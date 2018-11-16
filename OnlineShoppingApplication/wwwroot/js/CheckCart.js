/// <reference path="../lib/jquery/dist/jquery.min.js" />

$('#CheckCart').click(function (e) {
   // e.preventDefault();
    var config = {
        url: '/Product/IsCartValid',
        method: 'Get',
        success: function (data) {
            if (data == true)
                window.location.href = '/Product/ProductCart';
            else {
                alert('Your Cart is Empty..');
            }
        },
        error: function (xhr, status, error) {
            alert(status);
        }
    };
    $.ajax(config);
    
});



