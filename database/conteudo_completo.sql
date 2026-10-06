-- Conteúdo das abas do Guia Poli (Redes, Sistemas, Comunicação, Suporte, computadores dos laboratórios, e-mail institucional e AVA)
-- ANTES DE RODAR: confira os nomes das categorias com
--     SELECT id, nome FROM categorias;
-- Rode o arquivo inteiro de uma vez, na mesma conexão, e apenas UMA vez
-- (rodar de novo duplica as perguntas).

SET NAMES utf8mb4;
START TRANSACTION;

-- ======================= CATEGORIAS =======================

INSERT INTO categorias (nome, descricao)
VALUES
(
    'Redes e Conexões',
    'Informações sobre redes e conexões da POLI.'
),
(
    'Sistemas Acadêmicos',
    'Informações sobre sistemas acadêmicos da POLI.'
),
(
    'Suporte Técnico',
    'Informações sobre suporte técnico da POLI.'
);

-- ======================= REDES E CONEXÕES =======================
SET @cat = (SELECT id FROM categorias WHERE nome = 'Redes e Conexões' LIMIT 1);

INSERT INTO assuntos (categoria_id, nome, descricao)
VALUES (@cat, 'Wi-Fi POLI', 'Rede sem fio da Poli para estudantes: WIFI-POLI.');
SET @ass = LAST_INSERT_ID();
INSERT INTO perguntas (assunto_id, pergunta, resposta, criado_em, atualizado_em) VALUES
(@ass, 'Como acessar a rede WIFI-POLI?',
 'Usuário: o número do seu CPF, apenas os números.\nSenha inicial: os 6 primeiros dígitos do seu CPF seguidos de @Poli (exemplo: 123456@Poli).', NOW(), NOW()),
(@ass, 'Preciso fazer algo antes de conectar o celular?',
 'Sim. É obrigatório realizar o primeiro login e a troca de senha em um computador da própria Poli antes de conectar celulares ou outros dispositivos móveis.', NOW(), NOW()),
(@ass, 'Onde encontro mais detalhes e suporte?',
 'Consulte a página de Perguntas Frequentes do DTI da Poli:\nhttps://sites.google.com/dti.poli.br/perguntas-frequentes', NOW(), NOW());

INSERT INTO assuntos (categoria_id, nome, descricao)
VALUES (@cat, 'Eduroam', 'Rede eduroam para discentes e docentes.');
SET @ass = LAST_INSERT_ID();
INSERT INTO perguntas (assunto_id, pergunta, resposta, criado_em, atualizado_em) VALUES
(@ass, 'O que preciso para usar a eduroam?',
 'É preciso ter um e-mail institucional @upe. Se você ainda não tem, solicite pelo e-mail suporte@upe.br.', NOW(), NOW()),
(@ass, 'Como faço o cadastro?',
 'Cadastre-se na plataforma CAFe (Comunidade Acadêmica Federada) com suas informações pessoais para receber a senha de acesso no seu e-mail.\nhttps://ari.poli.br/pt/nova-rede-de-wi-fi-da-upe-eduroam/', NOW(), NOW()),
(@ass, 'Como me conecto à eduroam?',
 'Selecione a rede eduroam no seu dispositivo e informe seu e-mail institucional completo com a senha cadastrada.', NOW(), NOW());

-- ====================== SISTEMAS ACADÊMICOS ======================
SET @cat = (SELECT id FROM categorias WHERE nome = 'Sistemas Acadêmicos' LIMIT 1);

INSERT INTO assuntos (categoria_id, nome, descricao)
VALUES (@cat, 'SIG@ UPE', 'Sistema de Informações e Gestão Acadêmica. O login é o número do seu CPF.');
SET @ass = LAST_INSERT_ID();
INSERT INTO perguntas (assunto_id, pergunta, resposta, criado_em, atualizado_em) VALUES
(@ass, 'Como faço o primeiro acesso ao SIG@?',
 '1. Acesse o endereço oficial do SIG@ UPE: https://siga.upe.br/\n2. Clique em Solicitar Acesso ou use a chave de primeiro acesso informada no período de ingressantes.\n3. Cadastre uma senha pessoal e segura.\n4. Preencha ou atualize seus dados cadastrais obrigatórios (como e-mail secundário) logo no primeiro login.', NOW(), NOW()),
(@ass, 'Como faço a matrícula?',
 '1. Entre no SIG@ UPE (https://siga.upe.br/) com seu CPF e senha.\n2. Clique na aba Matrícula, no menu superior.\n3. Leia atentamente o formulário e siga as orientações específicas do período letivo da Poli.\n4. Confirme a operação e imprima ou salve o relatório de confirmação de matrícula para o seu controle.', NOW(), NOW()),
