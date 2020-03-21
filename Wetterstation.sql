-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 22. Dez 2019 um 11:47
-- Server-Version: 10.4.8-MariaDB
-- PHP-Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `Wetterstation`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `licht`
--

CREATE TABLE `licht` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `luxwert` double NOT NULL,
  `zeit` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `licht`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `regen`
--

CREATE TABLE `regen` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `regen` double NOT NULL,
  `zeit` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `regen`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `temp_feucht`
--

CREATE TABLE `temp_feucht` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `temperatur` double NOT NULL,
  `luftfeuchtigkeit` double NOT NULL,
  `zeit` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `temp_feucht`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `name` varchar(1350) DEFAULT NULL,
  `password` varchar(1350) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`user_id`, `name`, `password`) VALUES
(1, 'bolligen', 'D65F63B1BE7B8DD3E767B66EE3F1BC382F0E6B511F8C767A8A0400098742D25E'),
(2, 'langnau', '6723f2791db7ada63bf341b5ab877cf822f703b8ba3e3d5cf8de29be596a49c8'),
(3, 'admin', '86f07183dec19e27ec40cc6138160df19d70cc4349c005d29cc526ef8e4957ed');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wind`
--

CREATE TABLE `wind` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `wind` double NOT NULL,
  `zeit` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `wind`
--

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `licht`
--
ALTER TABLE `licht`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indizes für die Tabelle `regen`
--
ALTER TABLE `regen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indizes für die Tabelle `temp_feucht`
--
ALTER TABLE `temp_feucht`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indizes für die Tabelle `wind`
--
ALTER TABLE `wind`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `licht`
--
ALTER TABLE `licht`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3430;

--
-- AUTO_INCREMENT für Tabelle `regen`
--
ALTER TABLE `regen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5570;

--
-- AUTO_INCREMENT für Tabelle `temp_feucht`
--
ALTER TABLE `temp_feucht`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3850;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `wind`
--
ALTER TABLE `wind`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4085;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `licht`
--
ALTER TABLE `licht`
  ADD CONSTRAINT `licht_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints der Tabelle `regen`
--
ALTER TABLE `regen`
  ADD CONSTRAINT `regen_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints der Tabelle `temp_feucht`
--
ALTER TABLE `temp_feucht`
  ADD CONSTRAINT `temp_feucht_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints der Tabelle `wind`
--
ALTER TABLE `wind`
  ADD CONSTRAINT `wind_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
