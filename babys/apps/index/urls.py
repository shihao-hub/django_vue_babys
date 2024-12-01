from django.urls import path
from apps.index.views import index_view

urlpatterns = [
    # 网站首页
    path("", index_view, name="index")
]
