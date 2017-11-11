/*Criando DB*/
create database if not exists acta_dei
default character set utf8
default collate utf8_general_ci;

use acta_dei;

/*Criando Tabelas*/

create table if not exists usuarios (
	email varchar (50) not null,
    nome varchar(60) not null,
    senha varchar (100) not null,
    tipo_de_usuario enum('Administrador','Leitor') default 'Leitor',
    primary key(email)
) default charset = utf8;


create table if not exists publicacao_diaria (
	dia date not null,
    titulo varchar(100) not null,
    versiculo text not null,
    referencia_versiculo varchar(100) not null,
    texto text not null,
    oracao text not null,
    missao_diaria text not null,
    publicado_por varchar(60) not null,
    primary key (dia),
    foreign key (publicado_por) references usuarios(email)
)default charset = utf8;


create table if not exists comentarios (
	id int not null auto_increment,
    usuarios_email varchar (50) not null,
    publicacao_diaria_dia date not null,
    tipo_comentario enum('Oração','Correção') default 'Oração',
    comentario text not null,
    primary key (id),
    foreign key (usuarios_email) references usuarios(email),
    foreign key (publicacao_diaria_dia) references publicacao_diaria(dia)
)default charset = utf8;


/*inserindo dados para teste*/

insert into usuarios
(email, nome, senha, tipo_de_usuario)
values
('edson.vit0r@hotmail.com', 'Edson Vitor', 'cogitari', 'Administrador'),
('danie_nerd@hotmail.com', 'Daniel Lima', 'dannke', 'Administrador'),
('edson.vit0r.pessoal@gmail.com', 'Vitor da Silva', 'cogitari', 'Leitor'),
('roselylima2014@gmail.com', 'Rosely Lima', 'roselylima', 'Leitor');

select * from usuarios;

insert into publicacao_diaria
(dia, titulo, versiculo, referencia_versiculo, texto, oracao, missao_diaria, publicado_por)
values
('2016-01-01',

'A Conexão de Deus conosco',

' “Então o SENHOR Deus formou o homem do pó da terra e soprou em suas narinas o fôlego de vida, e o homem se tornou um ser vivente.”',
'Gênesis 2.7',
'Deus criou o universo por meio da palavra. Ele determinou às estrelas e aos planetas que existissem. Iniciou do nada o processo de criação. Como Espirito Santo e por sua palavra, a criação ocorreu.
	Então, Deus se dedicou a fazer o ser humano. Alguns textos bíblicos descrevem-no como “oleiro” e os seres humanos como “barro” (Is 64.8), fazendo-nos pensar no pai formando figuras de barro conforme o sedenho que tinha em mente. O toque final foi soprar em nós o fôlego de vida. Ele tornou-se pessoal.
	Ao soprar-nos fôlego, nos deu também a capacidade de falar. O ato de respirar que nos mantém vivos é o que usamos para nos comunicar. Devemos usar o privilégio do fôlego da vida para falar com nosso Criador.
	Fomos feitos para nos comunicar com nosso Oleiro. Assim como nos alegramos quando os bebês emitem os primeiros sons, o Pai também se alegra ao ouvir o som das palavras que seus filhos lhe dirigem.
	Sussurrem uma oração com frequência. Se as palavras não lhe vieram à mente logo, comece dizendo “Obrigado”. Pronuncie devagar essa palavra e, então, acrescente “por...”, até que diferentes modos de terminar a comecem a fluir. À medida que o fizer, vai ver que pode usar o tempo de inspiração para refletir sobre as palavras seguintes, e o de expiração para expressar seu agradecimento. Conceder-nos o “fôlego de vida” é a conexão de Deus conosco; orar é nossa conexão com ele.',
    
'Senhor, eu te agradeço pelo sopro da vida. Assim como falaste e trouxeste vida ao teu mundo maravilhoso, ajuda-me a falar palavras que tragam vida ao meu pequeno mundo. Sou grato (a) por esta ligada (o) a ti.',

'Com “fôlego da vida” dizer ao máximo de pessoas possíveis que lhe rodeia o quão bom é tela do seu lado e refletir o quanto você demonstra isto através de suas ações, pois bem melhor que falar com a boca é falar com “ações”.',
'edson.vit0r@hotmail.com'),


('2016-01-02',

'Um passeio {fingindo um erro para teste} pelo jardim .',

'“Ouvindo o homem e sua mulher os passos do SENHOR Deus que andava pelo jardim quando soprava a brisa do dia, esconderam-se da presença de SENHOR Deus entre as árvores do jardim.  Mas o SENHOR Deus chamou o homem, perguntando “Onde está você?””',
'Gênesis 3.8-9',
'Certos lugares se parecem com o primeiro jardim, provocando em nós o anseio de experimentar o que Adão e Eva desfrutaram: caminhar com Deus.
	O mundo continua sendo um ótimo cenário para conhecer a Deus, mas algo mudou. As duas primeiras pessoas desistiram da companhia de divina. Elas ouviram os passos dele a procurá-las. Mas ambas haviam pecado, e a culpa as oprimiu. Perderam o relacionamento intimo que tinham, e desde então lutamos para retomar essa proximidade.
	Deus não se escondeu do ser humano; foi o inverso. Envergonhados, temerosos e rebelados, Adão e Eva se Esconderam. Deus porém, foi procura-los. Embora tivesse conhecimento da desobediência, manteve seu compromisso.
	De que amizade maravilhosa foram privados! Que paz perderam! Mas, antes de criticá-los, lembremos com que frequência repetimos o mesmo erro. Passamos momentos com Deus que gostaríamos de guardar, no entanto, horas mais tarde, lhe voltamos às costas.
	O poder na vida de oração flui da presença de Deus em nos. Esse poder não é nosso, mas dele. Não o experimentaremos se insistirmos em nossos programas. Temos de planejar com serenidade momento em que nos encontraremos com Deus. Se não construímos a vida em torno desses “passeios no jardim” com o Senhor, bem rápido o mundo preencherá nossas horas com outros compromissos. Como fez com Adão e Eva, Deus virá procurar-nos. Eu não quero que ele tenha de me perguntar: “Onde você está?”. E você?',

'Senhor, quero caminhar junto de ti. Ajuda-me a não perder essa intimidade ao ser atraída pelas distrações deste mundo. Que eu ouça tua voz me chamando e que responda sem nenhuma hesitação. Ajuda-me a nunca me esconder de ti.',
    
'Pense em alguém que você tenha bastante conhecimento na bíblia, uma que esteja acessível, para que você possa sentar e conversar com ela sobre um ou dois temas que você não compreende da bíblia. Uma maneira de torna-se mais intimo de Deus é conhecer sua palavra.',

'danie_nerd@hotmail.com');

select * from publicacao_diaria;

insert into comentarios 
(id, usuarios_email, publicacao_diaria_dia, tipo_comentario, comentario)
values
(default, 'roselylima2014@gmail.com', '2016-01-01', 'Oração', 'Deus me faz mais próxima de te. Torna-me novamente digna de tua presença, Pois ao teu lado quero viver na eternidade desfrutando de tua magnifica presença. Abençoa toda a minha volta para que todos (Minha família, Meus amigos, Colegas, e até aqueles que não sei quem é) estejam todos juntos desfrutando de tua companhia.'),
(default, 'edson.vit0r.pessoal@gmail.com', '2016-01-02', 'Correção', 'No título há o seguinte erro: {fingindo um erro para teste}, creio que isto não deveria esta lá. Caso seja uma equivoco meu, minhas desculpas.');

select * from publicacao_diaria;