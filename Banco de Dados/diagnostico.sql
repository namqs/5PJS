-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30/11/2024 às 00:54
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `diagnostico`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `administrador`
--

CREATE TABLE `administrador` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `administrador`
--

INSERT INTO `administrador` (`id`, `nome`, `email`, `senha`) VALUES
(1, 'José Santos', 'jose.santos@admin.com', 'senha123'),
(2, 'Luciana Lima', 'luciana.lima@admin.com', 'admin456');

-- --------------------------------------------------------

--
-- Estrutura para tabela `exame`
--

CREATE TABLE `exame` (
  `id` int(11) NOT NULL,
  `tipoExame` varchar(255) NOT NULL,
  `dataColeta` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `paciente_id` int(11) DEFAULT NULL,
  `administrador_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `exame`
--

INSERT INTO `exame` (`id`, `tipoExame`, `dataColeta`, `status`, `paciente_id`, `administrador_id`) VALUES
(1, 'Xenodiagnóstico', '2024-11-20', 'Concluído', 1, 1),
(2, 'Hemocultura', '2024-11-21', 'Em andamento', 2, 2),
(3, 'Xenocultura', '2024-11-22', 'Concluído', 3, 1),
(4, 'Inoculação em animais', '2024-11-23', 'Em andamento', 4, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

CREATE TABLE `paciente` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `dataNascimento` date NOT NULL,
  `endereco` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `paciente`
--

INSERT INTO `paciente` (`id`, `nome`, `dataNascimento`, `endereco`) VALUES
(1, 'João Silva', '1985-03-10', 'Rua das Flores, 123, São Paulo'),
(2, 'Maria Oliveira', '1990-07-15', 'Avenida Paulista, 456, São Paulo'),
(3, 'Carlos Pereira', '1982-11-25', 'Rua dos Trilhos, 789, Rio de Janeiro'),
(4, 'Ana Souza', '2000-01-05', 'Praça do Patriarca, 101, Belo Horizonte');

-- --------------------------------------------------------

--
-- Estrutura para tabela `relatorio`
--

CREATE TABLE `relatorio` (
  `id` int(11) NOT NULL,
  `dataGeracao` date NOT NULL,
  `formato` varchar(50) NOT NULL,
  `conteudo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `relatorio`
--

INSERT INTO `relatorio` (`id`, `dataGeracao`, `formato`, `conteudo`) VALUES
(1, '2024-11-20', 'PDF', 'Relatório de exame de sangue de João Silva: sem alterações detectadas'),
(2, '2024-11-21', 'PDF', 'Relatório de exame de fezes de Maria Oliveira: parasita detectado'),
(3, '2024-11-22', 'PDF', 'Relatório de exame de urina de Carlos Pereira: sem alterações detectadas'),
(4, '2024-11-23', 'PDF', 'Relatório de exame de sangue de Ana Souza: possível presença de parasita');

-- --------------------------------------------------------

--
-- Estrutura para tabela `resultado`
--

CREATE TABLE `resultado` (
  `id` int(11) NOT NULL,
  `exameId` int(11) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `detectacaoParasita` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `resultado`
--

INSERT INTO `resultado` (`id`, `exameId`, `descricao`, `detectacaoParasita`) VALUES
(1, 1, 'Exame de sangue normal, sem alterações', 0),
(2, 2, 'Presença de ovos de parasita detectados', 1),
(3, 3, 'Exame normal, sem alterações', 0),
(4, 4, 'Exame de sangue com possível presença de parasitas', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `senha` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nome`, `cargo`, `email`, `senha`) VALUES
(1, 'Natalie', 'Cientista', 'namqsf@gmail.com', 'xuxu'),
(2, 'Sarah', 'Pesquisadora', 'sarah@gmail.com', 'Taylor'),
(3, 'Jota', 'Rolezeiro', 'jota@gmail.com', '$2b$10$pN6/Yk/up3W1E'),
(4, 'Marciano', 'Pesquisador', 'marciano@gmail.com', '$2b$10$cIiJiEtP9niqo'),
(5, 'Sarah', 'Pesquisadora', 'sarah@gmail.com', 'Taylor');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices de tabela `exame`
--
ALTER TABLE `exame`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paciente_id` (`paciente_id`),
  ADD KEY `administrador_id` (`administrador_id`);

--
-- Índices de tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `relatorio`
--
ALTER TABLE `relatorio`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `resultado`
--
ALTER TABLE `resultado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exameId` (`exameId`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `exame`
--
ALTER TABLE `exame`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `relatorio`
--
ALTER TABLE `relatorio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `resultado`
--
ALTER TABLE `resultado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `exame`
--
ALTER TABLE `exame`
  ADD CONSTRAINT `exame_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id`),
  ADD CONSTRAINT `exame_ibfk_2` FOREIGN KEY (`administrador_id`) REFERENCES `administrador` (`id`);

--
-- Restrições para tabelas `resultado`
--
ALTER TABLE `resultado`
  ADD CONSTRAINT `resultado_ibfk_1` FOREIGN KEY (`exameId`) REFERENCES `exame` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
