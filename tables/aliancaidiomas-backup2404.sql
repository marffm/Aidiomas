-- --------------------------------------------------------
-- Servidor:                     179.188.16.16
-- Versão do servidor:           5.6.21-69.0-log - Percona Server (GPL), Release 69.0, Revision 675
-- OS do Servidor:               debian-linux-gnu
-- HeidiSQL Versão:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura do banco de dados para aliancaidiomas
CREATE DATABASE IF NOT EXISTS `aliancaidiomas` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `aliancaidiomas`;


-- Copiando estrutura para tabela aliancaidiomas.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `nome` varchar(10) NOT NULL,
  `usuario` varchar(10) NOT NULL,
  `senha` varchar(8) NOT NULL,
  `nivel` int(11) unsigned NOT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela aliancaidiomas.admin: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`nome`, `usuario`, `senha`, `nivel`) VALUES
	('Valéria', 'airelav', 'valeria', 1),
	('Marcelo', 'Marcelo', '123', 1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.alemao
CREATE TABLE IF NOT EXISTS `alemao` (
  `b_level` varchar(10) NOT NULL,
  `codigo_aluno` int(11) unsigned NOT NULL,
  `semestre` varchar(12) NOT NULL,
  `quiz_1` varchar(50) DEFAULT NULL,
  `test_1` varchar(50) DEFAULT NULL,
  `quiz_2` varchar(50) DEFAULT NULL,
  `test_2` varchar(50) DEFAULT NULL,
  `sprechen` varchar(50) DEFAULT NULL,
  `hausau` varchar(50) DEFAULT NULL,
  KEY `FK_espanhol_b2_aluno` (`codigo_aluno`),
  CONSTRAINT `alemao_ibfk_1` FOREIGN KEY (`codigo_aluno`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Copiando dados para a tabela aliancaidiomas.alemao: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `alemao` DISABLE KEYS */;
/*!40000 ALTER TABLE `alemao` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.aluno
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

-- Copiando dados para a tabela aliancaidiomas.aluno: ~70 rows (aproximadamente)
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` (`codigo`, `nome`, `sobrenome`, `nascimento`, `telefone`, `email`, `usuario`, `senha`, `nivel`) VALUES
	(12432, 'Braulio', 'Limonta', '0001-01-01', '16-37213168', '', '12432', '12432', 3),
	(13731, 'Rafael', 'de Melo Siveira', '0001-01-01', '16-34033000', 'rmsilveira.rafael@gmail.com', '13731', '13731', 3),
	(1011465, 'Paulo Matheus', 'Ferrari Mota', '0001-01-01', '12-33010828', 'paulo_m_ferrari1994@hotmail.com', '1011465', '1011465', 3),
	(1011526, 'Adriane', 'Gomes Fernandes de Almeida', '0001-01-01', '12-33515553', 'drica.gfalmeida@gmail.com', '1011526', '1011526', 3),
	(1011578, 'Getulio', 'Alves de A Neto', '0001-01-01', '', '', '1011578', '1011578', 3),
	(1011712, 'Amon', 'Lucena', '0001-01-01', '16-37054374', 'amon-lucena@uol.com.br', '1011712', '1011712', 3),
	(1011727, 'Levi', 'Yoriyaz', '0001-01-01', '', 'Levikun@gmail.com', '1011727', '1011727', 3),
	(1011835, 'Noehlia ', 'Jose Palou Zuniga', '0001-01-01', '16-37045567', 'nojopazu93@hotmail.com', '1011835', '1011835', 3),
	(1011918, 'Larissa', 'Sigerio Puerta Mascarenhas', '0001-01-01', '', 'lari.sigeiro@hotmail.com', '1011918', '1011918', 3),
	(1012028, 'Bernado', 'Micheletto Neto', '0001-01-01', '', 'b.micheletto12@gmail.com', '1012028', '1012028', 3),
	(1012180, 'Rondinele', 'Ap LourenÃ§o', '0001-01-01', '', '', '1012180', '1012180', 3),
	(1012183, 'Jihad', 'Jawad El Gandur', '0001-01-01', '', '', '1012183', '1012183', 3),
	(1012187, 'Luiza ', 'Del Nery Forghieri', '0001-01-01', '', 'idnforghieri@gmail.com', '1012187', '1012187', 3),
	(1012188, 'Ana Luisa', 'Inacio Sanches', '0001-01-01', '', '', '1012188', '1012188', 3),
	(1012190, 'Isabela', 'Bracalente Infanger', '0001-01-01', '', '', '1012190', '1012190', 3),
	(1012191, 'Gabriela', 'Dias Nascimento', '0001-01-01', '', '', '1012191', '1012191', 3),
	(1012210, 'Debora', 'Mateus Lima', '0001-01-01', '11-79655768', 'deboralima60@gmail.com', '1012210', '1012210', 3),
	(1012212, 'Marina', 'Pereira Torres', '0001-01-01', '16-39165632', 'marinaptorres@outlook.com', '1012212', '1012212', 3),
	(1012215, 'Lygia', 'Carniel D Olivio', '0001-01-01', '', '', '1012215', '10122015', 3),
	(1012221, 'Gabriela', 'Machado Lameirao', '0001-01-01', '', '', '1012221', '1012221', 3),
	(1012222, 'Andre', 'Cespedes Pimenta', '0001-01-01', '', '', '1012222', '1012222', 3),
	(1012225, 'Ana Carolina ', 'Almeida Ayres', '0001-01-01', '', '', '1012225', '1012225', 3),
	(1012229, 'Giovanna', 'Freitas FranÃ§a', '0001-01-01', '62-99765153', 'giovannaffranca@gmail.com', '1012229', '1012229', 3),
	(1012235, 'Giulia ', 'Tavares Murta', '0001-01-01', '', '', '1012235', '1012235', 3),
	(1012242, 'Isabela', 'Lima Paifer', '0001-01-01', '', 'isalimapaifer@yahoo.com.br', '1012242', '1012242', 3),
	(1012277, 'Giovana', 'Puppin', '0001-01-01', '19-34224593', 'gipupp@hotmail.com', '1012277', '1012277', 3),
	(1012279, 'Sofia', 'Rodrigues Cruz', '0001-01-01', '11-24333389', 'sofia_src@hotmail.com', '1012279', '1012279', 3),
	(1012302, 'Izabela Maria', 'Baitelo', '0001-01-01', '', '', '1012302', '1012302', 3),
	(1012305, 'Lucas', 'Rezende de Melo', '0001-01-01', '', 'melo_rezende@hotmail.com', '1012305', '1012305', 3),
	(1012306, 'Andre Luis', 'Parodi Andreatta', '0001-01-01', '', 'andreandreatta@ig.com.br', '1012306', '1012306', 3),
	(1012307, 'Laura', 'Neves Amancio', '0001-01-01', '', 'lauran.amancio@yahoo.com.br', '1012307', '1012307', 3),
	(1012308, 'Julia Andrade', 'Nunez Queiroz', '0001-01-01', '16-39164027', 'juliaaqueiroz@gmail.com', '1012308', '1012308', 3),
	(1012312, 'Giovanna', 'Guerra Cabrini Araujo', '0001-01-01', '', 'giocabara@gmail.com', '1012312', '1012312', 3),
	(1012323, 'Beatriz', 'Ballaminut Cavalieri', '0001-01-01', '', 'biabcalavieri@hotmail.com', '1012323', '1012323', 3),
	(1012327, 'Eric Felipe', 'Sabadini Nakahara', '0001-01-01', '', 'ericsabadini@gmail.com', '1012327', '1012327', 3),
	(1012356, 'Cecilia Luisa', 'Ribeiro Alvarenga', '0001-01-01', '16-982580511', 'ceci_luisa@hotmail.com', '1012356', '1012356', 3),
	(1012370, 'Natalia Maria', 'de Moraes', '0001-01-01', '', 'natmorais@gmail.com', '1012370', '1012370', 3),
	(1012379, 'Willian', 'Zanetti', '0001-01-01', '', '', '1012379', '1012379', 3),
	(1012381, 'Analba ', 'dos Reis', '0001-01-01', '', '', '1012381', '1012381', 3),
	(1012382, 'Sandra', 'Osorio de Andrade', '0001-01-01', '16-37255941', 'soandrade44@gmail.com', '1012382', '1012382', 3),
	(1012392, 'Amanda', 'Claudiano Francisco', '0001-01-01', '', '', '1012392', '1012392', 3),
	(1012403, 'Karoline ', 'GonÃ§alves de Oliveira', '0001-01-01', '11-43514672', 'karolineoliv@gmail.com', '1012403', '1012403', 3),
	(1012406, 'Carolina', 'Rodrigues Finetti', '0001-01-01', '', '', '1012406', '1012406', 3),
	(1012415, 'Lucas', 'Lima Pinto', '0001-01-01', '', '', '1012415', '1012415', 3),
	(1012423, 'Leticia', 'Solia', '0001-01-01', '', '', '1012423', '1012423', 3),
	(1012428, 'Natalia', 'Leite de Souza', '0001-01-01', '12-21030995', 'isnatalia_@hotmail.com', '1012428', '1012428', 3),
	(1012429, 'Helena', 'de Oliveira Rosa', '0001-01-01', '16-34421837', 'helenaoliveirarosa@gmail.com', '1012429', '1012429', 3),
	(1012430, 'Monique', 'Marciel Barbosa', '0001-01-01', '', '', '1012430', '1012430', 3),
	(1012438, 'Gabriela', 'da Silva Cintra', '0001-01-01', '16-37054244', 'gabriela_silvacintra@hotmail.com', '1012438', '1012438', 3),
	(1012441, 'Thalita', 'Marques Monteiro', '0001-01-01', '11-20418914', 'thalitammonteiro@hotmail.com', '1012441', '1012441', 3),
	(1012442, 'Janaina Cristiane', 'da Silva Helfenstein', '0001-01-01', '16-37239558', 'janaina_helfenstein@yahoo.com.br', '1012442', '1012442', 3),
	(1012446, 'Murilo', 'Ribeiro Moreira de Lima', '0001-01-01', '', '', '1012446', '1012446', 3),
	(1012449, 'Talita', 'Driellen de Castro Silva', '0001-01-01', '', '', '1012449', '1012449', 3),
	(1012450, 'Rafael', 'Menezes Bido', '0001-01-01', '', '', '1012450', '1012450', 3),
	(1012451, 'Susana Thamires', 'Kaori Sakamoto Machado', '0001-01-01', '', '', '1012451', '1012451', 3),
	(1012454, 'Thiago', 'Torres Tezzon', '0001-01-01', '', '', '1012454', '1012454', 3),
	(1012455, 'Guilherme', 'Rocha Fabro', '0001-01-01', '', '', '1012455', '1012455', 3),
	(1012456, 'Rafael', 'Varollo Perlati', '0001-01-01', '', '', '1012456', '1012456', 3),
	(1012459, 'Renata Gabriele', 'Ferraz Bueno', '0001-01-01', '', '', '1012459', '1012459', 3),
	(1012460, 'Thiago', 'Teixeira de Petta', '0001-01-01', '16-981009446', 'thiaguinho.teixeira1997@gmail.com', '1012460', '1012460', 3),
	(1012463, 'Lavinia', 'Andrade Matheus', '0001-01-01', '19-992692768', 'laviniandradem@hotmail.com', '1012463', '1012463', 3),
	(1012464, 'Giovanna', 'Alves Medola', '0001-01-01', '', '', '1012464', '1012464', 3),
	(1012465, 'Victoria', 'Alves Silva', '0001-01-01', '', '', '1012465', '1012465', 3),
	(1012466, 'Heloisa Helena', 'de carvalho', '0001-01-01', '', '', '1012466', '1012466', 3),
	(1012469, 'Lara', 'Rezende Dozono Pereira', '0001-01-01', '', '', '1012469', '1012469', 3),
	(1012476, 'Lisa', 'Abdala Garcia', '0001-01-01', '16-39671528', 'lisaabdalag@hotmail.com', '1012476', '1012476', 3),
	(1012478, 'Lorean', 'Prophirio Credidio', '0001-01-01', '', '', '1012478', '1012478', 3),
	(1012480, 'Isabella', 'Abbs Murad Sebastiani', '0001-01-01', '', '', '1012480', '1012480', 3),
	(1012485, 'Carla Maria', 'Campardo Paiva', '0001-01-01', '19-38628575', 'carlacampadop@gmail.com', '1012485', '1012485', 3),
	(1012487, 'Beatriz', 'de Souza Lima Pissutti', '0001-01-01', '16-32426168', 'biapissutti@hotmail.com', '1012487', '1012487', 3);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.aluno_boletins
CREATE TABLE IF NOT EXISTS `aluno_boletins` (
  `boletins_AB` varchar(10) NOT NULL,
  `codigo_aluno_AB` int(11) unsigned NOT NULL,
  KEY `aluno_AB` (`codigo_aluno_AB`),
  KEY `FK_aluno_boletins_boletins` (`boletins_AB`),
  CONSTRAINT `FK_aluno_boletins_boletins` FOREIGN KEY (`boletins_AB`) REFERENCES `boletins` (`boletins`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aluno_AB` FOREIGN KEY (`codigo_aluno_AB`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela aliancaidiomas.aluno_boletins: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `aluno_boletins` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluno_boletins` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.aluno_grupo
CREATE TABLE IF NOT EXISTS `aluno_grupo` (
  `cod_grupo` int(11) NOT NULL,
  `codigo_aluno` int(11) unsigned NOT NULL,
  KEY `cod_aluno` (`codigo_aluno`),
  KEY `cod_grupo` (`cod_grupo`),
  CONSTRAINT `cod_aluno` FOREIGN KEY (`codigo_aluno`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cod_grupo` FOREIGN KEY (`cod_grupo`) REFERENCES `grupo` (`cod_grupo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela aliancaidiomas.aluno_grupo: ~63 rows (aproximadamente)
/*!40000 ALTER TABLE `aluno_grupo` DISABLE KEYS */;
INSERT INTO `aluno_grupo` (`cod_grupo`, `codigo_aluno`) VALUES
	(5490, 1012028),
	(5490, 1012212),
	(5490, 1012442),
	(5490, 1012308),
	(5490, 1012403),
	(5490, 1012305),
	(5490, 1012441),
	(5176, 1012306),
	(5176, 1012229),
	(5176, 1012312),
	(5176, 1012307),
	(5176, 1012187),
	(5283, 1011526),
	(5283, 1011712),
	(5283, 1011835),
	(5283, 1011465),
	(5283, 1011727),
	(5385, 1012210),
	(5385, 1012438),
	(5385, 1012277),
	(5385, 1012429),
	(5385, 1012242),
	(5385, 1011918),
	(5385, 1012463),
	(5385, 1012428),
	(5385, 1012279),
	(5385, 1012460),
	(5384, 1012356),
	(5384, 1012370),
	(5384, 13731),
	(5384, 1012382),
	(5384, 1012381),
	(5384, 12432),
	(5386, 1012487),
	(5386, 1012485),
	(5386, 1012476),
	(5091, 1012323),
	(5091, 1012327),
	(5091, 1012312),
	(5091, 1012302),
	(5091, 1012180),
	(5303, 1012188),
	(5303, 1012191),
	(5303, 1011578),
	(5303, 1012183),
	(5303, 1012187),
	(5303, 1012430),
	(5303, 1012451),
	(5309, 1012215),
	(5309, 1012190),
	(5309, 1012235),
	(5309, 1012221),
	(5309, 1012225),
	(5309, 1012222),
	(5501, 1012464),
	(5501, 1012455),
	(5501, 1012466),
	(5501, 1012469),
	(5501, 1012415),
	(5501, 1012450),
	(5501, 1012459),
	(5501, 1012449),
	(5501, 1012454);
/*!40000 ALTER TABLE `aluno_grupo` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.boletins
CREATE TABLE IF NOT EXISTS `boletins` (
  `boletins` varchar(10) NOT NULL,
  `nome_boletim` varchar(15) NOT NULL,
  `idioma_boletins` int(11) NOT NULL,
  PRIMARY KEY (`boletins`),
  KEY `idiomas_boletins` (`idioma_boletins`),
  CONSTRAINT `idiomas_boletins` FOREIGN KEY (`idioma_boletins`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela aliancaidiomas.boletins: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `boletins` DISABLE KEYS */;
INSERT INTO `boletins` (`boletins`, `nome_boletim`, `idioma_boletins`) VALUES
	('a1-e', 'espanhol_a1', 2),
	('a2-e', 'espanhol_a2', 2),
	('alemao', 'alemao', 4),
	('b1-e', 'espanhol_b1', 2),
	('b2-e', 'espanhol_b2', 2),
	('frances', 'frances', 3),
	('ingles', 'ingles', 1);
/*!40000 ALTER TABLE `boletins` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.espanhol_a1
CREATE TABLE IF NOT EXISTS `espanhol_a1` (
  `b_level` varchar(10) NOT NULL,
  `codigo_aluno` int(11) unsigned NOT NULL,
  `semestre` varchar(12) NOT NULL,
  `unidade123` varchar(50) DEFAULT NULL,
  `unidade456` varchar(50) DEFAULT NULL,
  `unidade789` varchar(50) DEFAULT NULL,
  `mediafinal` varchar(50) DEFAULT NULL,
  KEY `FK_espanhol_b2_aluno` (`codigo_aluno`),
  CONSTRAINT `espanhol_a1_ibfk_1` FOREIGN KEY (`codigo_aluno`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Copiando dados para a tabela aliancaidiomas.espanhol_a1: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `espanhol_a1` DISABLE KEYS */;
/*!40000 ALTER TABLE `espanhol_a1` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.espanhol_a2
CREATE TABLE IF NOT EXISTS `espanhol_a2` (
  `b_level` varchar(10) NOT NULL,
  `codigo_aluno` int(11) unsigned NOT NULL,
  `semestre` varchar(12) NOT NULL,
  `unidade123` varchar(50) DEFAULT NULL,
  `unidade456` varchar(50) DEFAULT NULL,
  `unidade78910` varchar(50) DEFAULT NULL,
  `proyectolectura` varchar(50) DEFAULT NULL,
  `mediafinal` varchar(50) DEFAULT NULL,
  KEY `FK_espanhol_b2_aluno` (`codigo_aluno`),
  CONSTRAINT `espanhol_a2_ibfk_1` FOREIGN KEY (`codigo_aluno`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Copiando dados para a tabela aliancaidiomas.espanhol_a2: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `espanhol_a2` DISABLE KEYS */;
/*!40000 ALTER TABLE `espanhol_a2` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.espanhol_b1
CREATE TABLE IF NOT EXISTS `espanhol_b1` (
  `b_level` varchar(10) NOT NULL,
  `codigo_aluno` int(11) unsigned NOT NULL,
  `semestre` varchar(12) NOT NULL,
  `unidade123` varchar(50) DEFAULT NULL,
  `unidade456` varchar(50) DEFAULT NULL,
  `unidade789` varchar(50) DEFAULT NULL,
  `unidade101112` varchar(50) DEFAULT NULL,
  `proyectolectura` varchar(50) DEFAULT NULL,
  `mediafinal` varchar(50) DEFAULT NULL,
  KEY `aluno` (`codigo_aluno`),
  CONSTRAINT `aluno` FOREIGN KEY (`codigo_aluno`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela aliancaidiomas.espanhol_b1: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `espanhol_b1` DISABLE KEYS */;
/*!40000 ALTER TABLE `espanhol_b1` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.espanhol_b2
CREATE TABLE IF NOT EXISTS `espanhol_b2` (
  `b_level` varchar(10) NOT NULL,
  `codigo_aluno` int(11) unsigned NOT NULL,
  `semestre` varchar(12) NOT NULL,
  `unidade12345` varchar(50) DEFAULT NULL,
  `unidade678910` varchar(50) DEFAULT NULL,
  `proyectolectura` varchar(50) DEFAULT NULL,
  `mediafinal` varchar(50) DEFAULT NULL,
  KEY `FK_espanhol_b2_aluno` (`codigo_aluno`),
  CONSTRAINT `FK_espanhol_b2_aluno` FOREIGN KEY (`codigo_aluno`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela aliancaidiomas.espanhol_b2: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `espanhol_b2` DISABLE KEYS */;
/*!40000 ALTER TABLE `espanhol_b2` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.frances
CREATE TABLE IF NOT EXISTS `frances` (
  `b_level` varchar(10) NOT NULL,
  `codigo_aluno` int(11) unsigned NOT NULL,
  `eleve` varchar(20) NOT NULL,
  `methode` varchar(50) DEFAULT NULL,
  `niveau` varchar(50) DEFAULT NULL,
  `moyenne` varchar(50) DEFAULT NULL,
  `travailles_unite1` varchar(50) DEFAULT NULL,
  `travailles_unite2` varchar(50) DEFAULT NULL,
  `travailles_unite3` varchar(50) DEFAULT NULL,
  `travailles_unite4` varchar(50) DEFAULT NULL,
  `devoirs_unite1` varchar(50) DEFAULT NULL,
  `devoirs_unite2` varchar(50) DEFAULT NULL,
  `devoirs_unite3` varchar(50) DEFAULT NULL,
  `devoirs_unite4` varchar(50) DEFAULT NULL,
  `participation` varchar(50) DEFAULT NULL,
  `davoirs_1` varchar(50) DEFAULT NULL,
  `performance` varchar(50) DEFAULT NULL,
  `test_ecrit1` varchar(50) DEFAULT NULL,
  `total_1` varchar(50) DEFAULT NULL,
  `lecture` varchar(50) DEFAULT NULL,
  `devoirs_2` varchar(50) DEFAULT NULL,
  `test_oral` varchar(50) DEFAULT NULL,
  `test_ecrit2` varchar(50) DEFAULT NULL,
  `total_2` varchar(50) DEFAULT NULL,
  KEY `FK_espanhol_b2_aluno` (`codigo_aluno`),
  CONSTRAINT `frances_ibfk_1` FOREIGN KEY (`codigo_aluno`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Copiando dados para a tabela aliancaidiomas.frances: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `frances` DISABLE KEYS */;
/*!40000 ALTER TABLE `frances` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.grupo
CREATE TABLE IF NOT EXISTS `grupo` (
  `cod_grupo` int(11) NOT NULL,
  `idioma` int(11) NOT NULL,
  `level_grupo` varchar(10) COLLATE utf8_bin NOT NULL,
  `codigo_professor` int(11) unsigned NOT NULL,
  PRIMARY KEY (`cod_grupo`),
  KEY `idioma_grupo` (`idioma`),
  CONSTRAINT `idioma_grupo` FOREIGN KEY (`idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela aliancaidiomas.grupo: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` (`cod_grupo`, `idioma`, `level_grupo`, `codigo_professor`) VALUES
	(511, 1, 'a2-e', 2),
	(1109, 2, 'b1-e', 1),
	(1122, 1, 'ingles', 1),
	(1234, 4, 'alemao', 4),
	(2830, 1, 'b2-e', 1),
	(5091, 2, 'a2-e', 13),
	(5176, 4, 'a1-e', 14),
	(5283, 4, 'b1-e', 15),
	(5303, 2, 'b1-e', 13),
	(5309, 2, 'b1-e', 9),
	(5384, 2, 'a1-e', 13),
	(5385, 2, 'a1-e', 13),
	(5386, 2, 'a1-e', 13),
	(5490, 4, 'a1-e', 14),
	(5501, 3, 'a1-e', 6);
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.idiomas
CREATE TABLE IF NOT EXISTS `idiomas` (
  `nome_idioma` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela aliancaidiomas.idiomas: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `idiomas` DISABLE KEYS */;
INSERT INTO `idiomas` (`nome_idioma`, `id`) VALUES
	('Inglês', 1),
	('Espanhol', 2),
	('Francês', 3),
	('Alemão', 4),
	('Português', 5);
/*!40000 ALTER TABLE `idiomas` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.ingles
CREATE TABLE IF NOT EXISTS `ingles` (
  `b_level` varchar(10) NOT NULL,
  `codigo_aluno` int(11) unsigned NOT NULL,
  `semestre` varchar(12) NOT NULL,
  `quiz_1` varchar(20) DEFAULT NULL,
  `test_1` varchar(20) DEFAULT NULL,
  `participacao_1` varchar(20) DEFAULT NULL,
  `media_1` varchar(20) DEFAULT NULL,
  `quiz_2` varchar(20) DEFAULT NULL,
  `test_2` varchar(20) DEFAULT NULL,
  `oral_test` varchar(20) DEFAULT NULL,
  `mocks` varchar(20) DEFAULT NULL,
  `reading` varchar(20) DEFAULT NULL,
  `participacao_2` varchar(20) DEFAULT NULL,
  `multroom` varchar(20) DEFAULT NULL,
  `media_2` varchar(20) DEFAULT NULL,
  `media_final` varchar(20) DEFAULT NULL,
  KEY `FK_espanhol_b2_aluno` (`codigo_aluno`),
  CONSTRAINT `ingles_ibfk_1` FOREIGN KEY (`codigo_aluno`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Copiando dados para a tabela aliancaidiomas.ingles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ingles` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingles` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.mural
CREATE TABLE IF NOT EXISTS `mural` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `summary` tinytext NOT NULL,
  `content` text NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela aliancaidiomas.mural: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `mural` DISABLE KEYS */;
INSERT INTO `mural` (`id`, `title`, `summary`, `content`, `date`) VALUES
	(1, 'TOEFL - Test of English as a Foreign Language', 'O Centro Linguistico de Franca prepara os candidatos para exame de TOEFL.', 'INGLÊS TOEFL – (Test of English as a Foreign Language) Ou Teste de Inglês como uma Língua Estrangeira é um exame que tem o objetivo de avaliar o potencial individual de falar e entender o inglês em nível acadêmico. O Centro Linguístico de Franca prepara os candidatos para exame de TOEFL. É requerido para a maior parte dos estudantes estrangeiros que tentam ingressar em uma universidade de um país em que inglesa é a primeira língua. Além disso, instituições com agências governamentais, empresas e programas de estudo podem exigir o teste. A nota no TOEFL é válida por apenas dois anos - após esse prazo, ela é eliminada do banco de dados. O TOEFL é uma marca registrada da Educational Testing Service (Serviço de Testes Educacionais; ETS). O primeiro teste foi realizado em 1964 e, desde então, aproximadamente mais 20 milhões de estudantes já o fizeram. Mais de 2.400 faculdades e universidades nos Estados Unidos e no Canadá exigem o TOEFL como requisito de admissão em seus cursos. Órgãos governamentais e programas de bolsa de estudos também o utilizam para avaliar a proficiência em inglês. O TOEFL pode ser complementado pelo TWE (Test of Written English – Teste de Inglês Escrito) TSE (Test of Spoken English – Teste de Inglês Oral).', '2016-01-20'),
	(2, 'TOEIC - Test of English for International Communication', 'O Centro Linguistico de Franca prepara os candidatos e tambem um centro aplicador do TOEIC', 'INGLÊS TOEIC (Test of English for International Communication) O que é: Teste de Inglês para comunicação Internacional. Quem o presta e Por quê: falantes não nativos o prestam para demonstrar suas habilidades linguísticas Inglesas quando se candidatam a novas posições ou para obterem credenciais. Onde prestá-lo e como se preparar: em escolas de Idiomas. O Centro Linguístico de Franca prepara os candidatos e é também um centro aplicador do TOEIC Quem aceita: o teste é altamente aceito por corporações, programas de Língua Inglesa e agências governamentais no mundo inteiro. •As corporações usam o TOEIC para documentar o progresso nos treinamentos recrutar e promover funcionários. Programas de Inglês usam-no para colocar alunos no nível correto de aprendizagem e mostrar aos alunos seu progresso e efetividade do programa. •Agências governamentais usam-no para documentar o progresso nos programas de treinamento e recrutar, promover e contratar funcionários. • Formato do teste: é um teste de múltipla escolha que utiliza áudio, figuras e material escrito para avaliar as habilidades na língua inglesa.', '2016-01-20');
/*!40000 ALTER TABLE `mural` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.nivel
CREATE TABLE IF NOT EXISTS `nivel` (
  `nivel` varchar(10) COLLATE utf8_bin NOT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela aliancaidiomas.nivel: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `nivel` DISABLE KEYS */;
INSERT INTO `nivel` (`nivel`, `id`) VALUES
	('admin', 1),
	('professor', 2),
	('aluno', 3);
/*!40000 ALTER TABLE `nivel` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.professor
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela aliancaidiomas.professor: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` (`nome_prof`, `sobrenome_prof`, `telefone_prof`, `email_prof`, `idioma`, `usuario_prof`, `senha_prof`, `nivel`, `id`) VALUES
	('Lucia Cristina ', 'P Gatti', '', '', 1, 'Lucia', '1011309', 2, 5),
	('Valeria ', 'de Souza Cintra', '', '', 1, 'Valeria C', '1011971', 2, 6),
	('Adriana', 'Gosuen', '', '', 1, 'Adriana', '1012128', 2, 7),
	('Giovanni', 'F. Molina Aguierre', '', '', 2, 'Giovanni', '1011904', 2, 9),
	('Maria Carolina', 'Avila Andrade', '', '', 1, 'Maria Carolina', '1012080', 2, 10),
	('Daniel ', 'Felix peÃ±a anez', '', '', 2, 'Daniel', '1028', 2, 11),
	('Evaldo', 'E. da Silva', '', '', 3, 'Evaldo', '1033', 2, 12),
	('Estela ', 'Maris Almeida', '', '', 2, 'Estela', '1072', 2, 13),
	('Frederico ', 'Theotonio', '', '', 1, 'Frederico', '1011198', 2, 14),
	('Getulio ', 'Alves de A Neto', '', '', 4, 'Getulio', '1011598', 2, 15),
	('Leonardo ', 'MendonÃ§a Figeueiredo', '', '', 3, 'Leonardo', '14101', 2, 16),
	('Mariana ', 'Nicolau', '', '', 1, 'Mariana', '1098', 2, 17),
	('Vinicius', 'Santos Teixeira', '', '', 4, 'Vinicius', '1011920', 2, 18);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
