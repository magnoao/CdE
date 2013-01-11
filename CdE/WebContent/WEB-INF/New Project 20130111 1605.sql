-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.58-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema emprestimo
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ emprestimo;
USE emprestimo;

--
-- Table structure for table `emprestimo`.`tbemprestimo`
--

DROP TABLE IF EXISTS `tbemprestimo`;
CREATE TABLE `tbemprestimo` (
  `idemprestimo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dataemprestimo` date DEFAULT '0000-00-00',
  `dataPrevistaDevolucao` date DEFAULT '0000-00-00',
  `datadevolucao` date DEFAULT '0000-00-00',
  `idpessoa` int(10) unsigned NOT NULL DEFAULT '0',
  `iditem` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`idemprestimo`),
  KEY `FK_tbemprestimo_1` (`iditem`),
  KEY `FK_tbemprestimo_2` (`idpessoa`),
  CONSTRAINT `FK_tbemprestimo_1` FOREIGN KEY (`iditem`) REFERENCES `tbitem` (`iditem`),
  CONSTRAINT `FK_tbemprestimo_2` FOREIGN KEY (`idpessoa`) REFERENCES `tbpessoa` (`idpessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emprestimo`.`tbemprestimo`
--

/*!40000 ALTER TABLE `tbemprestimo` DISABLE KEYS */;
INSERT INTO `tbemprestimo` (`idemprestimo`,`dataemprestimo`,`dataPrevistaDevolucao`,`datadevolucao`,`idpessoa`,`iditem`) VALUES 
 (1,'2012-12-21','2013-01-21',NULL,1,1),
 (2,'2012-12-21','2012-12-23',NULL,1,4),
 (3,'2012-12-21','2012-12-23',NULL,2,6),
 (4,'2012-12-25','2012-12-29',NULL,2,2),
 (5,'2012-12-25','2012-12-30','2013-01-01',2,2),
 (6,'2012-12-25','2012-12-30','2013-01-01',2,2),
 (7,'2012-12-21','2012-12-30','2013-01-01',2,8);
/*!40000 ALTER TABLE `tbemprestimo` ENABLE KEYS */;


--
-- Table structure for table `emprestimo`.`tbitem`
--

DROP TABLE IF EXISTS `tbitem`;
CREATE TABLE `tbitem` (
  `iditem` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL DEFAULT '',
  `descricao` text,
  `disponivel` tinyint(1) NOT NULL DEFAULT '1',
  `idtipodeitem` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`iditem`),
  KEY `FK_tbitem_1` (`idtipodeitem`),
  CONSTRAINT `FK_tbitem_1` FOREIGN KEY (`idtipodeitem`) REFERENCES `tbtipodeitem` (`idtipodeitem`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emprestimo`.`tbitem`
--

/*!40000 ALTER TABLE `tbitem` DISABLE KEYS */;
INSERT INTO `tbitem` (`iditem`,`nome`,`descricao`,`disponivel`,`idtipodeitem`) VALUES 
 (1,'Avril Lavgne','Esse é o album!',0,2),
 (2,'O Rappa - Acustico MTV','Um dos mais comportados...',0,2),
 (3,'O guia do Mochileiro','Uma aventura muito louca',0,3),
 (4,'O guia do Mochileiro - Dont Panic','Uma historia de dar nó nas ideias...',0,1),
 (5,'Ubunto 10.04','Cd de Instalação',1,2),
 (6,'Winows 8 Full Versions','Cd de Instalação',0,3),
 (8,'Torradeira','Manual do Eletrodomestico',1,1);
/*!40000 ALTER TABLE `tbitem` ENABLE KEYS */;


--
-- Table structure for table `emprestimo`.`tbpessoa`
--

DROP TABLE IF EXISTS `tbpessoa`;
CREATE TABLE `tbpessoa` (
  `idpessoa` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL DEFAULT '',
  `email` varchar(45) NOT NULL DEFAULT '',
  `telefone` varchar(16) NOT NULL DEFAULT '',
  `bloqueado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idpessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emprestimo`.`tbpessoa`
--

/*!40000 ALTER TABLE `tbpessoa` DISABLE KEYS */;
INSERT INTO `tbpessoa` (`idpessoa`,`nome`,`email`,`telefone`,`bloqueado`) VALUES 
 (1,'Jeanderval dos Santos Junior','jeandevall@gmail.com','(15)9769-3289',0),
 (2,'Lucio Alvaro Cordeiro','lucio@gmail.com','(75)8115-5298',0),
 (3,'Thiago','tm@gmail.com','(23)5263-4587',0),
 (4,'Renato Novais','renato@gmail.com','(71)9952-8461',0),
 (5,'Diego','diego@bol.com.br','(45)9268-5264',0);
/*!40000 ALTER TABLE `tbpessoa` ENABLE KEYS */;


--
-- Table structure for table `emprestimo`.`tbtipodeitem`
--

DROP TABLE IF EXISTS `tbtipodeitem`;
CREATE TABLE `tbtipodeitem` (
  `idtipodeitem` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL DEFAULT '',
  `descricao` text,
  PRIMARY KEY (`idtipodeitem`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emprestimo`.`tbtipodeitem`
--

/*!40000 ALTER TABLE `tbtipodeitem` DISABLE KEYS */;
INSERT INTO `tbtipodeitem` (`idtipodeitem`,`nome`,`descricao`) VALUES 
 (1,'Livro','Impresso no papel para leitura'),
 (2,'CD','Media para gravação de musicas e dados'),
 (3,'DVD','Media para gravação de filmes e dados'),
 (4,'Jogo','De tabuleiro, cartas, etc.'),
 (5,'Software','Programa para instalação');
/*!40000 ALTER TABLE `tbtipodeitem` ENABLE KEYS */;


--
-- Table structure for table `emprestimo`.`tbusuario`
--

DROP TABLE IF EXISTS `tbusuario`;
CREATE TABLE `tbusuario` (
  `idUsuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL DEFAULT '',
  `login` varchar(18) NOT NULL DEFAULT '',
  `senha` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emprestimo`.`tbusuario`
--

/*!40000 ALTER TABLE `tbusuario` DISABLE KEYS */;
INSERT INTO `tbusuario` (`idUsuario`,`nome`,`login`,`senha`) VALUES 
 (1,'Magno A. de Oliveira','mao','mao');
/*!40000 ALTER TABLE `tbusuario` ENABLE KEYS */;


--
-- View structure for view `emprestimo`.`viewdevedores`
--

DROP VIEW IF EXISTS `viewdevedores`;
CREATE ALGORITHM=UNDEFINED DEFINER=`ifba`@`%` SQL SECURITY DEFINER VIEW `emprestimo`.`viewdevedores` AS select distinct `emprestimo`.`tbemprestimo`.`idpessoa` AS `idpessoa` from `emprestimo`.`tbemprestimo` where isnull(`emprestimo`.`tbemprestimo`.`datadevolucao`);


--
-- View structure for view `emprestimo`.`viewemprestados`
--

DROP VIEW IF EXISTS `viewemprestados`;
CREATE ALGORITHM=UNDEFINED DEFINER=`ifba`@`%` SQL SECURITY DEFINER VIEW `emprestimo`.`viewemprestados` AS select `emprestimo`.`tbemprestimo`.`iditem` AS `iditem` from `emprestimo`.`tbemprestimo` where isnull(`emprestimo`.`tbemprestimo`.`datadevolucao`);


--
-- View structure for view `emprestimo`.`viewitensatrasados`
--

DROP VIEW IF EXISTS `viewitensatrasados`;
CREATE ALGORITHM=UNDEFINED DEFINER=`ifba`@`%` SQL SECURITY DEFINER VIEW `emprestimo`.`viewitensatrasados` AS select `emprestimo`.`tbemprestimo`.`iditem` AS `iditem` from `emprestimo`.`tbemprestimo` where (isnull(`emprestimo`.`tbemprestimo`.`datadevolucao`) and (`emprestimo`.`tbemprestimo`.`dataPrevistaDevolucao` < curdate()));

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
