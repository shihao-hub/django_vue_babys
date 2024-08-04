from django.db import models

ORDER_INFOS_STATE = (
    ("待支付", "待支付"),
    ("已支付", "已支付"),
    ("发货中", "发货中"),
    ("已签收", "已签收"),
    ("退货中", "退货中"),
)


class CartInfos(models.Model):
    id = models.AutoField(primary_key=True)
    quantity = models.IntegerField(verbose_name="购买数量")
    # 本书作者好像不爱用外键？
    commodity_infos_id = models.IntegerField(verbose_name="商品 ID")
    user_id = models.IntegerField(verbose_name="用户 ID")

    class Meta:
        verbose_name = verbose_name_plural = "购物车"

    def __str__(self):
        return str(self.id)


class OrderInfos(models.Model):
    id = models.AutoField(primary_key=True)
    price = models.FloatField(verbose_name="订单总价")
    created = models.DateField(verbose_name="创建时间", auto_now_add=True)
    user_id = models.IntegerField(verbose_name="用户 ID")
    state = models.CharField(verbose_name="订单状态", max_length=20, choices=ORDER_INFOS_STATE)

    class Meta:
        verbose_name = verbose_name_plural = "订单信息"

    def __str__(self):
        return str(self.id)
