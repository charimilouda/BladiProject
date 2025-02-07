//verify inputs
var inpt_email=document.forms['login_form']['email'];
var inpt_password=document.forms['login_form']['password'];
var email_error=document.getElementById("emailerror");
var password_error=document.getElementById("passerror");

inpt_email.addEventListener('textInput',email_Verify);
inpt_password.addEventListener('textInput',pass_Verify)
function verify()
{
    if(inpt_email.value.length<9 )
    {
        inpt_email.style.border="1px solid red";
        email_error.style.display="block";
        inpt_email.focus();
        return false;
    }
    if(inpt_password.value.length<6  )
    {
        inpt_password.style.border="1px solid red";
        password_error.style.display="block";
        password_error.focus();
        return false;
    }
}
function email_Verify(){
    if(inpt_email.value.length>=8)
    {
        inpt_email.style.border="1px solid silver";
        email_error.style.display="none";
        return true;
    }
}
    function pass_Verify(){
        if(inpt_password.value.length>=5)
        {
            inpt_password.style.border="1px solid silver";
            password_error.style.display="none";
            return true;
        }
    }

