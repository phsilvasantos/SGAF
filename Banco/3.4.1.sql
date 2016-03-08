CREATE DATABASE  IF NOT EXISTS `sgaf` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sgaf`;
-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: 127.0.0.1    Database: sgaf
-- ------------------------------------------------------
-- Server version	5.6.24

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
-- Table structure for table `acertos`
--

DROP TABLE IF EXISTS `acertos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acertos` (
  `ace_codigo` bigint(18) NOT NULL AUTO_INCREMENT,
  `ace_data` date NOT NULL,
  `ace_hora` time NOT NULL,
  `ace_supervisor` int(11) NOT NULL,
  `ace_fornecedor` int(11) NOT NULL,
  `ace_valorbruto` float NOT NULL,
  `ace_valortaxas` float NOT NULL,
  `ace_valorpendente` float NOT NULL,
  `ace_valorpendenteanterior` float NOT NULL,
  `ace_valortotal` float NOT NULL,
  `ace_valorpago` float NOT NULL,
  `ace_trocodevolvido` float NOT NULL,
  `ace_quiosque` bigint(18) NOT NULL,
  `ace_dataini` date NOT NULL,
  `ace_datafim` date NOT NULL,
  PRIMARY KEY (`ace_codigo`),
  KEY `ace_quiosque` (`ace_quiosque`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acertos`
--

