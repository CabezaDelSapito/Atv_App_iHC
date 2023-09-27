-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27/09/2023 às 08:38
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `unilivro`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categoria`
--

INSERT INTO `categoria` (`id`, `nome`) VALUES
(1, 'Matemática'),
(2, 'computação');

-- --------------------------------------------------------

--
-- Estrutura para tabela `livro`
--

CREATE TABLE `livro` (
  `id` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `categoria` int(11) NOT NULL,
  `autor` varchar(50) NOT NULL,
  `descricao` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `livro`
--

INSERT INTO `livro` (`id`, `titulo`, `categoria`, `autor`, `descricao`) VALUES
(1, 'calculo - volume 1', 1, 'james stewart', 'Nesta 9ª edição, assim como em todas as anteriores, os autores mantêm a tradição de escrever um livro que auxilie os estudantes a descobrir o cálculo – tanto por sua utilidade prática, como por sua surpreendente beleza. O intuito é transmitir ao leitor uma ideia da utilidade do cálculo, assim como promover o desenvolvimento de sua habilidade técnica. Ao mesmo tempo, os autores empenharam-se em valorizar a beleza intrínseca do assunto. Não há dúvida de que Newton experimentou uma sensação de triunfo quando fez suas grandes descobertas. O objetivo desta obra é fazer que os estudantes compartilhem um pouco desse entusiasmo.\r\n'),
(2, 'sistemas operacionais modernos', 2, 'Andrew S. Tanenbaum', 'A 4ª edição de Sistemas operacionais modernos foi extensamente revisada e atualizada para incorporar os últimos desenvolvimentos em tecnologias de sistemas operacionais. Além de tratar do sistema UNIX, o livro traz como novidade a abordagem do Windows 8 e 8.1, assim como um foco maior em Linux e a introdução da plataforma Android.\r\n'),
(3, 'Programação COBOL', 2, 'Tamio Shimizu', 'Engenharia industrial. COBOL. Linguagem de programação.\r\n');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `livro`
--
ALTER TABLE `livro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_categoria` (`categoria`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `livro`
--
ALTER TABLE `livro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `livro`
--
ALTER TABLE `livro`
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
