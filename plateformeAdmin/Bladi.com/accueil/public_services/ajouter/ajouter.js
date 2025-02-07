//sidebar toggle code
var sidebarOpen =false;
var sidebar=document.getElementById("sidebar");
var sidebarCloseIcon=document.getElementById("sidebarIcon");
function toggleSideBar() {
    if(!sidebarOpen)
    {
        sidebar.classList.add("sidebar_responsive");
        sidebarOpen=true;
    }

    
}
function closeSidebar() {
    if(sidebarOpen)
    {
        sidebar.classList.remove("sidebar_responsive");
        sidebarOpen=false;
    }
}


function verify(){
    let phoneNumber =document.getElementById("tel");
    if(phoneNumber.value.length!=10 && phoneNumber.value.length!=9)
    {   
        phoneNumber.style.border="1px solid red";
        document.getElementById('errorPhone').style.display="block";
        return false;
    }
}