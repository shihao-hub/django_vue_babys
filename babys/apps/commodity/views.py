from django.shortcuts import render
from django.http import HttpResponse


def commodity_view(request):
    return HttpResponse(content=b"commodity_view")


def detail_view(request):
    return HttpResponse(content=b"detail_view")
