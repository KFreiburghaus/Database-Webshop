-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 16. Jan 2020 um 22:41
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
-- Datenbank: `Webshop_Datenbank`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Artikel`
--

CREATE TABLE `Artikel` (
  `ArtikelID` int(11) NOT NULL,
  `ArtikelBeschreibung` varchar(200) NOT NULL,
  `ArtikelBild` varchar(200) NOT NULL,
  `UnterkategorieID` int(11) NOT NULL,
  `Einkaufspreis` double NOT NULL,
  `Verkaufspreis` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Artikel`
--

INSERT INTO `Artikel` (`ArtikelID`, `ArtikelBeschreibung`, `ArtikelBild`, `UnterkategorieID`, `Einkaufspreis`, `Verkaufspreis`) VALUES
(1, 'iPhone7 Plus Hülle', '/home/artikel/iPhone/iphone7_p_hülle.jpg', 1, 2.3, 6.95),
(2, 'iPhone7 Plus', '/home/artikel/iphone/iphone7_p.jpg', 1, 699, 750),
(3, 'Samsung Galaxy A40', '/home/artikel/samsung/galaxy_a40.jpg', 2, 210, 229.95),
(4, 'Samsung Galaxy A40 Hülle', '/home/artikel/samsung/galaxy_a40_hülle.jpg', 2, 12.1, 15.95),
(5, 'Samsung Galaxy A40 Panzerglas', '/home/artikel/samsung/galaxy_a40_panzerglas.jpg', 2, 11.75, 19.95),
(6, 'Longarm Shirt XL Men', '/home/artikel/longarm_shirt_xl_men.jpg', 3, 9.95, 14.95),
(7, 'Tank Top XL Men', '/home/artikel/tanktop_xl_men.jpg', 3, 7.25, 12),
(8, 'Top XS Women', '/home/artikel/top_xs_women.jpg', 4, 7.25, 12.95),
(9, 'Bluse S Women', '/home/artikel/bluse_s_women.jpg', 4, 19.95, 34.95);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Bestellstatus`
--

CREATE TABLE `Bestellstatus` (
  `BestellstatusID` int(11) NOT NULL,
  `Bestellstatus` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Bestellstatus`
--

INSERT INTO `Bestellstatus` (`BestellstatusID`, `Bestellstatus`) VALUES
(1, 'im Warenkorb'),
(2, 'bestellt'),
(3, 'geliefert');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Bestellungen`
--

CREATE TABLE `Bestellungen` (
  `BestellID` int(11) NOT NULL,
  `AuftragsNummer` int(11) NOT NULL,
  `ArtikelID` int(11) NOT NULL,
  `KundenID` int(11) NOT NULL,
  `BestellstatusID` int(11) NOT NULL DEFAULT 1,
  `BestellZeitpunkt` timestamp NOT NULL DEFAULT current_timestamp(),
  `Bewertung` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Bestellungen`
--

