<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <link rel="stylesheet" href="checkout.css">
</head>
<body>
    <div class="container">
        <h2>Checkout</h2>
        <div id="qrcode"></div>
        <input type="file" id="qrImageInput" accept="image/*">
        <button onclick="processPayment()">Process Payment</button>
        <div id="paymentDetails"></div>
    </div>

    <script src="https://cdn.rawgit.com/davidshimjs/qrcodejs/gh-pages/qrcode.min.js"></script>
    <script src="checkout.js"></script>
</body>
</html>
