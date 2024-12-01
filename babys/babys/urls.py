"""babys URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls import handler404
from django.contrib import admin
from django.urls import path, include, re_path
from django.views.static import serve
from django.conf import settings

urlpatterns = [
    # 添加 app 的 urls.py
    path("", include(("apps.index.urls", "index"), namespace="index")),
    path("commodity", include(("apps.commodity.urls", "commodity"), namespace="commodity")),
    path("shopper", include(("apps.shopper.urls", "shopper"), namespace="shopper")),
    # 配置媒体资源的路由信息（有正则需要 re_path，否则会警告 ?: (2_0.W001)）
    re_path("media/(?P<path>.*)", serve, {"document_root": settings.MEDIA_ROOT}, name="media"),
    # Django 内置的后台管理系统
    path("admin/", admin.site.urls),
]