INSERT INTO `Bestellungen` (`BestellID`, `AuftragsNummer`, `ArtikelID`, `KundenID`, `BestellstatusID`, `BestellZeitpunkt`, `Bewertung`) VALUES
(1, 1000, 4, 1, 3, '2020-01-13 14:36:57', 7),
(2, 1000, 3, 1, 3, '2020-01-13 14:36:57', 8),
(3, 1001, 7, 2, 2, '2020-01-13 14:37:56', 4),
(4, 1001, 9, 2, 2, '2020-01-13 14:37:56', 4),
(5, 1001, 8, 2, 2, '2020-01-13 14:37:56', 7),
(6, 1002, 7, 4, 2, '2020-01-13 14:45:24', 1),
(7, 1002, 9, 4, 2, '2020-01-13 14:45:24', NULL),
(8, 1002, 2, 4, 2, '2020-01-13 14:45:24', NULL),
(9, 1003, 1, 3, 2, '2020-01-13 14:47:33', 7),
(10, 1003, 2, 1, 2, '2020-01-13 14:47:33', NULL),
(11, 1004, 7, 4, 1, '2020-01-14 08:19:27', NULL),
(13, 1005, 2, 3, 3, '2020-01-16 19:48:49', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Kunde`
--

CREATE TABLE `Kunde` (
  `KundenID` int(11) NOT NULL,
  `Anrede` varchar(10) NOT NULL,
  `Vorname` varchar(200) NOT NULL,
  `Nachname` varchar(200) NOT NULL,
  `Adresse` varchar(200) NOT NULL,
  `PLZ` int(4) NOT NULL,
  `Wohnort` varchar(200) NOT NULL,
  `Telefon` int(10) NOT NULL,
  `EMail` varchar(200) NOT NULL,
  `Geburtsdatum` date NOT NULL,
  `PreisgruppenID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Kunde`
--

INSERT INTO `Kunde` (`KundenID`, `Anrede`, `Vorname`, `Nachname`, `Adresse`, `PLZ`, `Wohnort`, `Telefon`, `EMail`, `Geburtsdatum`, `PreisgruppenID`) VALUES
(1, 'Herr', 'David', 'Freiburghaus', 'Spittelhausweg 10', 3065, 'Bolligen', 796754452, '19david98@gmx.ch', '1998-05-17', 1),
(2, 'Frau', 'Susanne', 'Häberli', 'Postfach 12', 1234, 'Bern', 791234567, 'susanne@sunrise.ch', '1979-11-18', 1),
(3, 'Frau', 'Alex', 'Alex', 'Alexweg 12', 1111, 'Israel', 778889900, 'alex.alex@alex.alex', '2020-01-01', 2),
(4, 'Herr', 'Kaspar', 'Freiburghaus', 'Spittelhausweg 10', 3065, 'Bolligen', 799180300, 'kaspar.freiburghaus@protonmail.ch', '1996-01-23', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Oberkategorie`
--

CREATE TABLE `Oberkategorie` (
  `OberkategorieID` int(11) NOT NULL,
  `OberkategorieBeschreibung` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Oberkategorie`
--

INSERT INTO `Oberkategorie` (`OberkategorieID`, `OberkategorieBeschreibung`) VALUES
(1, 'Elektronische Geräte'),
(2, 'Kleider');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Preisgruppen`
--

CREATE TABLE `Preisgruppen` (
  `PreisgruppenID` int(11) NOT NULL,
  `PreisgruppenName` varchar(200) NOT NULL,
  `PreisReduktion` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Preisgruppen`
--

INSERT INTO `Preisgruppen` (`PreisgruppenID`, `PreisgruppenName`, `PreisReduktion`) VALUES
(1, 'Schüler', 0.8),
(2, 'Endkunde', 1),
(3, 'Händler', 0.85);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Unterkategorie`
--

CREATE TABLE `Unterkategorie` (
  `UnterkategorieID` int(11) NOT NULL,
  `UnterkategorieBeschreibung` varchar(200) NOT NULL,
  `OberkategorieID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Unterkategorie`
--

INSERT INTO `Unterkategorie` (`UnterkategorieID`, `UnterkategorieBeschreibung`, `OberkategorieID`) VALUES
(1, 'Apple Geräte & Zubehör', 1),
(2, 'Samsung Geräte & Zubehör', 1),
(3, 'Kleider Männer', 2),
(4, 'Kleider Frauen', 2);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Artikel`
--
ALTER TABLE `Artikel`
  ADD PRIMARY KEY (`ArtikelID`),
  ADD KEY `FK_Unterkategorie` (`UnterkategorieID`);

--
-- Indizes für die Tabelle `Bestellstatus`
--
ALTER TABLE `Bestellstatus`
  ADD PRIMARY KEY (`BestellstatusID`);

--
-- Indizes für die Tabelle `Bestellungen`
--
ALTER TABLE `Bestellungen`
  ADD PRIMARY KEY (`BestellID`),
  ADD KEY `FK_Artikel` (`ArtikelID`),
  ADD KEY `FK_Bestellstatus` (`BestellstatusID`),
  ADD KEY `FK_Kunde` (`KundenID`);

--
-- Indizes für die Tabelle `Kunde`
--
ALTER TABLE `Kunde`
  ADD PRIMARY KEY (`KundenID`),
  ADD KEY `FK_Preisgruppen` (`PreisgruppenID`);

--
-- Indizes für die Tabelle `Oberkategorie`
--
ALTER TABLE `Oberkategorie`
  ADD PRIMARY KEY (`OberkategorieID`);

--
-- Indizes für die Tabelle `Preisgruppen`
--
ALTER TABLE `Preisgruppen`
  ADD PRIMARY KEY (`PreisgruppenID`);

--
-- Indizes für die Tabelle `Unterkategorie`
--
ALTER TABLE `Unterkategorie`
  ADD PRIMARY KEY (`UnterkategorieID`),
  ADD KEY `FK_Oberkategorie` (`OberkategorieID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `Artikel`
--
ALTER TABLE `Artikel`
  MODIFY `ArtikelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `Bestellstatus`
--
ALTER TABLE `Bestellstatus`
  MODIFY `BestellstatusID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `Bestellungen`
--
ALTER TABLE `Bestellungen`
  MODIFY `BestellID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT für Tabelle `Oberkategorie`
--
ALTER TABLE `Oberkategorie`
  MODIFY `OberkategorieID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `Artikel`
--
ALTER TABLE `Artikel`
  ADD CONSTRAINT `FK_Unterkategorie` FOREIGN KEY (`UnterkategorieID`) REFERENCES `Unterkategorie` (`UnterkategorieID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints der Tabelle `Bestellungen`
--
ALTER TABLE `Bestellungen`
  ADD CONSTRAINT `FK_Artikel` FOREIGN KEY (`ArtikelID`) REFERENCES `Artikel` (`ArtikelID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Bestellstatus` FOREIGN KEY (`BestellstatusID`) REFERENCES `Bestellstatus` (`BestellstatusID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Kunde` FOREIGN KEY (`KundenID`) REFERENCES `Kunde` (`KundenID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints der Tabelle `Kunde`
--
ALTER TABLE `Kunde`
  ADD CONSTRAINT `FK_Preisgruppen` FOREIGN KEY (`PreisgruppenID`) REFERENCES `Preisgruppen` (`PreisgruppenID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints der Tabelle `Unterkategorie`
--
ALTER TABLE `Unterkategorie`
  ADD CONSTRAINT `FK_Oberkategorie` FOREIGN KEY (`OberkategorieID`) REFERENCES `Oberkategorie` (`OberkategorieID`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