(@ass, 'Como acesso meu e-mail institucional?',
 'No seu perfil do SIG@, localize as informações sobre o seu e-mail institucional (geralmente sem acentos).\nO primeiro acesso ao e-mail no Gmail (https://gmail.com/) usa o seu CPF como senha temporária, que deve ser alterada no primeiro login.', NOW(), NOW());

-- ===================== CANAIS DE COMUNICAÇÃO =====================
INSERT INTO categorias (nome, descricao)
SELECT 'Canais de Comunicação', 'Contatos oficiais da Escola Politécnica de Pernambuco.'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM categorias WHERE nome = 'Canais de Comunicação');
SET @cat = (SELECT id FROM categorias WHERE nome = 'Canais de Comunicação' LIMIT 1);

INSERT INTO assuntos (categoria_id, nome, descricao)
VALUES (@cat, 'Telefones', 'Telefones principais da Poli.');
SET @ass = LAST_INSERT_ID();
INSERT INTO perguntas (assunto_id, pergunta, resposta, criado_em, atualizado_em) VALUES
(@ass, 'Qual o telefone da Escolaridade?', '(81) 3184-7505 / 3184-7507 / 3184-7508 / 3184-7509', NOW(), NOW()),
(@ass, 'Qual o telefone da Divisão de Estágio?', '(81) 3184-7574', NOW(), NOW()),
(@ass, 'Qual o telefone da Tesouraria?', '(81) 3184-7535 / 3184-7569', NOW(), NOW());

INSERT INTO assuntos (categoria_id, nome, descricao)
VALUES (@cat, 'E-mails', 'E-mails de contato dos setores.');
SET @ass = LAST_INSERT_ID();
INSERT INTO perguntas (assunto_id, pergunta, resposta, criado_em, atualizado_em) VALUES
(@ass, 'Qual o e-mail da Escolaridade?', 'protocolo_escolaridade@poli.br', NOW(), NOW()),
(@ass, 'Qual o e-mail da Divisão de Estágio?', 'dvestagio@poli.br', NOW(), NOW()),
(@ass, 'Qual o e-mail da Tesouraria?', 'tesouraria@poli.br', NOW(), NOW()),
(@ass, 'Qual o e-mail da Coordenação Geral?', 'coordgraduacao@poli.br', NOW(), NOW());

INSERT INTO assuntos (categoria_id, nome, descricao)
VALUES (@cat, 'Endereço e contatos oficiais', 'Onde fica a Poli e onde ver todos os contatos.');
SET @ass = LAST_INSERT_ID();
INSERT INTO perguntas (assunto_id, pergunta, resposta, criado_em, atualizado_em) VALUES
(@ass, 'Onde fica a Poli?', 'Rua Benfica, 455, Madalena, Recife - PE', NOW(), NOW()),
(@ass, 'Onde encontro todos os contatos oficiais?',
 'No site da Escola Politécnica de Pernambuco:\nhttps://poli.br/contatos/', NOW(), NOW());

-- ====================== SUPORTE TÉCNICO (DTI) ======================
SET @cat = (SELECT id FROM categorias WHERE nome = 'Suporte Técnico' LIMIT 1);

INSERT INTO assuntos (categoria_id, nome, descricao)
VALUES (@cat, 'DTI - Divisão de Tecnologia da Informação', 'Atendimento de tecnologia da informação da Poli.');
SET @ass = LAST_INSERT_ID();
INSERT INTO perguntas (assunto_id, pergunta, resposta, criado_em, atualizado_em) VALUES
(@ass, 'Como falar com a DTI?',
 'O canal principal é o e-mail dti@poli.br. Para dúvidas sobre e-mail institucional, informe seu nome completo e CPF.\nPágina oficial da DTI: https://poli.br/dti/', NOW(), NOW()),
(@ass, 'Quais serviços a DTI presta?',
 'Manutenção de computadores, rede de dados, acesso à internet, sistemas de informação, páginas web e gestão de hardware e software.', NOW(), NOW());

INSERT INTO assuntos (categoria_id, nome, descricao)
VALUES (@cat, 'Computadores dos laboratórios', 'Como entrar e trocar a senha nos computadores dos laboratórios da Poli.');
SET @ass = LAST_INSERT_ID();

INSERT INTO perguntas (assunto_id, pergunta, resposta, criado_em, atualizado_em) VALUES
(@ass, 'Como faço o primeiro login?',
 'No computador do laboratório, clique em Outro usuário, no canto inferior esquerdo da tela. Depois digite seu usuário e sua senha.', NOW(), NOW()),
