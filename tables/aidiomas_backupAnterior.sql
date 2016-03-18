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


-- Copiando estrutura para tabela aliancaidiomas.alunos
CREATE TABLE IF NOT EXISTS `alunos` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `aluno` varchar(50) NOT NULL,
  `codigo` int(10) unsigned zerofill DEFAULT NULL,
  `turma` varchar(100) NOT NULL,
  `nivel` varchar(100) NOT NULL,
  `professor` varchar(50) NOT NULL,
  `user` varchar(12) NOT NULL,
  `senha` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela aliancaidiomas.alunos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
INSERT INTO `alunos` (`id`, `aluno`, `codigo`, `turma`, `nivel`, `professor`, `user`, `senha`) VALUES
	(1, 'teste12', 0123456789, 'home', 'sads', 'teste2', '1234', '1234'),
	(2, 'Marcelo', 0000000000, 'home', 'ate', 'TESTE2', 'marcelo', '123456');
/*!40000 ALTER TABLE `alunos` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.articles
CREATE TABLE IF NOT EXISTS `articles` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `publicationDate` date NOT NULL,
  `title` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela aliancaidiomas.articles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` (`id`, `publicationDate`, `title`, `summary`, `content`) VALUES
	(1, '2015-05-19', 'TOEFL - Test of English as a Foreign Language', 'O Centro Linguistico de Franca prepara os candidatos para exame de TOEFL.', 'INGLÃŠS\r\n\r\nTOEFL â€“ (Test of English as a Foreign Language)\r\n\r\nOu Teste de InglÃªs como uma LÃ­ngua Estrangeira Ã© um exame que tem o objetivo de avaliar o potencial individual de falar e entender o inglÃªs em nÃ­vel acadÃªmico. \r\nO Centro LinguÃ­stico de Franca prepara os candidatos para exame de TOEFL.\r\nÃ‰ requerido para a maior parte dos estudantes estrangeiros que tentam ingressar em uma universidade de um paÃ­s em que inglesa Ã© a primeira lÃ­ngua. AlÃ©m disso, instituiÃ§Ãµes com agÃªncias governamentais, empresas e programas de estudo podem exigir o teste. \r\nA nota no TOEFL Ã© vÃ¡lida por apenas dois anos - apÃ³s esse prazo, ela Ã© eliminada do banco de dados.\r\nO TOEFL Ã© uma marca registrada da Educational Testing Service (ServiÃ§o de Testes Educacionais; ETS). O primeiro teste foi realizado em 1964 e, desde entÃ£o, aproximadamente mais 20 milhÃµes de estudantes jÃ¡ o fizeram.\r\nMais de 2.400 faculdades e universidades nos Estados Unidos e no CanadÃ¡ exigem o TOEFL como requisito de admissÃ£o em seus cursos. \r\nÃ“rgÃ£os governamentais e programas de bolsa de estudos tambÃ©m o utilizam para avaliar a proficiÃªncia em inglÃªs.\r\nO TOEFL pode ser complementado pelo \r\n TWE (Test of Written English â€“ Teste de InglÃªs Escrito) \r\nTSE (Test of Spoken English â€“ Teste de InglÃªs Oral). \r\n'),
	(2, '2015-05-19', 'TOEIC - Test of English for International Communication', 'O Centro Linguistico de Franca prepara os candidatos e   tambem  um centro aplicador do TOEIC', 'INGLÃŠS\r\nTOEIC (Test of English for International Communication)\r\n\r\nO que Ã©: Teste de InglÃªs para comunicaÃ§Ã£o Internacional.\r\n\r\nQuem o presta e Por quÃª: falantes nÃ£o nativos o prestam para demonstrar suas habilidades linguÃ­sticas Inglesas quando se candidatam a novas posiÃ§Ãµes ou para obterem credenciais.\r\n\r\nOnde prestÃ¡-lo e como se preparar: em escolas de\r\nIdiomas.\r\nO Centro LinguÃ­stico de Franca prepara os candidatos e Ã© tambÃ©m um centro aplicador do TOEIC\r\n\r\nQuem aceita: o teste Ã© altamente aceito por corporaÃ§Ãµes, programas de LÃ­ngua Inglesa e agÃªncias governamentais no mundo inteiro.\r\n\r\nâ€¢As corporaÃ§Ãµes usam o TOEIC para documentar o progresso nos treinamentos recrutar e promover funcionÃ¡rios. Programas de InglÃªs usam-no para colocar alunos no nÃ­vel correto de aprendizagem e mostrar aos alunos seu progresso e efetividade do programa.\r\n\r\nâ€¢AgÃªncias governamentais usam-no para documentar o progresso nos programas de treinamento e recrutar, promover e contratar funcionÃ¡rios.\r\n\r\n \r\nâ€¢ Formato do teste: Ã© um teste de mÃºltipla escolha que utiliza Ã¡udio, figuras e material escrito para avaliar as habilidades na lÃ­ngua inglesa.\r\n');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.boletins
CREATE TABLE IF NOT EXISTS `boletins` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `aluno` varchar(50) NOT NULL,
  `codigo` int(10) unsigned zerofill DEFAULT NULL,
  `semestre` smallint(3) NOT NULL,
  `ano` smallint(4) NOT NULL,
  `quiz1` varchar(20) DEFAULT NULL,
  `test1` varchar(20) DEFAULT NULL,
  `participacao1` varchar(20) DEFAULT NULL,
  `observacao` text,
  `media1` varchar(20) DEFAULT NULL,
  `quiz2` varchar(20) DEFAULT NULL,
  `test2` varchar(20) DEFAULT NULL,
  `oraltest` varchar(20) DEFAULT NULL,
  `mocks` varchar(20) DEFAULT NULL,
  `reading` varchar(20) DEFAULT NULL,
  `participacao2` varchar(20) DEFAULT NULL,
  `multroom` varchar(20) DEFAULT NULL,
  `faltas` varchar(20) DEFAULT NULL,
  `media2` varchar(20) DEFAULT NULL,
  `mediafinal` varchar(20) DEFAULT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela aliancaidiomas.boletins: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `boletins` DISABLE KEYS */;
