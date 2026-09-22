from django.db import models


class Categoria(models.Model):
    id = models.AutoField(primary_key=True)
    nome = models.CharField(max_length=100)
    descricao = models.TextField(null=True, blank=True)

    class Meta:
        managed = False
        db_table = "categorias"

    def __str__(self):
        return self.nome


class Assunto(models.Model):
    id = models.AutoField(primary_key=True)

    categoria = models.ForeignKey(
        Categoria,
        on_delete=models.DO_NOTHING,
        db_column="categoria_id",
        related_name="assuntos",
    )

    nome = models.CharField(max_length=150)
    descricao = models.TextField(null=True, blank=True)

    class Meta:
        managed = False
        db_table = "assuntos"

    def __str__(self):
        return self.nome


class Pergunta(models.Model):
    id = models.AutoField(primary_key=True)

    assunto = models.ForeignKey(
        Assunto,
        on_delete=models.DO_NOTHING,
        db_column="assunto_id",
        related_name="perguntas",
    )

    pergunta = models.CharField(max_length=255)
    resposta = models.TextField()
    criado_em = models.DateTimeField(null=True)
    atualizado_em = models.DateTimeField(null=True)

    class Meta:
        managed = False
        db_table = "perguntas"

    def __str__(self):
        return self.pergunta