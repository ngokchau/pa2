$.fn.getSuggestions = function () {
    $.ajax({
        type: "POST",
        url: "QuerySuggestion.asmx/Search",
        data: JSON.stringify({ input: $("#s").val() }),
        contentType: "application/json; charset=utf-8",
        dataType: 'json',
        success: function (data) {
            var dump = "";
            if ($("#s").val() != "") {
                for (var i = 0; i < data.d.length; i++) {
                    dump += data.d[i] + "<br />";
                }
                $("#resultSet").html(dump);
            }
            else {
                $("#resultSet").html("");
            }
        }
    });
}

$.fn.addNewWord = function () {
    $.ajax({
        type: "POST",
        url: "QuerySuggestion.asmx/AddWordToTrie",
        data: JSON.stringify({ newWord: $("#s").val() }),
        contentType: "application/json; charset=utf-8",
        dataType: 'json',
        success: function (data) {
            // alert(JSON.stringify(data));
        }
    });
}

$.fn.showAlert() = function() {
    alert();
}