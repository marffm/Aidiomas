-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.6.16 - MySQL Community Server (GPL)
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura do banco de dados para aidiomas_db
CREATE DATABASE IF NOT EXISTS `aidiomas_db` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `aidiomas_db`;


-- Copiando estrutura para tabela aidiomas_db.aluno
CREATE TABLE IF NOT EXISTS `aluno` (
  `codigo` int(11) unsigned NOT NULL,
  `nome` varchar(25) COLLATE utf8_bin NOT NULL,
  `sobrenome` varchar(50) COLLATE utf8_bin NOT NULL,
  `nascimento` date NOT NULL,
  `telefone` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `user` varchar(10) COLLATE utf8_bin NOT NULL,
  `password` varchar(9) COLLATE utf8_bin NOT NULL,
  `acesso` int(11) unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `acesso` (`acesso`),
  CONSTRAINT `acesso` FOREIGN KEY (`acesso`) REFERENCES `nivel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela aidiomas_db.aluno: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;


-- Copiando estrutura para tabela aidiomas_db.grupo
CREATE TABLE IF NOT EXISTS `grupo` (
  `cod_grupo` int(11) NOT NULL,
  `idioma` int(11) NOT NULL,
  `level_grupo` varchar(12) COLLATE utf8_bin NOT NULL,
  `semestre` int(2) NOT NULL,
  PRIMARY KEY (`cod_grupo`),
  KEY `idioma_grupo` (`idioma`),
  CONSTRAINT `idioma_grupo` FOREIGN KEY (`idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela aidiomas_db.grupo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;


-- Copiando estrutura para tabela aidiomas_db.idiomas
CREATE TABLE IF NOT EXISTS `idiomas` (
  `nome_idioma` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela aidiomas_db.idiomas: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `idiomas` DISABLE KEYS */;
INSERT IGNORE INTO `idiomas` (`nome_idioma`, `id`) VALUES
	('ingles', 1),
	('espanhol', 2);
/*!40000 ALTER TABLE `idiomas` ENABLE KEYS */;


-- Copiando estrutura para tabela aidiomas_db.mural
CREATE TABLE IF NOT EXISTS `mural` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `title` varchar(200) COLLATE utf8_bin NOT NULL,
  `summary` tinytext COLLATE utf8_bin NOT NULL,
  `content` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela aidiomas_db.mural: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `mural` DISABLE KEYS */;
INSERT IGNORE INTO `mural` (`id`, `date`, `title`, `summary`, `content`) VALUES
	(1, '2016-01-19', 'teste', 'O Centro Linguistico de Franca prepara os candidatos e   tambem  um centro aplicador do TOEIC.', 'INGLÊS\r\nTOEIC (Test of English for International Communication)\r\n\r\nO que é: Teste de Inglês para comunicação Internacional.\r\n\r\nQuem o presta e Por quê: falantes não nativos o prestam para demonstrar suas habilidades linguísticas Inglesas quando se candidatam a novas posições ou para obterem credenciais.\r\n\r\nOnde prestá-lo e como se preparar: em escolas de\r\nIdiomas.\r\nO Centro Linguístico de Franca prepara os candidatos e é também um centro aplicador do TOEIC\r\n\r\nQuem aceita: o teste é altamente aceito por corporações, programas de Língua Inglesa e agências governamentais no mundo inteiro.\r\n\r\n•As corporações usam o TOEIC para documentar o progresso nos treinamentos recrutar e promover funcionários. Programas de Inglês usam-no para colocar alunos no nível correto de aprendizagem e mostrar aos alunos seu progresso e efetividade do programa.\r\n\r\n•Agências governamentais usam-no para documentar o progresso nos programas de treinamento e recrutar, promover e contratar funcionários.\r\n\r\n \r\n• Formato do teste: é um teste de múltipla escolha que utiliza áudio, figuras e material escrito para avaliar as habilidades na língua inglesa.\r\n'),
	(2, '2016-01-19', 'TOEFL - Test of English as a Foreign Language', 'O Centro Linguístico de Franca prepara os candidatos para exame de TOEFL.', 'INGLÊS TOEFL – (Test of English as a Foreign Language) Ou Teste de Inglês como uma Língua Estrangeira é um exame que tem o objetivo de avaliar o potencial individual de falar e entender o inglês em nível acadêmico. O Centro Linguístico de Franca prepara os candidatos para exame de TOEFL. É requerido para a maior parte dos estudantes estrangeiros que tentam ingressar em uma universidade de um país em que inglesa é a primeira língua. Além disso, instituições com agências governamentais, empresas e programas de estudo podem exigir o teste. A nota no TOEFL é válida por apenas dois anos - após esse prazo, ela é eliminada do banco de dados. O TOEFL é uma marca registrada da Educational Testing Service (Serviço de Testes Educacionais; ETS). O primeiro teste foi realizado em 1964 e, desde então, aproximadamente mais 20 milhões de estudantes já o fizeram. Mais de 2.400 faculdades e universidades nos Estados Unidos e no Canadá exigem o TOEFL como requisito de admissão em seus cursos. Órgãos governamentais e programas de bolsa de estudos também o utilizam para avaliar a proficiência em inglês. O TOEFL pode ser complementado pelo TWE (Test of Written English – Teste de Inglês Escrito) TSE (Test of Spoken English – Teste de Inglês Oral).'),
	(6, '2016-01-21', 'marcelo', 'abstract to test', 'full content abstract to test... It works perfectly');
/*!40000 ALTER TABLE `mural` ENABLE KEYS */;


-- Copiando estrutura para tabela aidiomas_db.nivel
CREATE TABLE IF NOT EXISTS `nivel` (
  `nivel` varchar(10) COLLATE utf8_bin NOT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela aidiomas_db.nivel: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `nivel` DISABLE KEYS */;
INSERT IGNORE INTO `nivel` (`nivel`, `id`) VALUES
	('admin', 1),
	('professor', 2),
	('aluno', 3);
/*!40000 ALTER TABLE `nivel` ENABLE KEYS */;


-- Copiando estrutura para tabela aidiomas_db.professor
CREATE TABLE IF NOT EXISTS `professor` (
  `nome` varchar(25) COLLATE utf8_bin NOT NULL,
  `sobrenome` varchar(50) COLLATE utf8_bin NOT NULL,
  `telefone` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `idioma` int(2) NOT NULL,
  `usuario` varchar(15) COLLATE utf8_bin NOT NULL,
  `senha` varchar(8) COLLATE utf8_bin NOT NULL,
  `acesso` int(11) unsigned NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `idiomas` (`idioma`),
  KEY `access` (`acesso`),
  CONSTRAINT `idiomas` FOREIGN KEY (`idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela aidiomas_db.professor: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT IGNORE INTO `professor` (`nome`, `sobrenome`, `telefone`, `email`, `idioma`, `usuario`, `senha`, `acesso`, `id`) VALUES
	('Fabiana', 'Fernandes', NULL, NULL, 1, 'fabiana', '456', 2, 1),
	('Leticia', 'Fernandes', NULL, NULL, 2, 'leticia', '789', 2, 2);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;


-- Copiando estrutura para tabela aidiomas_db.teste
CREATE TABLE IF NOT EXISTS `teste` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(25) COLLATE utf8_bin DEFAULT NULL,
  `content` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela aidiomas_db.teste: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `teste` DISABLE KEYS */;
INSERT IGNORE INTO `teste` (`id`, `title`, `content`) VALUES
	(1, 'Title teste 1', 'this is the space teste 1'),
	(2, 'Title teste 2', 'this is the space teste 2');
/*!40000 ALTER TABLE `teste` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
