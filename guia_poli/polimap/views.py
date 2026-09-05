from django.shortcuts import render

from faq.data import MAPA


def mapa(request):
    return render(request, "mapa.html", {
        "titulo": MAPA["titulo"],
        "descricao": MAPA["descricao"],
        "locais": MAPA["locais"],
    })