LOCK TABLES `acertos` WRITE;
/*!40000 ALTER TABLE `acertos` DISABLE KEYS */;
/*!40000 ALTER TABLE `acertos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acertos_taxas`
--

DROP TABLE IF EXISTS `acertos_taxas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acertos_taxas` (
  `acetax_acerto` bigint(18) NOT NULL,
  `acetax_taxa` smallint(4) NOT NULL,
  `acetax_referencia` float NOT NULL,
  `acetax_valor` float NOT NULL,
  PRIMARY KEY (`acetax_acerto`,`acetax_taxa`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acertos_taxas`
--

LOCK TABLES `acertos_taxas` WRITE;
/*!40000 ALTER TABLE `acertos_taxas` DISABLE KEYS */;
/*!40000 ALTER TABLE `acertos_taxas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caixas`
--

DROP TABLE IF EXISTS `caixas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caixas` (
  `cai_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `cai_nome` varchar(45) DEFAULT NULL,
  `cai_local` varchar(45) NOT NULL,
  `cai_quiosque` int(11) NOT NULL,
  `cai_situacao` int(11) NOT NULL,
  `cai_datahoracadastro` datetime NOT NULL,
  `cai_status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cai_codigo`),
  KEY `situacao_idx` (`cai_situacao`),
  KEY `quiosque_idx` (`cai_quiosque`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixas`
--

LOCK TABLES `caixas` WRITE;
/*!40000 ALTER TABLE `caixas` DISABLE KEYS */;
/*!40000 ALTER TABLE `caixas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caixas_entradassaidas`
--

DROP TABLE IF EXISTS `caixas_entradassaidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caixas_entradassaidas` (
  `caientsai_id` int(11) NOT NULL AUTO_INCREMENT,
  `caientsai_tipo` tinyint(2) NOT NULL,
  `caientsai_valor` float NOT NULL,
  `caientsai_datacadastro` datetime NOT NULL,
  `caientsai_descricao` varchar(60) DEFAULT NULL,
  `caientsai_areceber` tinyint(2) DEFAULT NULL,
  `caientsai_venda` bigint(20) DEFAULT NULL,
  `caientsai_usuarioquecadastrou` int(11) NOT NULL,
  `caientsai_numerooperacao` int(11) NOT NULL,
  PRIMARY KEY (`caientsai_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixas_entradassaidas`
--

LOCK TABLES `caixas_entradassaidas` WRITE;
/*!40000 ALTER TABLE `caixas_entradassaidas` DISABLE KEYS */;
/*!40000 ALTER TABLE `caixas_entradassaidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caixas_operacoes`
--

DROP TABLE IF EXISTS `caixas_operacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caixas_operacoes` (
  `caiopo_numero` int(11) NOT NULL AUTO_INCREMENT,
  `caiopo_caixa` int(11) NOT NULL,
  `caiopo_datahoraabertura` datetime NOT NULL,
  `caiopo_datahoraencerramento` datetime DEFAULT NULL,
  `caiopo_operador` int(11) NOT NULL,
  `caiopo_valorinicial` float NOT NULL,
  `caiopo_saldovendas` float DEFAULT NULL,
  `caiopo_totalvendas` float DEFAULT NULL,
  `caiopo_totaltroco` float DEFAULT NULL,
  `caiopo_valorfinal` float DEFAULT NULL,
  `caiopo_diferenca` float DEFAULT NULL,
  `caiopo_totalbruto` float DEFAULT NULL,
  `caiopo_liquido` float DEFAULT NULL,
  `caiopo_liquidosemcartao` float DEFAULT NULL,
  `caiopo_liquidocartao` float DEFAULT NULL,
  `caiopo_entradastotal` float DEFAULT NULL,
  `caiopo_saidastotal` float DEFAULT NULL,
  `caiopo_saldoentradassaidas` float DEFAULT NULL,
  `caiopo_totaldescontovendas` float DEFAULT NULL,
  `caiopo_valoresperado` float DEFAULT NULL,
  `caiopo_supervisor` int(11) DEFAULT NULL,
  PRIMARY KEY (`caiopo_numero`),
  KEY `caiopo_caixa_idx` (`caiopo_caixa`),
  KEY `caiopo_operador_idx` (`caiopo_operador`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixas_operacoes`
--

LOCK TABLES `caixas_operacoes` WRITE;
/*!40000 ALTER TABLE `caixas_operacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `caixas_operacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caixas_operadores`
--

DROP TABLE IF EXISTS `caixas_operadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caixas_operadores` (
  `caiope_caixa` int(11) NOT NULL,
  `caiope_operador` int(11) NOT NULL,
  `caiope_datafuncao` datetime DEFAULT NULL,
  PRIMARY KEY (`caiope_caixa`,`caiope_operador`),
  KEY `operador_idx` (`caiope_operador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixas_operadores`
--

LOCK TABLES `caixas_operadores` WRITE;
/*!40000 ALTER TABLE `caixas_operadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `caixas_operadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caixas_situacao`
--

DROP TABLE IF EXISTS `caixas_situacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caixas_situacao` (
  `caisit_codigo` int(11) NOT NULL,
  `caisit_nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`caisit_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixas_situacao`
--

LOCK TABLES `caixas_situacao` WRITE;
/*!40000 ALTER TABLE `caixas_situacao` DISABLE KEYS */;
INSERT INTO `caixas_situacao` VALUES (1,'Aberto'),(2,'Encerrado');
/*!40000 ALTER TABLE `caixas_situacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caixas_tipo`
--

DROP TABLE IF EXISTS `caixas_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caixas_tipo` (
  `caitip_codigo` int(11) NOT NULL,
  `caitip_nome` varchar(45) NOT NULL,
  PRIMARY KEY (`caitip_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixas_tipo`
--

LOCK TABLES `caixas_tipo` WRITE;
/*!40000 ALTER TABLE `caixas_tipo` DISABLE KEYS */;
INSERT INTO `caixas_tipo` VALUES (1,'Entrada'),(2,'Saida');
/*!40000 ALTER TABLE `caixas_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidades`
--

DROP TABLE IF EXISTS `cidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidades` (
  `cid_codigo` smallint(4) NOT NULL AUTO_INCREMENT,
  `cid_estado` tinyint(2) NOT NULL DEFAULT '0',
  `cid_nome` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`cid_codigo`),
  KEY `cid_estado` (`cid_estado`)
) ENGINE=MyISAM AUTO_INCREMENT=5565 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidades`
--

LOCK TABLES `cidades` WRITE;
/*!40000 ALTER TABLE `cidades` DISABLE KEYS */;
INSERT INTO `cidades` VALUES (1,8,'Afonso Cláudio'),(2,8,'Água Doce do Norte'),(3,8,'Águia Branca'),(4,8,'Alegre'),(5,8,'Alfredo Chaves'),(6,8,'Alto Rio Novo'),(7,8,'Anchieta'),(8,8,'Apiacá'),(9,8,'Aracruz'),(10,8,'Atilio Vivacqua'),(11,8,'Baixo Guandu'),(12,8,'Barra de São Francisco'),(13,8,'Boa Esperança'),(14,8,'Bom Jesus do Norte'),(15,8,'Brejetuba'),(16,8,'Cachoeiro de Itapemirim'),(17,8,'Cariacica'),(18,8,'Castelo'),(19,8,'Colatina'),(20,8,'Conceição da Barra'),(21,8,'Conceição do Castelo'),(22,8,'Divino de São Lourenço'),(23,8,'Domingos Martins'),(24,8,'Dores do Rio Preto'),(25,8,'Ecoporanga'),(26,8,'Fundão'),(27,8,'Governador Lindenberg'),(28,8,'Guaçuí'),(29,8,'Guarapari'),(30,8,'Ibatiba'),(31,8,'Ibiraçu'),(32,8,'Ibitirama'),(33,8,'Iconha'),(34,8,'Irupi'),(35,8,'Itaguaçu'),(36,8,'Itapemirim'),(37,8,'Itarana'),(38,8,'Iúna'),(39,8,'Jaguaré'),(40,8,'Jerônimo Monteiro'),(41,8,'João Neiva'),(42,8,'Laranja da Terra'),(43,8,'Linhares'),(44,8,'Mantenópolis'),(45,8,'Marataízes'),(46,8,'Marechal Floriano'),(47,8,'Marilândia'),(48,8,'Mimoso do Sul'),(49,8,'Montanha'),(50,8,'Mucurici'),(51,8,'Muniz Freire'),(52,8,'Muqui'),(53,8,'Nova Venécia'),(54,8,'Pancas'),(55,8,'Pedro Canário'),(56,8,'Pinheiros'),(57,8,'Piúma'),(58,8,'Ponto Belo'),(59,8,'Presidente Kennedy'),(60,8,'Rio Bananal'),(61,8,'Rio Novo do Sul'),(62,8,'Santa Leopoldina'),(63,8,'Santa Maria de Jetibá'),(64,8,'Santa Teresa'),(65,8,'São Domingos do Norte'),(66,8,'São Gabriel da Palha'),(67,8,'São José do Calçado'),(68,8,'São Mateus'),(69,8,'São Roque do Canaã'),(70,8,'Serra'),(71,8,'Sooretama'),(72,8,'Vargem Alta'),(73,8,'Venda Nova do Imigrante'),(74,8,'Viana'),(75,8,'Vila Pavão'),(76,8,'Vila Valério'),(77,8,'Vila Velha'),(78,8,'Vitória'),(79,1,'Acrelândia'),(80,1,'Assis Brasil'),(81,1,'Brasiléia'),(82,1,'Bujari'),(83,1,'Capixaba'),(84,1,'Cruzeiro do Sul'),(85,1,'Epitaciolândia'),(86,1,'Feijó'),(87,1,'Jordão'),(88,1,'Mâncio Lima'),(89,1,'Manoel Urbano'),(90,1,'Marechal Thaumaturgo'),(91,1,'Plácido de Castro'),(92,1,'Porto Acre'),(93,1,'Porto Walter'),(94,1,'Rio Branco'),(95,1,'Rodrigues Alves'),(96,1,'Santa Rosa do Purus'),(97,1,'Sena Madureira'),(98,1,'Senador Guiomard'),(99,1,'Tarauacá'),(100,1,'Xapuri'),(101,2,'Água Branca'),(102,2,'Anadia'),(103,2,'Arapiraca'),(104,2,'Atalaia'),(105,2,'Barra de Santo Antônio'),(106,2,'Barra de São Miguel'),(107,2,'Batalha'),(108,2,'Belém'),(109,2,'Belo Monte'),(110,2,'Boca da Mata'),(111,2,'Branquinha'),(112,2,'Cacimbinhas'),(113,2,'Cajueiro'),(114,2,'Campestre'),(115,2,'Campo Alegre'),(116,2,'Campo Grande'),(117,2,'Canapi'),(118,2,'Capela'),(119,2,'Carneiros'),(120,2,'Chã Preta'),(121,2,'Coité do Nóia'),(122,2,'Colônia Leopoldina'),(123,2,'Coqueiro Seco'),(124,2,'Coruripe'),(125,2,'Craíbas'),(126,2,'Delmiro Gouveia'),(127,2,'Dois Riachos'),(128,2,'Estrela de Alagoas'),(129,2,'Feira Grande'),(130,2,'Feliz Deserto'),(131,2,'Flexeiras'),(132,2,'Girau do Ponciano'),(133,2,'Ibateguara'),(134,2,'Igaci'),(135,2,'Igreja Nova'),(136,2,'Inhapi'),(137,2,'Jacaré dos Homens'),(138,2,'Jacuípe'),(139,2,'Japaratinga'),(140,2,'Jaramataia'),(141,2,'Jequiá da Praia'),(142,2,'Joaquim Gomes'),(143,2,'Jundiá'),(144,2,'Junqueiro'),(145,2,'Lagoa da Canoa'),(146,2,'Limoeiro de Anadia'),(147,2,'Maceió'),(148,2,'Major Isidoro'),(149,2,'Mar Vermelho'),(150,2,'Maragogi'),(151,2,'Maravilha'),(152,2,'Marechal Deodoro'),(153,2,'Maribondo'),(154,2,'Mata Grande'),(155,2,'Matriz de Camaragibe'),(156,2,'Messias'),(157,2,'Minador do Negrão'),(158,2,'Monteirópolis'),(159,2,'Murici'),(160,2,'Novo Lino'),(161,2,'Olho dÁgua das Flores'),(162,2,'Olho dÁgua do Casado'),(163,2,'Olho dÁgua Grande'),(164,2,'Olivença'),(165,2,'Ouro Branco'),(166,2,'Palestina'),(167,2,'Palmeira dos Índios'),(168,2,'Pão de Açúcar'),(169,2,'Pariconha'),(170,2,'Paripueira'),(171,2,'Passo de Camaragibe'),(172,2,'Paulo Jacinto'),(173,2,'Penedo'),(174,2,'Piaçabuçu'),(175,2,'Pilar'),(176,2,'Pindoba'),(177,2,'Piranhas'),(178,2,'Poço das Trincheiras'),(179,2,'Porto Calvo'),(180,2,'Porto de Pedras'),(181,2,'Porto Real do Colégio'),(182,2,'Quebrangulo'),(183,2,'Rio Largo'),(184,2,'Roteiro'),(185,2,'Santa Luzia do Norte'),(186,2,'Santana do Ipanema'),(187,2,'Santana do Mundaú'),(188,2,'São Brás'),(189,2,'São José da Laje'),(190,2,'São José da Tapera'),(191,2,'São Luís do Quitunde'),(192,2,'São Miguel dos Campos'),(193,2,'São Miguel dos Milagres'),(194,2,'São Sebastião'),(195,2,'Satuba'),(196,2,'Senador Rui Palmeira'),(197,2,'Tanque dArca'),(198,2,'Taquarana'),(199,2,'Teotônio Vilela'),(200,2,'Traipu'),(201,2,'União dos Palmares'),(202,2,'Viçosa'),(203,4,'Amapá'),(204,4,'Calçoene'),(205,4,'Cutias'),(206,4,'Ferreira Gomes'),(207,4,'Itaubal'),(208,4,'Laranjal do Jari'),(209,4,'Macapá'),(210,4,'Mazagão'),(211,4,'Oiapoque'),(212,4,'Pedra Branca do Amaparí'),(213,4,'Porto Grande'),(214,4,'Pracuúba'),(215,4,'Santana'),(216,4,'Serra do Navio'),(217,4,'Tartarugalzinho'),(218,4,'Vitória do Jari'),(219,3,'Alvarães'),(220,3,'Amaturá'),(221,3,'Anamã'),(222,3,'Anori'),(223,3,'Apuí'),(224,3,'Atalaia do Norte'),(225,3,'Autazes'),(226,3,'Barcelos'),(227,3,'Barreirinha'),(228,3,'Benjamin Constant'),(229,3,'Beruri'),(230,3,'Boa Vista do Ramos'),(231,3,'Boca do Acre'),(232,3,'Borba'),(233,3,'Caapiranga'),(234,3,'Canutama'),(235,3,'Carauari'),(236,3,'Careiro'),(237,3,'Careiro da Várzea'),(238,3,'Coari'),(239,3,'Codajás'),(240,3,'Eirunepé'),(241,3,'Envira'),(242,3,'Fonte Boa'),(243,3,'Guajará'),(244,3,'Humaitá'),(245,3,'Ipixuna'),(246,3,'Iranduba'),(247,3,'Itacoatiara'),(248,3,'Itamarati'),(249,3,'Itapiranga'),(250,3,'Japurá'),(251,3,'Juruá'),(252,3,'Jutaí'),(253,3,'Lábrea'),(254,3,'Manacapuru'),(255,3,'Manaquiri'),(256,3,'Manaus'),(257,3,'Manicoré'),(258,3,'Maraã'),(259,3,'Maués'),(260,3,'Nhamundá'),(261,3,'Nova Olinda do Norte'),(262,3,'Novo Airão'),(263,3,'Novo Aripuanã'),(264,3,'Parintins'),(265,3,'Pauini'),(266,3,'Presidente Figueiredo'),(267,3,'Rio Preto da Eva'),(268,3,'Santa Isabel do Rio Negro'),(269,3,'Santo Antônio do Içá'),(270,3,'São Gabriel da Cachoeira'),(271,3,'São Paulo de Olivença'),(272,3,'São Sebastião do Uatumã'),(273,3,'Silves'),(274,3,'Tabatinga'),(275,3,'Tapauá'),(276,3,'Tefé'),(277,3,'Tonantins'),(278,3,'Uarini'),(279,3,'Urucará'),(280,3,'Urucurituba'),(281,5,'Abaíra'),(282,5,'Abaré'),(283,5,'Acajutiba'),(284,5,'Adustina'),(285,5,'Água Fria'),(286,5,'Aiquara'),(287,5,'Alagoinhas'),(288,5,'Alcobaça'),(289,5,'Almadina'),(290,5,'Amargosa'),(291,5,'Amélia Rodrigues'),(292,5,'América Dourada'),(293,5,'Anagé'),(294,5,'Andaraí'),(295,5,'Andorinha'),(296,5,'Angical'),(297,5,'Anguera'),(298,5,'Antas'),(299,5,'Antônio Cardoso'),(300,5,'Antônio Gonçalves'),(301,5,'Aporá'),(302,5,'Apuarema'),(303,5,'Araças'),(304,5,'Aracatu'),(305,5,'Araci'),(306,5,'Aramari'),(307,5,'Arataca'),(308,5,'Aratuípe'),(309,5,'Aurelino Leal'),(310,5,'Baianópolis'),(311,5,'Baixa Grande'),(312,5,'Banzaê'),(313,5,'Barra'),(314,5,'Barra da Estiva'),(315,5,'Barra do Choça'),(316,5,'Barra do Mendes'),(317,5,'Barra do Rocha'),(318,5,'Barreiras'),(319,5,'Barro Alto'),(320,5,'Barro Preto (antigo Gov. Lomanto Jr.)'),(321,5,'Barrocas'),(322,5,'Belmonte'),(323,5,'Belo Campo'),(324,5,'Biritinga'),(325,5,'Boa Nova'),(326,5,'Boa Vista do Tupim'),(327,5,'Bom Jesus da Lapa'),(328,5,'Bom Jesus da Serra'),(329,5,'Boninal'),(330,5,'Bonito'),(331,5,'Boquira'),(332,5,'Botuporã'),(333,5,'Brejões'),(334,5,'Brejolândia'),(335,5,'Brotas de Macaúbas'),(336,5,'Brumado'),(337,5,'Buerarema'),(338,5,'Buritirama'),(339,5,'Caatiba'),(340,5,'Cabaceiras do Paraguaçu'),(341,5,'Cachoeira'),(342,5,'Caculé'),(343,5,'Caém'),(344,5,'Caetanos'),(345,5,'Caetité'),(346,5,'Cafarnaum'),(347,5,'Cairu'),(348,5,'Caldeirão Grande'),(349,5,'Camacan'),(350,5,'Camaçari'),(351,5,'Camamu'),(352,5,'Campo Alegre de Lourdes'),(353,5,'Campo Formoso'),(354,5,'Canápolis'),(355,5,'Canarana'),(356,5,'Canavieiras'),(357,5,'Candeal'),(358,5,'Candeias'),(359,5,'Candiba'),(360,5,'Cândido Sales'),(361,5,'Cansanção'),(362,5,'Canudos'),(363,5,'Capela do Alto Alegre'),(364,5,'Capim Grosso'),(365,5,'Caraíbas'),(366,5,'Caravelas'),(367,5,'Cardeal da Silva'),(368,5,'Carinhanha'),(369,5,'Casa Nova'),(370,5,'Castro Alves'),(371,5,'Catolândia'),(372,5,'Catu'),(373,5,'Caturama'),(374,5,'Central'),(375,5,'Chorrochó'),(376,5,'Cícero Dantas'),(377,5,'Cipó'),(378,5,'Coaraci'),(379,5,'Cocos'),(380,5,'Conceição da Feira'),(381,5,'Conceição do Almeida'),(382,5,'Conceição do Coité'),(383,5,'Conceição do Jacuípe'),(384,5,'Conde'),(385,5,'Condeúba'),(386,5,'Contendas do Sincorá'),(387,5,'Coração de Maria'),(388,5,'Cordeiros'),(389,5,'Coribe'),(390,5,'Coronel João Sá'),(391,5,'Correntina'),(392,5,'Cotegipe'),(393,5,'Cravolândia'),(394,5,'Crisópolis'),(395,5,'Cristópolis'),(396,5,'Cruz das Almas'),(397,5,'Curaçá'),(398,5,'Dário Meira'),(399,5,'Dias dÁvila'),(400,5,'Dom Basílio'),(401,5,'Dom Macedo Costa'),(402,5,'Elísio Medrado'),(403,5,'Encruzilhada'),(404,5,'Entre Rios'),(405,5,'Érico Cardoso'),(406,5,'Esplanada'),(407,5,'Euclides da Cunha'),(408,5,'Eunápolis'),(409,5,'Fátima'),(410,5,'Feira da Mata'),(411,5,'Feira de Santana'),(412,5,'Filadélfia'),(413,5,'Firmino Alves'),(414,5,'Floresta Azul'),(415,5,'Formosa do Rio Preto'),(416,5,'Gandu'),(417,5,'Gavião'),(418,5,'Gentio do Ouro'),(419,5,'Glória'),(420,5,'Gongogi'),(421,5,'Governador Mangabeira'),(422,5,'Guajeru'),(423,5,'Guanambi'),(424,5,'Guaratinga'),(425,5,'Heliópolis'),(426,5,'Iaçu'),(427,5,'Ibiassucê'),(428,5,'Ibicaraí'),(429,5,'Ibicoara'),(430,5,'Ibicuí'),(431,5,'Ibipeba'),(432,5,'Ibipitanga'),(433,5,'Ibiquera'),(434,5,'Ibirapitanga'),(435,5,'Ibirapuã'),(436,5,'Ibirataia'),(437,5,'Ibitiara'),(438,5,'Ibititá'),(439,5,'Ibotirama'),(440,5,'Ichu'),(441,5,'Igaporã'),(442,5,'Igrapiúna'),(443,5,'Iguaí'),(444,5,'Ilhéus'),(445,5,'Inhambupe'),(446,5,'Ipecaetá'),(447,5,'Ipiaú'),(448,5,'Ipirá'),(449,5,'Ipupiara'),(450,5,'Irajuba'),(451,5,'Iramaia'),(452,5,'Iraquara'),(453,5,'Irará'),(454,5,'Irecê'),(455,5,'Itabela'),(456,5,'Itaberaba'),(457,5,'Itabuna'),(458,5,'Itacaré'),(459,5,'Itaeté'),(460,5,'Itagi'),(461,5,'Itagibá'),(462,5,'Itagimirim'),(463,5,'Itaguaçu da Bahia'),(464,5,'Itaju do Colônia'),(465,5,'Itajuípe'),(466,5,'Itamaraju'),(467,5,'Itamari'),(468,5,'Itambé'),(469,5,'Itanagra'),(470,5,'Itanhém'),(471,5,'Itaparica'),(472,5,'Itapé'),(473,5,'Itapebi'),(474,5,'Itapetinga'),(475,5,'Itapicuru'),(476,5,'Itapitanga'),(477,5,'Itaquara'),(478,5,'Itarantim'),(479,5,'Itatim'),(480,5,'Itiruçu'),(481,5,'Itiúba'),(482,5,'Itororó'),(483,5,'Ituaçu'),(484,5,'Ituberá'),(485,5,'Iuiú'),(486,5,'Jaborandi'),(487,5,'Jacaraci'),(488,5,'Jacobina'),(489,5,'Jaguaquara'),(490,5,'Jaguarari'),(491,5,'Jaguaripe'),(492,5,'Jandaíra'),(493,5,'Jequié'),(494,5,'Jeremoabo'),(495,5,'Jiquiriçá'),(496,5,'Jitaúna'),(497,5,'João Dourado'),(498,5,'Juazeiro'),(499,5,'Jucuruçu'),(500,5,'Jussara'),(501,5,'Jussari'),(502,5,'Jussiape'),(503,5,'Lafaiete Coutinho'),(504,5,'Lagoa Real'),(505,5,'Laje'),(506,5,'Lajedão'),(507,5,'Lajedinho'),(508,5,'Lajedo do Tabocal'),(509,5,'Lamarão'),(510,5,'Lapão'),(511,5,'Lauro de Freitas'),(512,5,'Lençóis'),(513,5,'Licínio de Almeida'),(514,5,'Livramento de Nossa Senhora'),(515,5,'Luís Eduardo Magalhães'),(516,5,'Macajuba'),(517,5,'Macarani'),(518,5,'Macaúbas'),(519,5,'Macururé'),(520,5,'Madre de Deus'),(521,5,'Maetinga'),(522,5,'Maiquinique'),(523,5,'Mairi'),(524,5,'Malhada'),(525,5,'Malhada de Pedras'),(526,5,'Manoel Vitorino'),(527,5,'Mansidão'),(528,5,'Maracás'),(529,5,'Maragogipe'),(530,5,'Maraú'),(531,5,'Marcionílio Souza'),(532,5,'Mascote'),(533,5,'Mata de São João'),(534,5,'Matina'),(535,5,'Medeiros Neto'),(536,5,'Miguel Calmon'),(537,5,'Milagres'),(538,5,'Mirangaba'),(539,5,'Mirante'),(540,5,'Monte Santo'),(541,5,'Morpará'),(542,5,'Morro do Chapéu'),(543,5,'Mortugaba'),(544,5,'Mucugê'),(545,5,'Mucuri'),(546,5,'Mulungu do Morro'),(547,5,'Mundo Novo'),(548,5,'Muniz Ferreira'),(549,5,'Muquém de São Francisco'),(550,5,'Muritiba'),(551,5,'Mutuípe'),(552,5,'Nazaré'),(553,5,'Nilo Peçanha'),(554,5,'Nordestina'),(555,5,'Nova Canaã'),(556,5,'Nova Fátima'),(557,5,'Nova Ibiá'),(558,5,'Nova Itarana'),(559,5,'Nova Redenção'),(560,5,'Nova Soure'),(561,5,'Nova Viçosa'),(562,5,'Novo Horizonte'),(563,5,'Novo Triunfo'),(564,5,'Olindina'),(565,5,'Oliveira dos Brejinhos'),(566,5,'Ouriçangas'),(567,5,'Ourolândia'),(568,5,'Palmas de Monte Alto'),(569,5,'Palmeiras'),(570,5,'Paramirim'),(571,5,'Paratinga'),(572,5,'Paripiranga'),(573,5,'Pau Brasil'),(574,5,'Paulo Afonso'),(575,5,'Pé de Serra'),(576,5,'Pedrão'),(577,5,'Pedro Alexandre'),(578,5,'Piatã'),(579,5,'Pilão Arcado'),(580,5,'Pindaí'),(581,5,'Pindobaçu'),(582,5,'Pintadas'),(583,5,'Piraí do Norte'),(584,5,'Piripá'),(585,5,'Piritiba'),(586,5,'Planaltino'),(587,5,'Planalto'),(588,5,'Poções'),(589,5,'Pojuca'),(590,5,'Ponto Novo'),(591,5,'Porto Seguro'),(592,5,'Potiraguá'),(593,5,'Prado'),(594,5,'Presidente Dutra'),(595,5,'Presidente Jânio Quadros'),(596,5,'Presidente Tancredo Neves'),(597,5,'Queimadas'),(598,5,'Quijingue'),(599,5,'Quixabeira'),(600,5,'Rafael Jambeiro'),(601,5,'Remanso'),(602,5,'Retirolândia'),(603,5,'Riachão das Neves'),(604,5,'Riachão do Jacuípe'),(605,5,'Riacho de Santana'),(606,5,'Ribeira do Amparo'),(607,5,'Ribeira do Pombal'),(608,5,'Ribeirão do Largo'),(609,5,'Rio de Contas'),(610,5,'Rio do Antônio'),(611,5,'Rio do Pires'),(612,5,'Rio Real'),(613,5,'Rodelas'),(614,5,'Ruy Barbosa'),(615,5,'Salinas da Margarida'),(616,5,'Salvador'),(617,5,'Santa Bárbara'),(618,5,'Santa Brígida'),(619,5,'Santa Cruz Cabrália'),(620,5,'Santa Cruz da Vitória'),(621,5,'Santa Inês'),(622,5,'Santa Luzia'),(623,5,'Santa Maria da Vitória'),(624,5,'Santa Rita de Cássia'),(625,5,'Santa Teresinha'),(626,5,'Santaluz'),(627,5,'Santana'),(628,5,'Santanópolis'),(629,5,'Santo Amaro'),(630,5,'Santo Antônio de Jesus'),(631,5,'Santo Estêvão'),(632,5,'São Desidério'),(633,5,'São Domingos'),(634,5,'São Felipe'),(635,5,'São Félix'),(636,5,'São Félix do Coribe'),(637,5,'São Francisco do Conde'),(638,5,'São Gabriel'),(639,5,'São Gonçalo dos Campos'),(640,5,'São José da Vitória'),(641,5,'São José do Jacuípe'),(642,5,'São Miguel das Matas'),(643,5,'São Sebastião do Passé'),(644,5,'Sapeaçu'),(645,5,'Sátiro Dias'),(646,5,'Saubara'),(647,5,'Saúde'),(648,5,'Seabra'),(649,5,'Sebastião Laranjeiras'),(650,5,'Senhor do Bonfim'),(651,5,'Sento Sé'),(652,5,'Serra do Ramalho'),(653,5,'Serra Dourada'),(654,5,'Serra Preta'),(655,5,'Serrinha'),(656,5,'Serrolândia'),(657,5,'Simões Filho'),(658,5,'Sítio do Mato'),(659,5,'Sítio do Quinto'),(660,5,'Sobradinho'),(661,5,'Souto Soares'),(662,5,'Tabocas do Brejo Velho'),(663,5,'Tanhaçu'),(664,5,'Tanque Novo'),(665,5,'Tanquinho'),(666,5,'Taperoá'),(667,5,'Tapiramutá'),(668,5,'Teixeira de Freitas'),(669,5,'Teodoro Sampaio'),(670,5,'Teofilândia'),(671,5,'Teolândia'),(672,5,'Terra Nova'),(673,5,'Tremedal'),(674,5,'Tucano'),(675,5,'Uauá'),(676,5,'Ubaíra'),(677,5,'Ubaitaba'),(678,5,'Ubatã'),(679,5,'Uibaí'),(680,5,'Umburanas'),(681,5,'Una'),(682,5,'Urandi'),(683,5,'Uruçuca'),(684,5,'Utinga'),(685,5,'Valença'),(686,5,'Valente'),(687,5,'Várzea da Roça'),(688,5,'Várzea do Poço'),(689,5,'Várzea Nova'),(690,5,'Varzedo'),(691,5,'Vera Cruz'),(692,5,'Vereda'),(693,5,'Vitória da Conquista'),(694,5,'Wagner'),(695,5,'Wanderley'),(696,5,'Wenceslau Guimarães'),(697,5,'Xique-Xique'),(698,6,'Abaiara'),(699,6,'Acarape'),(700,6,'Acaraú'),(701,6,'Acopiara'),(702,6,'Aiuaba'),(703,6,'Alcântaras'),(704,6,'Altaneira'),(705,6,'Alto Santo'),(706,6,'Amontada'),(707,6,'Antonina do Norte'),(708,6,'Apuiarés'),(709,6,'Aquiraz'),(710,6,'Aracati'),(711,6,'Aracoiaba'),(712,6,'Ararendá'),(713,6,'Araripe'),(714,6,'Aratuba'),(715,6,'Arneiroz'),(716,6,'Assaré'),(717,6,'Aurora'),(718,6,'Baixio'),(719,6,'Banabuiú'),(720,6,'Barbalha'),(721,6,'Barreira'),(722,6,'Barro'),(723,6,'Barroquinha'),(724,6,'Baturité'),(725,6,'Beberibe'),(726,6,'Bela Cruz'),(727,6,'Boa Viagem'),(728,6,'Brejo Santo'),(729,6,'Camocim'),(730,6,'Campos Sales'),(731,6,'Canindé'),(732,6,'Capistrano'),(733,6,'Caridade'),(734,6,'Cariré'),(735,6,'Caririaçu'),(736,6,'Cariús'),(737,6,'Carnaubal'),(738,6,'Cascavel'),(739,6,'Catarina'),(740,6,'Catunda'),(741,6,'Caucaia'),(742,6,'Cedro'),(743,6,'Chaval'),(744,6,'Choró'),(745,6,'Chorozinho'),(746,6,'Coreaú'),(747,6,'Crateús'),(748,6,'Crato'),(749,6,'Croatá'),(750,6,'Cruz'),(751,6,'Deputado Irapuan Pinheiro'),(752,6,'Ererê'),(753,6,'Eusébio'),(754,6,'Farias Brito'),(755,6,'Forquilha'),(756,6,'Fortaleza'),(757,6,'Fortim'),(758,6,'Frecheirinha'),(759,6,'General Sampaio'),(760,6,'Graça'),(761,6,'Granja'),(762,6,'Granjeiro'),(763,6,'Groaíras'),(764,6,'Guaiúba'),(765,6,'Guaraciaba do Norte'),(766,6,'Guaramiranga'),(767,6,'Hidrolândia'),(768,6,'Horizonte'),(769,6,'Ibaretama'),(770,6,'Ibiapina'),(771,6,'Ibicuitinga'),(772,6,'Icapuí'),(773,6,'Icó'),(774,6,'Iguatu'),(775,6,'Independência'),(776,6,'Ipaporanga'),(777,6,'Ipaumirim'),(778,6,'Ipu'),(779,6,'Ipueiras'),(780,6,'Iracema'),(781,6,'Irauçuba'),(782,6,'Itaiçaba'),(783,6,'Itaitinga'),(784,6,'Itapagé'),(785,6,'Itapipoca'),(786,6,'Itapiúna'),(787,6,'Itarema'),(788,6,'Itatira'),(789,6,'Jaguaretama'),(790,6,'Jaguaribara'),(791,6,'Jaguaribe'),(792,6,'Jaguaruana'),(793,6,'Jardim'),(794,6,'Jati'),(795,6,'Jijoca de Jericoacoara'),(796,6,'Juazeiro do Norte'),(797,6,'Jucás'),(798,6,'Lavras da Mangabeira'),(799,6,'Limoeiro do Norte'),(800,6,'Madalena'),(801,6,'Maracanaú'),(802,6,'Maranguape'),(803,6,'Marco'),(804,6,'Martinópole'),(805,6,'Massapê'),(806,6,'Mauriti'),(807,6,'Meruoca'),(808,6,'Milagres'),(809,6,'Milhã'),(810,6,'Miraíma'),(811,6,'Missão Velha'),(812,6,'Mombaça'),(813,6,'Monsenhor Tabosa'),(814,6,'Morada Nova'),(815,6,'Moraújo'),(816,6,'Morrinhos'),(817,6,'Mucambo'),(818,6,'Mulungu'),(819,6,'Nova Olinda'),(820,6,'Nova Russas'),(821,6,'Novo Oriente'),(822,6,'Ocara'),(823,6,'Orós'),(824,6,'Pacajus'),(825,6,'Pacatuba'),(826,6,'Pacoti'),(827,6,'Pacujá'),(828,6,'Palhano'),(829,6,'Palmácia'),(830,6,'Paracuru'),(831,6,'Paraipaba'),(832,6,'Parambu'),(833,6,'Paramoti'),(834,6,'Pedra Branca'),(835,6,'Penaforte'),(836,6,'Pentecoste'),(837,6,'Pereiro'),(838,6,'Pindoretama'),(839,6,'Piquet Carneiro'),(840,6,'Pires Ferreira'),(841,6,'Poranga'),(842,6,'Porteiras'),(843,6,'Potengi'),(844,6,'Potiretama'),(845,6,'Quiterianópolis'),(846,6,'Quixadá'),(847,6,'Quixelô'),(848,6,'Quixeramobim'),(849,6,'Quixeré'),(850,6,'Redenção'),(851,6,'Reriutaba'),(852,6,'Russas'),(853,6,'Saboeiro'),(854,6,'Salitre'),(855,6,'Santa Quitéria'),(856,6,'Santana do Acaraú'),(857,6,'Santana do Cariri'),(858,6,'São Benedito'),(859,6,'São Gonçalo do Amarante'),(860,6,'São João do Jaguaribe'),(861,6,'São Luís do Curu'),(862,6,'Senador Pompeu'),(863,6,'Senador Sá'),(864,6,'Sobral'),(865,6,'Solonópole'),(866,6,'Tabuleiro do Norte'),(867,6,'Tamboril'),(868,6,'Tarrafas'),(869,6,'Tauá'),(870,6,'Tejuçuoca'),(871,6,'Tianguá'),(872,6,'Trairi'),(873,6,'Tururu'),(874,6,'Ubajara'),(875,6,'Umari'),(876,6,'Umirim'),(877,6,'Uruburetama'),(878,6,'Uruoca'),(879,6,'Varjota'),(880,6,'Várzea Alegre'),(881,6,'Viçosa do Ceará'),(882,7,'Brasília'),(883,9,'Abadia de Goiás'),(884,9,'Abadiânia'),(885,9,'Acreúna'),(886,9,'Adelândia'),(887,9,'Água Fria de Goiás'),(888,9,'Água Limpa'),(889,9,'Águas Lindas de Goiás'),(890,9,'Alexânia'),(891,9,'Aloândia'),(892,9,'Alto Horizonte'),(893,9,'Alto Paraíso de Goiás'),(894,9,'Alvorada do Norte'),(895,9,'Amaralina'),(896,9,'Americano do Brasil'),(897,9,'Amorinópolis'),(898,9,'Anápolis'),(899,9,'Anhanguera'),(900,9,'Anicuns'),(901,9,'Aparecida de Goiânia'),(902,9,'Aparecida do Rio Doce'),(903,9,'Aporé'),(904,9,'Araçu'),(905,9,'Aragarças'),(906,9,'Aragoiânia'),(907,9,'Araguapaz'),(908,9,'Arenópolis'),(909,9,'Aruanã'),(910,9,'Aurilândia'),(911,9,'Avelinópolis'),(912,9,'Baliza'),(913,9,'Barro Alto'),(914,9,'Bela Vista de Goiás'),(915,9,'Bom Jardim de Goiás'),(916,9,'Bom Jesus de Goiás'),(917,9,'Bonfinópolis'),(918,9,'Bonópolis'),(919,9,'Brazabrantes'),(920,9,'Britânia'),(921,9,'Buriti Alegre'),(922,9,'Buriti de Goiás'),(923,9,'Buritinópolis'),(924,9,'Cabeceiras'),(925,9,'Cachoeira Alta'),(926,9,'Cachoeira de Goiás'),(927,9,'Cachoeira Dourada'),(928,9,'Caçu'),(929,9,'Caiapônia'),(930,9,'Caldas Novas'),(931,9,'Caldazinha'),(932,9,'Campestre de Goiás'),(933,9,'Campinaçu'),(934,9,'Campinorte'),(935,9,'Campo Alegre de Goiás'),(936,9,'Campo Limpo de Goiás'),(937,9,'Campos Belos'),(938,9,'Campos Verdes'),(939,9,'Carmo do Rio Verde'),(940,9,'Castelândia'),(941,9,'Catalão'),(942,9,'Caturaí'),(943,9,'Cavalcante'),(944,9,'Ceres'),(945,9,'Cezarina'),(946,9,'Chapadão do Céu'),(947,9,'Cidade Ocidental'),(948,9,'Cocalzinho de Goiás'),(949,9,'Colinas do Sul'),(950,9,'Córrego do Ouro'),(951,9,'Corumbá de Goiás'),(952,9,'Corumbaíba'),(953,9,'Cristalina'),(954,9,'Cristianópolis'),(955,9,'Crixás'),(956,9,'Cromínia'),(957,9,'Cumari'),(958,9,'Damianópolis'),(959,9,'Damolândia'),(960,9,'Davinópolis'),(961,9,'Diorama'),(962,9,'Divinópolis de Goiás'),(963,9,'Doverlândia'),(964,9,'Edealina'),(965,9,'Edéia'),(966,9,'Estrela do Norte'),(967,9,'Faina'),(968,9,'Fazenda Nova'),(969,9,'Firminópolis'),(970,9,'Flores de Goiás'),(971,9,'Formosa'),(972,9,'Formoso'),(973,9,'Gameleira de Goiás'),(974,9,'Goianápolis'),(975,9,'Goiandira'),(976,9,'Goianésia'),(977,9,'Goiânia'),(978,9,'Goianira'),(979,9,'Goiás'),(980,9,'Goiatuba'),(981,9,'Gouvelândia'),(982,9,'Guapó'),(983,9,'Guaraíta'),(984,9,'Guarani de Goiás'),(985,9,'Guarinos'),(986,9,'Heitoraí'),(987,9,'Hidrolândia'),(988,9,'Hidrolina'),(989,9,'Iaciara'),(990,9,'Inaciolândia'),(991,9,'Indiara'),(992,9,'Inhumas'),(993,9,'Ipameri'),(994,9,'Ipiranga de Goiás'),(995,9,'Iporá'),(996,9,'Israelândia'),(997,9,'Itaberaí'),(998,9,'Itaguari'),(999,9,'Itaguaru'),(1000,9,'Itajá'),(1001,9,'Itapaci'),(1002,9,'Itapirapuã'),(1003,9,'Itapuranga'),(1004,9,'Itarumã'),(1005,9,'Itauçu'),(1006,9,'Itumbiara'),(1007,9,'Ivolândia'),(1008,9,'Jandaia'),(1009,9,'Jaraguá'),(1010,9,'Jataí'),(1011,9,'Jaupaci'),(1012,9,'Jesúpolis'),(1013,9,'Joviânia'),(1014,9,'Jussara'),(1015,9,'Lagoa Santa'),(1016,9,'Leopoldo de Bulhões'),(1017,9,'Luziânia'),(1018,9,'Mairipotaba'),(1019,9,'Mambaí'),(1020,9,'Mara Rosa'),(1021,9,'Marzagão'),(1022,9,'Matrinchã'),(1023,9,'Maurilândia'),(1024,9,'Mimoso de Goiás'),(1025,9,'Minaçu'),(1026,9,'Mineiros'),(1027,9,'Moiporá'),(1028,9,'Monte Alegre de Goiás'),(1029,9,'Montes Claros de Goiás'),(1030,9,'Montividiu'),(1031,9,'Montividiu do Norte'),(1032,9,'Morrinhos'),(1033,9,'Morro Agudo de Goiás'),(1034,9,'Mossâmedes'),(1035,9,'Mozarlândia'),(1036,9,'Mundo Novo'),(1037,9,'Mutunópolis'),(1038,9,'Nazário'),(1039,9,'Nerópolis'),(1040,9,'Niquelândia'),(1041,9,'Nova América'),(1042,9,'Nova Aurora'),(1043,9,'Nova Crixás'),(1044,9,'Nova Glória'),(1045,9,'Nova Iguaçu de Goiás'),(1046,9,'Nova Roma'),(1047,9,'Nova Veneza'),(1048,9,'Novo Brasil'),(1049,9,'Novo Gama'),(1050,9,'Novo Planalto'),(1051,9,'Orizona'),(1052,9,'Ouro Verde de Goiás'),(1053,9,'Ouvidor'),(1054,9,'Padre Bernardo'),(1055,9,'Palestina de Goiás'),(1056,9,'Palmeiras de Goiás'),(1057,9,'Palmelo'),(1058,9,'Palminópolis'),(1059,9,'Panamá'),(1060,9,'Paranaiguara'),(1061,9,'Paraúna'),(1062,9,'Perolândia'),(1063,9,'Petrolina de Goiás'),(1064,9,'Pilar de Goiás'),(1065,9,'Piracanjuba'),(1066,9,'Piranhas'),(1067,9,'Pirenópolis'),(1068,9,'Pires do Rio'),(1069,9,'Planaltina'),(1070,9,'Pontalina'),(1071,9,'Porangatu'),(1072,9,'Porteirão'),(1073,9,'Portelândia'),(1074,9,'Posse'),(1075,9,'Professor Jamil'),(1076,9,'Quirinópolis'),(1077,9,'Rialma'),(1078,9,'Rianápolis'),(1079,9,'Rio Quente'),(1080,9,'Rio Verde'),(1081,9,'Rubiataba'),(1082,9,'Sanclerlândia'),(1083,9,'Santa Bárbara de Goiás'),(1084,9,'Santa Cruz de Goiás'),(1085,9,'Santa Fé de Goiás'),(1086,9,'Santa Helena de Goiás'),(1087,9,'Santa Isabel'),(1088,9,'Santa Rita do Araguaia'),(1089,9,'Santa Rita do Novo Destino'),(1090,9,'Santa Rosa de Goiás'),(1091,9,'Santa Tereza de Goiás'),(1092,9,'Santa Terezinha de Goiás'),(1093,9,'Santo Antônio da Barra'),(1094,9,'Santo Antônio de Goiás'),(1095,9,'Santo Antônio do Descoberto'),(1096,9,'São Domingos'),(1097,9,'São Francisco de Goiás'),(1098,9,'São João dAliança'),(1099,9,'São João da Paraúna'),(1100,9,'São Luís de Montes Belos'),(1101,9,'São Luíz do Norte'),(1102,9,'São Miguel do Araguaia'),(1103,9,'São Miguel do Passa Quatro'),(1104,9,'São Patrício'),(1105,9,'São Simão'),(1106,9,'Senador Canedo'),(1107,9,'Serranópolis'),(1108,9,'Silvânia'),(1109,9,'Simolândia'),(1110,9,'Sítio dAbadia'),(1111,9,'Taquaral de Goiás'),(1112,9,'Teresina de Goiás'),(1113,9,'Terezópolis de Goiás'),(1114,9,'Três Ranchos'),(1115,9,'Trindade'),(1116,9,'Trombas'),(1117,9,'Turvânia'),(1118,9,'Turvelândia'),(1119,9,'Uirapuru'),(1120,9,'Uruaçu'),(1121,9,'Uruana'),(1122,9,'Urutaí'),(1123,9,'Valparaíso de Goiás'),(1124,9,'Varjão'),(1125,9,'Vianópolis'),(1126,9,'Vicentinópolis'),(1127,9,'Vila Boa'),(1128,9,'Vila Propício'),(1129,10,'Açailândia'),(1130,10,'Afonso Cunha'),(1131,10,'Água Doce do Maranhão'),(1132,10,'Alcântara'),(1133,10,'Aldeias Altas'),(1134,10,'Altamira do Maranhão'),(1135,10,'Alto Alegre do Maranhão'),(1136,10,'Alto Alegre do Pindaré'),(1137,10,'Alto Parnaíba'),(1138,10,'Amapá do Maranhão'),(1139,10,'Amarante do Maranhão'),(1140,10,'Anajatuba'),(1141,10,'Anapurus'),(1142,10,'Apicum-Açu'),(1143,10,'Araguanã'),(1144,10,'Araioses'),(1145,10,'Arame'),(1146,10,'Arari'),(1147,10,'Axixá'),(1148,10,'Bacabal'),(1149,10,'Bacabeira'),(1150,10,'Bacuri'),(1151,10,'Bacurituba'),(1152,10,'Balsas'),(1153,10,'Barão de Grajaú'),(1154,10,'Barra do Corda'),(1155,10,'Barreirinhas'),(1156,10,'Bela Vista do Maranhão'),(1157,10,'Belágua'),(1158,10,'Benedito Leite'),(1159,10,'Bequimão'),(1160,10,'Bernardo do Mearim'),(1161,10,'Boa Vista do Gurupi'),(1162,10,'Bom Jardim'),(1163,10,'Bom Jesus das Selvas'),(1164,10,'Bom Lugar'),(1165,10,'Brejo'),(1166,10,'Brejo de Areia'),(1167,10,'Buriti'),(1168,10,'Buriti Bravo'),(1169,10,'Buriticupu'),(1170,10,'Buritirana'),(1171,10,'Cachoeira Grande'),(1172,10,'Cajapió'),(1173,10,'Cajari'),(1174,10,'Campestre do Maranhão'),(1175,10,'Cândido Mendes'),(1176,10,'Cantanhede'),(1177,10,'Capinzal do Norte'),(1178,10,'Carolina'),(1179,10,'Carutapera'),(1180,10,'Caxias'),(1181,10,'Cedral'),(1182,10,'Central do Maranhão'),(1183,10,'Centro do Guilherme'),(1184,10,'Centro Novo do Maranhão'),(1185,10,'Chapadinha'),(1186,10,'Cidelândia'),(1187,10,'Codó'),(1188,10,'Coelho Neto'),(1189,10,'Colinas'),(1190,10,'Conceição do Lago-Açu'),(1191,10,'Coroatá'),(1192,10,'Cururupu'),(1193,10,'Davinópolis'),(1194,10,'Dom Pedro'),(1195,10,'Duque Bacelar'),(1196,10,'Esperantinópolis'),(1197,10,'Estreito'),(1198,10,'Feira Nova do Maranhão'),(1199,10,'Fernando Falcão'),(1200,10,'Formosa da Serra Negra'),(1201,10,'Fortaleza dos Nogueiras'),(1202,10,'Fortuna'),(1203,10,'Godofredo Viana'),(1204,10,'Gonçalves Dias'),(1205,10,'Governador Archer'),(1206,10,'Governador Edison Lobão'),(1207,10,'Governador Eugênio Barros'),(1208,10,'Governador Luiz Rocha'),(1209,10,'Governador Newton Bello'),(1210,10,'Governador Nunes Freire'),(1211,10,'Graça Aranha'),(1212,10,'Grajaú'),(1213,10,'Guimarães'),(1214,10,'Humberto de Campos'),(1215,10,'Icatu'),(1216,10,'Igarapé do Meio'),(1217,10,'Igarapé Grande'),(1218,10,'Imperatriz'),(1219,10,'Itaipava do Grajaú'),(1220,10,'Itapecuru Mirim'),(1221,10,'Itinga do Maranhão'),(1222,10,'Jatobá'),(1223,10,'Jenipapo dos Vieiras'),(1224,10,'João Lisboa'),(1225,10,'Joselândia'),(1226,10,'Junco do Maranhão'),(1227,10,'Lago da Pedra'),(1228,10,'Lago do Junco'),(1229,10,'Lago dos Rodrigues'),(1230,10,'Lago Verde'),(1231,10,'Lagoa do Mato'),(1232,10,'Lagoa Grande do Maranhão'),(1233,10,'Lajeado Novo'),(1234,10,'Lima Campos'),(1235,10,'Loreto'),(1236,10,'Luís Domingues'),(1237,10,'Magalhães de Almeida'),(1238,10,'Maracaçumé'),(1239,10,'Marajá do Sena'),(1240,10,'Maranhãozinho'),(1241,10,'Mata Roma'),(1242,10,'Matinha'),(1243,10,'Matões'),(1244,10,'Matões do Norte'),(1245,10,'Milagres do Maranhão'),(1246,10,'Mirador'),(1247,10,'Miranda do Norte'),(1248,10,'Mirinzal'),(1249,10,'Monção'),(1250,10,'Montes Altos'),(1251,10,'Morros'),(1252,10,'Nina Rodrigues'),(1253,10,'Nova Colinas'),(1254,10,'Nova Iorque'),(1255,10,'Nova Olinda do Maranhão'),(1256,10,'Olho dÁgua das Cunhãs'),(1257,10,'Olinda Nova do Maranhão'),(1258,10,'Paço do Lumiar'),(1259,10,'Palmeirândia'),(1260,10,'Paraibano'),(1261,10,'Parnarama'),(1262,10,'Passagem Franca'),(1263,10,'Pastos Bons'),(1264,10,'Paulino Neves'),(1265,10,'Paulo Ramos'),(1266,10,'Pedreiras'),(1267,10,'Pedro do Rosário'),(1268,10,'Penalva'),(1269,10,'Peri Mirim'),(1270,10,'Peritoró'),(1271,10,'Pindaré-Mirim'),(1272,10,'Pinheiro'),(1273,10,'Pio XII'),(1274,10,'Pirapemas'),(1275,10,'Poção de Pedras'),(1276,10,'Porto Franco'),(1277,10,'Porto Rico do Maranhão'),(1278,10,'Presidente Dutra'),(1279,10,'Presidente Juscelino'),(1280,10,'Presidente Médici'),(1281,10,'Presidente Sarney'),(1282,10,'Presidente Vargas'),(1283,10,'Primeira Cruz'),(1284,10,'Raposa'),(1285,10,'Riachão'),(1286,10,'Ribamar Fiquene'),(1287,10,'Rosário'),(1288,10,'Sambaíba'),(1289,10,'Santa Filomena do Maranhão'),(1290,10,'Santa Helena'),(1291,10,'Santa Inês'),(1292,10,'Santa Luzia'),(1293,10,'Santa Luzia do Paruá'),(1294,10,'Santa Quitéria do Maranhão'),(1295,10,'Santa Rita'),(1296,10,'Santana do Maranhão'),(1297,10,'Santo Amaro do Maranhão'),(1298,10,'Santo Antônio dos Lopes'),(1299,10,'São Benedito do Rio Preto'),(1300,10,'São Bento'),(1301,10,'São Bernardo'),(1302,10,'São Domingos do Azeitão'),(1303,10,'São Domingos do Maranhão'),(1304,10,'São Félix de Balsas'),(1305,10,'São Francisco do Brejão'),(1306,10,'São Francisco do Maranhão'),(1307,10,'São João Batista'),(1308,10,'São João do Carú'),(1309,10,'São João do Paraíso'),(1310,10,'São João do Soter'),(1311,10,'São João dos Patos'),(1312,10,'São José de Ribamar'),(1313,10,'São José dos Basílios'),(1314,10,'São Luís'),(1315,10,'São Luís Gonzaga do Maranhão'),(1316,10,'São Mateus do Maranhão'),(1317,10,'São Pedro da Água Branca'),(1318,10,'São Pedro dos Crentes'),(1319,10,'São Raimundo das Mangabeiras'),(1320,10,'São Raimundo do Doca Bezerra'),(1321,10,'São Roberto'),(1322,10,'São Vicente Ferrer'),(1323,10,'Satubinha'),(1324,10,'Senador Alexandre Costa'),(1325,10,'Senador La Rocque'),(1326,10,'Serrano do Maranhão'),(1327,10,'Sítio Novo'),(1328,10,'Sucupira do Norte'),(1329,10,'Sucupira do Riachão'),(1330,10,'Tasso Fragoso'),(1331,10,'Timbiras'),(1332,10,'Timon'),(1333,10,'Trizidela do Vale'),(1334,10,'Tufilândia'),(1335,10,'Tuntum'),(1336,10,'Turiaçu'),(1337,10,'Turilândia'),(1338,10,'Tutóia'),(1339,10,'Urbano Santos'),(1340,10,'Vargem Grande'),(1341,10,'Viana'),(1342,10,'Vila Nova dos Martírios'),(1343,10,'Vitória do Mearim'),(1344,10,'Vitorino Freire'),(1345,10,'Zé Doca'),(1346,13,'Acorizal'),(1347,13,'Água Boa'),(1348,13,'Alta Floresta'),(1349,13,'Alto Araguaia'),(1350,13,'Alto Boa Vista'),(1351,13,'Alto Garças'),(1352,13,'Alto Paraguai'),(1353,13,'Alto Taquari'),(1354,13,'Apiacás'),(1355,13,'Araguaiana'),(1356,13,'Araguainha'),(1357,13,'Araputanga'),(1358,13,'Arenápolis'),(1359,13,'Aripuanã'),(1360,13,'Barão de Melgaço'),(1361,13,'Barra do Bugres'),(1362,13,'Barra do Garças'),(1363,13,'Bom Jesus do Araguaia'),(1364,13,'Brasnorte'),(1365,13,'Cáceres'),(1366,13,'Campinápolis'),(1367,13,'Campo Novo do Parecis'),(1368,13,'Campo Verde'),(1369,13,'Campos de Júlio'),(1370,13,'Canabrava do Norte'),(1371,13,'Canarana'),(1372,13,'Carlinda'),(1373,13,'Castanheira'),(1374,13,'Chapada dos Guimarães'),(1375,13,'Cláudia'),(1376,13,'Cocalinho'),(1377,13,'Colíder'),(1378,13,'Colniza'),(1379,13,'Comodoro'),(1380,13,'Confresa'),(1381,13,'Conquista dOeste'),(1382,13,'Cotriguaçu'),(1383,13,'Cuiabá'),(1384,13,'Curvelândia'),(1385,13,'Curvelândia'),(1386,13,'Denise'),(1387,13,'Diamantino'),(1388,13,'Dom Aquino'),(1389,13,'Feliz Natal'),(1390,13,'Figueirópolis dOeste'),(1391,13,'Gaúcha do Norte'),(1392,13,'General Carneiro'),(1393,13,'Glória dOeste'),(1394,13,'Guarantã do Norte'),(1395,13,'Guiratinga'),(1396,13,'Indiavaí'),(1397,13,'Ipiranga do Norte'),(1398,13,'Itanhangá'),(1399,13,'Itaúba'),(1400,13,'Itiquira'),(1401,13,'Jaciara'),(1402,13,'Jangada'),(1403,13,'Jauru'),(1404,13,'Juara'),(1405,13,'Juína'),(1406,13,'Juruena'),(1407,13,'Juscimeira'),(1408,13,'Lambari dOeste'),(1409,13,'Lucas do Rio Verde'),(1410,13,'Luciára'),(1411,13,'Marcelândia'),(1412,13,'Matupá'),(1413,13,'Mirassol dOeste'),(1414,13,'Nobres'),(1415,13,'Nortelândia'),(1416,13,'Nossa Senhora do Livramento'),(1417,13,'Nova Bandeirantes'),(1418,13,'Nova Brasilândia'),(1419,13,'Nova Canaã do Norte'),(1420,13,'Nova Guarita'),(1421,13,'Nova Lacerda'),(1422,13,'Nova Marilândia'),(1423,13,'Nova Maringá'),(1424,13,'Nova Monte verde'),(1425,13,'Nova Mutum'),(1426,13,'Nova Olímpia'),(1427,13,'Nova Santa Helena'),(1428,13,'Nova Ubiratã'),(1429,13,'Nova Xavantina'),(1430,13,'Novo Horizonte do Norte'),(1431,13,'Novo Mundo'),(1432,13,'Novo Santo Antônio'),(1433,13,'Novo São Joaquim'),(1434,13,'Paranaíta'),(1435,13,'Paranatinga'),(1436,13,'Pedra Preta'),(1437,13,'Peixoto de Azevedo'),(1438,13,'Planalto da Serra'),(1439,13,'Poconé'),(1440,13,'Pontal do Araguaia'),(1441,13,'Ponte Branca'),(1442,13,'Pontes e Lacerda'),(1443,13,'Porto Alegre do Norte'),(1444,13,'Porto dos Gaúchos'),(1445,13,'Porto Esperidião'),(1446,13,'Porto Estrela'),(1447,13,'Poxoréo'),(1448,13,'Primavera do Leste'),(1449,13,'Querência'),(1450,13,'Reserva do Cabaçal'),(1451,13,'Ribeirão Cascalheira'),(1452,13,'Ribeirãozinho'),(1453,13,'Rio Branco'),(1454,13,'Rondolândia'),(1455,13,'Rondonópolis'),(1456,13,'Rosário Oeste'),(1457,13,'Salto do Céu'),(1458,13,'Santa Carmem'),(1459,13,'Santa Cruz do Xingu'),(1460,13,'Santa Rita do Trivelato'),(1461,13,'Santa Terezinha'),(1462,13,'Santo Afonso'),(1463,13,'Santo Antônio do Leste'),(1464,13,'Santo Antônio do Leverger'),(1465,13,'São Félix do Araguaia'),(1466,13,'São José do Povo'),(1467,13,'São José do Rio Claro'),(1468,13,'São José do Xingu'),(1469,13,'São José dos Quatro Marcos'),(1470,13,'São Pedro da Cipa'),(1471,13,'Sapezal'),(1472,13,'Serra Nova Dourada'),(1473,13,'Sinop'),(1474,13,'Sorriso'),(1475,13,'Tabaporã'),(1476,13,'Tangará da Serra'),(1477,13,'Tapurah'),(1478,13,'Terra Nova do Norte'),(1479,13,'Tesouro'),(1480,13,'Torixoréu'),(1481,13,'União do Sul'),(1482,13,'Vale de São Domingos'),(1483,13,'Várzea Grande'),(1484,13,'Vera'),(1485,13,'Vila Bela da Santíssima Trindade'),(1486,13,'Vila Rica'),(1487,12,'Água Clara'),(1488,12,'Alcinópolis'),(1489,12,'Amambaí'),(1490,12,'Anastácio'),(1491,12,'Anaurilândia'),(1492,12,'Angélica'),(1493,12,'Antônio João'),(1494,12,'Aparecida do Taboado'),(1495,12,'Aquidauana'),(1496,12,'Aral Moreira'),(1497,12,'Bandeirantes'),(1498,12,'Bataguassu'),(1499,12,'Bataiporã'),(1500,12,'Bela Vista'),(1501,12,'Bodoquena'),(1502,12,'Bonito'),(1503,12,'Brasilândia'),(1504,12,'Caarapó'),(1505,12,'Camapuã'),(1506,12,'Campo Grande'),(1507,12,'Caracol'),(1508,12,'Cassilândia'),(1509,12,'Chapadão do Sul'),(1510,12,'Corguinho'),(1511,12,'Coronel Sapucaia'),(1512,12,'Corumbá'),(1513,12,'Costa Rica'),(1514,12,'Coxim'),(1515,12,'Deodápolis'),(1516,12,'Dois Irmãos do Buriti'),(1517,12,'Douradina'),(1518,12,'Dourados'),(1519,12,'Eldorado'),(1520,12,'Fátima do Sul'),(1521,12,'Figueirão'),(1522,12,'Glória de Dourados'),(1523,12,'Guia Lopes da Laguna'),(1524,12,'Iguatemi'),(1525,12,'Inocência'),(1526,12,'Itaporã'),(1527,12,'Itaquiraí'),(1528,12,'Ivinhema'),(1529,12,'Japorã'),(1530,12,'Jaraguari'),(1531,12,'Jardim'),(1532,12,'Jateí'),(1533,12,'Juti'),(1534,12,'Ladário'),(1535,12,'Laguna Carapã'),(1536,12,'Maracaju'),(1537,12,'Miranda'),(1538,12,'Mundo Novo'),(1539,12,'Naviraí'),(1540,12,'Nioaque'),(1541,12,'Nova Alvorada do Sul'),(1542,12,'Nova Andradina'),(1543,12,'Novo Horizonte do Sul'),(1544,12,'Paranaíba'),(1545,12,'Paranhos'),(1546,12,'Pedro Gomes'),(1547,12,'Ponta Porã'),(1548,12,'Porto Murtinho'),(1549,12,'Ribas do Rio Pardo'),(1550,12,'Rio Brilhante'),(1551,12,'Rio Negro'),(1552,12,'Rio Verde de Mato Grosso'),(1553,12,'Rochedo'),(1554,12,'Santa Rita do Pardo'),(1555,12,'São Gabriel do Oeste'),(1556,12,'Selvíria'),(1557,12,'Sete Quedas'),(1558,12,'Sidrolândia'),(1559,12,'Sonora'),(1560,12,'Tacuru'),(1561,12,'Taquarussu'),(1562,12,'Terenos'),(1563,12,'Três Lagoas'),(1564,12,'Vicentina'),(1565,11,'Abadia dos Dourados'),(1566,11,'Abaeté'),(1567,11,'Abre Campo'),(1568,11,'Acaiaca'),(1569,11,'Açucena'),(1570,11,'Água Boa'),(1571,11,'Água Comprida'),(1572,11,'Aguanil'),(1573,11,'Águas Formosas'),(1574,11,'Águas Vermelhas'),(1575,11,'Aimorés'),(1576,11,'Aiuruoca'),(1577,11,'Alagoa'),(1578,11,'Albertina'),(1579,11,'Além Paraíba'),(1580,11,'Alfenas'),(1581,11,'Alfredo Vasconcelos'),(1582,11,'Almenara'),(1583,11,'Alpercata'),(1584,11,'Alpinópolis'),(1585,11,'Alterosa'),(1586,11,'Alto Caparaó'),(1587,11,'Alto Jequitibá'),(1588,11,'Alto Rio Doce'),(1589,11,'Alvarenga'),(1590,11,'Alvinópolis'),(1591,11,'Alvorada de Minas'),(1592,11,'Amparo do Serra'),(1593,11,'Andradas'),(1594,11,'Andrelândia'),(1595,11,'Angelândia'),(1596,11,'Antônio Carlos'),(1597,11,'Antônio Dias'),(1598,11,'Antônio Prado de Minas'),(1599,11,'Araçaí'),(1600,11,'Aracitaba'),(1601,11,'Araçuaí'),(1602,11,'Araguari'),(1603,11,'Arantina'),(1604,11,'Araponga'),(1605,11,'Araporã'),(1606,11,'Arapuá'),(1607,11,'Araújos'),(1608,11,'Araxá'),(1609,11,'Arceburgo'),(1610,11,'Arcos'),(1611,11,'Areado'),(1612,11,'Argirita'),(1613,11,'Aricanduva'),(1614,11,'Arinos'),(1615,11,'Astolfo Dutra'),(1616,11,'Ataléia'),(1617,11,'Augusto de Lima'),(1618,11,'Baependi'),(1619,11,'Baldim'),(1620,11,'Bambuí'),(1621,11,'Bandeira'),(1622,11,'Bandeira do Sul'),(1623,11,'Barão de Cocais'),(1624,11,'Barão de Monte Alto'),(1625,11,'Barbacena'),(1626,11,'Barra Longa'),(1627,11,'Barroso'),(1628,11,'Bela Vista de Minas'),(1629,11,'Belmiro Braga'),(1630,11,'Belo Horizonte'),(1631,11,'Belo Oriente'),(1632,11,'Belo Vale'),(1633,11,'Berilo'),(1634,11,'Berizal'),(1635,11,'Bertópolis'),(1636,11,'Betim'),(1637,11,'Bias Fortes'),(1638,11,'Bicas'),(1639,11,'Biquinhas'),(1640,11,'Boa Esperança'),(1641,11,'Bocaina de Minas'),(1642,11,'Bocaiúva'),(1643,11,'Bom Despacho'),(1644,11,'Bom Jardim de Minas'),(1645,11,'Bom Jesus da Penha'),(1646,11,'Bom Jesus do Amparo'),(1647,11,'Bom Jesus do Galho'),(1648,11,'Bom Repouso'),(1649,11,'Bom Sucesso'),(1650,11,'Bonfim'),(1651,11,'Bonfinópolis de Minas'),(1652,11,'Bonito de Minas'),(1653,11,'Borda da Mata'),(1654,11,'Botelhos'),(1655,11,'Botumirim'),(1656,11,'Brás Pires'),(1657,11,'Brasilândia de Minas'),(1658,11,'Brasília de Minas'),(1659,11,'Brasópolis'),(1660,11,'Braúnas'),(1661,11,'Brumadinho'),(1662,11,'Bueno Brandão'),(1663,11,'Buenópolis'),(1664,11,'Bugre'),(1665,11,'Buritis'),(1666,11,'Buritizeiro'),(1667,11,'Cabeceira Grande'),(1668,11,'Cabo Verde'),(1669,11,'Cachoeira da Prata'),(1670,11,'Cachoeira de Minas'),(1671,11,'Cachoeira de Pajeú'),(1672,11,'Cachoeira Dourada'),(1673,11,'Caetanópolis'),(1674,11,'Caeté'),(1675,11,'Caiana'),(1676,11,'Cajuri'),(1677,11,'Caldas'),(1678,11,'Camacho'),(1679,11,'Camanducaia'),(1680,11,'Cambuí'),(1681,11,'Cambuquira'),(1682,11,'Campanário'),(1683,11,'Campanha'),(1684,11,'Campestre'),(1685,11,'Campina Verde'),(1686,11,'Campo Azul'),(1687,11,'Campo Belo'),(1688,11,'Campo do Meio'),(1689,11,'Campo Florido'),(1690,11,'Campos Altos'),(1691,11,'Campos Gerais'),(1692,11,'Cana Verde'),(1693,11,'Canaã'),(1694,11,'Canápolis'),(1695,11,'Candeias'),(1696,11,'Cantagalo'),(1697,11,'Caparaó'),(1698,11,'Capela Nova'),(1699,11,'Capelinha'),(1700,11,'Capetinga'),(1701,11,'Capim Branco'),(1702,11,'Capinópolis'),(1703,11,'Capitão Andrade'),(1704,11,'Capitão Enéas'),(1705,11,'Capitólio'),(1706,11,'Caputira'),(1707,11,'Caraí'),(1708,11,'Caranaíba'),(1709,11,'Carandaí'),(1710,11,'Carangola'),(1711,11,'Caratinga'),(1712,11,'Carbonita'),(1713,11,'Careaçu'),(1714,11,'Carlos Chagas'),(1715,11,'Carmésia'),(1716,11,'Carmo da Cachoeira'),(1717,11,'Carmo da Mata'),(1718,11,'Carmo de Minas'),(1719,11,'Carmo do Cajuru'),(1720,11,'Carmo do Paranaíba'),(1721,11,'Carmo do Rio Claro'),(1722,11,'Carmópolis de Minas'),(1723,11,'Carneirinho'),(1724,11,'Carrancas'),(1725,11,'Carvalhópolis'),(1726,11,'Carvalhos'),(1727,11,'Casa Grande'),(1728,11,'Cascalho Rico'),(1729,11,'Cássia'),(1730,11,'Cataguases'),(1731,11,'Catas Altas'),(1732,11,'Catas Altas da Noruega'),(1733,11,'Catuji'),(1734,11,'Catuti'),(1735,11,'Caxambu'),(1736,11,'Cedro do Abaeté'),(1737,11,'Central de Minas'),(1738,11,'Centralina'),(1739,11,'Chácara'),(1740,11,'Chalé'),(1741,11,'Chapada do Norte'),(1742,11,'Chapada Gaúcha'),(1743,11,'Chiador'),(1744,11,'Cipotânea'),(1745,11,'Claraval'),(1746,11,'Claro dos Poções'),(1747,11,'Cláudio'),(1748,11,'Coimbra'),(1749,11,'Coluna'),(1750,11,'Comendador Gomes'),(1751,11,'Comercinho'),(1752,11,'Conceição da Aparecida'),(1753,11,'Conceição da Barra de Minas'),(1754,11,'Conceição das Alagoas'),(1755,11,'Conceição das Pedras'),(1756,11,'Conceição de Ipanema'),(1757,11,'Conceição do Mato Dentro'),(1758,11,'Conceição do Pará'),(1759,11,'Conceição do Rio Verde'),(1760,11,'Conceição dos Ouros'),(1761,11,'Cônego Marinho'),(1762,11,'Confins'),(1763,11,'Congonhal'),(1764,11,'Congonhas'),(1765,11,'Congonhas do Norte'),(1766,11,'Conquista'),(1767,11,'Conselheiro Lafaiete'),(1768,11,'Conselheiro Pena'),(1769,11,'Consolação'),(1770,11,'Contagem'),(1771,11,'Coqueiral'),(1772,11,'Coração de Jesus'),(1773,11,'Cordisburgo'),(1774,11,'Cordislândia'),(1775,11,'Corinto'),(1776,11,'Coroaci'),(1777,11,'Coromandel'),(1778,11,'Coronel Fabriciano'),(1779,11,'Coronel Murta'),(1780,11,'Coronel Pacheco'),(1781,11,'Coronel Xavier Chaves'),(1782,11,'Córrego Danta'),(1783,11,'Córrego do Bom Jesus'),(1784,11,'Córrego Fundo'),(1785,11,'Córrego Novo'),(1786,11,'Couto de Magalhães de Minas'),(1787,11,'Crisólita'),(1788,11,'Cristais'),(1789,11,'Cristália'),(1790,11,'Cristiano Otoni'),(1791,11,'Cristina'),(1792,11,'Crucilândia'),(1793,11,'Cruzeiro da Fortaleza'),(1794,11,'Cruzília'),(1795,11,'Cuparaque'),(1796,11,'Curral de Dentro'),(1797,11,'Curvelo'),(1798,11,'Datas'),(1799,11,'Delfim Moreira'),(1800,11,'Delfinópolis'),(1801,11,'Delta'),(1802,11,'Descoberto'),(1803,11,'Desterro de Entre Rios'),(1804,11,'Desterro do Melo'),(1805,11,'Diamantina'),(1806,11,'Diogo de Vasconcelos'),(1807,11,'Dionísio'),(1808,11,'Divinésia'),(1809,11,'Divino'),(1810,11,'Divino das Laranjeiras'),(1811,11,'Divinolândia de Minas'),(1812,11,'Divinópolis'),(1813,11,'Divisa Alegre'),(1814,11,'Divisa Nova'),(1815,11,'Divisópolis'),(1816,11,'Dom Bosco'),(1817,11,'Dom Cavati'),(1818,11,'Dom Joaquim'),(1819,11,'Dom Silvério'),(1820,11,'Dom Viçoso'),(1821,11,'Dona Eusébia'),(1822,11,'Dores de Campos'),(1823,11,'Dores de Guanhães'),(1824,11,'Dores do Indaiá'),(1825,11,'Dores do Turvo'),(1826,11,'Doresópolis'),(1827,11,'Douradoquara'),(1828,11,'Durandé'),(1829,11,'Elói Mendes'),(1830,11,'Engenheiro Caldas'),(1831,11,'Engenheiro Navarro'),(1832,11,'Entre Folhas'),(1833,11,'Entre Rios de Minas'),(1834,11,'Ervália'),(1835,11,'Esmeraldas'),(1836,11,'Espera Feliz'),(1837,11,'Espinosa'),(1838,11,'Espírito Santo do Dourado'),(1839,11,'Estiva'),(1840,11,'Estrela Dalva'),(1841,11,'Estrela do Indaiá'),(1842,11,'Estrela do Sul'),(1843,11,'Eugenópolis'),(1844,11,'Ewbank da Câmara'),(1845,11,'Extrema'),(1846,11,'Fama'),(1847,11,'Faria Lemos'),(1848,11,'Felício dos Santos'),(1849,11,'Felisburgo'),(1850,11,'Felixlândia'),(1851,11,'Fernandes Tourinho'),(1852,11,'Ferros'),(1853,11,'Fervedouro'),(1854,11,'Florestal'),(1855,11,'Formiga'),(1856,11,'Formoso'),(1857,11,'Fortaleza de Minas'),(1858,11,'Fortuna de Minas'),(1859,11,'Francisco Badaró'),(1860,11,'Francisco Dumont'),(1861,11,'Francisco Sá'),(1862,11,'Franciscópolis'),(1863,11,'Frei Gaspar'),(1864,11,'Frei Inocêncio'),(1865,11,'Frei Lagonegro'),(1866,11,'Fronteira'),(1867,11,'Fronteira dos Vales'),(1868,11,'Fruta de Leite'),(1869,11,'Frutal'),(1870,11,'Funilândia'),(1871,11,'Galiléia'),(1872,11,'Gameleiras'),(1873,11,'Glaucilândia'),(1874,11,'Goiabeira'),(1875,11,'Goianá'),(1876,11,'Gonçalves'),(1877,11,'Gonzaga'),(1878,11,'Gouveia'),(1879,11,'Governador Valadares'),(1880,11,'Grão Mogol'),(1881,11,'Grupiara'),(1882,11,'Guanhães'),(1883,11,'Guapé'),(1884,11,'Guaraciaba'),(1885,11,'Guaraciama'),(1886,11,'Guaranésia'),(1887,11,'Guarani'),(1888,11,'Guarará'),(1889,11,'Guarda-Mor'),(1890,11,'Guaxupé'),(1891,11,'Guidoval'),(1892,11,'Guimarânia'),(1893,11,'Guiricema'),(1894,11,'Gurinhatã'),(1895,11,'Heliodora'),(1896,11,'Iapu'),(1897,11,'Ibertioga'),(1898,11,'Ibiá'),(1899,11,'Ibiaí'),(1900,11,'Ibiracatu'),(1901,11,'Ibiraci'),(1902,11,'Ibirité'),(1903,11,'Ibitiúra de Minas'),(1904,11,'Ibituruna'),(1905,11,'Icaraí de Minas'),(1906,11,'Igarapé'),(1907,11,'Igaratinga'),(1908,11,'Iguatama'),(1909,11,'Ijaci'),(1910,11,'Ilicínea'),(1911,11,'Imbé de Minas'),(1912,11,'Inconfidentes'),(1913,11,'Indaiabira'),(1914,11,'Indianópolis'),(1915,11,'Ingaí'),(1916,11,'Inhapim'),(1917,11,'Inhaúma'),(1918,11,'Inimutaba'),(1919,11,'Ipaba'),(1920,11,'Ipanema'),(1921,11,'Ipatinga'),(1922,11,'Ipiaçu'),(1923,11,'Ipuiúna'),(1924,11,'Iraí de Minas'),(1925,11,'Itabira'),(1926,11,'Itabirinha de Mantena'),(1927,11,'Itabirito'),(1928,11,'Itacambira'),(1929,11,'Itacarambi'),(1930,11,'Itaguara'),(1931,11,'Itaipé'),(1932,11,'Itajubá'),(1933,11,'Itamarandiba'),(1934,11,'Itamarati de Minas'),(1935,11,'Itambacuri'),(1936,11,'Itambé do Mato Dentro'),(1937,11,'Itamogi'),(1938,11,'Itamonte'),(1939,11,'Itanhandu'),(1940,11,'Itanhomi'),(1941,11,'Itaobim'),(1942,11,'Itapagipe'),(1943,11,'Itapecerica'),(1944,11,'Itapeva'),(1945,11,'Itatiaiuçu'),(1946,11,'Itaú de Minas'),(1947,11,'Itaúna'),(1948,11,'Itaverava'),(1949,11,'Itinga'),(1950,11,'Itueta'),(1951,11,'Ituiutaba'),(1952,11,'Itumirim'),(1953,11,'Iturama'),(1954,11,'Itutinga'),(1955,11,'Jaboticatubas'),(1956,11,'Jacinto'),(1957,11,'Jacuí'),(1958,11,'Jacutinga'),(1959,11,'Jaguaraçu'),(1960,11,'Jaíba'),(1961,11,'Jampruca'),(1962,11,'Janaúba'),(1963,11,'Januária'),(1964,11,'Japaraíba'),(1965,11,'Japonvar'),(1966,11,'Jeceaba'),(1967,11,'Jenipapo de Minas'),(1968,11,'Jequeri'),(1969,11,'Jequitaí'),(1970,11,'Jequitibá'),(1971,11,'Jequitinhonha'),(1972,11,'Jesuânia'),(1973,11,'Joaíma'),(1974,11,'Joanésia'),(1975,11,'João Monlevade'),(1976,11,'João Pinheiro'),(1977,11,'Joaquim Felício'),(1978,11,'Jordânia'),(1979,11,'José Gonçalves de Minas'),(1980,11,'José Raydan'),(1981,11,'Josenópolis'),(1982,11,'Juatuba'),(1983,11,'Juiz de Fora'),(1984,11,'Juramento'),(1985,11,'Juruaia'),(1986,11,'Juvenília'),(1987,11,'Ladainha'),(1988,11,'Lagamar'),(1989,11,'Lagoa da Prata'),(1990,11,'Lagoa dos Patos'),(1991,11,'Lagoa Dourada'),(1992,11,'Lagoa Formosa'),(1993,11,'Lagoa Grande'),(1994,11,'Lagoa Santa'),(1995,11,'Lajinha'),(1996,11,'Lambari'),(1997,11,'Lamim'),(1998,11,'Laranjal'),(1999,11,'Lassance'),(2000,11,'Lavras'),(2001,11,'Leandro Ferreira'),(2002,11,'Leme do Prado'),(2003,11,'Leopoldina'),(2004,11,'Liberdade'),(2005,11,'Lima Duarte'),(2006,11,'Limeira do Oeste'),(2007,11,'Lontra'),(2008,11,'Luisburgo'),(2009,11,'Luislândia'),(2010,11,'Luminárias'),(2011,11,'Luz'),(2012,11,'Machacalis'),(2013,11,'Machado'),(2014,11,'Madre de Deus de Minas'),(2015,11,'Malacacheta'),(2016,11,'Mamonas'),(2017,11,'Manga'),(2018,11,'Manhuaçu'),(2019,11,'Manhumirim'),(2020,11,'Mantena'),(2021,11,'Mar de Espanha'),(2022,11,'Maravilhas'),(2023,11,'Maria da Fé'),(2024,11,'Mariana'),(2025,11,'Marilac'),(2026,11,'Mário Campos'),(2027,11,'Maripá de Minas'),(2028,11,'Marliéria'),(2029,11,'Marmelópolis'),(2030,11,'Martinho Campos'),(2031,11,'Martins Soares'),(2032,11,'Mata Verde'),(2033,11,'Materlândia'),(2034,11,'Mateus Leme'),(2035,11,'Mathias Lobato'),(2036,11,'Matias Barbosa'),(2037,11,'Matias Cardoso'),(2038,11,'Matipó'),(2039,11,'Mato Verde'),(2040,11,'Matozinhos'),(2041,11,'Matutina'),(2042,11,'Medeiros'),(2043,11,'Medina'),(2044,11,'Mendes Pimentel'),(2045,11,'Mercês'),(2046,11,'Mesquita'),(2047,11,'Minas Novas'),(2048,11,'Minduri'),(2049,11,'Mirabela'),(2050,11,'Miradouro'),(2051,11,'Miraí'),(2052,11,'Miravânia'),(2053,11,'Moeda'),(2054,11,'Moema'),(2055,11,'Monjolos'),(2056,11,'Monsenhor Paulo'),(2057,11,'Montalvânia'),(2058,11,'Monte Alegre de Minas'),(2059,11,'Monte Azul'),(2060,11,'Monte Belo'),(2061,11,'Monte Carmelo'),(2062,11,'Monte Formoso'),(2063,11,'Monte Santo de Minas'),(2064,11,'Monte Sião'),(2065,11,'Montes Claros'),(2066,11,'Montezuma'),(2067,11,'Morada Nova de Minas'),(2068,11,'Morro da Garça'),(2069,11,'Morro do Pilar'),(2070,11,'Munhoz'),(2071,11,'Muriaé'),(2072,11,'Mutum'),(2073,11,'Muzambinho'),(2074,11,'Nacip Raydan'),(2075,11,'Nanuque'),(2076,11,'Naque'),(2077,11,'Natalândia'),(2078,11,'Natércia'),(2079,11,'Nazareno'),(2080,11,'Nepomuceno'),(2081,11,'Ninheira'),(2082,11,'Nova Belém'),(2083,11,'Nova Era'),(2084,11,'Nova Lima'),(2085,11,'Nova Módica'),(2086,11,'Nova Ponte'),(2087,11,'Nova Porteirinha'),(2088,11,'Nova Resende'),(2089,11,'Nova Serrana'),(2090,11,'Nova União'),(2091,11,'Novo Cruzeiro'),(2092,11,'Novo Oriente de Minas'),(2093,11,'Novorizonte'),(2094,11,'Olaria'),(2095,11,'Olhos-dÁgua'),(2096,11,'Olímpio Noronha'),(2097,11,'Oliveira'),(2098,11,'Oliveira Fortes'),(2099,11,'Onça de Pitangui'),(2100,11,'Oratórios'),(2101,11,'Orizânia'),(2102,11,'Ouro Branco'),(2103,11,'Ouro Fino'),(2104,11,'Ouro Preto'),(2105,11,'Ouro Verde de Minas'),(2106,11,'Padre Carvalho'),(2107,11,'Padre Paraíso'),(2108,11,'Pai Pedro'),(2109,11,'Paineiras'),(2110,11,'Pains'),(2111,11,'Paiva'),(2112,11,'Palma'),(2113,11,'Palmópolis'),(2114,11,'Papagaios'),(2115,11,'Pará de Minas'),(2116,11,'Paracatu'),(2117,11,'Paraguaçu'),(2118,11,'Paraisópolis'),(2119,11,'Paraopeba'),(2120,11,'Passa Quatro'),(2121,11,'Passa Tempo'),(2122,11,'Passabém'),(2123,11,'Passa-Vinte'),(2124,11,'Passos'),(2125,11,'Patis'),(2126,11,'Patos de Minas'),(2127,11,'Patrocínio'),(2128,11,'Patrocínio do Muriaé'),(2129,11,'Paula Cândido'),(2130,11,'Paulistas'),(2131,11,'Pavão'),(2132,11,'Peçanha'),(2133,11,'Pedra Azul'),(2134,11,'Pedra Bonita'),(2135,11,'Pedra do Anta'),(2136,11,'Pedra do Indaiá'),(2137,11,'Pedra Dourada'),(2138,11,'Pedralva'),(2139,11,'Pedras de Maria da Cruz'),(2140,11,'Pedrinópolis'),(2141,11,'Pedro Leopoldo'),(2142,11,'Pedro Teixeira'),(2143,11,'Pequeri'),(2144,11,'Pequi'),(2145,11,'Perdigão'),(2146,11,'Perdizes'),(2147,11,'Perdões'),(2148,11,'Periquito'),(2149,11,'Pescador'),(2150,11,'Piau'),(2151,11,'Piedade de Caratinga'),(2152,11,'Piedade de Ponte Nova'),(2153,11,'Piedade do Rio Grande'),(2154,11,'Piedade dos Gerais'),(2155,11,'Pimenta'),(2156,11,'Pingo-dÁgua'),(2157,11,'Pintópolis'),(2158,11,'Piracema'),(2159,11,'Pirajuba'),(2160,11,'Piranga'),(2161,11,'Piranguçu'),(2162,11,'Piranguinho'),(2163,11,'Pirapetinga'),(2164,11,'Pirapora'),(2165,11,'Piraúba'),(2166,11,'Pitangui'),(2167,11,'Piumhi'),(2168,11,'Planura'),(2169,11,'Poço Fundo'),(2170,11,'Poços de Caldas'),(2171,11,'Pocrane'),(2172,11,'Pompéu'),(2173,11,'Ponte Nova'),(2174,11,'Ponto Chique'),(2175,11,'Ponto dos Volantes'),(2176,11,'Porteirinha'),(2177,11,'Porto Firme'),(2178,11,'Poté'),(2179,11,'Pouso Alegre'),(2180,11,'Pouso Alto'),(2181,11,'Prados'),(2182,11,'Prata'),(2183,11,'Pratápolis'),(2184,11,'Pratinha'),(2185,11,'Presidente Bernardes'),(2186,11,'Presidente Juscelino'),(2187,11,'Presidente Kubitschek'),(2188,11,'Presidente Olegário'),(2189,11,'Prudente de Morais'),(2190,11,'Quartel Geral'),(2191,11,'Queluzito'),(2192,11,'Raposos'),(2193,11,'Raul Soares'),(2194,11,'Recreio'),(2195,11,'Reduto'),(2196,11,'Resende Costa'),(2197,11,'Resplendor'),(2198,11,'Ressaquinha'),(2199,11,'Riachinho'),(2200,11,'Riacho dos Machados'),(2201,11,'Ribeirão das Neves'),(2202,11,'Ribeirão Vermelho'),(2203,11,'Rio Acima'),(2204,11,'Rio Casca'),(2205,11,'Rio do Prado'),(2206,11,'Rio Doce'),(2207,11,'Rio Espera'),(2208,11,'Rio Manso'),(2209,11,'Rio Novo'),(2210,11,'Rio Paranaíba'),(2211,11,'Rio Pardo de Minas'),(2212,11,'Rio Piracicaba'),(2213,11,'Rio Pomba'),(2214,11,'Rio Preto'),(2215,11,'Rio Vermelho'),(2216,11,'Ritápolis'),(2217,11,'Rochedo de Minas'),(2218,11,'Rodeiro'),(2219,11,'Romaria'),(2220,11,'Rosário da Limeira'),(2221,11,'Rubelita'),(2222,11,'Rubim'),(2223,11,'Sabará'),(2224,11,'Sabinópolis'),(2225,11,'Sacramento'),(2226,11,'Salinas'),(2227,11,'Salto da Divisa'),(2228,11,'Santa Bárbara'),(2229,11,'Santa Bárbara do Leste'),(2230,11,'Santa Bárbara do Monte Verde'),(2231,11,'Santa Bárbara do Tugúrio'),(2232,11,'Santa Cruz de Minas'),(2233,11,'Santa Cruz de Salinas'),(2234,11,'Santa Cruz do Escalvado'),(2235,11,'Santa Efigênia de Minas'),(2236,11,'Santa Fé de Minas'),(2237,11,'Santa Helena de Minas'),(2238,11,'Santa Juliana'),(2239,11,'Santa Luzia'),(2240,11,'Santa Margarida'),(2241,11,'Santa Maria de Itabira'),(2242,11,'Santa Maria do Salto'),(2243,11,'Santa Maria do Suaçuí'),(2244,11,'Santa Rita de Caldas'),(2245,11,'Santa Rita de Ibitipoca'),(2246,11,'Santa Rita de Jacutinga'),(2247,11,'Santa Rita de Minas'),(2248,11,'Santa Rita do Itueto'),(2249,11,'Santa Rita do Sapucaí'),(2250,11,'Santa Rosa da Serra'),(2251,11,'Santa Vitória'),(2252,11,'Santana da Vargem'),(2253,11,'Santana de Cataguases'),(2254,11,'Santana de Pirapama'),(2255,11,'Santana do Deserto'),(2256,11,'Santana do Garambéu'),(2257,11,'Santana do Jacaré'),(2258,11,'Santana do Manhuaçu'),(2259,11,'Santana do Paraíso'),(2260,11,'Santana do Riacho'),(2261,11,'Santana dos Montes'),(2262,11,'Santo Antônio do Amparo'),(2263,11,'Santo Antônio do Aventureiro'),(2264,11,'Santo Antônio do Grama'),(2265,11,'Santo Antônio do Itambé'),(2266,11,'Santo Antônio do Jacinto'),(2267,11,'Santo Antônio do Monte'),(2268,11,'Santo Antônio do Retiro'),(2269,11,'Santo Antônio do Rio Abaixo'),(2270,11,'Santo Hipólito'),(2271,11,'Santos Dumont'),(2272,11,'São Bento Abade'),(2273,11,'São Brás do Suaçuí'),(2274,11,'São Domingos das Dores'),(2275,11,'São Domingos do Prata'),(2276,11,'São Félix de Minas'),(2277,11,'São Francisco'),(2278,11,'São Francisco de Paula'),(2279,11,'São Francisco de Sales'),(2280,11,'São Francisco do Glória'),(2281,11,'São Geraldo'),(2282,11,'São Geraldo da Piedade'),(2283,11,'São Geraldo do Baixio'),(2284,11,'São Gonçalo do Abaeté'),(2285,11,'São Gonçalo do Pará'),(2286,11,'São Gonçalo do Rio Abaixo'),(2287,11,'São Gonçalo do Rio Preto'),(2288,11,'São Gonçalo do Sapucaí'),(2289,11,'São Gotardo'),(2290,11,'São João Batista do Glória'),(2291,11,'São João da Lagoa'),(2292,11,'São João da Mata'),(2293,11,'São João da Ponte'),(2294,11,'São João das Missões'),(2295,11,'São João del Rei'),(2296,11,'São João do Manhuaçu'),(2297,11,'São João do Manteninha'),(2298,11,'São João do Oriente'),(2299,11,'São João do Pacuí'),(2300,11,'São João do Paraíso'),(2301,11,'São João Evangelista'),(2302,11,'São João Nepomuceno'),(2303,11,'São Joaquim de Bicas'),(2304,11,'São José da Barra'),(2305,11,'São José da Lapa'),(2306,11,'São José da Safira'),(2307,11,'São José da Varginha'),(2308,11,'São José do Alegre'),(2309,11,'São José do Divino'),(2310,11,'São José do Goiabal'),(2311,11,'São José do Jacuri'),(2312,11,'São José do Mantimento'),(2313,11,'São Lourenço'),(2314,11,'São Miguel do Anta'),(2315,11,'São Pedro da União'),(2316,11,'São Pedro do Suaçuí'),(2317,11,'São Pedro dos Ferros'),(2318,11,'São Romão'),(2319,11,'São Roque de Minas'),(2320,11,'São Sebastião da Bela Vista'),(2321,11,'São Sebastião da Vargem Alegre'),(2322,11,'São Sebastião do Anta'),(2323,11,'São Sebastião do Maranhão'),(2324,11,'São Sebastião do Oeste'),(2325,11,'São Sebastião do Paraíso'),(2326,11,'São Sebastião do Rio Preto'),(2327,11,'São Sebastião do Rio Verde'),(2328,11,'São Thomé das Letras'),(2329,11,'São Tiago'),(2330,11,'São Tomás de Aquino'),(2331,11,'São Vicente de Minas'),(2332,11,'Sapucaí-Mirim'),(2333,11,'Sardoá'),(2334,11,'Sarzedo'),(2335,11,'Sem-Peixe'),(2336,11,'Senador Amaral'),(2337,11,'Senador Cortes'),(2338,11,'Senador Firmino'),(2339,11,'Senador José Bento'),(2340,11,'Senador Modestino Gonçalves'),(2341,11,'Senhora de Oliveira'),(2342,11,'Senhora do Porto'),(2343,11,'Senhora dos Remédios'),(2344,11,'Sericita'),(2345,11,'Seritinga'),(2346,11,'Serra Azul de Minas'),(2347,11,'Serra da Saudade'),(2348,11,'Serra do Salitre'),(2349,11,'Serra dos Aimorés'),(2350,11,'Serrania'),(2351,11,'Serranópolis de Minas'),(2352,11,'Serranos'),(2353,11,'Serro'),(2354,11,'Sete Lagoas'),(2355,11,'Setubinha'),(2356,11,'Silveirânia'),(2357,11,'Silvianópolis'),(2358,11,'Simão Pereira'),(2359,11,'Simonésia'),(2360,11,'Sobrália'),(2361,11,'Soledade de Minas'),(2362,11,'Tabuleiro'),(2363,11,'Taiobeiras'),(2364,11,'Taparuba'),(2365,11,'Tapira'),(2366,11,'Tapiraí'),(2367,11,'Taquaraçu de Minas'),(2368,11,'Tarumirim'),(2369,11,'Teixeiras'),(2370,11,'Teófilo Otoni'),(2371,11,'Timóteo'),(2372,11,'Tiradentes'),(2373,11,'Tiros'),(2374,11,'Tocantins'),(2375,11,'Tocos do Moji'),(2376,11,'Toledo'),(2377,11,'Tombos'),(2378,11,'Três Corações'),(2379,11,'Três Marias'),(2380,11,'Três Pontas'),(2381,11,'Tumiritinga'),(2382,11,'Tupaciguara'),(2383,11,'Turmalina'),(2384,11,'Turvolândia'),(2385,11,'Ubá'),(2386,11,'Ubaí'),(2387,11,'Ubaporanga'),(2388,11,'Uberaba'),(2389,11,'Uberlândia'),(2390,11,'Umburatiba'),(2391,11,'Unaí'),(2392,11,'União de Minas'),(2393,11,'Uruana de Minas'),(2394,11,'Urucânia'),(2395,11,'Urucuia'),(2396,11,'Vargem Alegre'),(2397,11,'Vargem Bonita'),(2398,11,'Vargem Grande do Rio Pardo'),(2399,11,'Varginha'),(2400,11,'Varjão de Minas'),(2401,11,'Várzea da Palma'),(2402,11,'Varzelândia'),(2403,11,'Vazante'),(2404,11,'Verdelândia'),(2405,11,'Veredinha'),(2406,11,'Veríssimo'),(2407,11,'Vermelho Novo'),(2408,11,'Vespasiano'),(2409,11,'Viçosa'),(2410,11,'Vieiras'),(2411,11,'Virgem da Lapa'),(2412,11,'Virgínia'),(2413,11,'Virginópolis'),(2414,11,'Virgolândia'),(2415,11,'Visconde do Rio Branco'),(2416,11,'Volta Grande'),(2417,11,'Wenceslau Braz'),(2418,14,'Abaetetuba'),(2419,14,'Abel Figueiredo'),(2420,14,'Acará'),(2421,14,'Afuá'),(2422,14,'Água Azul do Norte'),(2423,14,'Alenquer'),(2424,14,'Almeirim'),(2425,14,'Altamira'),(2426,14,'Anajás'),(2427,14,'Ananindeua'),(2428,14,'Anapu'),(2429,14,'Augusto Corrêa'),(2430,14,'Aurora do Pará'),(2431,14,'Aveiro'),(2432,14,'Bagre'),(2433,14,'Baião'),(2434,14,'Bannach'),(2435,14,'Barcarena'),(2436,14,'Belém'),(2437,14,'Belterra'),(2438,14,'Benevides'),(2439,14,'Bom Jesus do Tocantins'),(2440,14,'Bonito'),(2441,14,'Bragança'),(2442,14,'Brasil Novo'),(2443,14,'Brejo Grande do Araguaia'),(2444,14,'Breu Branco'),(2445,14,'Breves'),(2446,14,'Bujaru'),(2447,14,'Cachoeira do Arari'),(2448,14,'Cachoeira do Piriá'),(2449,14,'Cametá'),(2450,14,'Canaã dos Carajás'),(2451,14,'Capanema'),(2452,14,'Capitão Poço'),(2453,14,'Castanhal'),(2454,14,'Chaves'),(2455,14,'Colares'),(2456,14,'Conceição do Araguaia'),(2457,14,'Concórdia do Pará'),(2458,14,'Cumaru do Norte'),(2459,14,'Curionópolis'),(2460,14,'Curralinho'),(2461,14,'Curuá'),(2462,14,'Curuçá'),(2463,14,'Dom Eliseu'),(2464,14,'Eldorado dos Carajás'),(2465,14,'Faro'),(2466,14,'Floresta do Araguaia'),(2467,14,'Garrafão do Norte'),(2468,14,'Goianésia do Pará'),(2469,14,'Gurupá'),(2470,14,'Igarapé-Açu'),(2471,14,'Igarapé-Miri'),(2472,14,'Inhangapi'),(2473,14,'Ipixuna do Pará'),(2474,14,'Irituia'),(2475,14,'Itaituba'),(2476,14,'Itupiranga'),(2477,14,'Jacareacanga'),(2478,14,'Jacundá'),(2479,14,'Juruti'),(2480,14,'Limoeiro do Ajuru'),(2481,14,'Mãe do Rio'),(2482,14,'Magalhães Barata'),(2483,14,'Marabá'),(2484,14,'Maracanã'),(2485,14,'Marapanim'),(2486,14,'Marituba'),(2487,14,'Medicilândia'),(2488,14,'Melgaço'),(2489,14,'Mocajuba'),(2490,14,'Moju'),(2491,14,'Monte Alegre'),(2492,14,'Muaná'),(2493,14,'Nova Esperança do Piriá'),(2494,14,'Nova Ipixuna'),(2495,14,'Nova Timboteua'),(2496,14,'Novo Progresso'),(2497,14,'Novo Repartimento'),(2498,14,'Óbidos'),(2499,14,'Oeiras do Pará'),(2500,14,'Oriximiná'),(2501,14,'Ourém'),(2502,14,'Ourilândia do Norte'),(2503,14,'Pacajá'),(2504,14,'Palestina do Pará'),(2505,14,'Paragominas'),(2506,14,'Parauapebas'),(2507,14,'Pau dArco'),(2508,14,'Peixe-Boi'),(2509,14,'Piçarra'),(2510,14,'Placas'),(2511,14,'Ponta de Pedras'),(2512,14,'Portel'),(2513,14,'Porto de Moz'),(2514,14,'Prainha'),(2515,14,'Primavera'),(2516,14,'Quatipuru'),(2517,14,'Redenção'),(2518,14,'Rio Maria'),(2519,14,'Rondon do Pará'),(2520,14,'Rurópolis'),(2521,14,'Salinópolis'),(2522,14,'Salvaterra'),(2523,14,'Santa Bárbara do Pará'),(2524,14,'Santa Cruz do Arari'),(2525,14,'Santa Isabel do Pará'),(2526,14,'Santa Luzia do Pará'),(2527,14,'Santa Maria das Barreiras'),(2528,14,'Santa Maria do Pará'),(2529,14,'Santana do Araguaia'),(2530,14,'Santarém'),(2531,14,'Santarém Novo'),(2532,14,'Santo Antônio do Tauá'),(2533,14,'São Caetano de Odivelas'),(2534,14,'São Domingos do Araguaia'),(2535,14,'São Domingos do Capim'),(2536,14,'São Félix do Xingu'),(2537,14,'São Francisco do Pará'),(2538,14,'São Geraldo do Araguaia'),(2539,14,'São João da Ponta'),(2540,14,'São João de Pirabas'),(2541,14,'São João do Araguaia'),(2542,14,'São Miguel do Guamá'),(2543,14,'São Sebastião da Boa Vista'),(2544,14,'Sapucaia'),(2545,14,'Senador José Porfírio'),(2546,14,'Soure'),(2547,14,'Tailândia'),(2548,14,'Terra Alta'),(2549,14,'Terra Santa'),(2550,14,'Tomé-Açu'),(2551,14,'Tracuateua'),(2552,14,'Trairão'),(2553,14,'Tucumã'),(2554,14,'Tucuruí'),(2555,14,'Ulianópolis'),(2556,14,'Uruará'),(2557,14,'Vigia'),(2558,14,'Viseu'),(2559,14,'Vitória do Xingu'),(2560,14,'Xinguara'),(2561,15,'Água Branca'),(2562,15,'Aguiar'),(2563,15,'Alagoa Grande'),(2564,15,'Alagoa Nova'),(2565,15,'Alagoinha'),(2566,15,'Alcantil'),(2567,15,'Algodão de Jandaíra'),(2568,15,'Alhandra'),(2569,15,'Amparo'),(2570,15,'Aparecida'),(2571,15,'Araçagi'),(2572,15,'Arara'),(2573,15,'Araruna'),(2574,15,'Areia'),(2575,15,'Areia de Baraúnas'),(2576,15,'Areial'),(2577,15,'Aroeiras'),(2578,15,'Assunção'),(2579,15,'Baía da Traição'),(2580,15,'Bananeiras'),(2581,15,'Baraúna'),(2582,15,'Barra de Santa Rosa'),(2583,15,'Barra de Santana'),(2584,15,'Barra de São Miguel'),(2585,15,'Bayeux'),(2586,15,'Belém'),(2587,15,'Belém do Brejo do Cruz'),(2588,15,'Bernardino Batista'),(2589,15,'Boa Ventura'),(2590,15,'Boa Vista'),(2591,15,'Bom Jesus'),(2592,15,'Bom Sucesso'),(2593,15,'Bonito de Santa Fé'),(2594,15,'Boqueirão'),(2595,15,'Borborema'),(2596,15,'Brejo do Cruz'),(2597,15,'Brejo dos Santos'),(2598,15,'Caaporã'),(2599,15,'Cabaceiras'),(2600,15,'Cabedelo'),(2601,15,'Cachoeira dos Índios'),(2602,15,'Cacimba de Areia'),(2603,15,'Cacimba de Dentro'),(2604,15,'Cacimbas'),(2605,15,'Caiçara'),(2606,15,'Cajazeiras'),(2607,15,'Cajazeirinhas'),(2608,15,'Caldas Brandão'),(2609,15,'Camalaú'),(2610,15,'Campina Grande'),(2611,15,'Campo de Santana'),(2612,15,'Capim'),(2613,15,'Caraúbas'),(2614,15,'Carrapateira'),(2615,15,'Casserengue'),(2616,15,'Catingueira'),(2617,15,'Catolé do Rocha'),(2618,15,'Caturité'),(2619,15,'Conceição'),(2620,15,'Condado'),(2621,15,'Conde'),(2622,15,'Congo'),(2623,15,'Coremas'),(2624,15,'Coxixola'),(2625,15,'Cruz do Espírito Santo'),(2626,15,'Cubati'),(2627,15,'Cuité'),(2628,15,'Cuité de Mamanguape'),(2629,15,'Cuitegi'),(2630,15,'Curral de Cima'),(2631,15,'Curral Velho'),(2632,15,'Damião'),(2633,15,'Desterro'),(2634,15,'Diamante'),(2635,15,'Dona Inês'),(2636,15,'Duas Estradas'),(2637,15,'Emas'),(2638,15,'Esperança'),(2639,15,'Fagundes'),(2640,15,'Frei Martinho'),(2641,15,'Gado Bravo'),(2642,15,'Guarabira'),(2643,15,'Gurinhém'),(2644,15,'Gurjão'),(2645,15,'Ibiara'),(2646,15,'Igaracy'),(2647,15,'Imaculada'),(2648,15,'Ingá'),(2649,15,'Itabaiana'),(2650,15,'Itaporanga'),(2651,15,'Itapororoca'),(2652,15,'Itatuba'),(2653,15,'Jacaraú'),(2654,15,'Jericó'),(2655,15,'João Pessoa'),(2656,15,'Juarez Távora'),(2657,15,'Juazeirinho'),(2658,15,'Junco do Seridó'),(2659,15,'Juripiranga'),(2660,15,'Juru'),(2661,15,'Lagoa'),(2662,15,'Lagoa de Dentro'),(2663,15,'Lagoa Seca'),(2664,15,'Lastro'),(2665,15,'Livramento'),(2666,15,'Logradouro'),(2667,15,'Lucena'),(2668,15,'Mãe dÁgua'),(2669,15,'Malta'),(2670,15,'Mamanguape'),(2671,15,'Manaíra'),(2672,15,'Marcação'),(2673,15,'Mari'),(2674,15,'Marizópolis'),(2675,15,'Massaranduba'),(2676,15,'Mataraca'),(2677,15,'Matinhas'),(2678,15,'Mato Grosso'),(2679,15,'Maturéia'),(2680,15,'Mogeiro'),(2681,15,'Montadas'),(2682,15,'Monte Horebe'),(2683,15,'Monteiro'),(2684,15,'Mulungu'),(2685,15,'Natuba'),(2686,15,'Nazarezinho'),(2687,15,'Nova Floresta'),(2688,15,'Nova Olinda'),(2689,15,'Nova Palmeira'),(2690,15,'Olho dÁgua'),(2691,15,'Olivedos'),(2692,15,'Ouro Velho'),(2693,15,'Parari'),(2694,15,'Passagem'),(2695,15,'Patos'),(2696,15,'Paulista'),(2697,15,'Pedra Branca'),(2698,15,'Pedra Lavrada'),(2699,15,'Pedras de Fogo'),(2700,15,'Pedro Régis'),(2701,15,'Piancó'),(2702,15,'Picuí'),(2703,15,'Pilar'),(2704,15,'Pilões'),(2705,15,'Pilõezinhos'),(2706,15,'Pirpirituba'),(2707,15,'Pitimbu'),(2708,15,'Pocinhos'),(2709,15,'Poço Dantas'),(2710,15,'Poço de José de Moura'),(2711,15,'Pombal'),(2712,15,'Prata'),(2713,15,'Princesa Isabel'),(2714,15,'Puxinanã'),(2715,15,'Queimadas'),(2716,15,'Quixabá'),(2717,15,'Remígio'),(2718,15,'Riachão'),(2719,15,'Riachão do Bacamarte'),(2720,15,'Riachão do Poço'),(2721,15,'Riacho de Santo Antônio'),(2722,15,'Riacho dos Cavalos'),(2723,15,'Rio Tinto'),(2724,15,'Salgadinho'),(2725,15,'Salgado de São Félix'),(2726,15,'Santa Cecília'),(2727,15,'Santa Cruz'),(2728,15,'Santa Helena'),(2729,15,'Santa Inês'),(2730,15,'Santa Luzia'),(2731,15,'Santa Rita'),(2732,15,'Santa Teresinha'),(2733,15,'Santana de Mangueira'),(2734,15,'Santana dos Garrotes'),(2735,15,'Santarém'),(2736,15,'Santo André'),(2737,15,'São Bentinho'),(2738,15,'São Bento'),(2739,15,'São Domingos de Pombal'),(2740,15,'São Domingos do Cariri'),(2741,15,'São Francisco'),(2742,15,'São João do Cariri'),(2743,15,'São João do Rio do Peixe'),(2744,15,'São João do Tigre'),(2745,15,'São José da Lagoa Tapada'),(2746,15,'São José de Caiana'),(2747,15,'São José de Espinharas'),(2748,15,'São José de Piranhas'),(2749,15,'São José de Princesa'),(2750,15,'São José do Bonfim'),(2751,15,'São José do Brejo do Cruz'),(2752,15,'São José do Sabugi'),(2753,15,'São José dos Cordeiros'),(2754,15,'São José dos Ramos'),(2755,15,'São Mamede'),(2756,15,'São Miguel de Taipu'),(2757,15,'São Sebastião de Lagoa de Roça'),(2758,15,'São Sebastião do Umbuzeiro'),(2759,15,'Sapé'),(2760,15,'Seridó'),(2761,15,'Serra Branca'),(2762,15,'Serra da Raiz'),(2763,15,'Serra Grande'),(2764,15,'Serra Redonda'),(2765,15,'Serraria'),(2766,15,'Sertãozinho'),(2767,15,'Sobrado'),(2768,15,'Solânea'),(2769,15,'Soledade'),(2770,15,'Sossêgo'),(2771,15,'Sousa'),(2772,15,'Sumé'),(2773,15,'Taperoá'),(2774,15,'Tavares'),(2775,15,'Teixeira'),(2776,15,'Tenório'),(2777,15,'Triunfo'),(2778,15,'Uiraúna'),(2779,15,'Umbuzeiro'),(2780,15,'Várzea'),(2781,15,'Vieirópolis'),(2782,15,'Vista Serrana'),(2783,15,'Zabelê'),(2784,18,'Abatiá'),(2785,18,'Adrianópolis'),(2786,18,'Agudos do Sul'),(2787,18,'Almirante Tamandaré'),(2788,18,'Altamira do Paraná'),(2789,18,'Alto Paraíso'),(2790,18,'Alto Paraná'),(2791,18,'Alto Piquiri'),(2792,18,'Altônia'),(2793,18,'Alvorada do Sul'),(2794,18,'Amaporã'),(2795,18,'Ampére'),(2796,18,'Anahy'),(2797,18,'Andirá'),(2798,18,'Ângulo'),(2799,18,'Antonina'),(2800,18,'Antônio Olinto'),(2801,18,'Apucarana'),(2802,18,'Arapongas'),(2803,18,'Arapoti'),(2804,18,'Arapuã'),(2805,18,'Araruna'),(2806,18,'Araucária'),(2807,18,'Ariranha do Ivaí'),(2808,18,'Assaí'),(2809,18,'Assis Chateaubriand'),(2810,18,'Astorga'),(2811,18,'Atalaia'),(2812,18,'Balsa Nova'),(2813,18,'Bandeirantes'),(2814,18,'Barbosa Ferraz'),(2815,18,'Barra do Jacaré'),(2816,18,'Barracão'),(2817,18,'Bela Vista da Caroba'),(2818,18,'Bela Vista do Paraíso'),(2819,18,'Bituruna'),(2820,18,'Boa Esperança'),(2821,18,'Boa Esperança do Iguaçu'),(2822,18,'Boa Ventura de São Roque'),(2823,18,'Boa Vista da Aparecida'),(2824,18,'Bocaiúva do Sul'),(2825,18,'Bom Jesus do Sul'),(2826,18,'Bom Sucesso'),(2827,18,'Bom Sucesso do Sul'),(2828,18,'Borrazópolis'),(2829,18,'Braganey'),(2830,18,'Brasilândia do Sul'),(2831,18,'Cafeara'),(2832,18,'Cafelândia'),(2833,18,'Cafezal do Sul'),(2834,18,'Califórnia'),(2835,18,'Cambará'),(2836,18,'Cambé'),(2837,18,'Cambira'),(2838,18,'Campina da Lagoa'),(2839,18,'Campina do Simão'),(2840,18,'Campina Grande do Sul'),(2841,18,'Campo Bonito'),(2842,18,'Campo do Tenente'),(2843,18,'Campo Largo'),(2844,18,'Campo Magro'),(2845,18,'Campo Mourão'),(2846,18,'Cândido de Abreu'),(2847,18,'Candói'),(2848,18,'Cantagalo'),(2849,18,'Capanema'),(2850,18,'Capitão Leônidas Marques'),(2851,18,'Carambeí'),(2852,18,'Carlópolis'),(2853,18,'Cascavel'),(2854,18,'Castro'),(2855,18,'Catanduvas'),(2856,18,'Centenário do Sul'),(2857,18,'Cerro Azul'),(2858,18,'Céu Azul'),(2859,18,'Chopinzinho'),(2860,18,'Cianorte'),(2861,18,'Cidade Gaúcha'),(2862,18,'Clevelândia'),(2863,18,'Colombo'),(2864,18,'Colorado'),(2865,18,'Congonhinhas'),(2866,18,'Conselheiro Mairinck'),(2867,18,'Contenda'),(2868,18,'Corbélia'),(2869,18,'Cornélio Procópio'),(2870,18,'Coronel Domingos Soares'),(2871,18,'Coronel Vivida'),(2872,18,'Corumbataí do Sul'),(2873,18,'Cruz Machado'),(2874,18,'Cruzeiro do Iguaçu'),(2875,18,'Cruzeiro do Oeste'),(2876,18,'Cruzeiro do Sul'),(2877,18,'Cruzmaltina'),(2878,18,'Curitiba'),(2879,18,'Curiúva'),(2880,18,'Diamante dOeste'),(2881,18,'Diamante do Norte'),(2882,18,'Diamante do Sul'),(2883,18,'Dois Vizinhos'),(2884,18,'Douradina'),(2885,18,'Doutor Camargo'),(2886,18,'Doutor Ulysses'),(2887,18,'Enéas Marques'),(2888,18,'Engenheiro Beltrão'),(2889,18,'Entre Rios do Oeste'),(2890,18,'Esperança Nova'),(2891,18,'Espigão Alto do Iguaçu'),(2892,18,'Farol'),(2893,18,'Faxinal'),(2894,18,'Fazenda Rio Grande'),(2895,18,'Fênix'),(2896,18,'Fernandes Pinheiro'),(2897,18,'Figueira'),(2898,18,'Flor da Serra do Sul'),(2899,18,'Floraí'),(2900,18,'Floresta'),(2901,18,'Florestópolis'),(2902,18,'Flórida'),(2903,18,'Formosa do Oeste'),(2904,18,'Foz do Iguaçu'),(2905,18,'Foz do Jordão'),(2906,18,'Francisco Alves'),(2907,18,'Francisco Beltrão'),(2908,18,'General Carneiro'),(2909,18,'Godoy Moreira'),(2910,18,'Goioerê'),(2911,18,'Goioxim'),(2912,18,'Grandes Rios'),(2913,18,'Guaíra'),(2914,18,'Guairaçá'),(2915,18,'Guamiranga'),(2916,18,'Guapirama'),(2917,18,'Guaporema'),(2918,18,'Guaraci'),(2919,18,'Guaraniaçu'),(2920,18,'Guarapuava'),(2921,18,'Guaraqueçaba'),(2922,18,'Guaratuba'),(2923,18,'Honório Serpa'),(2924,18,'Ibaiti'),(2925,18,'Ibema'),(2926,18,'Ibiporã'),(2927,18,'Icaraíma'),(2928,18,'Iguaraçu'),(2929,18,'Iguatu'),(2930,18,'Imbaú'),(2931,18,'Imbituva'),(2932,18,'Inácio Martins'),(2933,18,'Inajá'),(2934,18,'Indianópolis'),(2935,18,'Ipiranga'),(2936,18,'Iporã'),(2937,18,'Iracema do Oeste'),(2938,18,'Irati'),(2939,18,'Iretama'),(2940,18,'Itaguajé'),(2941,18,'Itaipulândia'),(2942,18,'Itambaracá'),(2943,18,'Itambé'),(2944,18,'Itapejara dOeste'),(2945,18,'Itaperuçu'),(2946,18,'Itaúna do Sul'),(2947,18,'Ivaí'),(2948,18,'Ivaiporã'),(2949,18,'Ivaté'),(2950,18,'Ivatuba'),(2951,18,'Jaboti'),(2952,18,'Jacarezinho'),(2953,18,'Jaguapitã'),(2954,18,'Jaguariaíva'),(2955,18,'Jandaia do Sul'),(2956,18,'Janiópolis'),(2957,18,'Japira'),(2958,18,'Japurá'),(2959,18,'Jardim Alegre'),(2960,18,'Jardim Olinda'),(2961,18,'Jataizinho'),(2962,18,'Jesuítas'),(2963,18,'Joaquim Távora'),(2964,18,'Jundiaí do Sul'),(2965,18,'Juranda'),(2966,18,'Jussara'),(2967,18,'Kaloré'),(2968,18,'Lapa'),(2969,18,'Laranjal'),(2970,18,'Laranjeiras do Sul'),(2971,18,'Leópolis'),(2972,18,'Lidianópolis'),(2973,18,'Lindoeste'),(2974,18,'Loanda'),(2975,18,'Lobato'),(2976,18,'Londrina'),(2977,18,'Luiziana'),(2978,18,'Lunardelli'),(2979,18,'Lupionópolis'),(2980,18,'Mallet'),(2981,18,'Mamborê'),(2982,18,'Mandaguaçu'),(2983,18,'Mandaguari'),(2984,18,'Mandirituba'),(2985,18,'Manfrinópolis'),(2986,18,'Mangueirinha'),(2987,18,'Manoel Ribas'),(2988,18,'Marechal Cândido Rondon'),(2989,18,'Maria Helena'),(2990,18,'Marialva'),(2991,18,'Marilândia do Sul'),(2992,18,'Marilena'),(2993,18,'Mariluz'),(2994,18,'Maringá'),(2995,18,'Mariópolis'),(2996,18,'Maripá'),(2997,18,'Marmeleiro'),(2998,18,'Marquinho'),(2999,18,'Marumbi'),(3000,18,'Matelândia'),(3001,18,'Matinhos'),(3002,18,'Mato Rico'),(3003,18,'Mauá da Serra'),(3004,18,'Medianeira'),(3005,18,'Mercedes'),(3006,18,'Mirador'),(3007,18,'Miraselva'),(3008,18,'Missal'),(3009,18,'Moreira Sales'),(3010,18,'Morretes'),(3011,18,'Munhoz de Melo'),(3012,18,'Nossa Senhora das Graças'),(3013,18,'Nova Aliança do Ivaí'),(3014,18,'Nova América da Colina'),(3015,18,'Nova Aurora'),(3016,18,'Nova Cantu'),(3017,18,'Nova Esperança'),(3018,18,'Nova Esperança do Sudoeste'),(3019,18,'Nova Fátima'),(3020,18,'Nova Laranjeiras'),(3021,18,'Nova Londrina'),(3022,18,'Nova Olímpia'),(3023,18,'Nova Prata do Iguaçu'),(3024,18,'Nova Santa Bárbara'),(3025,18,'Nova Santa Rosa'),(3026,18,'Nova Tebas'),(3027,18,'Novo Itacolomi'),(3028,18,'Ortigueira'),(3029,18,'Ourizona'),(3030,18,'Ouro Verde do Oeste'),(3031,18,'Paiçandu'),(3032,18,'Palmas'),(3033,18,'Palmeira'),(3034,18,'Palmital'),(3035,18,'Palotina'),(3036,18,'Paraíso do Norte'),(3037,18,'Paranacity'),(3038,18,'Paranaguá'),(3039,18,'Paranapoema'),(3040,18,'Paranavaí'),(3041,18,'Pato Bragado'),(3042,18,'Pato Branco'),(3043,18,'Paula Freitas'),(3044,18,'Paulo Frontin'),(3045,18,'Peabiru'),(3046,18,'Perobal'),(3047,18,'Pérola'),(3048,18,'Pérola dOeste'),(3049,18,'Piên'),(3050,18,'Pinhais'),(3051,18,'Pinhal de São Bento'),(3052,18,'Pinhalão'),(3053,18,'Pinhão'),(3054,18,'Piraí do Sul'),(3055,18,'Piraquara'),(3056,18,'Pitanga'),(3057,18,'Pitangueiras'),(3058,18,'Planaltina do Paraná'),(3059,18,'Planalto'),(3060,18,'Ponta Grossa'),(3061,18,'Pontal do Paraná'),(3062,18,'Porecatu'),(3063,18,'Porto Amazonas'),(3064,18,'Porto Barreiro'),(3065,18,'Porto Rico'),(3066,18,'Porto Vitória'),(3067,18,'Prado Ferreira'),(3068,18,'Pranchita'),(3069,18,'Presidente Castelo Branco'),(3070,18,'Primeiro de Maio'),(3071,18,'Prudentópolis'),(3072,18,'Quarto Centenário'),(3073,18,'Quatiguá'),(3074,18,'Quatro Barras'),(3075,18,'Quatro Pontes'),(3076,18,'Quedas do Iguaçu'),(3077,18,'Querência do Norte'),(3078,18,'Quinta do Sol'),(3079,18,'Quitandinha'),(3080,18,'Ramilândia'),(3081,18,'Rancho Alegre'),(3082,18,'Rancho Alegre dOeste'),(3083,18,'Realeza'),(3084,18,'Rebouças'),(3085,18,'Renascença'),(3086,18,'Reserva'),(3087,18,'Reserva do Iguaçu'),(3088,18,'Ribeirão Claro'),(3089,18,'Ribeirão do Pinhal'),(3090,18,'Rio Azul'),(3091,18,'Rio Bom'),(3092,18,'Rio Bonito do Iguaçu'),(3093,18,'Rio Branco do Ivaí'),(3094,18,'Rio Branco do Sul'),(3095,18,'Rio Negro'),(3096,18,'Rolândia'),(3097,18,'Roncador'),(3098,18,'Rondon'),(3099,18,'Rosário do Ivaí'),(3100,18,'Sabáudia'),(3101,18,'Salgado Filho'),(3102,18,'Salto do Itararé'),(3103,18,'Salto do Lontra'),(3104,18,'Santa Amélia'),(3105,18,'Santa Cecília do Pavão'),(3106,18,'Santa Cruz de Monte Castelo'),(3107,18,'Santa Fé'),(3108,18,'Santa Helena'),(3109,18,'Santa Inês'),(3110,18,'Santa Isabel do Ivaí'),(3111,18,'Santa Izabel do Oeste'),(3112,18,'Santa Lúcia'),(3113,18,'Santa Maria do Oeste'),(3114,18,'Santa Mariana'),(3115,18,'Santa Mônica'),(3116,18,'Santa Tereza do Oeste'),(3117,18,'Santa Terezinha de Itaipu'),(3118,18,'Santana do Itararé'),(3119,18,'Santo Antônio da Platina'),(3120,18,'Santo Antônio do Caiuá'),(3121,18,'Santo Antônio do Paraíso'),(3122,18,'Santo Antônio do Sudoeste'),(3123,18,'Santo Inácio'),(3124,18,'São Carlos do Ivaí'),(3125,18,'São Jerônimo da Serra'),(3126,18,'São João'),(3127,18,'São João do Caiuá'),(3128,18,'São João do Ivaí'),(3129,18,'São João do Triunfo'),(3130,18,'São Jorge dOeste'),(3131,18,'São Jorge do Ivaí'),(3132,18,'São Jorge do Patrocínio'),(3133,18,'São José da Boa Vista'),(3134,18,'São José das Palmeiras'),(3135,18,'São José dos Pinhais'),(3136,18,'São Manoel do Paraná'),(3137,18,'São Mateus do Sul'),(3138,18,'São Miguel do Iguaçu'),(3139,18,'São Pedro do Iguaçu'),(3140,18,'São Pedro do Ivaí'),(3141,18,'São Pedro do Paraná'),(3142,18,'São Sebastião da Amoreira'),(3143,18,'São Tomé'),(3144,18,'Sapopema'),(3145,18,'Sarandi'),(3146,18,'Saudade do Iguaçu'),(3147,18,'Sengés'),(3148,18,'Serranópolis do Iguaçu'),(3149,18,'Sertaneja'),(3150,18,'Sertanópolis'),(3151,18,'Siqueira Campos'),(3152,18,'Sulina'),(3153,18,'Tamarana'),(3154,18,'Tamboara'),(3155,18,'Tapejara'),(3156,18,'Tapira'),(3157,18,'Teixeira Soares'),(3158,18,'Telêmaco Borba'),(3159,18,'Terra Boa'),(3160,18,'Terra Rica'),(3161,18,'Terra Roxa'),(3162,18,'Tibagi'),(3163,18,'Tijucas do Sul'),(3164,18,'Toledo'),(3165,18,'Tomazina'),(3166,18,'Três Barras do Paraná'),(3167,18,'Tunas do Paraná'),(3168,18,'Tuneiras do Oeste'),(3169,18,'Tupãssi'),(3170,18,'Turvo'),(3171,18,'Ubiratã'),(3172,18,'Umuarama'),(3173,18,'União da Vitória'),(3174,18,'Uniflor'),(3175,18,'Uraí'),(3176,18,'Ventania'),(3177,18,'Vera Cruz do Oeste'),(3178,18,'Verê'),(3179,18,'Virmond'),(3180,18,'Vitorino'),(3181,18,'Wenceslau Braz'),(3182,18,'Xambrê'),(3183,16,'Abreu e Lima'),(3184,16,'Afogados da Ingazeira'),(3185,16,'Afrânio'),(3186,16,'Agrestina'),(3187,16,'Água Preta'),(3188,16,'Águas Belas'),(3189,16,'Alagoinha'),(3190,16,'Aliança'),(3191,16,'Altinho'),(3192,16,'Amaraji'),(3193,16,'Angelim'),(3194,16,'Araçoiaba'),(3195,16,'Araripina'),(3196,16,'Arcoverde'),(3197,16,'Barra de Guabiraba'),(3198,16,'Barreiros'),(3199,16,'Belém de Maria'),(3200,16,'Belém de São Francisco'),(3201,16,'Belo Jardim'),(3202,16,'Betânia'),(3203,16,'Bezerros'),(3204,16,'Bodocó'),(3205,16,'Bom Conselho'),(3206,16,'Bom Jardim'),(3207,16,'Bonito'),(3208,16,'Brejão'),(3209,16,'Brejinho'),(3210,16,'Brejo da Madre de Deus'),(3211,16,'Buenos Aires'),(3212,16,'Buíque'),(3213,16,'Cabo de Santo Agostinho'),(3214,16,'Cabrobó'),(3215,16,'Cachoeirinha'),(3216,16,'Caetés'),(3217,16,'Calçado'),(3218,16,'Calumbi'),(3219,16,'Camaragibe'),(3220,16,'Camocim de São Félix'),(3221,16,'Camutanga'),(3222,16,'Canhotinho'),(3223,16,'Capoeiras'),(3224,16,'Carnaíba'),(3225,16,'Carnaubeira da Penha'),(3226,16,'Carpina'),(3227,16,'Caruaru'),(3228,16,'Casinhas'),(3229,16,'Catende'),(3230,16,'Cedro'),(3231,16,'Chã de Alegria'),(3232,16,'Chã Grande'),(3233,16,'Condado'),(3234,16,'Correntes'),(3235,16,'Cortês'),(3236,16,'Cumaru'),(3237,16,'Cupira'),(3238,16,'Custódia'),(3239,16,'Dormentes'),(3240,16,'Escada'),(3241,16,'Exu'),(3242,16,'Feira Nova'),(3243,16,'Fernando de Noronha'),(3244,16,'Ferreiros'),(3245,16,'Flores'),(3246,16,'Floresta'),(3247,16,'Frei Miguelinho'),(3248,16,'Gameleira'),(3249,16,'Garanhuns'),(3250,16,'Glória do Goitá'),(3251,16,'Goiana'),(3252,16,'Granito'),(3253,16,'Gravatá'),(3254,16,'Iati'),(3255,16,'Ibimirim'),(3256,16,'Ibirajuba'),(3257,16,'Igarassu'),(3258,16,'Iguaraci'),(3259,16,'Ilha de Itamaracá'),(3260,16,'Inajá'),(3261,16,'Ingazeira'),(3262,16,'Ipojuca'),(3263,16,'Ipubi'),(3264,16,'Itacuruba'),(3265,16,'Itaíba'),(3266,16,'Itambé'),(3267,16,'Itapetim'),(3268,16,'Itapissuma'),(3269,16,'Itaquitinga'),(3270,16,'Jaboatão dos Guararapes'),(3271,16,'Jaqueira'),(3272,16,'Jataúba'),(3273,16,'Jatobá'),(3274,16,'João Alfredo'),(3275,16,'Joaquim Nabuco'),(3276,16,'Jucati'),(3277,16,'Jupi'),(3278,16,'Jurema'),(3279,16,'Lagoa do Carro'),(3280,16,'Lagoa do Itaenga'),(3281,16,'Lagoa do Ouro'),(3282,16,'Lagoa dos Gatos'),(3283,16,'Lagoa Grande'),(3284,16,'Lajedo'),(3285,16,'Limoeiro'),(3286,16,'Macaparana'),(3287,16,'Machados'),(3288,16,'Manari'),(3289,16,'Maraial'),(3290,16,'Mirandiba'),(3291,16,'Moreilândia'),(3292,16,'Moreno'),(3293,16,'Nazaré da Mata'),(3294,16,'Olinda'),(3295,16,'Orobó'),(3296,16,'Orocó'),(3297,16,'Ouricuri'),(3298,16,'Palmares'),(3299,16,'Palmeirina'),(3300,16,'Panelas'),(3301,16,'Paranatama'),(3302,16,'Parnamirim'),(3303,16,'Passira'),(3304,16,'Paudalho'),(3305,16,'Paulista'),(3306,16,'Pedra'),(3307,16,'Pesqueira'),(3308,16,'Petrolândia'),(3309,16,'Petrolina'),(3310,16,'Poção'),(3311,16,'Pombos'),(3312,16,'Primavera'),(3313,16,'Quipapá'),(3314,16,'Quixaba'),(3315,16,'Recife'),(3316,16,'Riacho das Almas'),(3317,16,'Ribeirão'),(3318,16,'Rio Formoso'),(3319,16,'Sairé'),(3320,16,'Salgadinho'),(3321,16,'Salgueiro'),(3322,16,'Saloá'),(3323,16,'Sanharó'),(3324,16,'Santa Cruz'),(3325,16,'Santa Cruz da Baixa Verde'),(3326,16,'Santa Cruz do Capibaribe'),(3327,16,'Santa Filomena'),(3328,16,'Santa Maria da Boa Vista'),(3329,16,'Santa Maria do Cambucá'),(3330,16,'Santa Terezinha'),(3331,16,'São Benedito do Sul'),(3332,16,'São Bento do Una'),(3333,16,'São Caitano'),(3334,16,'São João'),(3335,16,'São Joaquim do Monte'),(3336,16,'São José da Coroa Grande'),(3337,16,'São José do Belmonte'),(3338,16,'São José do Egito'),(3339,16,'São Lourenço da Mata'),(3340,16,'São Vicente Ferrer'),(3341,16,'Serra Talhada'),(3342,16,'Serrita'),(3343,16,'Sertânia'),(3344,16,'Sirinhaém'),(3345,16,'Solidão'),(3346,16,'Surubim'),(3347,16,'Tabira'),(3348,16,'Tacaimbó'),(3349,16,'Tacaratu'),(3350,16,'Tamandaré'),(3351,16,'Taquaritinga do Norte'),(3352,16,'Terezinha'),(3353,16,'Terra Nova'),(3354,16,'Timbaúba'),(3355,16,'Toritama'),(3356,16,'Tracunhaém'),(3357,16,'Trindade'),(3358,16,'Triunfo'),(3359,16,'Tupanatinga'),(3360,16,'Tuparetama'),(3361,16,'Venturosa'),(3362,16,'Verdejante'),(3363,16,'Vertente do Lério'),(3364,16,'Vertentes'),(3365,16,'Vicência'),(3366,16,'Vitória de Santo Antão'),(3367,16,'Xexéu'),(3368,17,'Acauã'),(3369,17,'Agricolândia'),(3370,17,'Água Branca'),(3371,17,'Alagoinha do Piauí'),(3372,17,'Alegrete do Piauí'),(3373,17,'Alto Longá'),(3374,17,'Altos'),(3375,17,'Alvorada do Gurguéia'),(3376,17,'Amarante'),(3377,17,'Angical do Piauí'),(3378,17,'Anísio de Abreu'),(3379,17,'Antônio Almeida'),(3380,17,'Aroazes'),(3381,17,'Aroeiras do Itaim'),(3382,17,'Arraial'),(3383,17,'Assunção do Piauí'),(3384,17,'Avelino Lopes'),(3385,17,'Baixa Grande do Ribeiro'),(3386,17,'Barra dAlcântara'),(3387,17,'Barras'),(3388,17,'Barreiras do Piauí'),(3389,17,'Barro Duro'),(3390,17,'Batalha'),(3391,17,'Bela Vista do Piauí'),(3392,17,'Belém do Piauí'),(3393,17,'Beneditinos'),(3394,17,'Bertolínia'),(3395,17,'Betânia do Piauí'),(3396,17,'Boa Hora'),(3397,17,'Bocaina'),(3398,17,'Bom Jesus'),(3399,17,'Bom Princípio do Piauí'),(3400,17,'Bonfim do Piauí'),(3401,17,'Boqueirão do Piauí'),(3402,17,'Brasileira'),(3403,17,'Brejo do Piauí'),(3404,17,'Buriti dos Lopes'),(3405,17,'Buriti dos Montes'),(3406,17,'Cabeceiras do Piauí'),(3407,17,'Cajazeiras do Piauí'),(3408,17,'Cajueiro da Praia'),(3409,17,'Caldeirão Grande do Piauí'),(3410,17,'Campinas do Piauí'),(3411,17,'Campo Alegre do Fidalgo'),(3412,17,'Campo Grande do Piauí'),(3413,17,'Campo Largo do Piauí'),(3414,17,'Campo Maior'),(3415,17,'Canavieira'),(3416,17,'Canto do Buriti'),(3417,17,'Capitão de Campos'),(3418,17,'Capitão Gervásio Oliveira'),(3419,17,'Caracol'),(3420,17,'Caraúbas do Piauí'),(3421,17,'Caridade do Piauí'),(3422,17,'Castelo do Piauí'),(3423,17,'Caxingó'),(3424,17,'Cocal'),(3425,17,'Cocal de Telha'),(3426,17,'Cocal dos Alves'),(3427,17,'Coivaras'),(3428,17,'Colônia do Gurguéia'),(3429,17,'Colônia do Piauí'),(3430,17,'Conceição do Canindé'),(3431,17,'Coronel José Dias'),(3432,17,'Corrente'),(3433,17,'Cristalândia do Piauí'),(3434,17,'Cristino Castro'),(3435,17,'Curimatá'),(3436,17,'Currais'),(3437,17,'Curral Novo do Piauí'),(3438,17,'Curralinhos'),(3439,17,'Demerval Lobão'),(3440,17,'Dirceu Arcoverde'),(3441,17,'Dom Expedito Lopes'),(3442,17,'Dom Inocêncio'),(3443,17,'Domingos Mourão'),(3444,17,'Elesbão Veloso'),(3445,17,'Eliseu Martins'),(3446,17,'Esperantina'),(3447,17,'Fartura do Piauí'),(3448,17,'Flores do Piauí'),(3449,17,'Floresta do Piauí'),(3450,17,'Floriano'),(3451,17,'Francinópolis'),(3452,17,'Francisco Ayres'),(3453,17,'Francisco Macedo'),(3454,17,'Francisco Santos'),(3455,17,'Fronteiras'),(3456,17,'Geminiano'),(3457,17,'Gilbués'),(3458,17,'Guadalupe'),(3459,17,'Guaribas'),(3460,17,'Hugo Napoleão'),(3461,17,'Ilha Grande'),(3462,17,'Inhuma'),(3463,17,'Ipiranga do Piauí'),(3464,17,'Isaías Coelho'),(3465,17,'Itainópolis'),(3466,17,'Itaueira'),(3467,17,'Jacobina do Piauí'),(3468,17,'Jaicós'),(3469,17,'Jardim do Mulato'),(3470,17,'Jatobá do Piauí'),(3471,17,'Jerumenha'),(3472,17,'João Costa'),(3473,17,'Joaquim Pires'),(3474,17,'Joca Marques'),(3475,17,'José de Freitas'),(3476,17,'Juazeiro do Piauí'),(3477,17,'Júlio Borges'),(3478,17,'Jurema'),(3479,17,'Lagoa Alegre'),(3480,17,'Lagoa de São Francisco'),(3481,17,'Lagoa do Barro do Piauí'),(3482,17,'Lagoa do Piauí'),(3483,17,'Lagoa do Sítio'),(3484,17,'Lagoinha do Piauí'),(3485,17,'Landri Sales'),(3486,17,'Luís Correia'),(3487,17,'Luzilândia'),(3488,17,'Madeiro'),(3489,17,'Manoel Emídio'),(3490,17,'Marcolândia'),(3491,17,'Marcos Parente'),(3492,17,'Massapê do Piauí'),(3493,17,'Matias Olímpio'),(3494,17,'Miguel Alves'),(3495,17,'Miguel Leão'),(3496,17,'Milton Brandão'),(3497,17,'Monsenhor Gil'),(3498,17,'Monsenhor Hipólito'),(3499,17,'Monte Alegre do Piauí'),(3500,17,'Morro Cabeça no Tempo'),(3501,17,'Morro do Chapéu do Piauí'),(3502,17,'Murici dos Portelas'),(3503,17,'Nazaré do Piauí'),(3504,17,'Nossa Senhora de Nazaré'),(3505,17,'Nossa Senhora dos Remédios'),(3506,17,'Nova Santa Rita'),(3507,17,'Novo Oriente do Piauí'),(3508,17,'Novo Santo Antônio'),(3509,17,'Oeiras'),(3510,17,'Olho dÁgua do Piauí'),(3511,17,'Padre Marcos'),(3512,17,'Paes Landim'),(3513,17,'Pajeú do Piauí'),(3514,17,'Palmeira do Piauí'),(3515,17,'Palmeirais'),(3516,17,'Paquetá'),(3517,17,'Parnaguá'),(3518,17,'Parnaíba'),(3519,17,'Passagem Franca do Piauí'),(3520,17,'Patos do Piauí'),(3521,17,'Pau dArco do Piauí'),(3522,17,'Paulistana'),(3523,17,'Pavussu'),(3524,17,'Pedro II'),(3525,17,'Pedro Laurentino'),(3526,17,'Picos'),(3527,17,'Pimenteiras'),(3528,17,'Pio IX'),(3529,17,'Piracuruca'),(3530,17,'Piripiri'),(3531,17,'Porto'),(3532,17,'Porto Alegre do Piauí'),(3533,17,'Prata do Piauí'),(3534,17,'Queimada Nova'),(3535,17,'Redenção do Gurguéia'),(3536,17,'Regeneração'),(3537,17,'Riacho Frio'),(3538,17,'Ribeira do Piauí'),(3539,17,'Ribeiro Gonçalves'),(3540,17,'Rio Grande do Piauí'),(3541,17,'Santa Cruz do Piauí'),(3542,17,'Santa Cruz dos Milagres'),(3543,17,'Santa Filomena'),(3544,17,'Santa Luz'),(3545,17,'Santa Rosa do Piauí'),(3546,17,'Santana do Piauí'),(3547,17,'Santo Antônio de Lisboa'),(3548,17,'Santo Antônio dos Milagres'),(3549,17,'Santo Inácio do Piauí'),(3550,17,'São Braz do Piauí'),(3551,17,'São Félix do Piauí'),(3552,17,'São Francisco de Assis do Piauí'),(3553,17,'São Francisco do Piauí'),(3554,17,'São Gonçalo do Gurguéia'),(3555,17,'São Gonçalo do Piauí'),(3556,17,'São João da Canabrava'),(3557,17,'São João da Fronteira'),(3558,17,'São João da Serra'),(3559,17,'São João da Varjota'),(3560,17,'São João do Arraial'),(3561,17,'São João do Piauí'),(3562,17,'São José do Divino'),(3563,17,'São José do Peixe'),(3564,17,'São José do Piauí'),(3565,17,'São Julião'),(3566,17,'São Lourenço do Piauí'),(3567,17,'São Luis do Piauí'),(3568,17,'São Miguel da Baixa Grande'),(3569,17,'São Miguel do Fidalgo'),(3570,17,'São Miguel do Tapuio'),(3571,17,'São Pedro do Piauí'),(3572,17,'São Raimundo Nonato'),(3573,17,'Sebastião Barros'),(3574,17,'Sebastião Leal'),(3575,17,'Sigefredo Pacheco'),(3576,17,'Simões'),(3577,17,'Simplício Mendes'),(3578,17,'Socorro do Piauí'),(3579,17,'Sussuapara'),(3580,17,'Tamboril do Piauí'),(3581,17,'Tanque do Piauí'),(3582,17,'Teresina'),(3583,17,'União'),(3584,17,'Uruçuí'),(3585,17,'Valença do Piauí'),(3586,17,'Várzea Branca'),(3587,17,'Várzea Grande'),(3588,17,'Vera Mendes'),(3589,17,'Vila Nova do Piauí'),(3590,17,'Wall Ferraz'),(3591,19,'Angra dos Reis'),(3592,19,'Aperibé'),(3593,19,'Araruama'),(3594,19,'Areal'),(3595,19,'Armação dos Búzios'),(3596,19,'Arraial do Cabo'),(3597,19,'Barra do Piraí'),(3598,19,'Barra Mansa'),(3599,19,'Belford Roxo'),(3600,19,'Bom Jardim'),(3601,19,'Bom Jesus do Itabapoana'),(3602,19,'Cabo Frio'),(3603,19,'Cachoeiras de Macacu'),(3604,19,'Cambuci'),(3605,19,'Campos dos Goytacazes'),(3606,19,'Cantagalo'),(3607,19,'Carapebus'),(3608,19,'Cardoso Moreira'),(3609,19,'Carmo'),(3610,19,'Casimiro de Abreu'),(3611,19,'Comendador Levy Gasparian'),(3612,19,'Conceição de Macabu'),(3613,19,'Cordeiro'),(3614,19,'Duas Barras'),(3615,19,'Duque de Caxias'),(3616,19,'Engenheiro Paulo de Frontin'),(3617,19,'Guapimirim'),(3618,19,'Iguaba Grande'),(3619,19,'Itaboraí'),(3620,19,'Itaguaí'),(3621,19,'Italva'),(3622,19,'Itaocara'),(3623,19,'Itaperuna'),(3624,19,'Itatiaia'),(3625,19,'Japeri'),(3626,19,'Laje do Muriaé'),(3627,19,'Macaé'),(3628,19,'Macuco'),(3629,19,'Magé'),(3630,19,'Mangaratiba'),(3631,19,'Maricá'),(3632,19,'Mendes'),(3633,19,'Mesquita'),(3634,19,'Miguel Pereira'),(3635,19,'Miracema'),(3636,19,'Natividade'),(3637,19,'Nilópolis'),(3638,19,'Niterói'),(3639,19,'Nova Friburgo'),(3640,19,'Nova Iguaçu'),(3641,19,'Paracambi'),(3642,19,'Paraíba do Sul'),(3643,19,'Parati'),(3644,19,'Paty do Alferes'),(3645,19,'Petrópolis'),(3646,19,'Pinheiral'),(3647,19,'Piraí'),(3648,19,'Porciúncula'),(3649,19,'Porto Real'),(3650,19,'Quatis'),(3651,19,'Queimados'),(3652,19,'Quissamã'),(3653,19,'Resende'),(3654,19,'Rio Bonito'),(3655,19,'Rio Claro'),(3656,19,'Rio das Flores'),(3657,19,'Rio das Ostras'),(3658,19,'Rio de Janeiro'),(3659,19,'Santa Maria Madalena'),(3660,19,'Santo Antônio de Pádua'),(3661,19,'São Fidélis'),(3662,19,'São Francisco de Itabapoana'),(3663,19,'São Gonçalo'),(3664,19,'São João da Barra'),(3665,19,'São João de Meriti'),(3666,19,'São José de Ubá'),(3667,19,'São José do Vale do Rio Pret'),(3668,19,'São Pedro da Aldeia'),(3669,19,'São Sebastião do Alto'),(3670,19,'Sapucaia'),(3671,19,'Saquarema'),(3672,19,'Seropédica'),(3673,19,'Silva Jardim'),(3674,19,'Sumidouro'),(3675,19,'Tanguá'),(3676,19,'Teresópolis'),(3677,19,'Trajano de Morais'),(3678,19,'Três Rios'),(3679,19,'Valença'),(3680,19,'Varre-Sai'),(3681,19,'Vassouras'),(3682,19,'Volta Redonda'),(3683,20,'Acari'),(3684,20,'Açu'),(3685,20,'Afonso Bezerra'),(3686,20,'Água Nova'),(3687,20,'Alexandria'),(3688,20,'Almino Afonso'),(3689,20,'Alto do Rodrigues'),(3690,20,'Angicos'),(3691,20,'Antônio Martins'),(3692,20,'Apodi'),(3693,20,'Areia Branca'),(3694,20,'Arês'),(3695,20,'Augusto Severo'),(3696,20,'Baía Formosa'),(3697,20,'Baraúna'),(3698,20,'Barcelona'),(3699,20,'Bento Fernandes'),(3700,20,'Bodó'),(3701,20,'Bom Jesus'),(3702,20,'Brejinho'),(3703,20,'Caiçara do Norte'),(3704,20,'Caiçara do Rio do Vento'),(3705,20,'Caicó'),(3706,20,'Campo Redondo'),(3707,20,'Canguaretama'),(3708,20,'Caraúbas'),(3709,20,'Carnaúba dos Dantas'),(3710,20,'Carnaubais'),(3711,20,'Ceará-Mirim'),(3712,20,'Cerro Corá'),(3713,20,'Coronel Ezequiel'),(3714,20,'Coronel João Pessoa'),(3715,20,'Cruzeta'),(3716,20,'Currais Novos'),(3717,20,'Doutor Severiano'),(3718,20,'Encanto'),(3719,20,'Equador'),(3720,20,'Espírito Santo'),(3721,20,'Extremoz'),(3722,20,'Felipe Guerra'),(3723,20,'Fernando Pedroza'),(3724,20,'Florânia'),(3725,20,'Francisco Dantas'),(3726,20,'Frutuoso Gomes'),(3727,20,'Galinhos'),(3728,20,'Goianinha'),(3729,20,'Governador Dix-Sept Rosado'),(3730,20,'Grossos'),(3731,20,'Guamaré'),(3732,20,'Ielmo Marinho'),(3733,20,'Ipanguaçu'),(3734,20,'Ipueira'),(3735,20,'Itajá'),(3736,20,'Itaú'),(3737,20,'Jaçanã'),(3738,20,'Jandaíra'),(3739,20,'Janduís'),(3740,20,'Januário Cicco'),(3741,20,'Japi'),(3742,20,'Jardim de Angicos'),(3743,20,'Jardim de Piranhas'),(3744,20,'Jardim do Seridó'),(3745,20,'João Câmara'),(3746,20,'João Dias'),(3747,20,'José da Penha'),(3748,20,'Jucurutu'),(3749,20,'Jundiá'),(3750,20,'Lagoa dAnta'),(3751,20,'Lagoa de Pedras'),(3752,20,'Lagoa de Velhos'),(3753,20,'Lagoa Nova'),(3754,20,'Lagoa Salgada'),(3755,20,'Lajes'),(3756,20,'Lajes Pintadas'),(3757,20,'Lucrécia'),(3758,20,'Luís Gomes'),(3759,20,'Macaíba'),(3760,20,'Macau'),(3761,20,'Major Sales'),(3762,20,'Marcelino Vieira'),(3763,20,'Martins'),(3764,20,'Maxaranguape'),(3765,20,'Messias Targino'),(3766,20,'Montanhas'),(3767,20,'Monte Alegre'),(3768,20,'Monte das Gameleiras'),(3769,20,'Mossoró'),(3770,20,'Natal'),(3771,20,'Nísia Floresta'),(3772,20,'Nova Cruz'),(3773,20,'Olho-dÁgua do Borges'),(3774,20,'Ouro Branco'),(3775,20,'Paraná'),(3776,20,'Paraú'),(3777,20,'Parazinho'),(3778,20,'Parelhas'),(3779,20,'Parnamirim'),(3780,20,'Passa e Fica'),(3781,20,'Passagem'),(3782,20,'Patu'),(3783,20,'Pau dos Ferros'),(3784,20,'Pedra Grande'),(3785,20,'Pedra Preta'),(3786,20,'Pedro Avelino'),(3787,20,'Pedro Velho'),(3788,20,'Pendências'),(3789,20,'Pilões'),(3790,20,'Poço Branco'),(3791,20,'Portalegre'),(3792,20,'Porto do Mangue'),(3793,20,'Presidente Juscelino'),(3794,20,'Pureza'),(3795,20,'Rafael Fernandes'),(3796,20,'Rafael Godeiro'),(3797,20,'Riacho da Cruz'),(3798,20,'Riacho de Santana'),(3799,20,'Riachuelo'),(3800,20,'Rio do Fogo'),(3801,20,'Rodolfo Fernandes'),(3802,20,'Ruy Barbosa'),(3803,20,'Santa Cruz'),(3804,20,'Santa Maria'),(3805,20,'Santana do Matos'),(3806,20,'Santana do Seridó'),(3807,20,'Santo Antônio'),(3808,20,'São Bento do Norte'),(3809,20,'São Bento do Trairí'),(3810,20,'São Fernando'),(3811,20,'São Francisco do Oeste'),(3812,20,'São Gonçalo do Amarante'),(3813,20,'São João do Sabugi'),(3814,20,'São José de Mipibu'),(3815,20,'São José do Campestre'),(3816,20,'São José do Seridó'),(3817,20,'São Miguel'),(3818,20,'São Miguel do Gostoso'),(3819,20,'São Paulo do Potengi'),(3820,20,'São Pedro'),(3821,20,'São Rafael'),(3822,20,'São Tomé'),(3823,20,'São Vicente'),(3824,20,'Senador Elói de Souza'),(3825,20,'Senador Georgino Avelino'),(3826,20,'Serra de São Bento'),(3827,20,'Serra do Mel'),(3828,20,'Serra Negra do Norte'),(3829,20,'Serrinha'),(3830,20,'Serrinha dos Pintos'),(3831,20,'Severiano Melo'),(3832,20,'Sítio Novo'),(3833,20,'Taboleiro Grande'),(3834,20,'Taipu'),(3835,20,'Tangará'),(3836,20,'Tenente Ananias'),(3837,20,'Tenente Laurentino Cruz'),(3838,20,'Tibau'),(3839,20,'Tibau do Sul'),(3840,20,'Timbaúba dos Batistas'),(3841,20,'Touros'),(3842,20,'Triunfo Potiguar'),(3843,20,'Umarizal'),(3844,20,'Upanema'),(3845,20,'Várzea'),(3846,20,'Venha-Ver'),(3847,20,'Vera Cruz'),(3848,20,'Viçosa'),(3849,20,'Vila Flor'),(3850,23,'Aceguá'),(3851,23,'Água Santa'),(3852,23,'Agudo'),(3853,23,'Ajuricaba'),(3854,23,'Alecrim'),(3855,23,'Alegrete'),(3856,23,'Alegria'),(3857,23,'Almirante Tamandaré do Sul'),(3858,23,'Alpestre'),(3859,23,'Alto Alegre'),(3860,23,'Alto Feliz'),(3861,23,'Alvorada'),(3862,23,'Amaral Ferrador'),(3863,23,'Ametista do Sul'),(3864,23,'André da Rocha'),(3865,23,'Anta Gorda'),(3866,23,'Antônio Prado'),(3867,23,'Arambaré'),(3868,23,'Araricá'),(3869,23,'Aratiba'),(3870,23,'Arroio do Meio'),(3871,23,'Arroio do Padre'),(3872,23,'Arroio do Sal'),(3873,23,'Arroio do Tigre'),(3874,23,'Arroio dos Ratos'),(3875,23,'Arroio Grande'),(3876,23,'Arvorezinha'),(3877,23,'Augusto Pestana'),(3878,23,'Áurea'),(3879,23,'Bagé'),(3880,23,'Balneário Pinhal'),(3881,23,'Barão'),(3882,23,'Barão de Cotegipe'),(3883,23,'Barão do Triunfo'),(3884,23,'Barra do Guarita'),(3885,23,'Barra do Quaraí'),(3886,23,'Barra do Ribeiro'),(3887,23,'Barra do Rio Azul'),(3888,23,'Barra Funda'),(3889,23,'Barracão'),(3890,23,'Barros Cassal'),(3891,23,'Benjamin Constant do Sul'),(3892,23,'Bento Gonçalves'),(3893,23,'Boa Vista das Missões'),(3894,23,'Boa Vista do Buricá'),(3895,23,'Boa Vista do Cadeado'),(3896,23,'Boa Vista do Incra'),(3897,23,'Boa Vista do Sul'),(3898,23,'Bom Jesus'),(3899,23,'Bom Princípio'),(3900,23,'Bom Progresso'),(3901,23,'Bom Retiro do Sul'),(3902,23,'Boqueirão do Leão'),(3903,23,'Bossoroca'),(3904,23,'Bozano'),(3905,23,'Braga'),(3906,23,'Brochier'),(3907,23,'Butiá'),(3908,23,'Caçapava do Sul'),(3909,23,'Cacequi'),(3910,23,'Cachoeira do Sul'),(3911,23,'Cachoeirinha'),(3912,23,'Cacique Doble'),(3913,23,'Caibaté'),(3914,23,'Caiçara'),(3915,23,'Camaquã'),(3916,23,'Camargo'),(3917,23,'Cambará do Sul'),(3918,23,'Campestre da Serra'),(3919,23,'Campina das Missões'),(3920,23,'Campinas do Sul'),(3921,23,'Campo Bom'),(3922,23,'Campo Novo'),(3923,23,'Campos Borges'),(3924,23,'Candelária'),(3925,23,'Cândido Godói'),(3926,23,'Candiota'),(3927,23,'Canela'),(3928,23,'Canguçu'),(3929,23,'Canoas'),(3930,23,'Canudos do Vale'),(3931,23,'Capão Bonito do Sul'),(3932,23,'Capão da Canoa'),(3933,23,'Capão do Cipó'),(3934,23,'Capão do Leão'),(3935,23,'Capela de Santana'),(3936,23,'Capitão'),(3937,23,'Capivari do Sul'),(3938,23,'Caraá'),(3939,23,'Carazinho'),(3940,23,'Carlos Barbosa'),(3941,23,'Carlos Gomes'),(3942,23,'Casca'),(3943,23,'Caseiros'),(3944,23,'Catuípe'),(3945,23,'Caxias do Sul'),(3946,23,'Centenário'),(3947,23,'Cerrito'),(3948,23,'Cerro Branco'),(3949,23,'Cerro Grande'),(3950,23,'Cerro Grande do Sul'),(3951,23,'Cerro Largo'),(3952,23,'Chapada'),(3953,23,'Charqueadas'),(3954,23,'Charrua'),(3955,23,'Chiapeta'),(3956,23,'Chuí'),(3957,23,'Chuvisca'),(3958,23,'Cidreira'),(3959,23,'Ciríaco'),(3960,23,'Colinas'),(3961,23,'Colorado'),(3962,23,'Condor'),(3963,23,'Constantina'),(3964,23,'Coqueiro Baixo'),(3965,23,'Coqueiros do Sul'),(3966,23,'Coronel Barros'),(3967,23,'Coronel Bicaco'),(3968,23,'Coronel Pilar'),(3969,23,'Cotiporã'),(3970,23,'Coxilha'),(3971,23,'Crissiumal'),(3972,23,'Cristal'),(3973,23,'Cristal do Sul'),(3974,23,'Cruz Alta'),(3975,23,'Cruzaltense'),(3976,23,'Cruzeiro do Sul'),(3977,23,'David Canabarro'),(3978,23,'Derrubadas'),(3979,23,'Dezesseis de Novembro'),(3980,23,'Dilermando de Aguiar'),(3981,23,'Dois Irmãos'),(3982,23,'Dois Irmãos das Missões'),(3983,23,'Dois Lajeados'),(3984,23,'Dom Feliciano'),(3985,23,'Dom Pedrito'),(3986,23,'Dom Pedro de Alcântara'),(3987,23,'Dona Francisca'),(3988,23,'Doutor Maurício Cardoso'),(3989,23,'Doutor Ricardo'),(3990,23,'Eldorado do Sul'),(3991,23,'Encantado'),(3992,23,'Encruzilhada do Sul'),(3993,23,'Engenho Velho'),(3994,23,'Entre Rios do Sul'),(3995,23,'Entre-Ijuís'),(3996,23,'Erebango'),(3997,23,'Erechim'),(3998,23,'Ernestina'),(3999,23,'Erval Grande'),(4000,23,'Erval Seco'),(4001,23,'Esmeralda'),(4002,23,'Esperança do Sul'),(4003,23,'Espumoso'),(4004,23,'Estação'),(4005,23,'Estância Velha'),(4006,23,'Esteio'),(4007,23,'Estrela'),(4008,23,'Estrela Velha'),(4009,23,'Eugênio de Castro'),(4010,23,'Fagundes Varela'),(4011,23,'Farroupilha'),(4012,23,'Faxinal do Soturno'),(4013,23,'Faxinalzinho'),(4014,23,'Fazenda Vilanova'),(4015,23,'Feliz'),(4016,23,'Flores da Cunha'),(4017,23,'Floriano Peixoto'),(4018,23,'Fontoura Xavier'),(4019,23,'Formigueiro'),(4020,23,'Forquetinha'),(4021,23,'Fortaleza dos Valos'),(4022,23,'Frederico Westphalen'),(4023,23,'Garibaldi'),(4024,23,'Garruchos'),(4025,23,'Gaurama'),(4026,23,'General Câmara'),(4027,23,'Gentil'),(4028,23,'Getúlio Vargas'),(4029,23,'Giruá'),(4030,23,'Glorinha'),(4031,23,'Gramado'),(4032,23,'Gramado dos Loureiros'),(4033,23,'Gramado Xavier'),(4034,23,'Gravataí'),(4035,23,'Guabiju'),(4036,23,'Guaíba'),(4037,23,'Guaporé'),(4038,23,'Guarani das Missões'),(4039,23,'Harmonia'),(4040,23,'Herval'),(4041,23,'Herveiras'),(4042,23,'Horizontina'),(4043,23,'Hulha Negra'),(4044,23,'Humaitá'),(4045,23,'Ibarama'),(4046,23,'Ibiaçá'),(4047,23,'Ibiraiaras'),(4048,23,'Ibirapuitã'),(4049,23,'Ibirubá'),(4050,23,'Igrejinha'),(4051,23,'Ijuí'),(4052,23,'Ilópolis'),(4053,23,'Imbé'),(4054,23,'Imigrante'),(4055,23,'Independência'),(4056,23,'Inhacorá'),(4057,23,'Ipê'),(4058,23,'Ipiranga do Sul'),(4059,23,'Iraí'),(4060,23,'Itaara'),(4061,23,'Itacurubi'),(4062,23,'Itapuca'),(4063,23,'Itaqui'),(4064,23,'Itati'),(4065,23,'Itatiba do Sul'),(4066,23,'Ivorá'),(4067,23,'Ivoti'),(4068,23,'Jaboticaba'),(4069,23,'Jacuizinho'),(4070,23,'Jacutinga'),(4071,23,'Jaguarão'),(4072,23,'Jaguari'),(4073,23,'Jaquirana'),(4074,23,'Jari'),(4075,23,'Jóia'),(4076,23,'Júlio de Castilhos'),(4077,23,'Lagoa Bonita do Sul'),(4078,23,'Lagoa dos Três Cantos'),(4079,23,'Lagoa Vermelha'),(4080,23,'Lagoão'),(4081,23,'Lajeado'),(4082,23,'Lajeado do Bugre'),(4083,23,'Lavras do Sul'),(4084,23,'Liberato Salzano'),(4085,23,'Lindolfo Collor'),(4086,23,'Linha Nova'),(4087,23,'Maçambara'),(4088,23,'Machadinho'),(4089,23,'Mampituba'),(4090,23,'Manoel Viana'),(4091,23,'Maquiné'),(4092,23,'Maratá'),(4093,23,'Marau'),(4094,23,'Marcelino Ramos'),(4095,23,'Mariana Pimentel'),(4096,23,'Mariano Moro'),(4097,23,'Marques de Souza'),(4098,23,'Mata'),(4099,23,'Mato Castelhano'),(4100,23,'Mato Leitão'),(4101,23,'Mato Queimado'),(4102,23,'Maximiliano de Almeida'),(4103,23,'Minas do Leão'),(4104,23,'Miraguaí'),(4105,23,'Montauri'),(4106,23,'Monte Alegre dos Campos'),(4107,23,'Monte Belo do Sul'),(4108,23,'Montenegro'),(4109,23,'Mormaço'),(4110,23,'Morrinhos do Sul'),(4111,23,'Morro Redondo'),(4112,23,'Morro Reuter'),(4113,23,'Mostardas'),(4114,23,'Muçum'),(4115,23,'Muitos Capões'),(4116,23,'Muliterno'),(4117,23,'Não-Me-Toque'),(4118,23,'Nicolau Vergueiro'),(4119,23,'Nonoai'),(4120,23,'Nova Alvorada'),(4121,23,'Nova Araçá'),(4122,23,'Nova Bassano'),(4123,23,'Nova Boa Vista'),(4124,23,'Nova Bréscia'),(4125,23,'Nova Candelária'),(4126,23,'Nova Esperança do Sul'),(4127,23,'Nova Hartz'),(4128,23,'Nova Pádua'),(4129,23,'Nova Palma'),(4130,23,'Nova Petrópolis'),(4131,23,'Nova Prata'),(4132,23,'Nova Ramada'),(4133,23,'Nova Roma do Sul'),(4134,23,'Nova Santa Rita'),(4135,23,'Novo Barreiro'),(4136,23,'Novo Cabrais'),(4137,23,'Novo Hamburgo'),(4138,23,'Novo Machado'),(4139,23,'Novo Tiradentes'),(4140,23,'Novo Xingu'),(4141,23,'Osório'),(4142,23,'Paim Filho'),(4143,23,'Palmares do Sul'),(4144,23,'Palmeira das Missões'),(4145,23,'Palmitinho'),(4146,23,'Panambi'),(4147,23,'Pantano Grande'),(4148,23,'Paraí'),(4149,23,'Paraíso do Sul'),(4150,23,'Pareci Novo'),(4151,23,'Parobé'),(4152,23,'Passa Sete'),(4153,23,'Passo do Sobrado'),(4154,23,'Passo Fundo'),(4155,23,'Paulo Bento'),(4156,23,'Paverama'),(4157,23,'Pedras Altas'),(4158,23,'Pedro Osório'),(4159,23,'Pejuçara'),(4160,23,'Pelotas'),(4161,23,'Picada Café'),(4162,23,'Pinhal'),(4163,23,'Pinhal da Serra'),(4164,23,'Pinhal Grande'),(4165,23,'Pinheirinho do Vale'),(4166,23,'Pinheiro Machado'),(4167,23,'Pirapó'),(4168,23,'Piratini'),(4169,23,'Planalto'),(4170,23,'Poço das Antas'),(4171,23,'Pontão'),(4172,23,'Ponte Preta'),(4173,23,'Portão'),(4174,23,'Porto Alegre'),(4175,23,'Porto Lucena'),(4176,23,'Porto Mauá'),(4177,23,'Porto Vera Cruz'),(4178,23,'Porto Xavier'),(4179,23,'Pouso Novo'),(4180,23,'Presidente Lucena'),(4181,23,'Progresso'),(4182,23,'Protásio Alves'),(4183,23,'Putinga'),(4184,23,'Quaraí'),(4185,23,'Quatro Irmãos'),(4186,23,'Quevedos'),(4187,23,'Quinze de Novembro'),(4188,23,'Redentora'),(4189,23,'Relvado'),(4190,23,'Restinga Seca'),(4191,23,'Rio dos Índios'),(4192,23,'Rio Grande'),(4193,23,'Rio Pardo'),(4194,23,'Riozinho'),(4195,23,'Roca Sales'),(4196,23,'Rodeio Bonito'),(4197,23,'Rolador'),(4198,23,'Rolante'),(4199,23,'Ronda Alta'),(4200,23,'Rondinha'),(4201,23,'Roque Gonzales'),(4202,23,'Rosário do Sul'),(4203,23,'Sagrada Família'),(4204,23,'Saldanha Marinho'),(4205,23,'Salto do Jacuí'),(4206,23,'Salvador das Missões'),(4207,23,'Salvador do Sul'),(4208,23,'Sananduva'),(4209,23,'Santa Bárbara do Sul'),(4210,23,'Santa Cecília do Sul'),(4211,23,'Santa Clara do Sul'),(4212,23,'Santa Cruz do Sul'),(4213,23,'Santa Margarida do Sul'),(4214,23,'Santa Maria'),(4215,23,'Santa Maria do Herval'),(4216,23,'Santa Rosa'),(4217,23,'Santa Tereza'),(4218,23,'Santa Vitória do Palmar'),(4219,23,'Santana da Boa Vista'),(4220,23,'Santana do Livramento'),(4221,23,'Santiago'),(4222,23,'Santo Ângelo'),(4223,23,'Santo Antônio da Patrulha'),(4224,23,'Santo Antônio das Missões'),(4225,23,'Santo Antônio do Palma'),(4226,23,'Santo Antônio do Planalto'),(4227,23,'Santo Augusto'),(4228,23,'Santo Cristo'),(4229,23,'Santo Expedito do Sul'),(4230,23,'São Borja'),(4231,23,'São Domingos do Sul'),(4232,23,'São Francisco de Assis'),(4233,23,'São Francisco de Paula'),(4234,23,'São Gabriel'),(4235,23,'São Jerônimo'),(4236,23,'São João da Urtiga'),(4237,23,'São João do Polêsine'),(4238,23,'São Jorge'),(4239,23,'São José das Missões'),(4240,23,'São José do Herval'),(4241,23,'São José do Hortêncio'),(4242,23,'São José do Inhacorá'),(4243,23,'São José do Norte'),(4244,23,'São José do Ouro'),(4245,23,'São José do Sul'),(4246,23,'São José dos Ausentes'),(4247,23,'São Leopoldo'),(4248,23,'São Lourenço do Sul'),(4249,23,'São Luiz Gonzaga'),(4250,23,'São Marcos'),(4251,23,'São Martinho'),(4252,23,'São Martinho da Serra'),(4253,23,'São Miguel das Missões'),(4254,23,'São Nicolau'),(4255,23,'São Paulo das Missões'),(4256,23,'São Pedro da Serra'),(4257,23,'São Pedro das Missões'),(4258,23,'São Pedro do Butiá'),(4259,23,'São Pedro do Sul'),(4260,23,'São Sebastião do Caí'),(4261,23,'São Sepé'),(4262,23,'São Valentim'),(4263,23,'São Valentim do Sul'),(4264,23,'São Valério do Sul'),(4265,23,'São Vendelino'),(4266,23,'São Vicente do Sul'),(4267,23,'Sapiranga'),(4268,23,'Sapucaia do Sul'),(4269,23,'Sarandi'),(4270,23,'Seberi'),(4271,23,'Sede Nova'),(4272,23,'Segredo'),(4273,23,'Selbach'),(4274,23,'Senador Salgado Filho'),(4275,23,'Sentinela do Sul'),(4276,23,'Serafina Corrêa'),(4277,23,'Sério'),(4278,23,'Sertão'),(4279,23,'Sertão Santana'),(4280,23,'Sete de Setembro'),(4281,23,'Severiano de Almeida'),(4282,23,'Silveira Martins'),(4283,23,'Sinimbu'),(4284,23,'Sobradinho'),(4285,23,'Soledade'),(4286,23,'Tabaí'),(4287,23,'Tapejara'),(4288,23,'Tapera'),(4289,23,'Tapes'),(4290,23,'Taquara'),(4291,23,'Taquari'),(4292,23,'Taquaruçu do Sul'),(4293,23,'Tavares'),(4294,23,'Tenente Portela'),(4295,23,'Terra de Areia'),(4296,23,'Teutônia'),(4297,23,'Tio Hugo'),(4298,23,'Tiradentes do Sul'),(4299,23,'Toropi'),(4300,23,'Torres'),(4301,23,'Tramandaí'),(4302,23,'Travesseiro'),(4303,23,'Três Arroios'),(4304,23,'Três Cachoeiras'),(4305,23,'Três Coroas'),(4306,23,'Três de Maio'),(4307,23,'Três Forquilhas'),(4308,23,'Três Palmeiras'),(4309,23,'Três Passos'),(4310,23,'Trindade do Sul'),(4311,23,'Triunfo'),(4312,23,'Tucunduva'),(4313,23,'Tunas'),(4314,23,'Tupanci do Sul'),(4315,23,'Tupanciretã'),(4316,23,'Tupandi'),(4317,23,'Tuparendi'),(4318,23,'Turuçu'),(4319,23,'Ubiretama'),(4320,23,'União da Serra'),(4321,23,'Unistalda'),(4322,23,'Uruguaiana'),(4323,23,'Vacaria'),(4324,23,'Vale do Sol'),(4325,23,'Vale Real'),(4326,23,'Vale Verde'),(4327,23,'Vanini'),(4328,23,'Venâncio Aires'),(4329,23,'Vera Cruz'),(4330,23,'Veranópolis'),(4331,23,'Vespasiano Correa'),(4332,23,'Viadutos'),(4333,23,'Viamão'),(4334,23,'Vicente Dutra'),(4335,23,'Victor Graeff'),(4336,23,'Vila Flores'),(4337,23,'Vila Lângaro'),(4338,23,'Vila Maria'),(4339,23,'Vila Nova do Sul'),(4340,23,'Vista Alegre'),(4341,23,'Vista Alegre do Prata'),(4342,23,'Vista Gaúcha'),(4343,23,'Vitória das Missões'),(4344,23,'Westfália'),(4345,23,'Xangri-lá'),(4346,21,'Alta Floresta dOeste'),(4347,21,'Alto Alegre dos Parecis'),(4348,21,'Alto Paraíso'),(4349,21,'Alvorada dOeste'),(4350,21,'Ariquemes'),(4351,21,'Buritis'),(4352,21,'Cabixi'),(4353,21,'Cacaulândia'),(4354,21,'Cacoal'),(4355,21,'Campo Novo de Rondônia'),(4356,21,'Candeias do Jamari'),(4357,21,'Castanheiras'),(4358,21,'Cerejeiras'),(4359,21,'Chupinguaia'),(4360,21,'Colorado do Oeste'),(4361,21,'Corumbiara'),(4362,21,'Costa Marques'),(4363,21,'Cujubim'),(4364,21,'Espigão dOeste'),(4365,21,'Governador Jorge Teixeira'),(4366,21,'Guajará-Mirim'),(4367,21,'Itapuã do Oeste'),(4368,21,'Jaru'),(4369,21,'Ji-Paraná'),(4370,21,'Machadinho dOeste'),(4371,21,'Ministro Andreazza'),(4372,21,'Mirante da Serra'),(4373,21,'Monte Negro'),(4374,21,'Nova Brasilândia dOeste'),(4375,21,'Nova Mamoré'),(4376,21,'Nova União'),(4377,21,'Novo Horizonte do Oeste'),(4378,21,'Ouro Preto do Oeste'),(4379,21,'Parecis'),(4380,21,'Pimenta Bueno'),(4381,21,'Pimenteiras do Oeste'),(4382,21,'Porto Velho'),(4383,21,'Presidente Médici'),(4384,21,'Primavera de Rondônia'),(4385,21,'Rio Crespo'),(4386,21,'Rolim de Moura'),(4387,21,'Santa Luzia dOeste'),(4388,21,'São Felipe dOeste'),(4389,21,'São Francisco do Guaporé'),(4390,21,'São Miguel do Guaporé'),(4391,21,'Seringueiras'),(4392,21,'Teixeirópolis'),(4393,21,'Theobroma'),(4394,21,'Urupá'),(4395,21,'Vale do Anari'),(4396,21,'Vale do Paraíso'),(4397,21,'Vilhena'),(4398,22,'Alto Alegre'),(4399,22,'Amajari'),(4400,22,'Boa Vista'),(4401,22,'Bonfim'),(4402,22,'Cantá'),(4403,22,'Caracaraí'),(4404,22,'Caroebe'),(4405,22,'Iracema'),(4406,22,'Mucajaí'),(4407,22,'Normandia'),(4408,22,'Pacaraima'),(4409,22,'Rorainópolis'),(4410,22,'São João da Baliza'),(4411,22,'São Luiz'),(4412,22,'Uiramutã'),(4413,24,'Abdon Batista'),(4414,24,'Abelardo Luz'),(4415,24,'Agrolândia'),(4416,24,'Agronômica'),(4417,24,'Água Doce'),(4418,24,'Águas de Chapecó'),(4419,24,'Águas Frias'),(4420,24,'Águas Mornas'),(4421,24,'Alfredo Wagner'),(4422,24,'Alto Bela Vista'),(4423,24,'Anchieta'),(4424,24,'Angelina'),(4425,24,'Anita Garibaldi'),(4426,24,'Anitápolis'),(4427,24,'Antônio Carlos'),(4428,24,'Apiúna'),(4429,24,'Arabutã'),(4430,24,'Araquari'),(4431,24,'Araranguá'),(4432,24,'Armazém'),(4433,24,'Arroio Trinta'),(4434,24,'Arvoredo'),(4435,24,'Ascurra'),(4436,24,'Atalanta'),(4437,24,'Aurora'),(4438,24,'Balneário Arroio do Silva'),(4439,24,'Balneário Barra do Sul'),(4440,24,'Balneário Camboriú'),(4441,24,'Balneário Gaivota'),(4442,24,'Bandeirante'),(4443,24,'Barra Bonita'),(4444,24,'Barra Velha'),(4445,24,'Bela Vista do Toldo'),(4446,24,'Belmonte'),(4447,24,'Benedito Novo'),(4448,24,'Biguaçu'),(4449,24,'Blumenau'),(4450,24,'Bocaina do Sul'),(4451,24,'Bom Jardim da Serra'),(4452,24,'Bom Jesus'),(4453,24,'Bom Jesus do Oeste'),(4454,24,'Bom Retiro'),(4455,24,'Bombinhas'),(4456,24,'Botuverá'),(4457,24,'Braço do Norte'),(4458,24,'Braço do Trombudo'),(4459,24,'Brunópolis'),(4460,24,'Brusque'),(4461,24,'Caçador'),(4462,24,'Caibi'),(4463,24,'Calmon'),(4464,24,'Camboriú'),(4465,24,'Campo Alegre'),(4466,24,'Campo Belo do Sul'),(4467,24,'Campo Erê'),(4468,24,'Campos Novos'),(4469,24,'Canelinha'),(4470,24,'Canoinhas'),(4471,24,'Capão Alto'),(4472,24,'Capinzal'),(4473,24,'Capivari de Baixo'),(4474,24,'Catanduvas'),(4475,24,'Caxambu do Sul'),(4476,24,'Celso Ramos'),(4477,24,'Cerro Negro'),(4478,24,'Chapadão do Lageado'),(4479,24,'Chapecó'),(4480,24,'Cocal do Sul'),(4481,24,'Concórdia'),(4482,24,'Cordilheira Alta'),(4483,24,'Coronel Freitas'),(4484,24,'Coronel Martins'),(4485,24,'Correia Pinto'),(4486,24,'Corupá'),(4487,24,'Criciúma'),(4488,24,'Cunha Porã'),(4489,24,'Cunhataí'),(4490,24,'Curitibanos'),(4491,24,'Descanso'),(4492,24,'Dionísio Cerqueira'),(4493,24,'Dona Emma'),(4494,24,'Doutor Pedrinho'),(4495,24,'Entre Rios'),(4496,24,'Ermo'),(4497,24,'Erval Velho'),(4498,24,'Faxinal dos Guedes'),(4499,24,'Flor do Sertão'),(4500,24,'Florianópolis'),(4501,24,'Formosa do Sul'),(4502,24,'Forquilhinha'),(4503,24,'Fraiburgo'),(4504,24,'Frei Rogério'),(4505,24,'Galvão'),(4506,24,'Garopaba'),(4507,24,'Garuva'),(4508,24,'Gaspar'),(4509,24,'Governador Celso Ramos'),(4510,24,'Grão Pará'),(4511,24,'Gravatal'),(4512,24,'Guabiruba'),(4513,24,'Guaraciaba'),(4514,24,'Guaramirim'),(4515,24,'Guarujá do Sul'),(4516,24,'Guatambú'),(4517,24,'Herval dOeste'),(4518,24,'Ibiam'),(4519,24,'Ibicaré'),(4520,24,'Ibirama'),(4521,24,'Içara'),(4522,24,'Ilhota'),(4523,24,'Imaruí'),(4524,24,'Imbituba'),(4525,24,'Imbuia'),(4526,24,'Indaial'),(4527,24,'Iomerê'),(4528,24,'Ipira'),(4529,24,'Iporã do Oeste'),(4530,24,'Ipuaçu'),(4531,24,'Ipumirim'),(4532,24,'Iraceminha'),(4533,24,'Irani'),(4534,24,'Irati'),(4535,24,'Irineópolis'),(4536,24,'Itá'),(4537,24,'Itaiópolis'),(4538,24,'Itajaí'),(4539,24,'Itapema'),(4540,24,'Itapiranga'),(4541,24,'Itapoá'),(4542,24,'Ituporanga'),(4543,24,'Jaborá'),(4544,24,'Jacinto Machado'),(4545,24,'Jaguaruna'),(4546,24,'Jaraguá do Sul'),(4547,24,'Jardinópolis'),(4548,24,'Joaçaba'),(4549,24,'Joinville'),(4550,24,'José Boiteux'),(4551,24,'Jupiá'),(4552,24,'Lacerdópolis'),(4553,24,'Lages'),(4554,24,'Laguna'),(4555,24,'Lajeado Grande'),(4556,24,'Laurentino'),(4557,24,'Lauro Muller'),(4558,24,'Lebon Régis'),(4559,24,'Leoberto Leal'),(4560,24,'Lindóia do Sul'),(4561,24,'Lontras'),(4562,24,'Luiz Alves'),(4563,24,'Luzerna'),(4564,24,'Macieira'),(4565,24,'Mafra'),(4566,24,'Major Gercino'),(4567,24,'Major Vieira'),(4568,24,'Maracajá'),(4569,24,'Maravilha'),(4570,24,'Marema'),(4571,24,'Massaranduba'),(4572,24,'Matos Costa'),(4573,24,'Meleiro'),(4574,24,'Mirim Doce'),(4575,24,'Modelo'),(4576,24,'Mondaí'),(4577,24,'Monte Carlo'),(4578,24,'Monte Castelo'),(4579,24,'Morro da Fumaça'),(4580,24,'Morro Grande'),(4581,24,'Navegantes'),(4582,24,'Nova Erechim'),(4583,24,'Nova Itaberaba'),(4584,24,'Nova Trento'),(4585,24,'Nova Veneza'),(4586,24,'Novo Horizonte'),(4587,24,'Orleans'),(4588,24,'Otacílio Costa'),(4589,24,'Ouro'),(4590,24,'Ouro Verde'),(4591,24,'Paial'),(4592,24,'Painel'),(4593,24,'Palhoça'),(4594,24,'Palma Sola'),(4595,24,'Palmeira'),(4596,24,'Palmitos'),(4597,24,'Papanduva'),(4598,24,'Paraíso'),(4599,24,'Passo de Torres'),(4600,24,'Passos Maia'),(4601,24,'Paulo Lopes'),(4602,24,'Pedras Grandes'),(4603,24,'Penha'),(4604,24,'Peritiba'),(4605,24,'Petrolândia'),(4606,24,'Piçarras'),(4607,24,'Pinhalzinho'),(4608,24,'Pinheiro Preto'),(4609,24,'Piratuba'),(4610,24,'Planalto Alegre'),(4611,24,'Pomerode'),(4612,24,'Ponte Alta'),(4613,24,'Ponte Alta do Norte'),(4614,24,'Ponte Serrada'),(4615,24,'Porto Belo'),(4616,24,'Porto União'),(4617,24,'Pouso Redondo'),(4618,24,'Praia Grande'),(4619,24,'Presidente Castelo Branco'),(4620,24,'Presidente Getúlio'),(4621,24,'Presidente Nereu'),(4622,24,'Princesa'),(4623,24,'Quilombo'),(4624,24,'Rancho Queimado'),(4625,24,'Rio das Antas'),(4626,24,'Rio do Campo'),(4627,24,'Rio do Oeste'),(4628,24,'Rio do Sul'),(4629,24,'Rio dos Cedros'),(4630,24,'Rio Fortuna'),(4631,24,'Rio Negrinho'),(4632,24,'Rio Rufino'),(4633,24,'Riqueza'),(4634,24,'Rodeio'),(4635,24,'Romelândia'),(4636,24,'Salete'),(4637,24,'Saltinho'),(4638,24,'Salto Veloso'),(4639,24,'Sangão'),(4640,24,'Santa Cecília'),(4641,24,'Santa Helena'),(4642,24,'Santa Rosa de Lima'),(4643,24,'Santa Rosa do Sul'),(4644,24,'Santa Terezinha'),(4645,24,'Santa Terezinha do Progresso'),(4646,24,'Santiago do Sul'),(4647,24,'Santo Amaro da Imperatriz'),(4648,24,'São Bento do Sul'),(4649,24,'São Bernardino'),(4650,24,'São Bonifácio'),(4651,24,'São Carlos'),(4652,24,'São Cristovão do Sul'),(4653,24,'São Domingos'),(4654,24,'São Francisco do Sul'),(4655,24,'São João Batista'),(4656,24,'São João do Itaperiú'),(4657,24,'São João do Oeste'),(4658,24,'São João do Sul'),(4659,24,'São Joaquim'),(4660,24,'São José'),(4661,24,'São José do Cedro'),(4662,24,'São José do Cerrito'),(4663,24,'São Lourenço do Oeste'),(4664,24,'São Ludgero'),(4665,24,'São Martinho'),(4666,24,'São Miguel da Boa Vista'),(4667,24,'São Miguel do Oeste'),(4668,24,'São Pedro de Alcântara'),(4669,24,'Saudades'),(4670,24,'Schroeder'),(4671,24,'Seara'),(4672,24,'Serra Alta'),(4673,24,'Siderópolis'),(4674,24,'Sombrio'),(4675,24,'Sul Brasil'),(4676,24,'Taió'),(4677,24,'Tangará'),(4678,24,'Tigrinhos'),(4679,24,'Tijucas'),(4680,24,'Timbé do Sul'),(4681,24,'Timbó'),(4682,24,'Timbó Grande'),(4683,24,'Três Barras'),(4684,24,'Treviso'),(4685,24,'Treze de Maio'),(4686,24,'Treze Tílias'),(4687,24,'Trombudo Central'),(4688,24,'Tubarão'),(4689,24,'Tunápolis'),(4690,24,'Turvo'),(4691,24,'União do Oeste'),(4692,24,'Urubici'),(4693,24,'Urupema'),(4694,24,'Urussanga'),(4695,24,'Vargeão'),(4696,24,'Vargem'),(4697,24,'Vargem Bonita'),(4698,24,'Vidal Ramos'),(4699,24,'Videira'),(4700,24,'Vitor Meireles'),(4701,24,'Witmarsum'),(4702,24,'Xanxerê'),(4703,24,'Xavantina'),(4704,24,'Xaxim'),(4705,24,'Zortéa'),(4706,26,'Adamantina'),(4707,26,'Adolfo'),(4708,26,'Aguaí'),(4709,26,'Águas da Prata'),(4710,26,'Águas de Lindóia'),(4711,26,'Águas de Santa Bárbara'),(4712,26,'Águas de São Pedro'),(4713,26,'Agudos'),(4714,26,'Alambari'),(4715,26,'Alfredo Marcondes'),(4716,26,'Altair'),(4717,26,'Altinópolis'),(4718,26,'Alto Alegre'),(4719,26,'Alumínio'),(4720,26,'Álvares Florence'),(4721,26,'Álvares Machado'),(4722,26,'Álvaro de Carvalho'),(4723,26,'Alvinlândia'),(4724,26,'Americana'),(4725,26,'Américo Brasiliense'),(4726,26,'Américo de Campos'),(4727,26,'Amparo'),(4728,26,'Analândia'),(4729,26,'Andradina'),(4730,26,'Angatuba'),(4731,26,'Anhembi'),(4732,26,'Anhumas'),(4733,26,'Aparecida'),(4734,26,'Aparecida dOeste'),(4735,26,'Apiaí'),(4736,26,'Araçariguama'),(4737,26,'Araçatuba'),(4738,26,'Araçoiaba da Serra'),(4739,26,'Aramina'),(4740,26,'Arandu'),(4741,26,'Arapeí'),(4742,26,'Araraquara'),(4743,26,'Araras'),(4744,26,'Arco-Íris'),(4745,26,'Arealva'),(4746,26,'Areias'),(4747,26,'Areiópolis'),(4748,26,'Ariranha'),(4749,26,'Artur Nogueira'),(4750,26,'Arujá'),(4751,26,'Aspásia'),(4752,26,'Assis'),(4753,26,'Atibaia'),(4754,26,'Auriflama'),(4755,26,'Avaí'),(4756,26,'Avanhandava'),(4757,26,'Avaré'),(4758,26,'Bady Bassitt'),(4759,26,'Balbinos'),(4760,26,'Bálsamo'),(4761,26,'Bananal'),(4762,26,'Barão de Antonina'),(4763,26,'Barbosa'),(4764,26,'Bariri'),(4765,26,'Barra Bonita'),(4766,26,'Barra do Chapéu'),(4767,26,'Barra do Turvo'),(4768,26,'Barretos'),(4769,26,'Barrinha'),(4770,26,'Barueri'),(4771,26,'Bastos'),(4772,26,'Batatais'),(4773,26,'Bauru'),(4774,26,'Bebedouro'),(4775,26,'Bento de Abreu'),(4776,26,'Bernardino de Campos'),(4777,26,'Bertioga'),(4778,26,'Bilac'),(4779,26,'Birigui'),(4780,26,'Biritiba-Mirim'),(4781,26,'Boa Esperança do Sul'),(4782,26,'Bocaina'),(4783,26,'Bofete'),(4784,26,'Boituva'),(4785,26,'Bom Jesus dos Perdões'),(4786,26,'Bom Sucesso de Itararé'),(4787,26,'Borá'),(4788,26,'Boracéia'),(4789,26,'Borborema'),(4790,26,'Borebi'),(4791,26,'Botucatu'),(4792,26,'Bragança Paulista'),(4793,26,'Braúna'),(4794,26,'Brejo Alegre'),(4795,26,'Brodowski'),(4796,26,'Brotas'),(4797,26,'Buri'),(4798,26,'Buritama'),(4799,26,'Buritizal'),(4800,26,'Cabrália Paulista'),(4801,26,'Cabreúva'),(4802,26,'Caçapava'),(4803,26,'Cachoeira Paulista'),(4804,26,'Caconde'),(4805,26,'Cafelândia'),(4806,26,'Caiabu'),(4807,26,'Caieiras'),(4808,26,'Caiuá'),(4809,26,'Cajamar'),(4810,26,'Cajati'),(4811,26,'Cajobi'),(4812,26,'Cajuru'),(4813,26,'Campina do Monte Alegre'),(4814,26,'Campinas'),(4815,26,'Campo Limpo Paulista'),(4816,26,'Campos do Jordão'),(4817,26,'Campos Novos Paulista'),(4818,26,'Cananéia'),(4819,26,'Canas'),(4820,26,'Cândido Mota'),(4821,26,'Cândido Rodrigues'),(4822,26,'Canitar'),(4823,26,'Capão Bonito'),(4824,26,'Capela do Alto'),(4825,26,'Capivari'),(4826,26,'Caraguatatuba'),(4827,26,'Carapicuíba'),(4828,26,'Cardoso'),(4829,26,'Casa Branca'),(4830,26,'Cássia dos Coqueiros'),(4831,26,'Castilho'),(4832,26,'Catanduva'),(4833,26,'Catiguá'),(4834,26,'Cedral'),(4835,26,'Cerqueira César'),(4836,26,'Cerquilho'),(4837,26,'Cesário Lange'),(4838,26,'Charqueada'),(4839,26,'Chavantes'),(4840,26,'Clementina'),(4841,26,'Colina'),(4842,26,'Colômbia'),(4843,26,'Conchal'),(4844,26,'Conchas'),(4845,26,'Cordeirópolis'),(4846,26,'Coroados'),(4847,26,'Coronel Macedo'),(4848,26,'Corumbataí'),(4849,26,'Cosmópolis'),(4850,26,'Cosmorama'),(4851,26,'Cotia'),(4852,26,'Cravinhos'),(4853,26,'Cristais Paulista'),(4854,26,'Cruzália'),(4855,26,'Cruzeiro'),(4856,26,'Cubatão'),(4857,26,'Cunha'),(4858,26,'Descalvado'),(4859,26,'Diadema'),(4860,26,'Dirce Reis'),(4861,26,'Divinolândia'),(4862,26,'Dobrada'),(4863,26,'Dois Córregos'),(4864,26,'Dolcinópolis'),(4865,26,'Dourado'),(4866,26,'Dracena'),(4867,26,'Duartina'),(4868,26,'Dumont'),(4869,26,'Echaporã'),(4870,26,'Eldorado'),(4871,26,'Elias Fausto'),(4872,26,'Elisiário'),(4873,26,'Embaúba'),(4874,26,'Embu'),(4875,26,'Embu-Guaçu'),(4876,26,'Emilianópolis'),(4877,26,'Engenheiro Coelho'),(4878,26,'Espírito Santo do Pinhal'),(4879,26,'Espírito Santo do Turvo'),(4880,26,'Estiva Gerbi'),(4881,26,'Estrela dOeste'),(4882,26,'Estrela do Norte'),(4883,26,'Euclides da Cunha Paulista'),(4884,26,'Fartura'),(4885,26,'Fernando Prestes'),(4886,26,'Fernandópolis'),(4887,26,'Fernão'),(4888,26,'Ferraz de Vasconcelos'),(4889,26,'Flora Rica'),(4890,26,'Floreal'),(4891,26,'Flórida Paulista'),(4892,26,'Florínia'),(4893,26,'Franca'),(4894,26,'Francisco Morato'),(4895,26,'Franco da Rocha'),(4896,26,'Gabriel Monteiro'),(4897,26,'Gália'),(4898,26,'Garça'),(4899,26,'Gastão Vidigal'),(4900,26,'Gavião Peixoto'),(4901,26,'General Salgado'),(4902,26,'Getulina'),(4903,26,'Glicério'),(4904,26,'Guaiçara'),(4905,26,'Guaimbê'),(4906,26,'Guaíra'),(4907,26,'Guapiaçu'),(4908,26,'Guapiara'),(4909,26,'Guará'),(4910,26,'Guaraçaí'),(4911,26,'Guaraci'),(4912,26,'Guarani dOeste'),(4913,26,'Guarantã'),(4914,26,'Guararapes'),(4915,26,'Guararema'),(4916,26,'Guaratinguetá'),(4917,26,'Guareí'),(4918,26,'Guariba'),(4919,26,'Guarujá'),(4920,26,'Guarulhos'),(4921,26,'Guatapará'),(4922,26,'Guzolândia'),(4923,26,'Herculândia'),(4924,26,'Holambra'),(4925,26,'Hortolândia'),(4926,26,'Iacanga'),(4927,26,'Iacri'),(4928,26,'Iaras'),(4929,26,'Ibaté'),(4930,26,'Ibirá'),(4931,26,'Ibirarema'),(4932,26,'Ibitinga'),(4933,26,'Ibiúna'),(4934,26,'Icém'),(4935,26,'Iepê'),(4936,26,'Igaraçu do Tietê'),(4937,26,'Igarapava'),(4938,26,'Igaratá'),(4939,26,'Iguape'),(4940,26,'Ilha Comprida'),(4941,26,'Ilha Solteira'),(4942,26,'Ilhabela'),(4943,26,'Indaiatuba'),(4944,26,'Indiana'),(4945,26,'Indiaporã'),(4946,26,'Inúbia Paulista'),(4947,26,'Ipaussu'),(4948,26,'Iperó'),(4949,26,'Ipeúna'),(4950,26,'Ipiguá'),(4951,26,'Iporanga'),(4952,26,'Ipuã'),(4953,26,'Iracemápolis'),(4954,26,'Irapuã'),(4955,26,'Irapuru'),(4956,26,'Itaberá'),(4957,26,'Itaí'),(4958,26,'Itajobi'),(4959,26,'Itaju'),(4960,26,'Itanhaém'),(4961,26,'Itaóca'),(4962,26,'Itapecerica da Serra'),(4963,26,'Itapetininga'),(4964,26,'Itapeva'),(4965,26,'Itapevi'),(4966,26,'Itapira'),(4967,26,'Itapirapuã Paulista'),(4968,26,'Itápolis'),(4969,26,'Itaporanga'),(4970,26,'Itapuí'),(4971,26,'Itapura'),(4972,26,'Itaquaquecetuba'),(4973,26,'Itararé'),(4974,26,'Itariri'),(4975,26,'Itatiba'),(4976,26,'Itatinga'),(4977,26,'Itirapina'),(4978,26,'Itirapuã'),(4979,26,'Itobi'),(4980,26,'Itu'),(4981,26,'Itupeva'),(4982,26,'Ituverava'),(4983,26,'Jaborandi'),(4984,26,'Jaboticabal'),(4985,26,'Jacareí'),(4986,26,'Jaci'),(4987,26,'Jacupiranga'),(4988,26,'Jaguariúna'),(4989,26,'Jales'),(4990,26,'Jambeiro'),(4991,26,'Jandira'),(4992,26,'Jardinópolis'),(4993,26,'Jarinu'),(4994,26,'Jaú'),(4995,26,'Jeriquara'),(4996,26,'Joanópolis'),(4997,26,'João Ramalho'),(4998,26,'José Bonifácio'),(4999,26,'Júlio Mesquita'),(5000,26,'Jumirim'),(5001,26,'Jundiaí'),(5002,26,'Junqueirópolis'),(5003,26,'Juquiá'),(5004,26,'Juquitiba'),(5005,26,'Lagoinha'),(5006,26,'Laranjal Paulista'),(5007,26,'Lavínia'),(5008,26,'Lavrinhas'),(5009,26,'Leme'),(5010,26,'Lençóis Paulista'),(5011,26,'Limeira'),(5012,26,'Lindóia'),(5013,26,'Lins'),(5014,26,'Lorena'),(5015,26,'Lourdes'),(5016,26,'Louveira'),(5017,26,'Lucélia'),(5018,26,'Lucianópolis'),(5019,26,'Luís Antônio'),(5020,26,'Luiziânia'),(5021,26,'Lupércio'),(5022,26,'Lutécia'),(5023,26,'Macatuba'),(5024,26,'Macaubal'),(5025,26,'Macedônia'),(5026,26,'Magda'),(5027,26,'Mairinque'),(5028,26,'Mairiporã'),(5029,26,'Manduri'),(5030,26,'Marabá Paulista'),(5031,26,'Maracaí'),(5032,26,'Marapoama'),(5033,26,'Mariápolis'),(5034,26,'Marília'),(5035,26,'Marinópolis'),(5036,26,'Martinópolis'),(5037,26,'Matão'),(5038,26,'Mauá'),(5039,26,'Mendonça'),(5040,26,'Meridiano'),(5041,26,'Mesópolis'),(5042,26,'Miguelópolis'),(5043,26,'Mineiros do Tietê'),(5044,26,'Mira Estrela'),(5045,26,'Miracatu'),(5046,26,'Mirandópolis'),(5047,26,'Mirante do Paranapanema'),(5048,26,'Mirassol'),(5049,26,'Mirassolândia'),(5050,26,'Mococa'),(5051,26,'Mogi das Cruzes'),(5052,26,'Mogi Guaçu'),(5053,26,'Moji Mirim'),(5054,26,'Mombuca'),(5055,26,'Monções'),(5056,26,'Mongaguá'),(5057,26,'Monte Alegre do Sul'),(5058,26,'Monte Alto'),(5059,26,'Monte Aprazível'),(5060,26,'Monte Azul Paulista'),(5061,26,'Monte Castelo'),(5062,26,'Monte Mor'),(5063,26,'Monteiro Lobato'),(5064,26,'Morro Agudo'),(5065,26,'Morungaba'),(5066,26,'Motuca'),(5067,26,'Murutinga do Sul'),(5068,26,'Nantes'),(5069,26,'Narandiba'),(5070,26,'Natividade da Serra'),(5071,26,'Nazaré Paulista'),(5072,26,'Neves Paulista'),(5073,26,'Nhandeara'),(5074,26,'Nipoã'),(5075,26,'Nova Aliança'),(5076,26,'Nova Campina'),(5077,26,'Nova Canaã Paulista'),(5078,26,'Nova Castilho'),(5079,26,'Nova Europa'),(5080,26,'Nova Granada'),(5081,26,'Nova Guataporanga'),(5082,26,'Nova Independência'),(5083,26,'Nova Luzitânia'),(5084,26,'Nova Odessa'),(5085,26,'Novais'),(5086,26,'Novo Horizonte'),(5087,26,'Nuporanga'),(5088,26,'Ocauçu'),(5089,26,'Óleo'),(5090,26,'Olímpia'),(5091,26,'Onda Verde'),(5092,26,'Oriente'),(5093,26,'Orindiúva'),(5094,26,'Orlândia'),(5095,26,'Osasco'),(5096,26,'Oscar Bressane'),(5097,26,'Osvaldo Cruz'),(5098,26,'Ourinhos'),(5099,26,'Ouro Verde'),(5100,26,'Ouroeste'),(5101,26,'Pacaembu'),(5102,26,'Palestina'),(5103,26,'Palmares Paulista'),(5104,26,'Palmeira dOeste'),(5105,26,'Palmital'),(5106,26,'Panorama'),(5107,26,'Paraguaçu Paulista'),(5108,26,'Paraibuna'),(5109,26,'Paraíso'),(5110,26,'Paranapanema'),(5111,26,'Paranapuã'),(5112,26,'Parapuã'),(5113,26,'Pardinho'),(5114,26,'Pariquera-Açu'),(5115,26,'Parisi'),(5116,26,'Patrocínio Paulista'),(5117,26,'Paulicéia'),(5118,26,'Paulínia'),(5119,26,'Paulistânia'),(5120,26,'Paulo de Faria'),(5121,26,'Pederneiras'),(5122,26,'Pedra Bela'),(5123,26,'Pedranópolis'),(5124,26,'Pedregulho'),(5125,26,'Pedreira'),(5126,26,'Pedrinhas Paulista'),(5127,26,'Pedro de Toledo'),(5128,26,'Penápolis'),(5129,26,'Pereira Barreto'),(5130,26,'Pereiras'),(5131,26,'Peruíbe'),(5132,26,'Piacatu'),(5133,26,'Piedade'),(5134,26,'Pilar do Sul'),(5135,26,'Pindamonhangaba'),(5136,26,'Pindorama'),(5137,26,'Pinhalzinho'),(5138,26,'Piquerobi'),(5139,26,'Piquete'),(5140,26,'Piracaia'),(5141,26,'Piracicaba'),(5142,26,'Piraju'),(5143,26,'Pirajuí'),(5144,26,'Pirangi'),(5145,26,'Pirapora do Bom Jesus'),(5146,26,'Pirapozinho'),(5147,26,'Pirassununga'),(5148,26,'Piratininga'),(5149,26,'Pitangueiras'),(5150,26,'Planalto'),(5151,26,'Platina'),(5152,26,'Poá'),(5153,26,'Poloni'),(5154,26,'Pompéia'),(5155,26,'Pongaí'),(5156,26,'Pontal'),(5157,26,'Pontalinda'),(5158,26,'Pontes Gestal'),(5159,26,'Populina'),(5160,26,'Porangaba'),(5161,26,'Porto Feliz'),(5162,26,'Porto Ferreira'),(5163,26,'Potim'),(5164,26,'Potirendaba'),(5165,26,'Pracinha'),(5166,26,'Pradópolis'),(5167,26,'Praia Grande'),(5168,26,'Pratânia'),(5169,26,'Presidente Alves'),(5170,26,'Presidente Bernardes'),(5171,26,'Presidente Epitácio'),(5172,26,'Presidente Prudente'),(5173,26,'Presidente Venceslau'),(5174,26,'Promissão'),(5175,26,'Quadra'),(5176,26,'Quatá'),(5177,26,'Queiroz'),(5178,26,'Queluz'),(5179,26,'Quintana'),(5180,26,'Rafard'),(5181,26,'Rancharia'),(5182,26,'Redenção da Serra'),(5183,26,'Regente Feijó'),(5184,26,'Reginópolis'),(5185,26,'Registro'),(5186,26,'Restinga'),(5187,26,'Ribeira'),(5188,26,'Ribeirão Bonito'),(5189,26,'Ribeirão Branco'),(5190,26,'Ribeirão Corrente'),(5191,26,'Ribeirão do Sul'),(5192,26,'Ribeirão dos Índios'),(5193,26,'Ribeirão Grande'),(5194,26,'Ribeirão Pires'),(5195,26,'Ribeirão Preto'),(5196,26,'Rifaina'),(5197,26,'Rincão'),(5198,26,'Rinópolis'),(5199,26,'Rio Claro'),(5200,26,'Rio das Pedras'),(5201,26,'Rio Grande da Serra'),(5202,26,'Riolândia'),(5203,26,'Riversul'),(5204,26,'Rosana'),(5205,26,'Roseira'),(5206,26,'Rubiácea'),(5207,26,'Rubinéia'),(5208,26,'Sabino'),(5209,26,'Sagres'),(5210,26,'Sales'),(5211,26,'Sales Oliveira'),(5212,26,'Salesópolis'),(5213,26,'Salmourão'),(5214,26,'Saltinho'),(5215,26,'Salto'),(5216,26,'Salto de Pirapora'),(5217,26,'Salto Grande'),(5218,26,'Sandovalina'),(5219,26,'Santa Adélia'),(5220,26,'Santa Albertina'),(5221,26,'Santa Bárbara dOeste'),(5222,26,'Santa Branca'),(5223,26,'Santa Clara dOeste'),(5224,26,'Santa Cruz da Conceição'),(5225,26,'Santa Cruz da Esperança'),(5226,26,'Santa Cruz das Palmeiras'),(5227,26,'Santa Cruz do Rio Pardo'),(5228,26,'Santa Ernestina'),(5229,26,'Santa Fé do Sul'),(5230,26,'Santa Gertrudes'),(5231,26,'Santa Isabel'),(5232,26,'Santa Lúcia'),(5233,26,'Santa Maria da Serra'),(5234,26,'Santa Mercedes'),(5235,26,'Santa Rita dOeste'),(5236,26,'Santa Rita do Passa Quatro'),(5237,26,'Santa Rosa de Viterbo'),(5238,26,'Santa Salete'),(5239,26,'Santana da Ponte Pensa'),(5240,26,'Santana de Parnaíba'),(5241,26,'Santo Anastácio'),(5242,26,'Santo André'),(5243,26,'Santo Antônio da Alegria'),(5244,26,'Santo Antônio de Posse'),(5245,26,'Santo Antônio do Aracanguá'),(5246,26,'Santo Antônio do Jardim'),(5247,26,'Santo Antônio do Pinhal'),(5248,26,'Santo Expedito'),(5249,26,'Santópolis do Aguapeí'),(5250,26,'Santos'),(5251,26,'São Bento do Sapucaí'),(5252,26,'São Bernardo do Campo'),(5253,26,'São Caetano do Sul'),(5254,26,'São Carlos'),(5255,26,'São Francisco'),(5256,26,'São João da Boa Vista'),(5257,26,'São João das Duas Pontes'),(5258,26,'São João de Iracema'),(5259,26,'São João do Pau dAlho'),(5260,26,'São Joaquim da Barra'),(5261,26,'São José da Bela Vista'),(5262,26,'São José do Barreiro'),(5263,26,'São José do Rio Pardo'),(5264,26,'São José do Rio Preto'),(5265,26,'São José dos Campos'),(5266,26,'São Lourenço da Serra'),(5267,26,'São Luís do Paraitinga'),(5268,26,'São Manuel'),(5269,26,'São Miguel Arcanjo'),(5270,26,'São Paulo'),(5271,26,'São Pedro'),(5272,26,'São Pedro do Turvo'),(5273,26,'São Roque'),(5274,26,'São Sebastião'),(5275,26,'São Sebastião da Grama'),(5276,26,'São Simão'),(5277,26,'São Vicente'),(5278,26,'Sarapuí'),(5279,26,'Sarutaiá'),(5280,26,'Sebastianópolis do Sul'),(5281,26,'Serra Azul'),(5282,26,'Serra Negra'),(5283,26,'Serrana'),(5284,26,'Sertãozinho'),(5285,26,'Sete Barras'),(5286,26,'Severínia'),(5287,26,'Silveiras'),(5288,26,'Socorro'),(5289,26,'Sorocaba'),(5290,26,'Sud Mennucci'),(5291,26,'Sumaré'),(5292,26,'Suzanápolis'),(5293,26,'Suzano'),(5294,26,'Tabapuã'),(5295,26,'Tabatinga'),(5296,26,'Taboão da Serra'),(5297,26,'Taciba'),(5298,26,'Taguaí'),(5299,26,'Taiaçu'),(5300,26,'Taiúva'),(5301,26,'Tambaú'),(5302,26,'Tanabi'),(5303,26,'Tapiraí'),(5304,26,'Tapiratiba'),(5305,26,'Taquaral'),(5306,26,'Taquaritinga'),(5307,26,'Taquarituba'),(5308,26,'Taquarivaí'),(5309,26,'Tarabai'),(5310,26,'Tarumã'),(5311,26,'Tatuí'),(5312,26,'Taubaté'),(5313,26,'Tejupá'),(5314,26,'Teodoro Sampaio'),(5315,26,'Terra Roxa'),(5316,26,'Tietê'),(5317,26,'Timburi'),(5318,26,'Torre de Pedra'),(5319,26,'Torrinha'),(5320,26,'Trabiju'),(5321,26,'Tremembé'),(5322,26,'Três Fronteiras'),(5323,26,'Tuiuti'),(5324,26,'Tupã'),(5325,26,'Tupi Paulista'),(5326,26,'Turiúba'),(5327,26,'Turmalina'),(5328,26,'Ubarana'),(5329,26,'Ubatuba'),(5330,26,'Ubirajara'),(5331,26,'Uchoa'),(5332,26,'União Paulista'),(5333,26,'Urânia'),(5334,26,'Uru'),(5335,26,'Urupês'),(5336,26,'Valentim Gentil'),(5337,26,'Valinhos'),(5338,26,'Valparaíso'),(5339,26,'Vargem'),(5340,26,'Vargem Grande do Sul'),(5341,26,'Vargem Grande Paulista'),(5342,26,'Várzea Paulista'),(5343,26,'Vera Cruz'),(5344,26,'Vinhedo'),(5345,26,'Viradouro'),(5346,26,'Vista Alegre do Alto'),(5347,26,'Vitória Brasil'),(5348,26,'Votorantim'),(5349,26,'Votuporanga'),(5350,26,'Zacarias'),(5351,25,'Amparo de São Francisco'),(5352,25,'Aquidabã'),(5353,25,'Aracaju'),(5354,25,'Arauá'),(5355,25,'Areia Branca'),(5356,25,'Barra dos Coqueiros'),(5357,25,'Boquim'),(5358,25,'Brejo Grande'),(5359,25,'Campo do Brito'),(5360,25,'Canhoba'),(5361,25,'Canindé de São Francisco'),(5362,25,'Capela'),(5363,25,'Carira'),(5364,25,'Carmópolis'),(5365,25,'Cedro de São João'),(5366,25,'Cristinápolis'),(5367,25,'Cumbe'),(5368,25,'Divina Pastora'),(5369,25,'Estância'),(5370,25,'Feira Nova'),(5371,25,'Frei Paulo'),(5372,25,'Gararu'),(5373,25,'General Maynard'),(5374,25,'Gracho Cardoso'),(5375,25,'Ilha das Flores'),(5376,25,'Indiaroba'),(5377,25,'Itabaiana'),(5378,25,'Itabaianinha'),(5379,25,'Itabi'),(5380,25,'Itaporanga dAjuda'),(5381,25,'Japaratuba'),(5382,25,'Japoatã'),(5383,25,'Lagarto'),(5384,25,'Laranjeiras'),(5385,25,'Macambira'),(5386,25,'Malhada dos Bois'),(5387,25,'Malhador'),(5388,25,'Maruim'),(5389,25,'Moita Bonita'),(5390,25,'Monte Alegre de Sergipe'),(5391,25,'Muribeca'),(5392,25,'Neópolis'),(5393,25,'Nossa Senhora Aparecida'),(5394,25,'Nossa Senhora da Glória'),(5395,25,'Nossa Senhora das Dores'),(5396,25,'Nossa Senhora de Lourdes'),(5397,25,'Nossa Senhora do Socorro'),(5398,25,'Pacatuba'),(5399,25,'Pedra Mole'),(5400,25,'Pedrinhas'),(5401,25,'Pinhão'),(5402,25,'Pirambu'),(5403,25,'Poço Redondo'),(5404,25,'Poço Verde'),(5405,25,'Porto da Folha'),(5406,25,'Propriá'),(5407,25,'Riachão do Dantas'),(5408,25,'Riachuelo'),(5409,25,'Ribeirópolis'),(5410,25,'Rosário do Catete'),(5411,25,'Salgado'),(5412,25,'Santa Luzia do Itanhy'),(5413,25,'Santa Rosa de Lima'),(5414,25,'Santana do São Francisco'),(5415,25,'Santo Amaro das Brotas'),(5416,25,'São Cristóvão'),(5417,25,'São Domingos'),(5418,25,'São Francisco'),(5419,25,'São Miguel do Aleixo'),(5420,25,'Simão Dias'),(5421,25,'Siriri'),(5422,25,'Telha'),(5423,25,'Tobias Barreto'),(5424,25,'Tomar do Geru'),(5425,25,'Umbaúba'),(5426,27,'Abreulândia'),(5427,27,'Aguiarnópolis'),(5428,27,'Aliança do Tocantins'),(5429,27,'Almas'),(5430,27,'Alvorada'),(5431,27,'Ananás'),(5432,27,'Angico'),(5433,27,'Aparecida do Rio Negro'),(5434,27,'Aragominas'),(5435,27,'Araguacema'),(5436,27,'Araguaçu'),(5437,27,'Araguaína'),(5438,27,'Araguanã'),(5439,27,'Araguatins'),(5440,27,'Arapoema'),(5441,27,'Arraias'),(5442,27,'Augustinópolis'),(5443,27,'Aurora do Tocantins'),(5444,27,'Axixá do Tocantins'),(5445,27,'Babaçulândia'),(5446,27,'Bandeirantes do Tocantins'),(5447,27,'Barra do Ouro'),(5448,27,'Barrolândia'),(5449,27,'Bernardo Sayão'),(5450,27,'Bom Jesus do Tocantins'),(5451,27,'Brasilândia do Tocantins'),(5452,27,'Brejinho de Nazaré'),(5453,27,'Buriti do Tocantins'),(5454,27,'Cachoeirinha'),(5455,27,'Campos Lindos'),(5456,27,'Cariri do Tocantins'),(5457,27,'Carmolândia'),(5458,27,'Carrasco Bonito'),(5459,27,'Caseara'),(5460,27,'Centenário'),(5461,27,'Chapada da Natividade'),(5462,27,'Chapada de Areia'),(5463,27,'Colinas do Tocantins'),(5464,27,'Colméia'),(5465,27,'Combinado'),(5466,27,'Conceição do Tocantins'),(5467,27,'Couto de Magalhães'),(5468,27,'Cristalândia'),(5469,27,'Crixás do Tocantins'),(5470,27,'Darcinópolis'),(5471,27,'Dianópolis'),(5472,27,'Divinópolis do Tocantins'),(5473,27,'Dois Irmãos do Tocantins'),(5474,27,'Dueré'),(5475,27,'Esperantina'),(5476,27,'Fátima'),(5477,27,'Figueirópolis'),(5478,27,'Filadélfia'),(5479,27,'Formoso do Araguaia'),(5480,27,'Fortaleza do Tabocão'),(5481,27,'Goianorte'),(5482,27,'Goiatins'),(5483,27,'Guaraí'),(5484,27,'Gurupi'),(5485,27,'Ipueiras'),(5486,27,'Itacajá'),(5487,27,'Itaguatins'),(5488,27,'Itapiratins'),(5489,27,'Itaporã do Tocantins'),(5490,27,'Jaú do Tocantins'),(5491,27,'Juarina'),(5492,27,'Lagoa da Confusão'),(5493,27,'Lagoa do Tocantins'),(5494,27,'Lajeado'),(5495,27,'Lavandeira'),(5496,27,'Lizarda'),(5497,27,'Luzinópolis'),(5498,27,'Marianópolis do Tocantins'),(5499,27,'Mateiros'),(5500,27,'Maurilândia do Tocantins'),(5501,27,'Miracema do Tocantins'),(5502,27,'Miranorte'),(5503,27,'Monte do Carmo'),(5504,27,'Monte Santo do Tocantins'),(5505,27,'Muricilândia'),(5506,27,'Natividade'),(5507,27,'Nazaré'),(5508,27,'Nova Olinda'),(5509,27,'Nova Rosalândia'),(5510,27,'Novo Acordo'),(5511,27,'Novo Alegre'),(5512,27,'Novo Jardim'),(5513,27,'Oliveira de Fátima'),(5514,27,'Palmas'),(5515,27,'Palmeirante'),(5516,27,'Palmeiras do Tocantins'),(5517,27,'Palmeirópolis'),(5518,27,'Paraíso do Tocantins'),(5519,27,'Paranã'),(5520,27,'Pau dArco'),(5521,27,'Pedro Afonso'),(5522,27,'Peixe'),(5523,27,'Pequizeiro'),(5524,27,'Pindorama do Tocantins'),(5525,27,'Piraquê'),(5526,27,'Pium'),(5527,27,'Ponte Alta do Bom Jesus'),(5528,27,'Ponte Alta do Tocantins'),(5529,27,'Porto Alegre do Tocantins'),(5530,27,'Porto Nacional'),(5531,27,'Praia Norte'),(5532,27,'Presidente Kennedy'),(5533,27,'Pugmil'),(5534,27,'Recursolândia'),(5535,27,'Riachinho'),(5536,27,'Rio da Conceição'),(5537,27,'Rio dos Bois'),(5538,27,'Rio Sono'),(5539,27,'Sampaio'),(5540,27,'Sandolândia'),(5541,27,'Santa Fé do Araguaia'),(5542,27,'Santa Maria do Tocantins'),(5543,27,'Santa Rita do Tocantins'),(5544,27,'Santa Rosa do Tocantins'),(5545,27,'Santa Tereza do Tocantins'),(5546,27,'Santa Terezinha do Tocantins'),(5547,27,'São Bento do Tocantins'),(5548,27,'São Félix do Tocantins'),(5549,27,'São Miguel do Tocantins'),(5550,27,'São Salvador do Tocantins'),(5551,27,'São Sebastião do Tocantins'),(5552,27,'São Valério da Natividade'),(5553,27,'Silvanópolis'),(5554,27,'Sítio Novo do Tocantins'),(5555,27,'Sucupira'),(5556,27,'Taguatinga'),(5557,27,'Taipas do Tocantins'),(5558,27,'Talismã'),(5559,27,'Tocantínia'),(5560,27,'Tocantinópolis'),(5561,27,'Tupirama'),(5562,27,'Tupiratins'),(5563,27,'Wanderlândia'),(5564,27,'Xambioá');
/*!40000 ALTER TABLE `cidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracoes`
--

DROP TABLE IF EXISTS `configuracoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracoes` (
  `cnf_codigo` int(11) NOT NULL,
  `cnf_versao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cnf_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracoes`
--

LOCK TABLES `configuracoes` WRITE;
/*!40000 ALTER TABLE `configuracoes` DISABLE KEYS */;
INSERT INTO `configuracoes` VALUES (1,'v3.4.1');
/*!40000 ALTER TABLE `configuracoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cooperativa_gestores`
--

DROP TABLE IF EXISTS `cooperativa_gestores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cooperativa_gestores` (
  `cooges_cooperativa` int(11) NOT NULL,
  `cooges_gestor` int(11) NOT NULL,
  PRIMARY KEY (`cooges_cooperativa`,`cooges_gestor`),
  KEY `cooges_quiosque` (`cooges_cooperativa`),
  KEY `cooges_gestor` (`cooges_gestor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cooperativa_gestores`
--

LOCK TABLES `cooperativa_gestores` WRITE;
/*!40000 ALTER TABLE `cooperativa_gestores` DISABLE KEYS */;
/*!40000 ALTER TABLE `cooperativa_gestores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cooperativas`
--

DROP TABLE IF EXISTS `cooperativas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cooperativas` (
  `coo_codigo` smallint(4) NOT NULL AUTO_INCREMENT,
  `coo_nomecompleto` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `coo_abreviacao` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coo_presidente` int(11) DEFAULT NULL,
  PRIMARY KEY (`coo_codigo`),
  KEY `coo_presidente` (`coo_presidente`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cooperativas`
--

LOCK TABLES `cooperativas` WRITE;
/*!40000 ALTER TABLE `cooperativas` DISABLE KEYS */;
/*!40000 ALTER TABLE `cooperativas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entradas`
--

DROP TABLE IF EXISTS `entradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entradas` (
  `ent_codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `ent_quiosque` bigint(20) NOT NULL,
  `ent_fornecedor` bigint(20) NOT NULL,
  `ent_supervisor` bigint(20) NOT NULL,
  `ent_datacadastro` date NOT NULL,
  `ent_horacadastro` time NOT NULL,
  `ent_tipo` bigint(20) NOT NULL,
  `ent_status` tinyint(4) NOT NULL,
  `ent_valortotal` float DEFAULT NULL,
  `ent_tiponegociacao` tinyint(4) NOT NULL,
  `ent_valortotalcusto` float DEFAULT NULL,
  PRIMARY KEY (`ent_codigo`),
  KEY `ent_tipo` (`ent_tipo`),
  KEY `ent_fornecedor` (`ent_fornecedor`),
  KEY `ent_vendedor` (`ent_supervisor`),
  KEY `ent_quiosque` (`ent_quiosque`),
  KEY `ent_status` (`ent_status`),
  KEY `ent_tiponegociacao` (`ent_tiponegociacao`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas`
--

LOCK TABLES `entradas` WRITE;
/*!40000 ALTER TABLE `entradas` DISABLE KEYS */;
/*!40000 ALTER TABLE `entradas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entradas_produtos`
--

DROP TABLE IF EXISTS `entradas_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entradas_produtos` (
  `entpro_entrada` bigint(20) NOT NULL,
  `entpro_numero` smallint(4) NOT NULL AUTO_INCREMENT,
  `entpro_produto` bigint(20) NOT NULL,
  `entpro_quantidade` float NOT NULL,
  `entpro_valorunitario` float NOT NULL,
  `entpro_validade` date DEFAULT NULL,
  `entpro_local` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entpro_valtot` float NOT NULL,
  `entpro_status` tinyint(1) NOT NULL,
  `entpro_valunicusto` float DEFAULT NULL,
  `entpro_valtotcusto` float DEFAULT NULL,
  PRIMARY KEY (`entpro_entrada`,`entpro_numero`),
  KEY `entpro_entrada` (`entpro_entrada`),
  KEY `entpro_produto` (`entpro_produto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas_produtos`
--

LOCK TABLES `entradas_produtos` WRITE;
/*!40000 ALTER TABLE `entradas_produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `entradas_produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entradas_tipo`
--

DROP TABLE IF EXISTS `entradas_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entradas_tipo` (
  `enttip_codigo` tinyint(4) NOT NULL AUTO_INCREMENT,
  `enttip_nome` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `enttip_descricao` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`enttip_codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas_tipo`
--

LOCK TABLES `entradas_tipo` WRITE;
/*!40000 ALTER TABLE `entradas_tipo` DISABLE KEYS */;
INSERT INTO `entradas_tipo` VALUES (1,'Normal',''),(2,'Doação','Para produtos que são doados ao quiosque'),(3,'Ajuste','');
/*!40000 ALTER TABLE `entradas_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados` (
  `est_codigo` tinyint(2) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `est_sigla` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `est_pais` smallint(4) NOT NULL,
  `est_nome` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`est_codigo`),
  KEY `est_pais` (`est_pais`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (24,'SC',1,'Santa Catarina'),(23,'RS',1,'Rio Grande do Sul'),(22,'RR',1,'Roraima'),(21,'RO',1,'Rondônia'),(20,'RN',1,'Rio Grande do Norte'),(19,'RJ',1,'Rio de Janeiro'),(18,'PR',1,'Paraná'),(17,'PI',1,'Piauí'),(16,'PE',1,'Pernambuco'),(15,'PB',1,'Paraíba'),(14,'PA',1,'Pará'),(13,'MT',1,'Mato Grosso'),(12,'MS',1,'Mato Grosso do Sul'),(11,'MG',1,'Minas Gerais'),(10,'MA',1,'Maranhão'),(09,'GO',1,'Goiás'),(08,'ES',1,'Espírito Santo'),(07,'DF',1,'Distrito Federal'),(06,'CE',1,'Ceará'),(05,'BA',1,'Bahia'),(04,'AP',1,'Amapá'),(03,'AM',1,'Amazonas'),(02,'AL',1,'Alagoas'),(01,'AC',1,'Acre'),(25,'SE',1,'Sergipe'),(26,'SP',1,'São Paulo'),(27,'TO',1,'Tocantins'),(43,'OTR',12,'Outro'),(44,'OUTRO',11,'Outro'),(45,'OUTRO',13,'Outro');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estoque` (
  `etq_quiosque` tinyint(2) NOT NULL,
  `etq_produto` bigint(20) NOT NULL,
  `etq_fornecedor` int(11) NOT NULL,
  `etq_lote` bigint(20) NOT NULL,
  `etq_quantidade` float NOT NULL,
  `etq_valorunitario` float DEFAULT NULL,
  `etq_validade` date DEFAULT NULL,
  PRIMARY KEY (`etq_quiosque`,`etq_produto`,`etq_fornecedor`,`etq_lote`),
  KEY `etqpro_quiosque` (`etq_quiosque`),
  KEY `etqpro_produto` (`etq_produto`),
  KEY `etqpro_fornecedor` (`etq_fornecedor`),
  KEY `etq_lote` (`etq_lote`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fechamentos`
--

DROP TABLE IF EXISTS `fechamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fechamentos` (
  `fch_codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `fch_datacadastro` date NOT NULL,
  `fch_horacadastro` time NOT NULL,
  `fch_dataini` datetime NOT NULL,
  `fch_datafim` datetime NOT NULL,
  `fch_supervisor` bigint(20) NOT NULL,
  `fch_totalvenda` float NOT NULL,
  `fch_totalcusto` float NOT NULL,
  `fch_totallucro` float NOT NULL,
  `fch_totaltaxas` float NOT NULL,
  `fch_totaltaxaquiosque` float NOT NULL,
  `fch_qtdvendas` int(11) NOT NULL,
  `fch_qtdprodutos` int(11) NOT NULL,
  `fch_qtdfornecedores` int(11) NOT NULL,
  `fch_qtdlotes` int(11) NOT NULL,
  `fch_quiosque` int(11) NOT NULL,
  PRIMARY KEY (`fch_codigo`),
  KEY `fch_supervisor` (`fch_supervisor`),
  KEY `fch_quiosque` (`fch_quiosque`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fechamentos`
--

LOCK TABLES `fechamentos` WRITE;
/*!40000 ALTER TABLE `fechamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `fechamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fechamentos_taxas`
--

DROP TABLE IF EXISTS `fechamentos_taxas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fechamentos_taxas` (
  `fchtax_fechamento` bigint(20) NOT NULL,
  `fchtax_taxa` int(11) NOT NULL,
  `fchtax_referencia` float NOT NULL,
  `fchtax_valor` float NOT NULL,
  PRIMARY KEY (`fchtax_fechamento`,`fchtax_taxa`),
  KEY `fchtax_fechamento` (`fchtax_fechamento`),
  KEY `fchtax_taxa` (`fchtax_taxa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fechamentos_taxas`
--

LOCK TABLES `fechamentos_taxas` WRITE;
/*!40000 ALTER TABLE `fechamentos_taxas` DISABLE KEYS */;
/*!40000 ALTER TABLE `fechamentos_taxas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedores_tiponegociacao`
--

DROP TABLE IF EXISTS `fornecedores_tiponegociacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedores_tiponegociacao` (
  `fortipneg_pessoa` bigint(20) NOT NULL,
  `fortipneg_tiponegociacao` tinyint(4) NOT NULL,
  PRIMARY KEY (`fortipneg_pessoa`,`fortipneg_tiponegociacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedores_tiponegociacao`
--

LOCK TABLES `fornecedores_tiponegociacao` WRITE;
/*!40000 ALTER TABLE `fornecedores_tiponegociacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedores_tiponegociacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_permissoes`
--

DROP TABLE IF EXISTS `grupo_permissoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_permissoes` (
  `gruper_codigo` tinyint(2) NOT NULL AUTO_INCREMENT,
  `gruper_nome` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `gruper_cooperativa_ver` tinyint(1) NOT NULL,
  `gruper_cooperativa_cadastrar` tinyint(1) NOT NULL,
  `gruper_cooperativa_editar` tinyint(1) NOT NULL,
  `gruper_cooperativa_excluir` tinyint(1) NOT NULL,
  `gruper_quiosque_ver` tinyint(1) NOT NULL,
  `gruper_quiosque_cadastrar` tinyint(1) NOT NULL,
  `gruper_quiosque_editar` tinyint(1) NOT NULL,
  `gruper_quiosque_excluir` tinyint(1) NOT NULL,
  `gruper_quiosque_definirsupervisores` tinyint(1) NOT NULL,
  `gruper_quiosque_definirvendedores` tinyint(1) NOT NULL,
  `gruper_quiosque_versupervisores` tinyint(1) NOT NULL,
  `gruper_quiosque_vervendedores` tinyint(1) NOT NULL,
  `gruper_quiosque_vertaxas` tinyint(1) NOT NULL,
  `gruper_quiosque_definircooperativa` tinyint(1) NOT NULL,
  `gruper_pessoas_alterar_cooperativa` tinyint(1) NOT NULL,
  `gruper_pessoas_cadastrar` tinyint(1) NOT NULL,
  `gruper_pessoas_cadastrar_administradores` tinyint(1) NOT NULL,
  `gruper_pessoas_cadastrar_gestores` tinyint(1) NOT NULL,
  `gruper_pessoas_cadastrar_supervisores` tinyint(1) NOT NULL,
  `gruper_pessoas_cadastrar_vendedores` tinyint(1) NOT NULL,
  `gruper_pessoas_cadastrar_fornecedores` tinyint(1) NOT NULL,
  `gruper_pessoas_cadastrar_consumidores` tinyint(1) NOT NULL,
  `gruper_pessoas_excluir` tinyint(1) NOT NULL,
  `gruper_pessoas_ver` tinyint(1) NOT NULL,
  `gruper_pessoas_ver_gestores` tinyint(1) NOT NULL,
  `gruper_pessoas_ver_supervisores` tinyint(1) NOT NULL,
  `gruper_pessoas_ver_vendedores` tinyint(1) NOT NULL,
  `gruper_pessoas_ver_fornecedores` tinyint(1) NOT NULL,
  `gruper_pessoas_ver_consumidores` tinyint(1) NOT NULL,
  `gruper_pessoas_ver_administradores` tinyint(1) NOT NULL,
  `gruper_pessoas_criarusuarios` tinyint(1) NOT NULL,
  `gruper_pessoas_definir_grupo_administradores` tinyint(1) NOT NULL,
  `gruper_pessoas_definir_grupo_gestores` tinyint(1) NOT NULL,
  `gruper_pessoas_definir_grupo_supervisores` tinyint(1) NOT NULL,
  `gruper_pessoas_definir_grupo_vendedores` tinyint(1) NOT NULL,
  `gruper_pessoas_definir_grupo_fornecedores` tinyint(1) NOT NULL,
  `gruper_pessoas_definir_grupo_consumidores` tinyint(1) NOT NULL,
  `gruper_pessoas_definir_quiosqueusuario` tinyint(1) NOT NULL,
  `gruper_produtos_ver` tinyint(1) NOT NULL,
  `gruper_produtos_cadastrar` tinyint(1) NOT NULL,
  `gruper_produtos_editar` tinyint(1) NOT NULL,
  `gruper_produtos_excluir` tinyint(1) NOT NULL,
  `gruper_paises_ver` tinyint(1) NOT NULL,
  `gruper_paises_cadastrar` tinyint(1) NOT NULL,
  `gruper_paises_editar` tinyint(1) NOT NULL,
  `gruper_paises_excluir` tinyint(1) NOT NULL,
  `gruper_estados_ver` tinyint(1) NOT NULL,
  `gruper_estados_cadastrar` tinyint(1) NOT NULL,
  `gruper_estados_editar` tinyint(1) NOT NULL,
  `gruper_estados_excluir` tinyint(1) NOT NULL,
  `gruper_cidades_ver` tinyint(1) NOT NULL,
  `gruper_cidades_cadastrar` tinyint(1) NOT NULL,
  `gruper_cidades_editar` tinyint(1) NOT NULL,
  `gruper_cidades_excluir` tinyint(1) NOT NULL,
  `gruper_categorias_ver` tinyint(1) NOT NULL,
  `gruper_categorias_cadastrar` tinyint(1) NOT NULL,
  `gruper_categorias_editar` tinyint(1) NOT NULL,
  `gruper_categorias_excluir` tinyint(1) NOT NULL,
  `gruper_tipocontagem_ver` tinyint(1) NOT NULL,
  `gruper_tipocontagem_cadastrar` tinyint(1) NOT NULL,
  `gruper_tipocontagem_editar` tinyint(1) NOT NULL,
  `gruper_tipocontagem_excluir` tinyint(1) NOT NULL,
  `gruper_estoque_ver` tinyint(1) NOT NULL,
  `gruper_estoque_qtdide_definir` tinyint(1) NOT NULL,
  `gruper_entradas_ver` tinyint(1) NOT NULL,
  `gruper_entradas_cadastrar` tinyint(1) NOT NULL,
  `gruper_entradas_editar` tinyint(1) NOT NULL,
  `gruper_entradas_excluir` tinyint(1) NOT NULL,
  `gruper_entradas_etiquetas` tinyint(1) NOT NULL,
  `gruper_entradas_cancelar` tinyint(1) NOT NULL,
  `gruper_saidas_ver` tinyint(1) NOT NULL,
  `gruper_saidas_cadastrar` tinyint(1) NOT NULL,
  `gruper_saidas_excluir` tinyint(1) NOT NULL,
  `gruper_saidas_editar` tinyint(1) NOT NULL,
  `gruper_saidas_cadastrar_devolucao` tinyint(1) NOT NULL,
  `gruper_saidas_editar_devolucao` tinyint(1) NOT NULL,
  `gruper_saidas_excluir_devolucao` tinyint(1) NOT NULL,
  `gruper_saidas_ver_devolucao` tinyint(1) NOT NULL,
  `gruper_relatorios_ver` tinyint(1) NOT NULL,
  `gruper_relatorios_cadastrar` tinyint(1) NOT NULL,
  `gruper_relatorios_editar` tinyint(1) NOT NULL,
  `gruper_relatorios_excluir` tinyint(1) NOT NULL,
  `gruper_acertos_cadastrar` tinyint(1) NOT NULL,
  `gruper_acertos_editar` tinyint(1) NOT NULL,
  `gruper_acertos_excluir` tinyint(1) NOT NULL,
  `gruper_acertos_ver` tinyint(1) NOT NULL,
  `gruper_taxas_cadastrar` tinyint(1) NOT NULL,
  `gruper_taxas_editar` tinyint(1) NOT NULL,
  `gruper_taxas_excluir` tinyint(1) NOT NULL,
  `gruper_taxas_ver` tinyint(1) NOT NULL,
  `gruper_taxas_aplicar` tinyint(1) NOT NULL,
  `gruper_quiosque_definircaixas` tinyint(1) NOT NULL,
  `gruper_quiosque_vercaixas` tinyint(1) NOT NULL,
  `gruper_pessoas_cadastrar_caixas` tinyint(1) NOT NULL,
  `gruper_pessoas_ver_caixas` tinyint(1) NOT NULL,
  `gruper_pessoas_definir_grupo_caixas` tinyint(1) NOT NULL,
  `gruper_caixas_cadastrar` tinyint(1) NOT NULL,
  `gruper_caixas_editar` tinyint(1) NOT NULL,
  `gruper_caixas_excluir` tinyint(1) NOT NULL,
  `gruper_caixas_ver` tinyint(1) NOT NULL,
  `gruper_caixas_operadores_gerir` tinyint(1) NOT NULL,
  `gruper_caixas_operacoes_ver` tinyint(1) NOT NULL,
  `gruper_caixas_operacoes_abrir` tinyint(1) NOT NULL,
  `gruper_caixas_operacoes_encerrar` tinyint(1) NOT NULL,
  `gruper_caixas_trocar` tinyint(1) NOT NULL,
  `gruper_cooperativa_gestores_ver` tinyint(1) NOT NULL,
  `gruper_cooperativa_gestores_gerir` tinyint(1) NOT NULL,
  PRIMARY KEY (`gruper_codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_permissoes`
--

LOCK TABLES `grupo_permissoes` WRITE;
/*!40000 ALTER TABLE `grupo_permissoes` DISABLE KEYS */;
INSERT INTO `grupo_permissoes` VALUES (1,'Administrador',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(2,'Gestor',0,0,0,0,1,1,1,1,1,1,1,1,1,0,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,0,0,1,0,1,0,0,1,1,0,0,0,1,0,0,0,0,0,0,1,1,1,1,1,0,0,1,1,1,1,0,0,0,1,0,1,0,0,0,1,1),(3,'Supervisor',0,0,0,0,1,0,1,0,0,1,1,1,1,0,0,1,0,0,0,1,1,1,1,1,0,1,1,1,1,0,1,0,0,0,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0),(4,'Caixa',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,1,1,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,1,1,1,1,0,0,0),(5,'Fornecedor',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(7,'Root',1,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,1,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `grupo_permissoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mestre_pessoas_tipo`
--

DROP TABLE IF EXISTS `mestre_pessoas_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mestre_pessoas_tipo` (
  `mespestip_pessoa` int(11) NOT NULL,
  `mespestip_tipo` tinyint(2) NOT NULL,
  PRIMARY KEY (`mespestip_pessoa`,`mespestip_tipo`),
  KEY `mespestip_pessoa` (`mespestip_pessoa`),
  KEY `mespestip_tipo` (`mespestip_tipo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mestre_pessoas_tipo`
--

LOCK TABLES `mestre_pessoas_tipo` WRITE;
/*!40000 ALTER TABLE `mestre_pessoas_tipo` DISABLE KEYS */;
INSERT INTO `mestre_pessoas_tipo` VALUES (4,1);
/*!40000 ALTER TABLE `mestre_pessoas_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mestre_produtos_tipo`
--

DROP TABLE IF EXISTS `mestre_produtos_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mestre_produtos_tipo` (
  `mesprotip_produto` bigint(20) NOT NULL,
  `mesprotip_tipo` tinyint(4) NOT NULL,
  PRIMARY KEY (`mesprotip_produto`,`mesprotip_tipo`),
  KEY `mesprotip_produto` (`mesprotip_produto`),
  KEY `mesprotip_tipo` (`mesprotip_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mestre_produtos_tipo`
--

LOCK TABLES `mestre_produtos_tipo` WRITE;
/*!40000 ALTER TABLE `mestre_produtos_tipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `mestre_produtos_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodos_pagamento`
--

DROP TABLE IF EXISTS `metodos_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metodos_pagamento` (
  `metpag_codigo` tinyint(4) NOT NULL AUTO_INCREMENT,
  `metpag_nome` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`metpag_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodos_pagamento`
--

LOCK TABLES `metodos_pagamento` WRITE;
/*!40000 ALTER TABLE `metodos_pagamento` DISABLE KEYS */;
INSERT INTO `metodos_pagamento` VALUES (1,'Dinheiro'),(2,'Cartão Crédito'),(3,'Cartão Débito'),(4,'Cheque'),(5,'Outro');
/*!40000 ALTER TABLE `metodos_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paises` (
  `pai_codigo` smallint(6) NOT NULL AUTO_INCREMENT,
  `pai_sigla` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `pai_nome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`pai_codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES (1,'BR','Brasil'),(13,'URU','Uruguai'),(12,'ARG','Argentina'),(11,'PAR','Paraguai');
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoas`
--

DROP TABLE IF EXISTS `pessoas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoas` (
  `pes_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `pes_id` int(8) DEFAULT NULL,
  `pes_nome` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `pes_cidade` mediumint(11) NOT NULL,
  `pes_cep` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pes_bairro` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pes_vila` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pes_endereco` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pes_complemento` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pes_referencia` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pes_numero` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pes_fone1` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pes_fone2` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pes_email` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pes_datacadastro` date DEFAULT NULL,
  `pes_horacadastro` time DEFAULT NULL,
  `pes_dataedicao` date DEFAULT NULL,
  `pes_horaedicao` time DEFAULT NULL,
  `pes_obs` text COLLATE utf8_unicode_ci,
  `pes_chat` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pes_cooperativa` tinyint(2) NOT NULL,
  `pes_possuiacesso` tinyint(1) NOT NULL,
  `pes_senha` text COLLATE utf8_unicode_ci,
  `pes_grupopermissoes` tinyint(2) DEFAULT NULL,
  `pes_quiosqueusuario` bigint(18) DEFAULT NULL,
  `pes_cpf` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `pes_email_senha` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pes_usarperguntasecreta` tinyint(1) NOT NULL,
  `pes_perguntasecreta` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pes_respostasecreta` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pes_cnpj` varchar(14) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pes_fone1ramal` int(9) DEFAULT NULL,
  `pes_fone2ramal` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pes_categoria` mediumint(9) DEFAULT NULL,
  `pes_tipopessoa` int(11) DEFAULT NULL,
  `pes_pessoacontato` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pes_caixausuario` int(11) DEFAULT NULL,
  `pes_caixaoperacaonumero` int(11) DEFAULT NULL,
  `pes_usuarioquecadastrou` int(11) NOT NULL,
  `pes_quiosquequecadastrou` int(11) NOT NULL,
  PRIMARY KEY (`pes_codigo`),
  KEY `usu_cidade` (`pes_cidade`),
  KEY `pes_quiosque` (`pes_cooperativa`),
  KEY `pes_quiosqueusuario` (`pes_quiosqueusuario`),
  KEY `pes_categoria` (`pes_categoria`,`pes_tipopessoa`),
  KEY `pes_usuarioquecadastrou` (`pes_usuarioquecadastrou`),
  KEY `pes_quiosquequecadastrou` (`pes_quiosquequecadastrou`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoas`
--

LOCK TABLES `pessoas` WRITE;
/*!40000 ALTER TABLE `pessoas` DISABLE KEYS */;
INSERT INTO `pessoas` VALUES (0,NULL,'',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,'',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(1,1,'root',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'4b0daceccf8aef63c93aca5d5b228d31',7,0,'99999999999',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),(4,2,'Mauricio Witzgall',3997,'','','','','','','','','','','2016-02-01','04:31:30','2016-02-01','04:47:30','','',0,1,'4297f44b13955235245b2497399d7a93',1,0,'00933115083',NULL,0,NULL,NULL,'',0,'',0,1,'',NULL,NULL,1,0);
/*!40000 ALTER TABLE `pessoas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoas_categoria`
--

DROP TABLE IF EXISTS `pessoas_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoas_categoria` (
  `pescat_codigo` smallint(6) NOT NULL AUTO_INCREMENT,
  `pescat_nome` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`pescat_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoas_categoria`
--

LOCK TABLES `pessoas_categoria` WRITE;
/*!40000 ALTER TABLE `pessoas_categoria` DISABLE KEYS */;
INSERT INTO `pessoas_categoria` VALUES (1,'Agro-indústria'),(2,'Empresa'),(3,'Distribuidora'),(4,'Orgão Público'),(5,'Outro'),(6,'Empreendimento Solidário');
/*!40000 ALTER TABLE `pessoas_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoas_tipo`
--

DROP TABLE IF EXISTS `pessoas_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoas_tipo` (
  `pestip_codigo` tinyint(2) NOT NULL AUTO_INCREMENT,
  `pestip_nome` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`pestip_codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoas_tipo`
--

LOCK TABLES `pessoas_tipo` WRITE;
/*!40000 ALTER TABLE `pessoas_tipo` DISABLE KEYS */;
INSERT INTO `pessoas_tipo` VALUES (1,'Administrador'),(4,'Caixa'),(5,'Fornecedor'),(6,'Consumidor'),(2,'Presidente'),(3,'Supervisor');
/*!40000 ALTER TABLE `pessoas_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoas_tipopessoa`
--

DROP TABLE IF EXISTS `pessoas_tipopessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoas_tipopessoa` (
  `pestippes_codigo` tinyint(4) NOT NULL,
  `pestippes_nome` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`pestippes_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoas_tipopessoa`
--

LOCK TABLES `pessoas_tipopessoa` WRITE;
/*!40000 ALTER TABLE `pessoas_tipopessoa` DISABLE KEYS */;
INSERT INTO `pessoas_tipopessoa` VALUES (1,'Pessoa Física'),(2,'Pessoa Jurídica');
/*!40000 ALTER TABLE `pessoas_tipopessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos` (
  `pro_codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `pro_nome` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `pro_tipocontagem` tinyint(4) NOT NULL,
  `pro_categoria` mediumint(11) NOT NULL,
  `pro_datacriacao` date NOT NULL,
  `pro_horacriacao` time NOT NULL,
  `pro_dataedicao` date DEFAULT NULL,
  `pro_horaedicao` time DEFAULT NULL,
  `pro_descricao` text COLLATE utf8_unicode_ci,
  `pro_obs` text COLLATE utf8_unicode_ci,
  `pro_cooperativa` smallint(4) NOT NULL,
  `pro_estoqueminimo` float DEFAULT NULL,
  `pro_volume` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pro_recipiente` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pro_marca` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `pro_composicao` text COLLATE utf8_unicode_ci,
  `pro_codigounico` bigint(13) DEFAULT NULL,
  `pro_idunico` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pro_industrializado` int(11) NOT NULL,
  `pro_usuarioquecadastrou` int(11) NOT NULL,
  `pro_quiosquequecadastrou` int(11) NOT NULL,
  PRIMARY KEY (`pro_codigo`),
  KEY `pro_categoria` (`pro_categoria`),
  KEY `pro_tipocontagem` (`pro_tipocontagem`),
  KEY `pro_quiosque` (`pro_cooperativa`),
  KEY `pro_usuarioquecadastrou` (`pro_usuarioquecadastrou`),
  KEY `pro_quiosquequecadastrou` (`pro_quiosquequecadastrou`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos_categorias`
--

DROP TABLE IF EXISTS `produtos_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos_categorias` (
  `cat_codigo` mediumint(9) NOT NULL AUTO_INCREMENT,
  `cat_nome` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `cat_cooperativa` smallint(4) NOT NULL,
  `cat_obs` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`cat_codigo`),
  KEY `cat_quiosque` (`cat_cooperativa`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos_categorias`
--

LOCK TABLES `produtos_categorias` WRITE;
/*!40000 ALTER TABLE `produtos_categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos_porcoes`
--

DROP TABLE IF EXISTS `produtos_porcoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos_porcoes` (
  `propor_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `propor_produto` bigint(20) NOT NULL,
  `propor_nome` varchar(45) NOT NULL,
  `propor_quantidade` float NOT NULL,
  `propor_usuarioquecadastrou` int(11) NOT NULL,
  `propor_quiosquequecadastrou` int(11) NOT NULL,
  `propor_datacadastro` datetime NOT NULL,
  `propor_valuniref` float DEFAULT NULL,
  PRIMARY KEY (`propor_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos_porcoes`
--

LOCK TABLES `produtos_porcoes` WRITE;
/*!40000 ALTER TABLE `produtos_porcoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos_porcoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos_recipientes`
--

DROP TABLE IF EXISTS `produtos_recipientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos_recipientes` (
  `prorec_codigo` tinyint(4) NOT NULL AUTO_INCREMENT,
  `prorec_nome` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `prorec_sigla` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`prorec_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos_recipientes`
--

LOCK TABLES `produtos_recipientes` WRITE;
/*!40000 ALTER TABLE `produtos_recipientes` DISABLE KEYS */;
INSERT INTO `produtos_recipientes` VALUES (1,'Pote',NULL),(2,'Caixa',NULL),(3,'Kit',NULL),(4,'Pacote',NULL),(5,'Saca',NULL),(6,'Pet',NULL),(7,'Fardo',NULL),(8,'Vidro',NULL),(9,'Sacola',NULL),(10,'Outro',NULL),(11,'Barril',NULL),(12,'Litrão',NULL),(13,'Garrafa',NULL);
/*!40000 ALTER TABLE `produtos_recipientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos_tipo`
--

DROP TABLE IF EXISTS `produtos_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produtos_tipo` (
  `protip_codigo` tinyint(4) NOT NULL AUTO_INCREMENT,
  `protip_nome` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `protip_sigla` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`protip_codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos_tipo`
--

LOCK TABLES `produtos_tipo` WRITE;
/*!40000 ALTER TABLE `produtos_tipo` DISABLE KEYS */;
INSERT INTO `produtos_tipo` VALUES (1,'Unidade(s)','un.'),(2,'Quilo(s)','kg.'),(3,'Litro(s)','lt.');
/*!40000 ALTER TABLE `produtos_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quantidade_ideal`
--

DROP TABLE IF EXISTS `quantidade_ideal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quantidade_ideal` (
  `qtdide_quiosque` smallint(4) NOT NULL,
  `qtdide_produto` mediumint(6) NOT NULL,
  `qtdide_quantidade` float NOT NULL,
  PRIMARY KEY (`qtdide_quiosque`,`qtdide_produto`),
  KEY `qtdide_quiosque` (`qtdide_quiosque`),
  KEY `qtdide_produto` (`qtdide_produto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quantidade_ideal`
--

LOCK TABLES `quantidade_ideal` WRITE;
/*!40000 ALTER TABLE `quantidade_ideal` DISABLE KEYS */;
/*!40000 ALTER TABLE `quantidade_ideal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiosques`
--

DROP TABLE IF EXISTS `quiosques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiosques` (
  `qui_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `qui_nome` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `qui_cidade` int(11) NOT NULL,
  `qui_cep` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qui_bairro` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qui_vila` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qui_endereco` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qui_numero` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qui_complemento` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qui_referencia` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qui_fone1` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qui_fone1ramal` int(9) DEFAULT NULL,
  `qui_fone2` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `qui_fone2ramal` int(9) DEFAULT NULL,
  `qui_email` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qui_obs` text COLLATE utf8_unicode_ci,
  `qui_datacadastro` date NOT NULL,
  `qui_horacadastro` time NOT NULL,
  `qui_dataedicao` date DEFAULT NULL,
  `qui_horaedicao` time DEFAULT NULL,
  `qui_cooperativa` int(8) NOT NULL,
  `qui_usuario` int(11) NOT NULL,
  `qui_disponivelnobusca` tinyint(4) NOT NULL,
  `qui_idunico` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `qui_latitude` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `qui_longitude` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`qui_codigo`),
  KEY `qui_cidade` (`qui_cidade`),
  KEY `qui_cooperativa` (`qui_cooperativa`),
  KEY `qui_usuario` (`qui_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiosques`
--

LOCK TABLES `quiosques` WRITE;
/*!40000 ALTER TABLE `quiosques` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiosques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiosques_supervisores`
--

DROP TABLE IF EXISTS `quiosques_supervisores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiosques_supervisores` (
  `quisup_quiosque` tinyint(2) NOT NULL,
  `quisup_supervisor` int(11) NOT NULL,
  `quisup_datafuncao` date DEFAULT NULL,
  PRIMARY KEY (`quisup_quiosque`,`quisup_supervisor`),
  KEY `quisup_quiosque` (`quisup_quiosque`),
  KEY `quisup_supervisor` (`quisup_supervisor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiosques_supervisores`
--

LOCK TABLES `quiosques_supervisores` WRITE;
/*!40000 ALTER TABLE `quiosques_supervisores` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiosques_supervisores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiosques_taxas`
--

DROP TABLE IF EXISTS `quiosques_taxas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiosques_taxas` (
  `quitax_quiosque` bigint(18) NOT NULL,
  `quitax_taxa` smallint(4) NOT NULL,
  `quitax_valor` float NOT NULL,
  PRIMARY KEY (`quitax_quiosque`,`quitax_taxa`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiosques_taxas`
--

LOCK TABLES `quiosques_taxas` WRITE;
/*!40000 ALTER TABLE `quiosques_taxas` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiosques_taxas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiosques_tiponegociacao`
--

DROP TABLE IF EXISTS `quiosques_tiponegociacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiosques_tiponegociacao` (
  `quitipneg_quiosque` int(11) NOT NULL,
  `quitipneg_tipo` tinyint(4) NOT NULL,
  PRIMARY KEY (`quitipneg_quiosque`,`quitipneg_tipo`),
  KEY `quitipneg_tipo` (`quitipneg_tipo`),
  KEY `quitipneg_quiosque` (`quitipneg_quiosque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiosques_tiponegociacao`
--

LOCK TABLES `quiosques_tiponegociacao` WRITE;
/*!40000 ALTER TABLE `quiosques_tiponegociacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiosques_tiponegociacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relatorios`
--

DROP TABLE IF EXISTS `relatorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relatorios` (
  `rel_codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `rel_nome` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `rel_descricao` text COLLATE utf8_unicode_ci,
  `rel_datacadastro` date NOT NULL,
  `rel_horacadastro` time NOT NULL,
  PRIMARY KEY (`rel_codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relatorios`
--

LOCK TABLES `relatorios` WRITE;
/*!40000 ALTER TABLE `relatorios` DISABLE KEYS */;
INSERT INTO `relatorios` VALUES (1,'Lista de vendas por fornecedor','','2012-07-04','22:13:25'),(12,'Lista de vendas por produto','','2012-07-31','07:31:56'),(13,'Lista de vendas','','2013-06-27','10:35:12');
/*!40000 ALTER TABLE `relatorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relatorios_permissao`
--

DROP TABLE IF EXISTS `relatorios_permissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relatorios_permissao` (
  `relper_relatorio` bigint(20) NOT NULL,
  `relper_grupo` tinyint(2) NOT NULL,
  PRIMARY KEY (`relper_relatorio`,`relper_grupo`),
  KEY `relper_relatorio` (`relper_relatorio`),
  KEY `relper_grupo` (`relper_grupo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relatorios_permissao`
--

LOCK TABLES `relatorios_permissao` WRITE;
/*!40000 ALTER TABLE `relatorios_permissao` DISABLE KEYS */;
INSERT INTO `relatorios_permissao` VALUES (1,3),(1,5),(12,2),(12,3),(13,2),(13,3);
/*!40000 ALTER TABLE `relatorios_permissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saidas`
--

DROP TABLE IF EXISTS `saidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saidas` (
  `sai_codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `sai_quiosque` bigint(20) NOT NULL,
  `sai_consumidor` bigint(20) NOT NULL,
  `sai_tipo` tinyint(4) NOT NULL,
  `sai_saidajustificada` tinyint(4) DEFAULT NULL,
  `sai_descricao` text COLLATE utf8_unicode_ci,
  `sai_datacadastro` date NOT NULL,
  `sai_horacadastro` time NOT NULL,
  `sai_status` tinyint(1) NOT NULL,
  `sai_totalbruto` float DEFAULT NULL,
  `sai_descontopercentual` float DEFAULT NULL,
  `sai_descontovalor` float DEFAULT NULL,
  `sai_totalcomdesconto` float DEFAULT NULL,
  `sai_valorecebido` float DEFAULT NULL,
  `sai_troco` float DEFAULT NULL,
  `sai_trocodevolvido` float DEFAULT NULL,
  `sai_descontoforcado` float DEFAULT NULL,
  `sai_acrescimoforcado` float DEFAULT NULL,
  `sai_totalliquido` float NOT NULL,
  `sai_datahoracadastro` datetime NOT NULL,
  `sai_areceber` tinyint(1) NOT NULL,
  `sai_metpag` tinyint(4) NOT NULL,
  `sai_caixaoperacaonumero` int(11) DEFAULT NULL,
  `sai_usuarioquecadastrou` int(11) DEFAULT NULL,
  PRIMARY KEY (`sai_codigo`),
  KEY `sai_quiosque` (`sai_quiosque`),
  KEY `sai_cliente` (`sai_consumidor`),
  KEY `sai_tipo` (`sai_tipo`),
  KEY `sai_justificativa` (`sai_saidajustificada`),
  KEY `sai_status` (`sai_status`),
  KEY `sai_metpag` (`sai_metpag`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saidas`
--

LOCK TABLES `saidas` WRITE;
/*!40000 ALTER TABLE `saidas` DISABLE KEYS */;
INSERT INTO `saidas` VALUES (39,0,0,0,NULL,NULL,'0000-00-00','00:00:00',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'0000-00-00 00:00:00',0,0,NULL,11);
/*!40000 ALTER TABLE `saidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saidas_motivo`
--

DROP TABLE IF EXISTS `saidas_motivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saidas_motivo` (
  `saimot_codigo` tinyint(4) NOT NULL AUTO_INCREMENT,
  `saimot_nome` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`saimot_codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saidas_motivo`
--

LOCK TABLES `saidas_motivo` WRITE;
/*!40000 ALTER TABLE `saidas_motivo` DISABLE KEYS */;
INSERT INTO `saidas_motivo` VALUES (1,'Vencimento'),(2,'Fornecedor Pediu'),(3,'Extravio'),(4,'Outro'),(5,'Ajuste'),(6,'Perda (peso)');
/*!40000 ALTER TABLE `saidas_motivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saidas_produtos`
--

DROP TABLE IF EXISTS `saidas_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saidas_produtos` (
  `saipro_saida` bigint(20) NOT NULL,
  `saipro_codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `saipro_lote` bigint(20) NOT NULL,
  `saipro_produto` bigint(20) NOT NULL,
  `saipro_quantidade` float NOT NULL,
  `saipro_valorunitario` float NOT NULL,
  `saipro_valortotal` float NOT NULL,
  `saipro_acertado` bigint(20) NOT NULL,
  `saipro_fechado` tinyint(4) NOT NULL,
  `saipro_porcao` int(11) DEFAULT NULL,
  `saipro_porcao_quantidade` float DEFAULT NULL,
  PRIMARY KEY (`saipro_saida`,`saipro_codigo`),
  KEY `saipro_lote` (`saipro_lote`),
  KEY `saipro_produto` (`saipro_produto`),
  KEY `saipro_saida` (`saipro_saida`),
  KEY `saipro_fechado` (`saipro_fechado`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saidas_produtos`
--

LOCK TABLES `saidas_produtos` WRITE;
/*!40000 ALTER TABLE `saidas_produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `saidas_produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saidas_tipo`
--

DROP TABLE IF EXISTS `saidas_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saidas_tipo` (
  `saitip_codigo` tinyint(4) NOT NULL AUTO_INCREMENT,
  `saitip_nome` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`saitip_codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saidas_tipo`
--

LOCK TABLES `saidas_tipo` WRITE;
/*!40000 ALTER TABLE `saidas_tipo` DISABLE KEYS */;
INSERT INTO `saidas_tipo` VALUES (1,'Venda'),(3,'Devolução');
/*!40000 ALTER TABLE `saidas_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `sta_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `sta_nome` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`sta_codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Válido'),(2,'Incompleto');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxas`
--

DROP TABLE IF EXISTS `taxas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxas` (
  `tax_codigo` smallint(4) NOT NULL AUTO_INCREMENT,
  `tax_nome` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `tax_descricao` text COLLATE utf8_unicode_ci,
  `tax_cooperativa` smallint(4) DEFAULT NULL,
  `tax_quiosque` bigint(18) DEFAULT NULL,
  `tax_tiponegociacao` tinyint(4) NOT NULL,
  PRIMARY KEY (`tax_codigo`),
  KEY `tax_cooperativa` (`tax_cooperativa`,`tax_quiosque`),
  KEY `tax_tiponegociacao` (`tax_tiponegociacao`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxas`
--

LOCK TABLES `taxas` WRITE;
/*!40000 ALTER TABLE `taxas` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_negociacao`
--

DROP TABLE IF EXISTS `tipo_negociacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_negociacao` (
  `tipneg_codigo` tinyint(4) NOT NULL,
  `tipneg_nome` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`tipneg_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_negociacao`
--

LOCK TABLES `tipo_negociacao` WRITE;
/*!40000 ALTER TABLE `tipo_negociacao` DISABLE KEYS */;
INSERT INTO `tipo_negociacao` VALUES (1,'Consignação'),(2,'Revenda');
/*!40000 ALTER TABLE `tipo_negociacao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-08 12:39:14
