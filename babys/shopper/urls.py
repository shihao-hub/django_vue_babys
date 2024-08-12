from django.urls import path
from .views import shopper_view, login_view, logout_view, shoppingcart_view

urlpatterns = [
    # 个人中心页
    path(".html", shopper_view, name="shopper"),
    # 登录页
    path("/login.html", login_view, name="login"),
    # 登出页
    path("/logout.html", logout_view, name="logout"),
    # 购物车
    path("/shoppingcart.html", shoppingcart_view, name="shoppingcart")
]
