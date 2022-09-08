
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

console.log("Diff in Days: " + Difference_In_Days.toFixed(0));

//To display the final no. of days (result)
console.log("<br>Total number of days between dates  <br>"
               + date1 + "<br> and <br>"
               + todaysdate + " is: <br> "
               + Difference_In_Days);



var position = navigator.geolocation;

function initMap()
{
    position.getCurrentPosition(success);

    function success(position)
    {
        var mylat = position.coords.latitude;
        var mylong = position.coords.longitude;

        console.log(mylat);
        console.log(mylong);

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

        

        var set_color = check_severiety();
        console.log("Set Color is:" +set_color);

        const cityCircle = new google.maps.Circle({
            strokeColor: set_color,
            strokeOpacity: 0.8,
            strokeWeight: 2,
            fillColor: set_color,
            fillOpacity: 0.35,
            map,
            center: coords,
            radius: 10,
        });
    }
    
}

function check_severiety()
{
    var litte_dark = "#be3835";
    var more_dark = "#9d2623";
    var defaultcolor = "#FF0000";

    Difference_In_Days = 11;

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




/*
var getcat = document.getElementById("category");
var getlat = document.getElementById("lat");
var getlong = document.getElementById("lng");

console.log("MAPVIEW Value of Category: " +getcat.value);
console.log("MAPVIEW Value of Latitude: " +getlat.value);
console.log("MAPVIEW Value of Longitude: " +getlong.value);

var mylat = getlat.value;
var mylong = getlong.value;

var chngcolor = getcat.value;





*/

















//------------------------------------------------------------
/*



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
*/



/*


*/



