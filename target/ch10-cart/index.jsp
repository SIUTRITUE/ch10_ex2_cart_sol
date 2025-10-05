<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🎵 Cửa hàng âm nhạc - Murach's Store</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>

<div class="container">
<h1>🎵 Danh sách CD âm nhạc</h1>

<div class="product-grid">
    <%@ taglib uri="/WEB-INF/murach.tld" prefix="mma" %>
    <mma:products>  
    <div class="product-card">
        <div class="product-info">
            <h3 class="product-title">${description}</h3>
            <div class="product-price">${price}</div>
            <div class="product-code">Mã: ${code}</div>
        </div>
        
        <form action="cart" method="post" class="add-to-cart-form">
            <input type="hidden" name="productCode" value="${code}">
            <input type="hidden" name="action" value="cart">
            
            <div class="quantity-section">
                <label for="quantity-${code}">Số lượng:</label>
                <div class="quantity-controls">
                    <button type="button" class="qty-btn" onclick="decreaseQuantity('${code}')">-</button>
                    <input type="number" id="quantity-${code}" name="quantity" value="1" min="1" max="99" class="quantity-input">
                    <button type="button" class="qty-btn" onclick="increaseQuantity('${code}')">+</button>
                </div>
            </div>
            
            <button type="submit" class="btn-add-to-cart">🛒 Thêm vào giỏ</button>
        </form>
    </div>
    </mma:products>
</div>

<div class="cart-link">
    <a href="cart.jsp" class="btn-view-cart">🛒 Xem giỏ hàng</a>
</div>

</div>

<script>
function increaseQuantity(productCode) {
    const input = document.getElementById('quantity-' + productCode);
    const currentValue = parseInt(input.value);
    if (currentValue < 99) {
        input.value = currentValue + 1;
    }
}

function decreaseQuantity(productCode) {
    const input = document.getElementById('quantity-' + productCode);
    const currentValue = parseInt(input.value);
    if (currentValue > 1) {
        input.value = currentValue - 1;
    }
}
</script>

</body>
</html>