(@ass, 'Qual é o meu usuário e a minha senha de primeiro acesso?',
 'Os usuários são criados automaticamente para os calouros no início do semestre.\nUsuário: o número do seu CPF ou Passaporte (apenas os números).\nSenha de primeiro acesso: os 6 primeiros dígitos do seu CPF ou Passaporte, seguidos de @Poli (sem as aspas).\n\nExemplo 1:\nUsuário: 12345678900\nSenha: 123456@Poli\n\nExemplo 2:\nUsuário: CS123456\nSenha: CS1234@Poli', NOW(), NOW()),
(@ass, 'Como crio a minha senha pessoal?',
 'No primeiro login será solicitada a criação de uma senha pessoal. A nova senha precisa ter, no mínimo: 8 dígitos, uma letra maiúscula, uma letra minúscula, um número e um caractere especial.', NOW(), NOW()),
(@ass, 'Como altero a minha senha depois?',
 'Estando logado em uma máquina do laboratório, pressione Ctrl + Alt + Del e escolha a opção Alterar uma senha. Vai aparecer a mesma tela de alteração de senha do primeiro login.', NOW(), NOW());

-- ---- BLOCO NOVO: E-mail institucional (aba Suporte Técnico) ----
-- Se você já rodou o resto deste arquivo, rode só daqui até o COMMIT.
SET @cat = (SELECT id FROM categorias WHERE nome = 'Suporte Técnico' LIMIT 1);

INSERT INTO assuntos (categoria_id, nome, descricao)
VALUES (@cat, 'E-mail institucional @upe.br', 'O e-mail @upe.br está se tornando o principal da instituição.');
SET @ass = LAST_INSERT_ID();
INSERT INTO perguntas (assunto_id, pergunta, resposta, criado_em, atualizado_em) VALUES
(@ass, 'Qual e-mail institucional vou usar: @upe.br ou @poli.br?',
 'A partir de 2025.2, o e-mail @poli.br não é mais criado para alunos de graduação, professores e servidores da Poli. Quem já possui esse e-mail pode continuar usando normalmente. A ideia é que, aos poucos, o e-mail @upe.br seja o principal da instituição.', NOW(), NOW()),
(@ass, 'Como consigo o meu e-mail @upe.br?',
 'Os e-mails @upe.br são gerados e administrados pelo NCTI (Núcleo de Comunicação e Tecnologia da Informação) da Reitoria da UPE. Você pode verificar o seu acesso pela sua conta no SIG@: https://siga.upe.br/\nO primeiro acesso ao e-mail no Gmail (https://gmail.com/) usa o seu CPF como senha temporária, que deve ser alterada no primeiro login.\nMais informações: acesse o site da UPE (https://upe.br/) e procure pela página E-mail institucional ingressantes do período mais recente, usando a busca do site.', NOW(), NOW()),
(@ass, 'Não encontrei o meu e-mail @upe.br. O que faço?',
 'Confira primeiro o seu perfil no SIG@ (https://siga.upe.br/). Se você ainda não tem e-mail @upe, solicite pelo e-mail suporte@upe.br.', NOW(), NOW()),
(@ass, 'Qual a diferença entre os e-mails @poli.br e @upe.br?',
 'Os e-mails @poli.br são gerados e administrados pelo DTI e são usados por alguns professores para cadastro no Google Classroom e em outros apps Google para acompanhamento de aulas.\nOs e-mails @upe.br são gerados e administrados pelo NCTI (Núcleo de Comunicação e Tecnologia da Informação) da Reitoria da UPE. O acesso a ele pode ser verificado pela sua conta no SIG@ (gerido pela seção Escolaridade da Poli).', NOW(), NOW()),
(@ass, 'Quais serviços o e-mail institucional oferece?',
 'O e-mail institucional dá acesso a vários serviços, incluindo Google Docs, Google Sheets, Google Slides, Google Drive e Google Classroom, entre outros.', NOW(), NOW());

INSERT INTO assuntos (categoria_id, nome, descricao)
VALUES (@cat, 'E-mail @poli.br (contas já existentes)', 'Para quem já possui e-mail @poli.br, criado pelo DTI.');
SET @ass = LAST_INSERT_ID();
INSERT INTO perguntas (assunto_id, pergunta, resposta, criado_em, atualizado_em) VALUES
(@ass, 'Como acesso o meu e-mail @poli.br?',
 'Com as suas credenciais, acesse https://accounts.google.com/\nA senha inicial é o seu CPF. No primeiro login será solicitada a alteração da senha.', NOW(), NOW()),
(@ass, 'Qual é o formato do endereço @poli.br?',
 'O endereço é formado pelas suas iniciais seguidas de @poli.br. Por exemplo, Altair Basílio Costa teria o usuário ABC@poli.br.\nSe já existir um usuário com as mesmas iniciais, um número é adicionado ao final (por exemplo: ABC1, ABC2, até ABC8).', NOW(), NOW()),
