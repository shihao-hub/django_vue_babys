from django.db import models


class Types(models.Model):
    """ (商品类别表) 设计说明之页面左侧设置的分类列表 """
    id = models.AutoField(primary_key=True)
    firsts = models.CharField(verbose_name="一级类型", max_length=100)
    seconds = models.CharField(verbose_name="二级类型", max_length=100)

    class Meta:
        verbose_name = verbose_name_plural = "商品类型"

    objects = models.Manager()

    def __str__(self):
        return str(self.id)

    @classmethod
    def get_seconds_list_by_firsts(cls, firsts):
        """ 重构之数据被它的所属类或者对象使用，应该将其放入它的类中（语言组织的不太好...） """
        types = cls.objects.all()
        return [e.seconds for e in types if e.firsts == firsts]


class CommodityInfos(models.Model):
    """ (商品信息表) 设计说明之商品详情页的信息，即商品的基本信息 """
    id = models.AutoField(primary_key=True)
    name = models.CharField(verbose_name="商品名称", max_length=100)
    sizes = models.CharField(verbose_name="颜色规格", max_length=100)
    # 与 Types 关联
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

    objects = models.Manager()

    def __str__(self):
        return str(self.id)
