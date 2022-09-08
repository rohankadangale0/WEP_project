
var getcat = document.getElementById("category");
var getlat = document.getElementById("lat");
var getlong = document.getElementById("lng");

var filed_date = document.getElementById("date");

console.log(filed_date.value);

console.log(filed_date.value.slice(0, 11));

var modified = filed_date.value.slice(0, 11);

console.log("Modified Date:" + modified);

const date1 = new Date(modified)

console.log("Date:" + date1);


const todaysdate = new Date();

// To calculate the time difference of two dates
var Difference_In_Time = todaysdate.getTime() - date1.getTime();

// To calculate the no. of days between two dates
var Difference_In_Days = Difference_In_Time / (1000 * 3600 * 24);

Difference_In_Days.toFixed(0);

console.log("Diff in Days: " + Difference_In_Days);

//To display the final no. of days (result)
console.log("Total number of days between dates \n"
               + date1 + "\n and \n"
               + todaysdate + " is: \n "
               + Difference_In_Days);


console.log("MAPVIEW Value of Category: " +getcat.value);
console.log("MAPVIEW Value of Latitude: " +getlat.value);
console.log("MAPVIEW Value of Longitude: " +getlong.value);

var mylat = getlat.value;
var mylong = getlong.value;

var chngcolor = getcat.value;
var position = navigator.geolocation;

function initMap()
{
        var coords = new google.maps.LatLng(mylat, mylong);

        var mapOptions = {
            zoom: 23,
            center: coords,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        var map = new google.maps.Map(document.getElementById("map"), mapOptions);

        var marker = new google.maps.Marker({
            map: map,
            position: coords,
            draggable: false,
        });

        var water = "#8abdf0";
        var electricity = "#d1dc6a";
        var road = "#241f1fd4";
        var defaultcolor = "#FF0000";

        if(chngcolor == "water")
        {
            const cityCircle = new google.maps.Circle({
                strokeColor: water,
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: water,
                fillOpacity: 0.35,
                map,
                center: coords,
                radius: 10,
            });
        }
        else if(chngcolor == "electricity")
        {
            const cityCircle = new google.maps.Circle({
                strokeColor: electricity,
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: electricity,
                fillOpacity: 0.35,
                map,
                center: coords,
                radius: 10,
            });
        }
        else
        {
            const cityCircle = new google.maps.Circle({
                strokeColor: road,
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: road,
                fillOpacity: 0.35,
                map,
                center: coords,
                radius: 10,
            });
        }
}


function check_severiety()
{
    
    var litte_dark = "";
    var more_dark = "";
    var defaultcolor = "";

    if(chngcolor == "water")
    {
        litte_dark = "#5b94ce";
        more_dark = "#3670aa";
        defaultcolor = "#8abdf0";
    }
    else if(chngcolor == "electricity")
    {
        litte_dark = "#acb740";
        more_dark = "#8c9722";
        defaultcolor = "#d1dc6a";
    }
    else
    {
        litte_dark = "#0e0d0dd4";
        more_dark = "#000000de";
        defaultcolor = "#241f1fd4";
    }

    if(Difference_In_Days > 10 )
    {
        return more_dark;
        
    }
    else if(Difference_In_Days > 3 )
    {
        return litte_dark;
    }
    else
    {
        return defaultcolor;
    }
}
