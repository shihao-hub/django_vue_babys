from django.contrib import admin
from commodity.models import Types, CommodityInfos


@admin.register(Types)
class TypesAdmin(admin.ModelAdmin):
    list_display = [field.name for field in Types._meta.get_fields()]