(@ass, 'O Wi-Fi e o e-mail usam o mesmo usuário?',
 'Não necessariamente. Os serviços de Wi-Fi e e-mail são independentes, então o seu usuário de e-mail pode ser diferente dos usuários de outros serviços.', NOW(), NOW()),
(@ass, 'Estou com problemas para acessar o meu e-mail @poli.br. O que faço?',
 'Compareça ao DTI (Bloco F da Poli) com um documento oficial com foto, ou escreva para dti@poli.br.\nPara o DTI ajudar por e-mail, envie uma selfie sua segurando um documento oficial com foto e um papel escrito à mão com a frase: "Solicito meu usuário de acesso ao e-mail@poli.br". O papel deve conter seu nome completo, a data atual, sua assinatura e seu CPF. Essa comprovação é necessária para confirmar sua identidade e permitir a recuperação do acesso à conta.', NOW(), NOW()),
(@ass, 'Quando o meu e-mail @poli.br será desativado?',
 'Após 30 dias do término do seu vínculo com a instituição, o seu e-mail @poli.br será desativado.', NOW(), NOW());

-- ---- BLOCO NOVO: AVA / POLI Virtual (aba Sistemas Acadêmicos) ----
-- Se você já rodou o resto deste arquivo, rode só daqui até o COMMIT.
SET @cat = (SELECT id FROM categorias WHERE nome = 'Sistemas Acadêmicos' LIMIT 1);

INSERT INTO assuntos (categoria_id, nome, descricao)
VALUES (@cat, 'AVA - POLI Virtual', 'Ambiente Virtual de Aprendizagem da Poli: https://polivirtual.eng.br/ava');
SET @ass = LAST_INSERT_ID();
INSERT INTO perguntas (assunto_id, pergunta, resposta, criado_em, atualizado_em) VALUES
(@ass, 'O que é o AVA (POLI Virtual)?',
 'O POLI Virtual é o Ambiente Virtual de Aprendizagem (AVA) da Escola Politécnica de Pernambuco, a plataforma de ensino a distância da Poli: https://polivirtual.eng.br/ava\nNem todas as disciplinas usam o POLI Virtual: alguns docentes optam por outras plataformas e, nesse caso, o suporte ao estudante é feito pelo docente.', NOW(), NOW()),
(@ass, 'Como faço o primeiro acesso ao AVA?',
 '1. Digite no navegador o endereço do AVA: https://polivirtual.eng.br/ava\n2. Clique em "Acessar", no canto superior direito da tela.\n3. Informe o seu CPF (somente números).\n4. Digite a senha de primeiro acesso: Abc12345*\n5. Altere a sua senha: digite a senha de primeiro acesso, crie uma nova senha e confirme. Anote a nova senha em um local seguro, porque você perde o acesso se esquecer nessa etapa.\n6. Na tela de confirmação, clique em "Continuar".\n7. Clique no seu nome, no canto superior direito, e vá em "Perfil".\n8. Confira o seu nome. O endereço de e-mail composto de vários números é fictício e não funciona: digite o seu e-mail de uso frequente.\n9. Envie uma foto de rosto sua para identificação na plataforma.\n10. Clique em "Atualizar perfil".', NOW(), NOW()),
(@ass, 'Existe um tutorial em PDF do primeiro acesso?',
 'Sim, o POLI Virtual disponibiliza o tutorial de primeiro acesso para estudantes em PDF: https://polivirtual.eng.br/Tutorial_POLI_Virtual_Estudante.pdf', NOW(), NOW()),
(@ass, 'Minha disciplina não aparece no AVA. O que faço?',
 'Se a disciplina não aparecer no seu perfil do POLI Virtual, ou se tiver qualquer dúvida sobre o funcionamento de uma disciplina, procure a Coordenação do seu curso ou o professor responsável.', NOW(), NOW()),
(@ass, 'Tenho um problema com a plataforma. Com quem falo?',
 'Para problemas específicos da plataforma, escreva para contato@polivirtual.eng.br.\nO endereço "admin" do POLI Virtual funciona de forma automática e não é monitorado, então não responda nem envie mensagens para ele.', NOW(), NOW());

COMMIT;

-- CONFERÊNCIA: mostra quantas perguntas cada assunto ficou com
SELECT c.nome AS categoria, a.nome AS assunto, COUNT(p.id) AS perguntas
FROM categorias c
JOIN assuntos a ON a.categoria_id = c.id
LEFT JOIN perguntas p ON p.assunto_id = a.id
GROUP BY c.nome, a.nome
ORDER BY c.nome, a.nome;