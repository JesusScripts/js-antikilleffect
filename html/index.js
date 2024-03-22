$(function () {

    function toggleDisplay(bool) {
        if (bool) {
            $("#bl").show();
        } else {
            $("#bl").hide();
        }
    }

    toggleDisplay(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                toggleDisplay(true)
            } else {
                toggleDisplay(false)
            }
        }
    })


})
