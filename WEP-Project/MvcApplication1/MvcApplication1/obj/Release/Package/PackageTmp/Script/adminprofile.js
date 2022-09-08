
var oldpass = document.getElementById("oldpswd");
var pass = document.getElementById("npswd");
var cpass = document.getElementById("repswd");


var err = document.getElementById("error");
var pss = document.getElementById("success");
var oldmtch = document.getElementById("oldmatch");

function check(e)
{
    //e.preventDefault();
    console.log("oldPass: " + oldpass.value);
    console.log("Pass: " + pass.value);
    console.log("CPass: " + cpass.value);

    if (oldpass.value == pass.value && oldpass.value == cpass.value) {
        oldmtch.style.display = "block";
        oldmtch.style.color = "white";
        err.style.display = "none";
        pss.style.display = "none";

        /*setTimeout(function () {
            alert("Password Matched with Old Password");
            window.location.reload();
        }, 500);*/

        document.getElementById("submitbtn").disabled = true;
    }
    else if (pass.value == cpass.value) {
        oldmtch.style.display = "none";
        err.style.display = "none";
        pss.style.display = "block";
        pss.style.color = "white";
        document.getElementById("submitbtn").disabled = false;
        // alert("Password match");

    }
    else if (document.getElementById("repswd").value != document.getElementById("npswd").value) {

        err.style.display = "block";
        err.style.display = "white";
        pss.style.display = "none";
        oldmtch.style.display = "none";
        document.getElementById("submitbtn").disabled = true;
        //alert("Password Does not match");
    }

}