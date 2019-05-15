// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
function AddToCart(sku, quantity, reload) {
    $.ajax({
        type: 'POST',
        url: '/Carts/AddToCart',
        data: JSON.stringify({
            productSKU: sku,
            quantity: quantity
        }),
        contentType: "application/json",
        dataType: 'json'
    }).then(function (response) {
        console.log(response);
        if (reload) { location.reload(); }
        document.getElementById("cartBadge").innerHTML = response;
    });
}
function ClickMinus(item) {
    var now = $(item).siblings("input").val();
    if ($.isNumeric(now)) {
        if (parseInt(now) - 1 > 0) { now--; }
        $(item).siblings("input").val(now);
    } else {
        $(item).siblings("input").val("1");
    }
}
function ClickPlus(item) {
    var now = $(item).siblings("input").val();
    if ($.isNumeric(now)) {
        $(item).siblings("input").val(parseInt(now) + 1);
    } else {
        $(item).siblings("input").val("1");
    }
}