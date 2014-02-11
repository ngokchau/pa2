using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;

namespace QuerySuggestionWebRole
{
    /// <summary>
    /// Summary description for QuerySuggestion
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    [ScriptService]
    public class QuerySuggestion : System.Web.Services.WebService
    {
        private static Trie trie;

        [WebMethod]
        public void BuildTrie()
        {
            trie = new Trie();
            CloudStorageAccount storageAccount = CloudStorageAccount.Parse(ConfigurationManager.AppSettings["StorageConnectionString"]);
            CloudBlobClient blobClient = storageAccount.CreateCloudBlobClient();
            CloudBlobContainer container = blobClient.GetContainerReference("data");
            CloudBlockBlob blob = container.GetBlockBlobReference("clean-wiki-quarter.txt");

            StreamReader sr = new StreamReader(blob.OpenRead());

            int counter = 1;

            using (sr)
            {
                while (!sr.EndOfStream && (counter % 50000 != 0 || Ram() > 60))
                {
                    trie.Insert(sr.ReadLine());
                    counter++;
                }
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<string> Search(string input)
        {
            if (trie == null)
            {
                BuildTrie();
            }
            trie.Search(input);
            //return new JavaScriptSerializer().Serialize(trie.Suggestions);
            return trie.Suggestions;
        }

        [WebMethod]
        public int Ram()
        {
            PerformanceCounter ramCounter = new PerformanceCounter("Memory", "Available MBytes");
            int ram = Convert.ToInt32(ramCounter.NextValue());

            return ram;
        }

        [WebMethod]
        public void AddWordToTrie(string newWord)
        {
            trie.Insert(newWord);
        }
    }
}
