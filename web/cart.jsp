<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🛒 Giỏ Hàng - Murach's Java Servlets and JSP</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>

<div class="container">
<h1>🛒 Giỏ hàng của bạn</h1>

<%@ taglib uri="/WEB-INF/murach.tld" prefix="mma" %>
<%-- Check if cart is empty --%>
<%
    murach.business.Cart cart = (murach.business.Cart) session.getAttribute("cart");
    boolean isEmpty = (cart == null || cart.getCount() == 0);
    if (isEmpty) {
%>
<div class="empty-cart">
    <h2>🛒 Giỏ hàng trống</h2>
    <p>Bạn chưa có sản phẩm nào trong giỏ hàng.</p>
    <a href="index.jsp" class="btn-view-cart">🛍️ Bắt đầu mua sắm</a>
</div>
<%
    } else {
%>

<table class="cart-table">
  <tr>
    <th>Sản phẩm</th>
    <th>Giá</th>
    <th>Số lượng</th>
    <th>Thành tiền</th>
    <th>Thao tác</th>
  </tr>

<mma:cart>
  <tr>
    <td class="product-info">
      <strong>${productDescription}</strong><br>
      <small>Mã: ${productCode}</small>
    </td>
    <td class="price">${productPrice}</td>
    <td class="quantity-controls">
      <form action="cart" method="post" style="display: inline;">
        <input type="hidden" name="action" value="cart">
        <input type="hidden" name="productCode" value="${productCode}">
        <input type="number" name="quantity" value="${quantity}" min="0" max="99" class="quantity-input">
        <button type="submit" class="btn-update">Cập nhật</button>
      </form>
    </td>
    <td class="total">${total}</td>
    <td class="actions">
      <form action="cart" method="post" style="display: inline;">
        <input type="hidden" name="action" value="cart">
        <input type="hidden" name="productCode" value="${productCode}">
        <input type="hidden" name="quantity" value="0">
        <button type="submit" class="btn-remove">🗑️ Xóa</button>
      </form>
    </td>
  </tr>
</mma:cart>

</table>

<div class="cart-summary">
  <div class="total-section">
    <h3>Tổng cộng: <span class="total-amount">${cartTotal != null ? cartTotal : '0.00 VND'}</span></h3>
  </div>
  
  <div class="action-buttons">
    <form action="" method="post" style="display: inline;">
      <input type="hidden" name="action" value="shop">
      <button type="submit" class="btn-continue">🛍️ Tiếp tục mua sắm</button>
    </form>

    <form action="" method="post" style="display: inline;">
      <input type="hidden" name="action" value="checkout">
      <button type="submit" class="btn-checkout">💳 Thanh toán</button>
    </form>
  </div>
</div>

<%
    }
%>

</div>
</body>
</html>