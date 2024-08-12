from django.shortcuts import render
from django.http import HttpResponse


def shopper_view(request):
    return HttpResponse(content=b"shopper_view")


def login_view(request):
    return HttpResponse(content=b"login_view")


def logout_view(request):
    return HttpResponse(content=b"logout_view")


def shoppingcart_view(request):
    return HttpResponse(content=b"shoppingcart_view")
