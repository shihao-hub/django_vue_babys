from .base_settings import *


def insert_between_in_list(list_val: list, val, before, after):
    no_problem, pos = False, -1
    # 此处可以优化成：、
    #       -> 多利用基本操作呀，总是重复很耗费心力的，至于为什么耗费，最明显的一点就是代码需要测试...
    #   pos = list_val.find(before)
    #   if pos and pos - 1 < len(list_val) and list_val[pos]:
    #       pos = pos + 1
    #   else:
    #       raise Exception("...")
    for i, v in enumerate(list_val):
        if i + 1 < len(list_val) and v == before and list_val[i + 1] == after:
            no_problem = True
            pos = i + 1
    if not no_problem:
        raise Exception(f"无法在 {before} 和 {after} 之间插入值，因为无法定位")
    list_val.insert(pos, val)


INSTALLED_APPS.extend([
    "index",
    "shopper",
    "commodity",
])

# 开发者可以根据自己的需求自定义中间件，只需要添加到此处就可以激活，但是一般情况下都不用自己写...
MIDDLEWARE.extend([
    "django.middleware.locale.LocaleMiddleware",  # 国际化
])

# Override
TEMPLATES = [
    {
        # 定义模板引擎
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        # 设置模板所在的路径
        'DIRS': [BASE_DIR / "templates"],
        # 是否在 App（项目应用） 中查找模板文件
        'APP_DIRS': True,
        # 用于填充 RequestContext 的上下文（模板中的变量和指令），一般情况下不做任何修改
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

# Override
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}

# Static files (CSS, JavaScripts, Images)
# STATIC_URL 是 DEBUG = True 时，Django 默认的，而且只能识别每个 app 下的 static 文件夹
STATIC_URL = "static/"
STATICFILES_DIRS = [
    BASE_DIR / "pstatic"
]
# 它的作用是在服务器上部署项目，实现服务器和项目之间的映射
STATIC_ROOT = BASE_DIR / "AllStatic"

# 媒体资源：存放一些经常变动的资源，注意这里是自定义的，因此还要在 ROOT_URLCONF 文件的 urlpatterns 中注册
MEDIA_URL = "media/"
MEDIA_ROOT = BASE_DIR / "media"
