from django.db import models


class Types(models.Model):
    id = models.AutoField(primary_key=True)
    firsts = models.CharField("一级类型", max_length=100)
    seconds = models.CharField("二级类型", max_length=100)

    class Meta:
        verbose_name = verbose_name_plural = "商品类型"

    def __str__(self):
        return str(self.id)


class CommodityInfos(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(verbose_name="商品名称", max_length=100)
    sezes = models.CharField(verbose_name="颜色规格", max_length=100)
    types = models.CharField(verbose_name="商品类型", max_length=100)
    price = models.FloatField(verbose_name="商品价格")
    discount = models.FloatField(verbose_name="折后价格")
    stock = models.IntegerField(verbose_name="存货数量")
    sold = models.IntegerField(verbose_name="已售数量")
    likes = models.IntegerField(verbose_name="收藏数量")
    created = models.DateField(verbose_name="上架日期", auto_now_add=True)
    img = models.FileField(verbose_name="商品主图", upload_to=r"imgs")
    details = models.FileField(verbose_name="商品介绍", upload_to=r"details")

    class Meta:
        verbose_name = verbose_name_plural = "商品信息"

    def __str__(self):
        return str(self.id)
