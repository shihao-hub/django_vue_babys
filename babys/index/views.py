from django.shortcuts import render
from django.http import HttpResponse
from django.core.handlers.wsgi import WSGIRequest
from django.views.generic import (
    # 数据显示视图
    RedirectView, TemplateView, ListView, DetailView,
    # 数据操作视图
    FormView, CreateView, UpdateView, DeleteView,
    # 日期筛选视图
    ArchiveIndexView, YearArchiveView, MonthArchiveView,
    WeekArchiveView, DayArchiveView, TodayArchiveView, DateDetailView
)

from commodity.models import CommodityInfos, Types


def index_view(request: WSGIRequest):
    if request.method == "GET":
        context = IndexView.extra_context
        context.update(IndexView.generate_business_context())
        return render(request, "index.html", context)
    else:
        raise Exception(f"不合理的请求方法：{request.method}")


class IndexView(TemplateView):
    """ TemplateView 只定义了 get 方法 """
    template_name = "index.html"
    template_engine = None  # 默认 settings.TEMPLATES.BACKEND
    content_type = None  # 默认 text/html
    extra_context = {"title": "首页", "class_content": ""}  # 顾名思义，存放比较固定的 context

    @staticmethod
    def generate_business_context():
        """ 重构之重复代码 """
        commodity_infos = CommodityInfos.objects.order_by("-sold")[:8]

        # Test
        # obj = CommodityInfos.objects.filter().get(pk=1)

        # 儿童服饰、奶粉辅食、儿童用品
        cl = Types.get_seconds_list_by_firsts("儿童服饰")
        fl = Types.get_seconds_list_by_firsts("奶粉辅食")
        gl = Types.get_seconds_list_by_firsts("儿童用品")

        clothes = CommodityInfos.objects.filter(types__in=cl).order_by("-sold")[:5]
        food = CommodityInfos.objects.filter(types__in=fl).order_by("-sold")[:5]
        goods = CommodityInfos.objects.filter(types__in=gl).order_by("-sold")[:5]
        return locals()

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context.update(self.generate_business_context())
        return context
