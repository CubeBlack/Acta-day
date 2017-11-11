-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: acta_dei
-- ------------------------------------------------------
-- Server version	5.6.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuarios_email` varchar(50) NOT NULL,
  `publicacao_diaria_dia` date NOT NULL,
  `tipo_comentario` enum('Oração','Correção') DEFAULT 'Oração',
  `comentario` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuarios_email` (`usuarios_email`),
  KEY `publicacao_diaria_dia` (`publicacao_diaria_dia`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`usuarios_email`) REFERENCES `usuarios` (`email`),
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`publicacao_diaria_dia`) REFERENCES `publicacao_diaria` (`dia`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,'roselylima2014@gmail.com','2016-01-01','Oração','Deus me faz mais próxima de te. Torna-me novamente digna de tua presença, Pois ao teu lado quero viver na eternidade desfrutando de tua magnifica presença. Abençoa toda a minha volta para que todos (Minha família, Meus amigos, Colegas, e até aqueles que não sei quem é) estejam todos juntos desfrutando de tua companhia.'),(2,'edson.vit0r.pessoal@gmail.com','2016-01-02','Correção','No título há o seguinte erro: {fingindo um erro para teste}, creio que isto não deveria esta lá. Caso seja uma equivoco meu, minhas desculpas.');
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicacao_diaria`
--

DROP TABLE IF EXISTS `publicacao_diaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publicacao_diaria` (
  `dia` date NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `versiculo` text NOT NULL,
  `referencia_versiculo` varchar(100) NOT NULL,
  `texto` text NOT NULL,
  `oracao` text NOT NULL,
  `missao_diaria` text NOT NULL,
  `publicado_por` varchar(60) NOT NULL,
  PRIMARY KEY (`dia`),
  KEY `publicado_por` (`publicado_por`),
  CONSTRAINT `publicacao_diaria_ibfk_1` FOREIGN KEY (`publicado_por`) REFERENCES `usuarios` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacao_diaria`
--

LOCK TABLES `publicacao_diaria` WRITE;
/*!40000 ALTER TABLE `publicacao_diaria` DISABLE KEYS */;
INSERT INTO `publicacao_diaria` VALUES ('2016-01-01','A Conexão de Deus conosco',' “Então o SENHOR Deus formou o homem do pó da terra e soprou em suas narinas o fôlego de vida, e o homem se tornou um ser vivente.”','Gênesis 2.7','Deus criou o universo por meio da palavra. Ele determinou às estrelas e aos planetas que existissem. Iniciou do nada o processo de criação. Como Espirito Santo e por sua palavra, a criação ocorreu.\n	Então, Deus se dedicou a fazer o ser humano. Alguns textos bíblicos descrevem-no como “oleiro” e os seres humanos como “barro” (Is 64.8), fazendo-nos pensar no pai formando figuras de barro conforme o sedenho que tinha em mente. O toque final foi soprar em nós o fôlego de vida. Ele tornou-se pessoal.\n	Ao soprar-nos fôlego, nos deu também a capacidade de falar. O ato de respirar que nos mantém vivos é o que usamos para nos comunicar. Devemos usar o privilégio do fôlego da vida para falar com nosso Criador.\n	Fomos feitos para nos comunicar com nosso Oleiro. Assim como nos alegramos quando os bebês emitem os primeiros sons, o Pai também se alegra ao ouvir o som das palavras que seus filhos lhe dirigem.\n	Sussurrem uma oração com frequência. Se as palavras não lhe vieram à mente logo, comece dizendo “Obrigado”. Pronuncie devagar essa palavra e, então, acrescente “por...”, até que diferentes modos de terminar a comecem a fluir. À medida que o fizer, vai ver que pode usar o tempo de inspiração para refletir sobre as palavras seguintes, e o de expiração para expressar seu agradecimento. Conceder-nos o “fôlego de vida” é a conexão de Deus conosco; orar é nossa conexão com ele.','Senhor, eu te agradeço pelo sopro da vida. Assim como falaste e trouxeste vida ao teu mundo maravilhoso, ajuda-me a falar palavras que tragam vida ao meu pequeno mundo. Sou grato (a) por esta ligada (o) a ti.','Com “fôlego da vida” dizer ao máximo de pessoas possíveis que lhe rodeia o quão bom é tela do seu lado e refletir o quanto você demonstra isto através de suas ações, pois bem melhor que falar com a boca é falar com “ações”.','edson.vit0r@hotmail.com'),('2016-01-02','Um passeio {fingindo um erro para teste} pelo jardim .','“Ouvindo o homem e sua mulher os passos do SENHOR Deus que andava pelo jardim quando soprava a brisa do dia, esconderam-se da presença de SENHOR Deus entre as árvores do jardim.  Mas o SENHOR Deus chamou o homem, perguntando “Onde está você?””','Gênesis 3.8-9','Certos lugares se parecem com o primeiro jardim, provocando em nós o anseio de experimentar o que Adão e Eva desfrutaram: caminhar com Deus.\n	O mundo continua sendo um ótimo cenário para conhecer a Deus, mas algo mudou. As duas primeiras pessoas desistiram da companhia de divina. Elas ouviram os passos dele a procurá-las. Mas ambas haviam pecado, e a culpa as oprimiu. Perderam o relacionamento intimo que tinham, e desde então lutamos para retomar essa proximidade.\n	Deus não se escondeu do ser humano; foi o inverso. Envergonhados, temerosos e rebelados, Adão e Eva se Esconderam. Deus porém, foi procura-los. Embora tivesse conhecimento da desobediência, manteve seu compromisso.\n	De que amizade maravilhosa foram privados! Que paz perderam! Mas, antes de criticá-los, lembremos com que frequência repetimos o mesmo erro. Passamos momentos com Deus que gostaríamos de guardar, no entanto, horas mais tarde, lhe voltamos às costas.\n	O poder na vida de oração flui da presença de Deus em nos. Esse poder não é nosso, mas dele. Não o experimentaremos se insistirmos em nossos programas. Temos de planejar com serenidade momento em que nos encontraremos com Deus. Se não construímos a vida em torno desses “passeios no jardim” com o Senhor, bem rápido o mundo preencherá nossas horas com outros compromissos. Como fez com Adão e Eva, Deus virá procurar-nos. Eu não quero que ele tenha de me perguntar: “Onde você está?”. E você?','Senhor, quero caminhar junto de ti. Ajuda-me a não perder essa intimidade ao ser atraída pelas distrações deste mundo. Que eu ouça tua voz me chamando e que responda sem nenhuma hesitação. Ajuda-me a nunca me esconder de ti.','Pense em alguém que você tenha bastante conhecimento na bíblia, uma que esteja acessível, para que você possa sentar e conversar com ela sobre um ou dois temas que você não compreende da bíblia. Uma maneira de torna-se mais intimo de Deus é conhecer sua palavra.','danie_nerd@hotmail.com');
/*!40000 ALTER TABLE `publicacao_diaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `email` varchar(50) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `tipo_de_usuario` enum('Administrador','Leitor') DEFAULT 'Leitor',
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('danie_nerd@hotmail.com','Daniel Lima','dannke','Administrador'),('edson.vit0r.pessoal@gmail.com','Vitor da Silva','cogitari','Leitor'),('edson.vit0r@hotmail.com','Edson Vitor','cogitari','Administrador'),('roselylima2014@gmail.com','Rosely Lima','roselylima','Leitor');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-04 23:51:32
