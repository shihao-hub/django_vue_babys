from django.urls import path
from apps.commodity.views import commodity_view, detail_view

urlpatterns = [
    # 商品列表页
    #   (Q)! 为什么此处是 .html 呢？
    path(".html", commodity_view, name="commodity"),
    # 商品详情页
    path("detail/<int:id>.html", detail_view, name="detail"),
]
