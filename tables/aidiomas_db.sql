-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.9-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela aidiomas_db.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `nome` varchar(10) NOT NULL,
  `usuario` varchar(10) NOT NULL,
  `senha` varchar(8) NOT NULL,
  `nivel` int(11) unsigned NOT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela aidiomas_db.admin: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
REPLACE INTO `admin` (`nome`, `usuario`, `senha`, `nivel`) VALUES
	('Marcelo', 'Marcelo', '123', 1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


-- Copiando estrutura para tabela aidiomas_db.aluno
CREATE TABLE IF NOT EXISTS `aluno` (
  `codigo` int(11) unsigned NOT NULL,
  `nome` varchar(25) COLLATE utf8_bin NOT NULL,
  `sobrenome` varchar(50) COLLATE utf8_bin NOT NULL,
  `nascimento` date NOT NULL,
  `telefone` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `usuario` varchar(10) COLLATE utf8_bin NOT NULL,
  `senha` varchar(9) COLLATE utf8_bin NOT NULL,
  `nivel` int(11) unsigned NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `acesso` (`nivel`),
  CONSTRAINT `acesso` FOREIGN KEY (`nivel`) REFERENCES `nivel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela aidiomas_db.aluno: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
REPLACE INTO `aluno` (`codigo`, `nome`, `sobrenome`, `nascimento`, `telefone`, `email`, `usuario`, `senha`, `nivel`) VALUES
	(1012248, 'Ana', 'Julia', '1998-06-11', NULL, NULL, 'pref', '987654', 3),
	(1012250, 'Marcela', 'Martins', '1997-12-20', NULL, NULL, 'marcelinha', '123', 3),
	(1012260, 'Bibi', 'Martins', '2000-08-30', NULL, NULL, 'bibi', '654', 3);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;


-- Copiando estrutura para tabela aidiomas_db.aluno_grupo
CREATE TABLE IF NOT EXISTS `aluno_grupo` (
  `cod_grupo` int(11) unsigned NOT NULL,
  `codigo_aluno` int(11) unsigned NOT NULL,
  KEY `cod_aluno` (`codigo_aluno`),
  CONSTRAINT `cod_aluno` FOREIGN KEY (`codigo_aluno`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela aidiomas_db.aluno_grupo: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `aluno_grupo` DISABLE KEYS */;
REPLACE INTO `aluno_grupo` (`cod_grupo`, `codigo_aluno`) VALUES
	(4788, 1012248),
	(4788, 1012250),
	(2830, 1012260);
/*!40000 ALTER TABLE `aluno_grupo` ENABLE KEYS */;


-- Copiando estrutura para tabela aidiomas_db.grupo
CREATE TABLE IF NOT EXISTS `grupo` (
  `cod_grupo` int(11) NOT NULL,
  `idioma` int(11) NOT NULL,
  `level_grupo` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `semestre` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `codigo_aluno` int(11) unsigned DEFAULT NULL,
  `codigo_professor` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cod_grupo`),
  KEY `idioma_grupo` (`idioma`),
  CONSTRAINT `idioma_grupo` FOREIGN KEY (`idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela aidiomas_db.grupo: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
REPLACE INTO `grupo` (`cod_grupo`, `idioma`, `level_grupo`, `semestre`, `codigo_aluno`, `codigo_professor`) VALUES
	(1109, 1, 'A7', '02/2015', 1012248, 1),
	(2145, 2, 'a3', '01/2016', 1012248, 1),
	(2830, 1, 'A7', '01/2016', 1012248, 1),
	(4788, 2, 'A1', '01/2016', 1012248, 1);
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;


-- Copiando estrutura para tabela aidiomas_db.idiomas
CREATE TABLE IF NOT EXISTS `idiomas` (
  `nome_idioma` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela aidiomas_db.idiomas: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `idiomas` DISABLE KEYS */;
REPLACE INTO `idiomas` (`nome_idioma`, `id`) VALUES
	('Inglês', 1),
	('Espanhol', 2),
	('Francês', 3),
	('Alemão', 4),
	('Português', 5);
/*!40000 ALTER TABLE `idiomas` ENABLE KEYS */;


-- Copiando estrutura para tabela aidiomas_db.mural
CREATE TABLE IF NOT EXISTS `mural` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `summary` tinytext NOT NULL,
  `content` text NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela aidiomas_db.mural: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `mural` DISABLE KEYS */;
REPLACE INTO `mural` (`id`, `title`, `summary`, `content`, `date`) VALUES
	(1, 'TOEFL - Test of English as a Foreign Language', 'O Centro Linguistico de Franca prepara os candidatos para exame de TOEFL.', 'INGLÊS TOEFL – (Test of English as a Foreign Language) Ou Teste de Inglês como uma Língua Estrangeira é um exame que tem o objetivo de avaliar o potencial individual de falar e entender o inglês em nível acadêmico. O Centro Linguístico de Franca prepara os candidatos para exame de TOEFL. É requerido para a maior parte dos estudantes estrangeiros que tentam ingressar em uma universidade de um país em que inglesa é a primeira língua. Além disso, instituições com agências governamentais, empresas e programas de estudo podem exigir o teste. A nota no TOEFL é válida por apenas dois anos - após esse prazo, ela é eliminada do banco de dados. O TOEFL é uma marca registrada da Educational Testing Service (Serviço de Testes Educacionais; ETS). O primeiro teste foi realizado em 1964 e, desde então, aproximadamente mais 20 milhões de estudantes já o fizeram. Mais de 2.400 faculdades e universidades nos Estados Unidos e no Canadá exigem o TOEFL como requisito de admissão em seus cursos. Órgãos governamentais e programas de bolsa de estudos também o utilizam para avaliar a proficiência em inglês. O TOEFL pode ser complementado pelo TWE (Test of Written English – Teste de Inglês Escrito) TSE (Test of Spoken English – Teste de Inglês Oral).', '2016-01-20'),
	(2, 'TOEIC - Test of English for International Communication', 'O Centro Linguistico de Franca prepara os candidatos e tambem um centro aplicador do TOEIC', 'INGLÊS TOEIC (Test of English for International Communication) O que é: Teste de Inglês para comunicação Internacional. Quem o presta e Por quê: falantes não nativos o prestam para demonstrar suas habilidades linguísticas Inglesas quando se candidatam a novas posições ou para obterem credenciais. Onde prestá-lo e como se preparar: em escolas de Idiomas. O Centro Linguístico de Franca prepara os candidatos e é também um centro aplicador do TOEIC Quem aceita: o teste é altamente aceito por corporações, programas de Língua Inglesa e agências governamentais no mundo inteiro. •As corporações usam o TOEIC para documentar o progresso nos treinamentos recrutar e promover funcionários. Programas de Inglês usam-no para colocar alunos no nível correto de aprendizagem e mostrar aos alunos seu progresso e efetividade do programa. •Agências governamentais usam-no para documentar o progresso nos programas de treinamento e recrutar, promover e contratar funcionários. • Formato do teste: é um teste de múltipla escolha que utiliza áudio, figuras e material escrito para avaliar as habilidades na língua inglesa.', '2016-01-20');
/*!40000 ALTER TABLE `mural` ENABLE KEYS */;


-- Copiando estrutura para tabela aidiomas_db.nivel
CREATE TABLE IF NOT EXISTS `nivel` (
  `nivel` varchar(10) COLLATE utf8_bin NOT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela aidiomas_db.nivel: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `nivel` DISABLE KEYS */;
REPLACE INTO `nivel` (`nivel`, `id`) VALUES
	('admin', 1),
	('professor', 2),
	('aluno', 3);
/*!40000 ALTER TABLE `nivel` ENABLE KEYS */;


-- Copiando estrutura para tabela aidiomas_db.professor
CREATE TABLE IF NOT EXISTS `professor` (
  `nome_prof` varchar(25) COLLATE utf8_bin NOT NULL,
  `sobrenome_prof` varchar(50) COLLATE utf8_bin NOT NULL,
  `telefone_prof` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `email_prof` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `idioma` int(2) NOT NULL,
  `usuario_prof` varchar(15) COLLATE utf8_bin NOT NULL,
  `senha_prof` varchar(8) COLLATE utf8_bin NOT NULL,
  `nivel` int(11) unsigned NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `idiomas` (`idioma`),
  KEY `access` (`nivel`),
  CONSTRAINT `idiomas` FOREIGN KEY (`idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela aidiomas_db.professor: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
REPLACE INTO `professor` (`nome_prof`, `sobrenome_prof`, `telefone_prof`, `email_prof`, `idioma`, `usuario_prof`, `senha_prof`, `nivel`, `id`) VALUES
	('Fabiana', 'Fernandes', '(16) 3701 0550', 'teste@teste.com.br', 4, 'fabiana', '456', 2, 1),
	('Leticia', 'Fernandes', '(16) 3721 0550', '', 2, 'leticia', '789', 2, 2),
	('Ana', 'Juia Martins', '16 - 3701 0550', '', 4, 'anajuia', '123456', 2, 4);
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
REPLACE INTO `teste` (`id`, `title`, `content`) VALUES
	(1, 'Title teste 1', 'this is the space teste 1'),
	(2, 'Title teste 2', 'this is the space teste 2');
/*!40000 ALTER TABLE `teste` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
