$(document).ready(function () {
    $.ajax({
        url: window.getLeftSidebarMenu,
        type: "GET",
        dataType: "json",
        error: function (response) {
            $("#sidebarMenuDynamic").html(response.responseText);
        },
        success: function (response) {
            $("#sidebarMenuDynamic").html(response);
        }
    });
});