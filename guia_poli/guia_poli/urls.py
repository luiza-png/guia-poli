from django.contrib import admin
from django.urls import include, path

from faq.views import home

urlpatterns = [
    path("admin/", admin.site.urls),
    path("", home, name="home"),
    path("", include("faq.urls")),
    path("mapa/", include("polimap.urls")),
]
