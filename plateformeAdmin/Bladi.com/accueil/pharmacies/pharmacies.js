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