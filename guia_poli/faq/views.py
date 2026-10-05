import unicodedata

from django.shortcuts import render, get_object_or_404
from .models import Categoria, Assunto, Pergunta, Pesquisa


def normalizar_texto(texto):
    """
    Normaliza o texto para facilitar a pesquisa.

    Exemplos:
    Wi-Fi  -> wifi
    WIFI   -> wifi
    wi fi  -> wifi
    conexão -> conexao
    CONEXÃO -> conexao
    """

    if not texto:
        return ""

    texto = texto.lower()

    # Remove acentos
    texto = unicodedata.normalize("NFD", texto)
    texto = "".join(
        caractere
        for caractere in texto
        if unicodedata.category(caractere) != "Mn"
    )

    # Remove espaços, hífens e underscores
    texto = texto.replace("-", "")
    texto = texto.replace(" ", "")
    texto = texto.replace("_", "")

    return texto


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


def pesquisar(request):
    termo = request.GET.get("q", "").strip()

    resultados = []

    if termo:
        # Guarda exatamente o que o usuário digitou
        Pesquisa.objects.create(termo=termo)

        # Normaliza o termo pesquisado
        termo_normalizado = normalizar_texto(termo)

        # Busca as perguntas e seus assuntos/categorias
        perguntas = Pergunta.objects.select_related(
            "assunto",
            "assunto__categoria"
        ).all()

        for pergunta in perguntas:

            textos_para_pesquisar = [
                pergunta.pergunta,
                pergunta.resposta,
                pergunta.assunto.nome,
                pergunta.assunto.descricao or "",
                pergunta.assunto.categoria.nome,
                pergunta.assunto.categoria.descricao or "",
            ]

            encontrou = False

            for texto in textos_para_pesquisar:
                texto_normalizado = normalizar_texto(texto)

                if termo_normalizado in texto_normalizado:
                    encontrou = True
                    break

            if encontrou:
                resultados.append(pergunta)

    return render(request, "pesquisa.html", {
        "termo": termo,
        "resultados": resultados,
    })