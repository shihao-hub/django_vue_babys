from django.db import models

ORDER_INFOS_STATE = (
    ("待支付", "待支付"),
    ("已支付", "已支付"),
    ("发货中", "发货中"),
    ("已签收", "已签收"),
    ("退货中", "退货中"),
)


class CartInfos(models.Model):
    """ (购物车信息表) 设计说明之购物车页面，将用户选购的商品以列表的形式展示 """
    id = models.AutoField(primary_key=True)
    quantity = models.IntegerField(verbose_name="购买数量")
    # (Q)! 本书作者好像不爱用外键？
    # 与 CommodityInfos 关联
    commodity_infos_id = models.IntegerField(verbose_name="商品信息表的主键 id")
    user_id = models.IntegerField(verbose_name="Django 内置用户表的主键 id")

    class Meta:
        verbose_name = verbose_name_plural = "购物车"

    objects = models.Manager()

    def __str__(self):
        return str(self.id)


class OrderInfos(models.Model):
    """ (订单信息表) 设计说明之订单信息 """
    id = models.AutoField(primary_key=True)
    price = models.FloatField(verbose_name="订单总价")
    created = models.DateField(verbose_name="创建时间", auto_now_add=True)
    user_id = models.IntegerField(verbose_name="用户 ID")
    state = models.CharField(verbose_name="订单状态", max_length=20, choices=ORDER_INFOS_STATE)

    class Meta:
        verbose_name = verbose_name_plural = "订单信息"

    objects = models.Manager()

    def __str__(self):
        return str(self.id)
