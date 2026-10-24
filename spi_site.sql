-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.4.3 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para spi_site
CREATE DATABASE IF NOT EXISTS `spi_site` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `spi_site`;

-- Copiando estrutura para tabela spi_site.artigos
CREATE TABLE IF NOT EXISTS `artigos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conteudo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagem_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `autor` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'Agência de Notícias',
  `data_publicacao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela spi_site.artigos: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela spi_site.avaliacoes_artigo
CREATE TABLE IF NOT EXISTS `avaliacoes_artigo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `artigo_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'registro-sp',
  `topicos_comparacao` tinyint(1) DEFAULT '0',
  `delineamento_proposto` tinyint(1) DEFAULT '0',
  `boa_fluidez` tinyint(1) DEFAULT '0',
  `data_avaliacao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela spi_site.avaliacoes_artigo: ~1 rows (aproximadamente)
INSERT INTO `avaliacoes_artigo` (`id`, `artigo_id`, `topicos_comparacao`, `delineamento_proposto`, `boa_fluidez`, `data_avaliacao`) VALUES
	(1, 'registro-sp', 1, 1, 1, '2026-10-18 21:32:19');

-- Copiando estrutura para tabela spi_site.comentarios
CREATE TABLE IF NOT EXISTS `comentarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `artigo_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comentario` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_criacao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela spi_site.comentarios: ~4 rows (aproximadamente)
INSERT INTO `comentarios` (`id`, `artigo_id`, `nome`, `comentario`, `data_criacao`) VALUES
	(1, 'registro-sp', 'João Victor', 'Projeto sensacional! Estudo perto de um centro de reabilitação e vejo diariamente o sufoco de quem tem mobilidade reduzida para atravessar a rua a tempo. Usar IA para "segurar" o sinal é o tipo de tecnologia que realmente transforma vidas. Parabéns pelo TCC, tomara que as prefeituras adotem!', '2026-10-18 20:53:18'),
	(2, 'registro-sp', 'Ana Beatriz', 'Esse projeto é urgente! Vejo diariamente idosos e PcDs passando sufoco para atravessar a rua, expostos a motoristas impacientes. Ter uma tecnologia que reconhece quem precisa de mais tempo no sinal verde não é luxo, é humanidade e respeito. Parabéns pela iniciativa, tomara que vá para as ruas logo!', '2026-10-18 20:53:18'),
	(3, 'registro-sp', 'Fabricio', 'Excelente artigo! Na Autoescola Sena, sempre focamos na direção defensiva, e um semáforo inteligente traz muito mais calma para o aluno iniciante no sinal verde. Essa tecnologia é o futuro das aulas práticas!', '2026-10-18 20:53:18'),
	(4, 'registro-sp', 'Simone Souza', 'amei!!', '2026-10-18 20:54:32');

-- Copiando estrutura para tabela spi_site.faq
CREATE TABLE IF NOT EXISTS `faq` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pergunta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `resposta` text COLLATE utf8mb4_unicode_ci,
  `data_envio` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela spi_site.faq: ~5 rows (aproximadamente)
INSERT INTO `faq` (`id`, `pergunta`, `resposta`, `data_envio`) VALUES
	(11, 'Qual o horário de atendimento da central de atendimento?', 'O atendimento funciona de segunda a sexta-feira, das 8h às 18h.', '2026-10-18 20:16:26'),
	(12, 'O que é a SPI - Sênior pass intelligence?', 'A SPI é uma proposta de semáforo inteligente voltada à mobilidade, acessibilidade e segurança no trânsito.', '2026-10-18 20:16:26'),
	(13, 'O site e o aplicativo são seguros?', 'Sim. O projeto utiliza boas práticas de segurança para proteger informações e dados dos usuários.', '2026-10-18 20:16:26'),
	(14, 'As informações que estão no site são seguras?', 'As informações disponibilizadas são utilizadas exclusivamente dentro das funcionalidades previstas pelo sistema.', '2026-10-18 20:16:26'),
	(15, 'Qual o canal para reclamações?', 'Reclamações e sugestões poderão ser encaminhadas pelos canais oficiais de atendimento da SPI.', '2026-10-18 20:16:26');

-- Copiando estrutura para tabela spi_site.mensagens_contato
CREATE TABLE IF NOT EXISTS `mensagens_contato` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `assunto` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mensagem` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pendente','lida','respondida') COLLATE utf8mb4_unicode_ci DEFAULT 'pendente',
  `data_envio` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela spi_site.mensagens_contato: ~3 rows (aproximadamente)
INSERT INTO `mensagens_contato` (`id`, `nome`, `email`, `assunto`, `mensagem`, `status`, `data_envio`) VALUES
	(1, 'Ana Beatriz', 'ana@camararegistro.sp.gov.br', 'Dúvida sobre o Projeto', 'Quando esse semaforo estará nas ruas?', 'pendente', '2026-10-18 21:02:09'),
	(2, 'simone', 'simone@camararegistro.sp.gov.br', 'Outros', 'amei o projeto', 'pendente', '2026-10-18 21:12:57'),
	(3, 'Ana Beatriz', 'maria.beatriz231809@gmail.com', 'Parceria / Contato Institucional', 'queria fechar uma parceria', 'pendente', '2026-10-23 23:28:12');

-- Copiando estrutura para tabela spi_site.solicitacoes_orcamento
CREATE TABLE IF NOT EXISTS `solicitacoes_orcamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entidade` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_organizacao` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cruzamentos` int DEFAULT '1',
  `mensagem` text COLLATE utf8mb4_unicode_ci,
  `data_solicitacao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela spi_site.solicitacoes_orcamento: ~1 rows (aproximadamente)
INSERT INTO `solicitacoes_orcamento` (`id`, `nome`, `email`, `telefone`, `entidade`, `tipo_organizacao`, `cidade`, `cruzamentos`, `mensagem`, `data_solicitacao`) VALUES
	(1, 'ANA BEATRIZ', 'maria.beatriz231809@gmail.com', '13997909355', 'Prefeitura de Registro', 'Prefeitura / Secretaria de Trânsito', 'Jacupiranga', 5, 'Cruzamento registro', '2026-10-23 22:55:20');

-- Copiando estrutura para tabela spi_site.usuarios_admin
CREATE TABLE IF NOT EXISTS `usuarios_admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_criacao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela spi_site.usuarios_admin: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
