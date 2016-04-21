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

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela aliancaidiomas.alemao
CREATE TABLE IF NOT EXISTS `alemao` (
  `b_level` varchar(10) NOT NULL,
  `codigo_aluno` int(11) unsigned NOT NULL,
  `semestre` varchar(12) NOT NULL,
  `quiz_1` int(11) unsigned DEFAULT NULL,
  `test_1` int(11) unsigned DEFAULT NULL,
  `quiz_2` int(11) unsigned DEFAULT NULL,
  `test_2` int(11) unsigned DEFAULT NULL,
  `sprechen` int(11) unsigned DEFAULT NULL,
  `hausau` int(11) unsigned DEFAULT NULL,
  KEY `FK_espanhol_b2_aluno` (`codigo_aluno`),
  CONSTRAINT `alemao_ibfk_1` FOREIGN KEY (`codigo_aluno`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Exportação de dados foi desmarcado.


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

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela aliancaidiomas.aluno_boletins
CREATE TABLE IF NOT EXISTS `aluno_boletins` (
  `boletins_AB` varchar(10) NOT NULL,
  `codigo_aluno_AB` int(11) unsigned NOT NULL,
  KEY `aluno_AB` (`codigo_aluno_AB`),
  KEY `FK_aluno_boletins_boletins` (`boletins_AB`),
  CONSTRAINT `aluno_AB` FOREIGN KEY (`codigo_aluno_AB`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_aluno_boletins_boletins` FOREIGN KEY (`boletins_AB`) REFERENCES `boletins` (`boletins`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela aliancaidiomas.aluno_grupo
CREATE TABLE IF NOT EXISTS `aluno_grupo` (
  `cod_grupo` int(11) NOT NULL,
  `codigo_aluno` int(11) unsigned NOT NULL,
  KEY `cod_aluno` (`codigo_aluno`),
  KEY `cod_grupo` (`cod_grupo`),
  CONSTRAINT `cod_aluno` FOREIGN KEY (`codigo_aluno`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cod_grupo` FOREIGN KEY (`cod_grupo`) REFERENCES `grupo` (`cod_grupo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela aliancaidiomas.boletins
CREATE TABLE IF NOT EXISTS `boletins` (
  `boletins` varchar(10) NOT NULL,
  `nome_boletim` varchar(15) NOT NULL,
  `idioma_boletins` int(11) NOT NULL,
  PRIMARY KEY (`boletins`),
  KEY `idiomas_boletins` (`idioma_boletins`),
  CONSTRAINT `idiomas_boletins` FOREIGN KEY (`idioma_boletins`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela aliancaidiomas.espanhol_a1
CREATE TABLE IF NOT EXISTS `espanhol_a1` (
  `b_level` varchar(10) NOT NULL,
  `codigo_aluno` int(11) unsigned NOT NULL,
  `semestre` varchar(12) NOT NULL,
  `unidade123` int(11) unsigned DEFAULT NULL,
  `unidade456` int(11) unsigned DEFAULT NULL,
  `unidade789` int(11) unsigned DEFAULT NULL,
  `mediafinal` int(11) unsigned DEFAULT NULL,
  KEY `FK_espanhol_b2_aluno` (`codigo_aluno`),
  CONSTRAINT `espanhol_a1_ibfk_1` FOREIGN KEY (`codigo_aluno`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela aliancaidiomas.espanhol_a2
CREATE TABLE IF NOT EXISTS `espanhol_a2` (
  `b_level` varchar(10) NOT NULL,
  `codigo_aluno` int(11) unsigned NOT NULL,
  `semestre` varchar(12) NOT NULL,
  `unidade123` int(11) unsigned DEFAULT NULL,
  `unidade456` int(11) unsigned DEFAULT NULL,
  `unidade78910` int(11) unsigned DEFAULT NULL,
  `proyectolectura` int(11) unsigned DEFAULT NULL,
  `mediafinal` int(11) unsigned DEFAULT NULL,
  KEY `FK_espanhol_b2_aluno` (`codigo_aluno`),
  CONSTRAINT `espanhol_a2_ibfk_1` FOREIGN KEY (`codigo_aluno`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela aliancaidiomas.espanhol_b1
CREATE TABLE IF NOT EXISTS `espanhol_b1` (
  `b_level` varchar(10) NOT NULL,
  `codigo_aluno` int(11) unsigned NOT NULL,
  `semestre` varchar(12) NOT NULL,
  `unidade123` int(11) unsigned DEFAULT NULL,
  `unidade456` int(11) unsigned DEFAULT NULL,
  `unidade789` int(11) unsigned DEFAULT NULL,
  `unidade101112` int(11) unsigned DEFAULT NULL,
  `proyectolectura` int(11) unsigned DEFAULT NULL,
  `mediafinal` int(11) unsigned DEFAULT NULL,
  KEY `aluno` (`codigo_aluno`),
  CONSTRAINT `aluno` FOREIGN KEY (`codigo_aluno`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela aliancaidiomas.espanhol_b2
CREATE TABLE IF NOT EXISTS `espanhol_b2` (
  `b_level` varchar(10) NOT NULL,
  `codigo_aluno` int(11) unsigned NOT NULL,
  `semestre` varchar(12) NOT NULL,
  `unidade12345` int(11) unsigned DEFAULT NULL,
  `unidade678910` int(11) unsigned DEFAULT NULL,
  `proyectolectura` int(11) unsigned DEFAULT NULL,
  `mediafinal` int(11) unsigned DEFAULT NULL,
  KEY `FK_espanhol_b2_aluno` (`codigo_aluno`),
  CONSTRAINT `FK_espanhol_b2_aluno` FOREIGN KEY (`codigo_aluno`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.


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

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela aliancaidiomas.idiomas
CREATE TABLE IF NOT EXISTS `idiomas` (
  `nome_idioma` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela aliancaidiomas.ingles
CREATE TABLE IF NOT EXISTS `ingles` (
  `b_level` varchar(10) NOT NULL,
  `codigo_aluno` int(11) unsigned NOT NULL,
  `semestre` varchar(12) NOT NULL,
  `quiz_1` int(11) unsigned DEFAULT NULL,
  `test_1` int(11) unsigned DEFAULT NULL,
  `participacao_1` int(11) unsigned DEFAULT NULL,
  `media_1` int(11) unsigned DEFAULT NULL,
  `quiz_2` int(11) unsigned DEFAULT NULL,
  `test_2` int(11) unsigned DEFAULT NULL,
  `oral_test` int(11) unsigned DEFAULT NULL,
  `mocks` int(11) unsigned DEFAULT NULL,
  `reading` int(11) unsigned DEFAULT NULL,
  `participacao_2` int(11) unsigned DEFAULT NULL,
  `multroom` int(11) unsigned DEFAULT NULL,
  `media_2` int(11) unsigned DEFAULT NULL,
  `media_final` int(11) unsigned DEFAULT NULL,
  KEY `FK_espanhol_b2_aluno` (`codigo_aluno`),
  CONSTRAINT `ingles_ibfk_1` FOREIGN KEY (`codigo_aluno`) REFERENCES `aluno` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela aliancaidiomas.mural
CREATE TABLE IF NOT EXISTS `mural` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `summary` tinytext NOT NULL,
  `content` text NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela aliancaidiomas.nivel
CREATE TABLE IF NOT EXISTS `nivel` (
  `nivel` varchar(10) COLLATE utf8_bin NOT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Exportação de dados foi desmarcado.


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Exportação de dados foi desmarcado.


-- Copiando estrutura para tabela aliancaidiomas.recado_grupo
CREATE TABLE IF NOT EXISTS `recado_grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod_grupo` int(11) NOT NULL DEFAULT '0',
  `titulo_recado` varchar(50) NOT NULL,
  `conteudo_recado` varchar(200) NOT NULL,
  `data_recado` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `grupo` (`cod_grupo`),
  CONSTRAINT `grupo` FOREIGN KEY (`cod_grupo`) REFERENCES `grupo` (`cod_grupo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