INSERT INTO `boletins` (`id`, `aluno`, `codigo`, `semestre`, `ano`, `quiz1`, `test1`, `participacao1`, `observacao`, `media1`, `quiz2`, `test2`, `oraltest`, `mocks`, `reading`, `participacao2`, `multroom`, `faltas`, `media2`, `mediafinal`, `data`) VALUES
	(1, 'teste12', 0123456789, 1, 1, '66 - 66', '66 - 66', '66 - 66', 'testes 66  66', '66 - 66', '66 - 66', '66 - 66', '66 - 66', '66 - 66', '66-  66', '66 - 66', '66-  66', '666', '66  66', '66  66', '2015-04-20');
/*!40000 ALTER TABLE `boletins` ENABLE KEYS */;


-- Copiando estrutura para tabela aliancaidiomas.professor
CREATE TABLE IF NOT EXISTS `professor` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(25) NOT NULL,
  `usuario` varchar(12) NOT NULL,
  `senha` varchar(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela aliancaidiomas.professor: ~18 rows (aproximadamente)
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` (`id`, `nome`, `usuario`, `senha`) VALUES
	(2, 'LUCIA CRISTINA P. GATTI', 'LUCIA', '1011309'),
	(3, 'VALERIA DE SOUZA CINTRA', 'VALERIA C', '1011971'),
	(4, 'ADRIANA GOSUEM', 'ADRIANA', '1012128'),
	(5, 'GIOVANNI F MOLINA AGUIRRE', 'GIOVANNI', '1011904'),
	(6, 'MARIA CAROLINA A ANDRADE', 'MARIA CAROL', '1012080'),
	(7, 'VALTER FRIAS MARIANO', 'VALTER', '13084'),
	(8, 'ALFREDO SABATINI', 'ALFREDO', '1006'),
	(9, 'DANIEL F PENA ANEZ', 'DANIEL', '1028'),
	(10, 'EVALDO E SILVA', 'EVALDO', '1033'),
	(11, 'ESTELA MARIS ALMEIDA', 'ESTELA', '1072'),
	(12, 'FREDERICO THEOTONIO', 'FRED', '1011198'),
	(13, 'GETULIO ALVES DE A NETO', 'GETULIO', '1011598'),
	(14, 'HAMILTOM ROBIM', 'HAMILTOM', '1015'),
	(15, 'JULIO CESAR V. NUNEZ', 'JULIO', '1011310'),
	(16, 'VINICIUS SANTOS TEIXEIRA', 'VINICIUS', '1011920'),
	(17, 'MARIANA NICOLAU', 'MARIANA', '1098'),
	(18, 'LUCIANE TAVARES CASIMIRO', 'LUCIANE', '1024'),
	(19, 'LEONARDO MENDONA FIGUEIR', 'LEONARDO', '14101');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
