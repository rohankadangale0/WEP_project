
var cmpltntyp = document.getElementById("catgr");
var arrayOfElements_water=document.getElementsByClassName('whidden');
var arrayOfElements_electricity=document.getElementsByClassName('ehidden');
var arrayOfElements_road = document.getElementsByClassName('rhidden');

//This function is used to get Which Category is selected and based on Selected Category Dropdown is visible  
function getcategory(val)
{
    console.log(val);

    if (val == 'water')
    {
        
        var lengthOfArray = arrayOfElements_water.length;

        for (var i=0; i<lengthOfArray;i++)
        {
            arrayOfElements_water[i].style.display='inline';
            arrayOfElements_electricity[i].style.display='none';
            arrayOfElements_road[i].style.display='none';
        }
        
    }
    else if (val == 'road')
    {
        
        var lengthOfArray=arrayOfElements_road.length;

        for (var i=0; i<lengthOfArray;i++)
        {
            arrayOfElements_road[i].style.display='inline';
            arrayOfElements_water[i].style.display='none';
            arrayOfElements_electricity[i].style.display='none';
        }
    }
    else if (val == 'electricity')
    {
        var lengthOfArray=arrayOfElements_electricity.length;

        for (var i=0; i<lengthOfArray;i++)
        {
            arrayOfElements_electricity[i].style.display='inline';
            arrayOfElements_road[i].style.display='none';
            arrayOfElements_water[i].style.display='none';
        }
    }
    else
    {
        var lengthOfArray = arrayOfElements_electricity.length;

        for (var i = 0; i < lengthOfArray; i++)
        {
            arrayOfElements_electricity[i].style.display = 'none';
            arrayOfElements_road[i].style.display = 'none';
            arrayOfElements_water[i].style.display = 'none';
        }
    }
        
}

//This function is used set the Selected value to input field to be used in database 
function gettypevalue(cval)
{
    /*var typevalue;
    console.log(e.target.value);
    typevalue = document.getElementById("type").innerText = e.target.value;
    console.log("typevalue: " +typevalue);*/

    console.log(cval);
    document.getElementById("cattype").value = cval;
}
