-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 22, 2025 alle 15:52
-- Versione del server: 10.10.3-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user_auth`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `nome` varchar(512) NOT NULL,
  `categoria` varchar(512) DEFAULT NULL,
  `tempoStimato` int(11) DEFAULT NULL,
  `ingredienti` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `recipes`
--

INSERT INTO `recipes` (`id`, `nome`, `categoria`, `tempoStimato`, `ingredienti`) VALUES
(1, 'pasta al sugo', 'primo', 45, 'Pasta(320 g) - Olio extravergine di oliva(30 g) - basilico() - pomodori pelati (800 g) - aglio(1 spicchio) - sale grosso() - sale fino()'),
(2, 'pasta alla carbonara', 'primo', 25, 'Pasta(320 g) - Tuorli di uova medie(6 pz) - guanciale(150 g) - Pecorino Romano(50 g) - pepe nero()'),
(3, 'pollo in padella al vino', 'secondo', 50, 'Pollo(800 g) - 2 bicchieri di vino bianco() - 2 spicchi di aglio() - rosmarino() - alloro() - maggiorana() - olio extravergine di oliva() - sale()'),
(4, 'torta in padella', 'dolce', 60, 'Farina 00(30 g) - yogurt bianco naturale(250 g) - zucchero(200 g) - olio di semi(125 ml) - Limone (1) - Uova medie (3) - Lievito in polvere per dolci(0,5 bustina)');

-- --------------------------------------------------------

--
-- Struttura della tabella `steps`
--

CREATE TABLE `steps` (
  `id` int(11) NOT NULL,
  `ricetta_id` int(11) NOT NULL,
  `passaggio` text NOT NULL,
  `ordine` int(11) NOT NULL,
  `tempo` int(11) DEFAULT NULL,
  `temperaturamin` decimal(5,2) DEFAULT NULL,
  `temperaturamax` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `steps`
--

INSERT INTO `steps` (`id`, `ricetta_id`, `passaggio`, `ordine`, `tempo`, `temperaturamin`, `temperaturamax`) VALUES
(1, 1, 'Versare olio extravergine di oliva con uno spicchio di aglio sbucciato e diviso in due in una padella e scaldare per 2 minuti.', 1, 200, 0.00, 300.00),
(2, 1, 'Mettere in padella i pomodori pelati o una passata di pomodoro ed aggiungere sale a gradimento.', 2, 0, 0.00, 300.00),
(3, 1, 'Lasciare il sugo a cuocere per circa 30 minuti a coperchio chiuso, mescolando circa ogni 10 minuti, poi rimuovere aglio e parti di buccia di pomodoro alla fine.', 3, 1900, 0.00, 90.00),
(4, 1, 'Lasciare a fiamma spenta il sugo, aggiungere basilico e chiudere coperchio, in parallelo: mettere acqua in una pentola ed accendere fornello attendendo che vada in ebollizione.', 4, 500, 70.00, 150.00),
(5, 1, 'Aggiungere sale, buttare la pasta nella pentola ed attendere la cottura.', 5, 500, 70.00, 150.00),
(6, 1, 'Scolare la pasta e versarla nella padella contenente il sugo.', 6, 0, 0.00, 300.00),
(7, 2, 'Mettere sul fuoco una pentola con acqua salata per cuocere la pasta. Nel frattempo eliminare la cotenna dal guanciale e tagliarlo prima a fette e poi a striscioline spesse circa 1cm.', 1, 300, 0.00, 300.00),
(8, 2, 'Versare i pezzetti di guanciale in una padella antiaderente e rosolare per circa 10 minuti a fiamma medio alta, attenzione a non bruciarlo per evitare un sapore troppo coprente.', 2, 700, 120.00, 170.00),
(9, 2, 'Buttare gli spaghetti nell’acqua bollente e cuocerli al dente.', 3, 0, 120.00, 170.00),
(10, 2, 'Versare i tuorli in una ciotolina, aggiungere il Pecorino e il pepe nero, mescolare il tutto con una frusta a mano fino ad ottenere una crema liscia. Travasare il guanciale in una ciotola e coprirlo eventualmente con della carta per renderlo più croccante, mescolare il grasso rimasto sulla pentola nella ciotolina con uova, pecorino e pepe, aggiungendo un cucchiaio di acqua bollente prelevata dalla pentola della pasta.', 4, 300, 0.00, 300.00),
(11, 2, 'Scolare la pasta quando è cotta e versarla nella padella dove è stato cotto il guanciale, poi versarci insieme la crema di pecorino e uova, quindi mescolare.', 5, 0, 0.00, 300.00),
(12, 2, 'Aggiungere il guanciale nella pentola, rimescolare e a discrezione aggiungere pecorino grattugiato.', 6, 0, 0.00, 300.00),
(13, 3, 'Tagliare il pollo a pezzi, tritare rosmarino e maggiorana, mettere il pollo con la pelle su un piano da lavoro e spennarlo con olio extravergine di oliva.', 1, 300, 0.00, 300.00),
(14, 3, 'Mettere sopra al pollo il trito di erbe aromatiche e alloro, chiudere il tutto in un contenitore e lasciarlo marinare per 30 minuti fuori frigo. ', 2, 3000, 0.00, 300.00),
(15, 3, 'Mettere in un tegame 4 cucchiai di olio extravergine di oliva e i due spicchi di aglio tagliandoli a metà. ', 3, 300, 0.00, 300.00),
(16, 3, 'Cuocere il pollo a pezzi dalla parte della pelle a fuoco alto per 10 minuti, girarlo dopo 5 minuti.', 4, 1000, 160.00, 250.00),
(17, 3, 'Quando il vino e completamente evaporato aggiungo vino e continuo la cottura a fuoco medio basso per 35 minuti, girando il pollo circa ogni 7 minuti.', 5, 3500, 50.00, 90.00),
(18, 3, 'Aggiustare di sale.', 6, 0, 0.00, 300.00),
(19, 4, 'Mettere le uova intere in una ciotola insieme allo zucchero e montare con le fruste elettriche fino ad ottenere un composto spumoso.', 1, 0, 0.00, 300.00),
(20, 4, ' Unire lo yogurt, l’olio di semi e la scorza e il succo del limone filtrato e mescolare.', 2, 0, 0.00, 300.00),
(21, 4, 'Setacciare la farina00 insieme allo lievito in polvere per dolci ed unirli al resto degli ingredienti della ciotola mescolando con una frusta a mano in modo da non formare grumi.', 3, 0, 0.00, 300.00),
(22, 4, 'Prendere una padella da circa 24 cm di diametro, ritagliare un disco di carta da forno ed applicarlo sulla padella. Versare successivamente il composto in padella, mettere coperchio e far cuocere a bassa temperatura per circa 25 minuti. (25, 40, 90)', 4, 2500, 40.00, 90.00),
(23, 4, 'Girare la torta e far cuocere ancora per circa 10 minuti - Una volta cotta completamente, spolverare la torta con zucchero a velo. ', 5, 1000, 40.00, 90.00);

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'aaa', 'aaa.aaa@gmail.com', '$2y$10$uDTzBZNYXB0lU/smpkjvf.iO./WokhulJFVnc3HLA6CTKnjcPte7a', '2025-05-16 10:31:52');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `steps`
--
ALTER TABLE `steps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ricetta_id` (`ricetta_id`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `steps`
--
ALTER TABLE `steps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `steps`
--
ALTER TABLE `steps`
  ADD CONSTRAINT `steps_ibfk_1` FOREIGN KEY (`ricetta_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
