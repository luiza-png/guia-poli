from django.shortcuts import render

from .data import CATEGORIAS


def home(request):
    return render(request, "home.html")


def _pagina_categoria(request, categoria):
    dados = CATEGORIAS[categoria]

    return render(request, "info_page.html", {
        "titulo": dados["titulo"],
        "descricao": dados["descricao"],
        "itens": dados["itens"],
    })


def redes(request):
    return _pagina_categoria(request, "redes")


def sistemas(request):
    return _pagina_categoria(request, "sistemas")


def comunicacao(request):
    return _pagina_categoria(request, "comunicacao")


def suporte(request):
    return _pagina_categoria(request, "suporte")
