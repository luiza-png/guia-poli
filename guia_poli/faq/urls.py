from django.urls import path

from . import views

urlpatterns = [
    path("redes/", views.redes, name="redes"),
    path("sistemas/", views.sistemas, name="sistemas"),
    path("comunicacao/", views.comunicacao, name="comunicacao"),
    path("suporte/", views.suporte, name="suporte"),
]
