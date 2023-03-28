$(document).ready(function() {
    console.log("Page Loaded");

    $("#wine_predictions").click(function() {
        
        winePredictions();
    });
});

function winePredictions() {
    var fixed_acidity = parseFloat($("#fixed_acidity").val());
    var volatile_acidity = parseFloat($("#volatile_acidity").val());
    var citric_acid = parseFloat($("#citric_acid").val());
    var residual_sugar = parseFloat($("#residual_sugar").val());
    var chlorides = parseFloat($("#chlorides").val());
    var free_sulfur_dioxide = parseFloat($("#free_sulfur_dioxide").val());
    var total_sulfur_dioxide = parseFloat($("#total_sulfur_dioxide").val());
    var density = parseFloat($("#density").val());
    var pH = parseFloat($("#pH").val());
    var sulphates = parseFloat($("#sulphates").val());
    var alcohol = parseFloat($("#alcohol").val());

    var payload = {
    
        "fixed_acidity": fixed_acidity,
        "volatile_acidity": volatile_acidity,
        "citric_acid": citric_acid,
        "residual_sugar": residual_sugar,
        "chlorides": chlorides,
        "free_sulfur_dioxide": free_sulfur_dioxide,
        "total_sulfur_dioxide": total_sulfur_dioxide,
        "density": density,
        "pH": pH,
        "sulphates": sulphates,
        "alcohol": alcohol
        
    };
    console.log(payload);
    $.ajax({
        type: "POST",
        url: "/predictions",
        contentType: 'application/json;charset=UTF-8',
        data: JSON.stringify({ "data": payload }),
        success: function(returnedData) {
            console.log(returnedData);

            if (returnedData["good_bad_prediction"] === "Good") {
                $("#output").text("That is some good Wine Homie!");
            } else {
                $("#output").text("Save it for those annoying people you don't like. :(");
            }
            
            if (returnedData["color_prediction"]==="White") {
                $("#output-color").text("It's a white wine.");
            } else {
                $("#output-color").text("It's a red wine.");
            } 
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            alert("Status: " + textStatus);
            alert("Error: " + errorThrown);
        }
    });
}