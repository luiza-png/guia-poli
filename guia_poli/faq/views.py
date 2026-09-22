from django.shortcuts import render, get_object_or_404
from .models import Categoria


def home(request):
    return render(request, "home.html")


def _pagina_categoria(request, nome_categoria):
    categoria = get_object_or_404(
        Categoria,
        nome=nome_categoria
    )

    assuntos = categoria.assuntos.prefetch_related("perguntas")

    return render(request, "info_page.html", {
        "titulo": categoria.nome,
        "descricao": categoria.descricao,
        "assuntos": assuntos,
    })


def redes(request):
    return _pagina_categoria(request, "Redes e Conexões")


def sistemas(request):
    return _pagina_categoria(request, "Sistemas Acadêmicos")


def suporte(request):
    return _pagina_categoria(request, "Suporte Técnico")


def comunicacao(request):
    return render(request, "info_page.html", {
        "titulo": "Comunicação",
        "descricao": "Informações de comunicação.",
        "assuntos": [],
    })