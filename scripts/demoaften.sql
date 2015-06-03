-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 29, 2015 at 11:19 AM
-- Server version: 5.5.43-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `demoaften`
--

-- --------------------------------------------------------

--
-- Table structure for table `brugere`
--

CREATE TABLE IF NOT EXISTS `brugere` (
  `brugerid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fbbrugerid` varchar(30) NOT NULL,
  `navn` varchar(140) NOT NULL,
  `fornavn` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `facebookinfo` text NOT NULL,
  PRIMARY KEY (`brugerid`),
  UNIQUE KEY `fbbrugerid` (`fbbrugerid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `brugere`
--

INSERT INTO `brugere` (`brugerid`, `fbbrugerid`, `navn`, `fornavn`, `gender`, `facebookinfo`) VALUES
(1, '10152751582686196', 'Andy Graulund', 'Andy', 'male', '{"id":"10152751582686196","first_name":"Andy","gender":"male","last_name":"Graulund","link":"https://www.facebook.com/app_scoped_user_id/10152751582686196/","locale":"en_US","name":"Andy Graulund","timezone":2,"updated_time":"2015-03-23T18:27:07+0000","verified":true}'),
(4, '10153261595172674', 'Jacob Tielbo Bøtter', 'Jacob', 'male', '{"id":"10153261595172674","first_name":"Jacob","gender":"male","last_name":"Bu00f8tter","link":"https://www.facebook.com/app_scoped_user_id/10153261595172674/","locale":"en_US","middle_name":"Tielbo","name":"Jacob Tielbo Bu00f8tter","timezone":2,"updated_time":"2015-04-01T08:42:24+0000","verified":true}');

-- --------------------------------------------------------

--
-- Table structure for table `emner`
--

CREATE TABLE IF NOT EXISTS `emner` (
  `emneid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `emnenavn` varchar(20) NOT NULL,
  `emnefarve` varchar(6) NOT NULL,
  PRIMARY KEY (`emneid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `emner`
--

INSERT INTO `emner` (`emneid`, `emnenavn`, `emnefarve`) VALUES
(1, 'Økonomi', 'f7b542'),
(2, 'EU', '8ab83b'),
(3, 'Integration', '6442f7'),
(4, 'Uddannelse', '66bd66'),
(5, 'Sundhed', 'e46c1c'),
(6, 'Velfærd', 'f1a80c'),
(7, 'Arbejdsmarked', 'c95797'),
(8, 'Trafik', 'da4444'),
(9, 'Ret', '38beb9'),
(10, 'Social', '429bf7'),
(11, 'Udvikling', '46f742'),
(12, 'Miljø', 'be8438'),
(13, 'Kultur', 'f742ca');

-- --------------------------------------------------------

--
-- Table structure for table `opstemmer`
--

CREATE TABLE IF NOT EXISTS `opstemmer` (
  `stemmeid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brugerid` int(10) unsigned NOT NULL,
  `sagid` int(10) unsigned NOT NULL,
  `stemme` tinyint(4) NOT NULL,
  PRIMARY KEY (`stemmeid`),
  UNIQUE KEY `unikstemme` (`brugerid`,`sagid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `opstemmer`
--

INSERT INTO `opstemmer` (`stemmeid`, `brugerid`, `sagid`, `stemme`) VALUES
(1, 1, 15, 1),
(2, 1, 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `partier`
--

CREATE TABLE IF NOT EXISTS `partier` (
  `id` varchar(2) NOT NULL,
  `bogstav` varchar(1) NOT NULL,
  `navn` varchar(30) NOT NULL,
  `kortnavn` varchar(10) NOT NULL,
  `farve` varchar(6) NOT NULL,
  `blok` tinyint(4) NOT NULL,
  `mandater` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bogstav` (`bogstav`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `partier`
--

INSERT INTO `partier` (`id`, `bogstav`, `navn`, `kortnavn`, `farve`, `blok`, `mandater`) VALUES
('a', 'A', 'Socialdemokraterne', 'Soc.dem.', 'b80800', 0, 47),
('aa', 'Å', 'Alternativet', 'Alt.', '2a9138', 0, 1),
('b', 'B', 'Radikale Venstre', 'Rad. V.', '733380', 0, 17),
('c', 'C', 'Det Konservative Folkeparti', 'Kons.', 'a1bd29', 1, 8),
('f', 'F', 'Socialistisk Folkeparti', 'SF', 'de0a78', 0, 12),
('i', 'I', 'Liberal Alliance', 'Lib. All.', '21c7d1', 1, 9),
('k', 'K', 'Kristendemokraterne', 'Krist.dem.', '8f8a75', 1, 0),
('o', 'O', 'Dansk Folkeparti', 'DF', 'f8d95a', 1, 22),
('oe', 'Ø', 'Enhedslisten', 'Enhedsl.', 'f0801a', 0, 12),
('v', 'V', 'Venstre', 'Venstre', '055ca3', 1, 47);

-- --------------------------------------------------------

--
-- Table structure for table `partiholdninger`
--

CREATE TABLE IF NOT EXISTS `partiholdninger` (
  `delta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `partibogstav` varchar(2) NOT NULL,
  `sagid` int(10) unsigned NOT NULL,
  `tekst` text NOT NULL,
  `opdateret` datetime NOT NULL,
  PRIMARY KEY (`delta`),
  KEY `partibogstav` (`partibogstav`),
  KEY `sagid` (`sagid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=199 ;

--
-- Dumping data for table `partiholdninger`
--

INSERT INTO `partiholdninger` (`delta`, `partibogstav`, `sagid`, `tekst`, `opdateret`) VALUES
(1, 'a', 1, '<ul>\r\n<li>Vi vil hvert år bruge flere penge på fælles velfærd.</li>\r\n<li>Vi går ikke ind for nulvækst i det offentlige. Det udhuler vores velfærdssamfund</li>\r\n<li>Nulvækst vil betyde 20 mia. kroner mindre til velfærd og 28.000 færre offentligt ansatte.</li>\r\n</ul>', '0000-00-00 00:00:00'),
(2, 'b', 1, '<ul>\r\n<li>Vi skal løbende udvikle vores velfærd i takt med fx flere ældre og flere patienter på danske sygehuse.</li>\r\n<li>Vi går ikke ind for nulvækst i det offentlige. I stedet skal vi lave reformer i Danmark, så der bliver råd til bedre velfærd.</li>\r\n<li>I vores program er der plads til at bruge tre mia. kroner mere om året på velfærd.</li>\r\n</ul>', '0000-00-00 00:00:00'),
(3, 'c', 1, '<ul>\r\n<li>Den offentlige sektor skal ikke vokse.</li>\r\n<li>Offentlig nulvækst er nødvendig, hvis vi skal få vækst i økonomien ved at sænke skatter og afgifter.</li>\r\n<li>Spørgsmålet er afgørende for, om K vil gå med i en regering.</li>\r\n</ul>', '0000-00-00 00:00:00'),
(4, 'f', 1, '<ul>\r\n<li>SF kæmper for en stærk offentlig sektor.</li>\r\n<li>Nulvækst vil have store konsekvenser for vores velfærd, både for de danskere, der bliver fyret, og for dem, der er afhængig af pædagoger, hjemmehjælpere og andre.</li>\r\n</ul>', '0000-00-00 00:00:00'),
(5, 'i', 1, '<ul>\r\n<li>Den offentlige sektor skal gøres meget mindre og vi skal have færre offentligt ansatte.</li>\r\n<li>Vi bruger for mange kræfter på registrering, endeløst bureaukrati og og meningsløse projekter, der ikke er til gavn for borgerne.</li>\r\n<li>Der skal spares 90 mia. kr. på det offentlige budget om året. Ikke på ''varme hænder'', men bureaukrati, ulandsbistand og andet.</li>\r\n</ul>', '0000-00-00 00:00:00'),
(6, 'k', 1, '<ul><li>?</li></ul>', '0000-00-00 00:00:00'),
(7, 'o', 1, '<ul>\r\n<li>Vi er imod nulvækst. Vi skal give borgerne en ordentlig service.</li>\r\n<li>Samfundet udvikler sig, behandlinger bliver dyrere, og der kommer flere ældre. Derfor koster det flere penge bare at holde samme standard.</li>\r\n<li>Der skal ikke skæres i antallet af varme hænder.</li>\r\n</ul>', '0000-00-00 00:00:00'),
(8, 'v', 1, '<ul>\r\n<li>Den offentlige sektor skal være effektiv og serviceorienteret, så skatteydernes penge bruges bedst muligt.</li>\r\n<li>Vi skal stopppe væksten i de offentlige udgifter. De skal kun stige i takt med prisudviklingen.</li>\r\n<li>Den offentlige sektor kan godt vokse et sted, hvis man sparer et andet, så det samlet går i nul.</li>\r\n</ul>', '0000-00-00 00:00:00'),
(9, 'oe', 1, '<ul>\r\n<li>Vi vil sikre et markant løft finansieringen af velfærd og sundhed efter de senere års drastiske beskæringer.</li>\r\n<li>Et stærkt velfærdssamfund er ikke bare socialt retfærdigt; det skaber også en sund økonomi.</li>\r\n</ul>', '0000-00-00 00:00:00'),
(10, 'aa', 1, '<ul>\r\n<li>Politikerne skal vise langt større tillid til den offentlige sektor.</li>\r\n<li>Den behøver ikke nødvendigvis at være større, end den er i dag, på nogle områder kunne den godt blive mindre.</li>\r\n</ul>', '0000-00-00 00:00:00'),
(11, 'a', 3, '<ul>\r\n<li>Flygtninge og indvandrere skal hurtigst muligt i arbejde, ud blandt kolleger og lære sproget. Alt for mange indvandrere er ikke i job. De skal ikke gøres til klienter.</li>\r\n<li>Flygtninge skal fra dag ét kunne tilbydes job, og man skal tage det job, man bliver tilbudt, ellers bliver man trukket i de penge, man får af det offentlige.</li>\r\n<li>De, der modtager kontanthjælp, skal tage et nyttejob, for eksempel at rydde op på strande eller hjælpe på plejehjem.</li>\r\n<li>Det er regeringens mål, at 10.000 flere indvandrere og efterkommere kommer i arbejde inden år 2020.</li>\r\n</ul>', '0000-00-00 00:00:00'),
(12, 'b', 3, '<ul>\r\n<li>At sikre muligheder for at komme i arbejde er vigtigt for integration og medborgerskab.</li>\r\n<li>Indvandrere og flygtninge skal ikke  have hårdere behandling end andre ledige.</li>\r\n<li>Praktik, ansættelse med jobtilskud, brug af voksenlærlinge, støtte til virksomheder og mere brug af erhvervsmentorordninger er veje frem for at få flere indvandrere og efterkommere i arbejde.</li>\r\n</ul>', '0000-00-00 00:00:00'),
(13, 'c', 3, '<ul>\r\n<li>Flygtninge og indvandrere på kontanthjælp fremover skal arbejde for deres sociale ydelser.</li>\r\n<li>Genindførelse af starthjælp og kontanthjælpsloft skal gøre det mere attraktivt for flygtninge og indvandrere at tage et arbejde.</li>\r\n<li>Vi skal ikke importere mere arbejdskraft, når Danmark samtidig har udgifter til indvandrere, der allerede er her og går ledige.</li>\r\n</ul>', '0000-00-00 00:00:00'),
(14, 'f', 3, '<ul>\r\n<li>Flere flygtninge og indvandrere skal i arbejde. Men vi vil bruge gulerod frem for pisk: for eksempel via partnerskaber med gartnerier og rengøringsfirmaer.</li>\r\n<li>Det offentlige skal tage større ansvar – og virksomhederne skal aktivt arbejde med mangfoldighed.</li>\r\n<li>Et rejsehold skal hjælpe kommunerne til at forbedre deres indsats og få et bedre overblik.</li>\r\n</ul>', '0000-00-00 00:00:00'),
(15, 'i', 3, '<ul>\r\n<li>Lavere sociale ydelser skal give flygtninge og indvandrere større tilskyndelse til at finde et job.</li>\r\n<li>Støtter grundlæggende Venstres forslag.</li>\r\n</ul>', '0000-00-00 00:00:00'),
(16, 'k', 3, '<ul>\r\n<li>?</li>\r\n</ul>', '0000-00-00 00:00:00'),
(17, 'o', 3, '<ul>\r\n<li>Først og fremmest skal tilstrømningen af flygtninge og indvandrere til Danmark standses. Ellers er det en illusion at tro, at det er muligt at integrere dem, der er i landet.</li>\r\n<li>De offentlige ydelser til indvandrere skal sættes ned og folk, der kommer udefra, skal ikke fra første dag have ret til at få de samme ydelser og samme velfærd som danske statsborgere. Det vil betyde, at det vil kunne betale sig for udlændinge at tage et arbejde.</li>\r\n<li>Målet med integrationslovgivningen er, indvandrere indgår i samfundslivet på linje med danske statsborgere: Altså på lige fod, når det gælder uddannelse, arbejde og i fritids- og kulturaktiviteter.</li>\r\n</ul>', '0000-00-00 00:00:00'),
(18, 'v', 3, '<ul>\r\n<li>Indvandrere skal i job og uddannelse i samme omfang som øvrige danskere. De skal stå til rådighed for arbejdsmarkedet så tidligt som muligt, helst fra dag 1.</li>\r\n<li>Det er vigtigt, at det kan betale sig at arbejde.</li>\r\n<li>Kommunernes skal måles på, om de er gode til at få udlændinge i arbejde eller uddannelse. De bedste kommuner skal belønnes med op mod én milliard kroner.</li>\r\n</ul>', '0000-00-00 00:00:00'),
(19, 'oe', 3, '<ul>\r\n<li>Arbejdsmarkedet skal indrettes langt mere socialt end i dag.</li>\r\n<li>Der skal skabes reelle jobmuligheder til flygtninge og indvandrere, som i dag ikke kan få et arbejde, fordi de ikke kan yde 100 procent fra dag 1.</li>\r\n<li>Kravet til kommunerne skal være realistisk: Har man høj arbejdsløshed, har man heller ikke de store muligheder for at skaffe arbejde til hverken flygtninge, indvandrere eller andre uden for arbejdsmarkedet.</li>\r\n</ul>', '0000-00-00 00:00:00'),
(20, 'a', 2, '<ul>\r\n<li>Vi ønsker et nyt dagpengesystem og en beskæftigelsesreform, der hurtigere får ledige i arbejde.</li>\r\n<li>Genoptjeningsreglerne skal nytænkes. Lønmodtagerne skal have et incitament til at tage korte ansættelser.</li>\r\n<li>Det er uholdbart, hvis det ikke kan betale sig for dagpengemodtagere at tage et job uanset længde.</lI>\r\n<li>Dagpengesystemet må ikke blive dyrere.</li>\r\n</ul>', '0000-00-00 00:00:00'),
(21, 'f', 2, '<ul>\r\n<li>Genoptjeningsperioden skal forkortes.</li>\r\n<li>Det helt afgørende er selvfølgelig, at man kan se den gulerod, der er ved at tage et vikariat på seks måneder, og man så igen har genoptjent retten til dagpenge. Derfor vil vores krav til finansloven også fortsat være at halvere genoptjeningskravet.</li>\r\n</ul>', '0000-00-00 00:00:00'),
(22, 'o', 2, '<ul>\r\n<li>Dansk Folkeparti foreslår, at dagpengeperioden ikke er lagt fast, men i stedet følger økonomien.</li>\r\n<li>Når det er dårlige tider, skal der være længere dagpengeperiode og kortere optjening.</li>\r\n<li>I gode tider skal der være kortere dagpengeperiode og længere optjening.</li>\r\n<li>Det er et krav fra DF, at systemet ændres efter et valg, hvis DF får indflydelse.</li>\r\n</ul>', '0000-00-00 00:00:00'),
(23, 'i', 2, '<ul>\r\n<li>Dagpengeperioden skal være kortere end i dag - ned til 1 år. Og så skal satserne være lavere.</li>\r\n</ul>', '0000-00-00 00:00:00'),
(24, 'c', 2, '<ul>\r\n<li>Konservative vil belønne folk, der har været på arbejdsmarkedet i mange år.</li>\r\n<li>Man skal have været på arbejdsmarkedet mindst 12 år, for at få ret til to års dagpenge. Disse folk skal så også have ret til til 21.000 kr om måneden, men aftrappes hvert kvartal.</li>\r\n<li>Har man været på arbejdsmarkedet under seks år, er dagpengeperioden kun et år.</li>\r\n</ul>', '0000-00-00 00:00:00'),
(25, 'oe', 2, '<ul>\r\n<li>Helt centralt krav for at støtte en ny regering, at dagpengesystemet laves om.</li>\r\n<li>Enhedslisten har fremsat en lang række konkrete forslag til ændringer af reglerne, fx xxx og xxxx.</li>\r\n</ul>', '0000-00-00 00:00:00'),
(26, 'aa', 2, '<ul>\r\n<li>Vil erstatte dagpenge med en basisydelse, som gives til folk uden krav om at stå til rådighed for arbejdsmarkedet.</li>\r\n</ul>', '0000-00-00 00:00:00'),
(27, 'v', 2, '<ul>\r\n<li>"Hvis man inden for rammerne af den økonomi, der er i vores dagpengesystem, kan lave et mere intelligent system, er det ikke noget, jeg på forhånd vil afvise" – Lars Løkke Rasmussen</li>\r\n</ul>', '0000-00-00 00:00:00'),
(28, 'b', 2, '<ul>\r\n<li>Ønsker ikke ændringer af det nuværende system.</li>\r\n</ul>', '0000-00-00 00:00:00'),
(29, 'v', 4, 'Nej. Skoledagene er tilpas lange. Venstre gik efter at få hævet det faglige niveau med den nye folkeskolereform, og det fik vi sat en god ramme for.', '0000-00-00 00:00:00'),
(30, 'i', 4, 'Ja. Eleverne har fået alt for lange skoledage. Det betyder, at nogle børn ikke kan komme til de fritidsinteresser, de tidligere ville dyrke.', '0000-00-00 00:00:00'),
(31, 'k', 4, 'Ja. Elever skal have fri om eftermiddagen, så de kan selv bestemme, hvad de skal gå til. Det drejer sig om dannelse, om forældrenes mulighed for at være sammen med børnene, og om, at man får ikke en bedre skole ved at proppe eleverne ind i skolen hele dagen.', '0000-00-00 00:00:00'),
(32, 'aa', 4, 'Ja. Selvom der er mange gode ideer i folkeskolereformen, så har eleverne fået for lange dage.', '0000-00-00 00:00:00'),
(33, 'oe', 4, 'Ja. Vi er meget uenige i regeringen og højrefløjens skolereform. Man tromlede hen over lærerne, og det er et problem, at man stopper én slags skole ned i halsen på alle elever - blandt andet fordi de får nogle meget lange skoledage.', '0000-00-00 00:00:00'),
(34, 'b', 4, 'Nej. Eleverne har fået en alsidig dag, som veksler mellem læring, leg og andre aktiviteter, herunder lektielæsning.', '0000-00-00 00:00:00'),
(35, 'c', 4, 'Ja. Eleverne har fået for lange skoledage. Vi ønsker, at de tvungne lektiecafeer bliver pillet ud af folkeskolereformen.', '0000-00-00 00:00:00'),
(36, 'o', 4, 'Grundlæggende nej. Men det er vigtigt, at skoledagen kommer til at fungere med det idrætsliv og de fritidstilbud, der er. Det er en vigtig opgave for skolerne', '0000-00-00 00:00:00'),
(37, 'a', 4, 'Nej, men forhåbentlig får de en bedre skoledag. Vi giver dem flere timer i dansk og matematik, men samtidig får man mere bevægelse og flere forskellige måder at blive undervist på. Så alt i alt forhåbentlig meget bedre.', '0000-00-00 00:00:00'),
(38, 'f', 4, 'Folkeskolereformen gør, at børnene både laver lektier og har deres fritidsaktiviteter på skolen. Så alt i alt bruger eleverne mindre tid på at være i skolen. Derfor er det en meget passende længde.', '0000-00-00 00:00:00'),
(39, 'v', 5, 'Nej. Afgiften på cigaretter skal ikke sættes op. Vi har i denne periode lavet en aftale med regeringen om at hæve afgifterne, og derudover ønsker vi ikke at sætte afgifterne op.', '0000-00-00 00:00:00'),
(40, 'i', 5, 'Nej, afgiften skal sættes ned, så vi ikke får nær så meget grænsehandel.', '0000-00-00 00:00:00'),
(41, 'k', 5, 'Ja. Sundhedsudgifterne i Danmark stiger. Hvis vi på den enkle måde kan nedbringe antallet af syge mennesker og få mere livskvalitet, så er det klart en vej, vi skal gå.', '0000-00-00 00:00:00'),
(42, 'aa', 5, 'Ja. Afgiften skal helt sikkert sættes op. Det, der er usundt, skal koste mere, og det, der er sundt, skal koste mindre.', '0000-00-00 00:00:00'),
(43, 'oe', 5, 'Ja. Afgiften på cigaretter skal sættes op, fordi vi ved, at det får flere til at holde op med at ryge. Men der er en social problemstilling i det: Det rammer dem, der tjener mindst, hårdest, og derfor skal de, der tjener mindst, løftes økonomisk.', '0000-00-00 00:00:00'),
(44, 'b', 5, 'Ja, hvis det kan ske, uden at salget bare flytter til udlandet, og det kan bidrage til en øget folkesundhed.', '0000-00-00 00:00:00'),
(45, 'c', 5, 'Nej, vi synes ikke, at afgifterne på cigaretterne skal sættes op. Det er et personligt ansvar, om man vil ryge.', '0000-00-00 00:00:00'),
(46, 'o', 5, 'Udgangspunktet er, at afgifter på cigaretter ikke skal sættes op. Men hvis tyskerne sætter afgiften op, kan Danmark også gøre det, uden at der kommer mere grænsehandel.', '0000-00-00 00:00:00'),
(47, 'a', 5, 'Hverken-eller. Vi har tidligere gjort det af hensyn til folkesundheden og for at forhindre unge mennesker i at starte med at ryge. ', '0000-00-00 00:00:00'),
(48, 'f', 5, 'Ja, afgiften på cigaretter skal sættes op, for alt for mange unge begynder at ryge, og det har vi ingen interesse i i Danmark.', '0000-00-00 00:00:00'),
(49, 'v', 6, 'Nej. Venstre går ikke ind for, at et besøg hos lægen skal koste noget. Men vi vil godt diskutere, om brugerbetaling generelt er fordelt rigtigt, når det for eksempel koster noget at gå til tandlæge, mens det andre steder ikke koster noget.', '0000-00-00 00:00:00'),
(50, 'i', 6, 'Ja, principielt mener Liberal Alliance, at et besøg hos den praktiserende læge skal koste penge. Men vi har indgået en aftale med de andre partier i blå blok om, at vinder vi valget, så kommer der ikke brugerbetaling i denne valgperiode. Og det løfte overholder vi naturligvis.', '0000-00-00 00:00:00'),
(51, 'k', 6, 'Nej, det skal det ikke. Vi risikerer, at folk ikke kommer til lægen tids nok, og så bliver det langt mere kompliceret og dyrere at behandle folk.', '0000-00-00 00:00:00'),
(52, 'aa', 6, 'Der skal ikke være brugerbetaling i sundhedsvæsenet, men der er i forvejen nogle helt ulogiske forskelle: Det er gratis at gå til lægen, men det koster kassen at gå til tandlægen. Så vi bliver nødt til at finde ud af, hvordan vi gør det smartere.', '0000-00-00 00:00:00'),
(53, 'oe', 6, 'Nej, det skal overhovedet ikke koste penge at gå til lægen. Det skal betales over skatten. Det er så vigtigt at holde fast i, at sundhed finansierer vi i fællesskab over skatten. Det må aldrig nogensinde være vores pengepung, der afgør, om vi får den behandling, vi har behov for.', '0000-00-00 00:00:00'),
(54, 'b', 6, 'Nej. Vi har ikke brug for mere brugerbetaling i sundhedsvæsenet. Men vi skal turde kikke på, om den er rimeligt fordelt. For det er meget dyrt at gå til tandlægen, og det rammer folk, der ikke har mange penge.', '0000-00-00 00:00:00'),
(55, 'c', 6, 'Nej, umiddelbart synes vi ikke, at det skal koste penge at gå til lægen. Men vi vil gerne se på hele sundhedsvæsenet og brugerbetaling, for der er noget uretfærdigt i, at man betaler meget for at gå til tandlægen, men intet for at gå til lægen.', '0000-00-00 00:00:00'),
(56, 'o', 6, 'Nej, et lægebesøg skal ikke koste penge. Vi ønsker ikke mere brugerbetaling i vores sundhedsvæsen.', '0000-00-00 00:00:00'),
(57, 'a', 6, 'Nej. Det må aldrig blive sådan, at man skal overveje økonomien, før man tager til lægen, hvis man sidder derhjemme med et sygt barn eller mærker en underlig knude.', '0000-00-00 00:00:00'),
(58, 'f', 6, 'Nej, det er vigtigt, at alle har adgang til velfærden i Danmark. Og en af kerneydelserne er adgangen til lægen. Begynder man at lave en pris på det, bliver folk mere syge, og så havner de i vores sundhedssystem. Det er dyrere for systemet og skadeligt for den enkelte.', '0000-00-00 00:00:00'),
(59, 'v', 7, 'Ja. I Venstre har vi bestemt ikke noget imod private aktører. For os handler det om, at kvaliteten er god, og at de ældre får noget for pengene.', '0000-00-00 00:00:00'),
(60, 'i', 7, 'Ja, mere af ældreplejen skal foretages af private, ligesom Thyra gjorde det med plejehjemmet Lotte.', '0000-00-00 00:00:00'),
(61, 'k', 7, 'Nej. Men vi kan gå med til, at borgeren selv kan få 80% af den udgift, kommunen bruger til at servicere borgeren, og så kan man selv finde et privat tilbud, der passer.', '0000-00-00 00:00:00'),
(62, 'aa', 7, 'Ikke som udgangspunkt. Der er er nogle spændende muligheder for samarbejde mellem offentligt og privat, men vi går ikke ind privatisering som princip.', '0000-00-00 00:00:00'),
(63, 'oe', 7, 'Nej. Vi mener bestemt ikke, at ældreplejen skal udliciteres til private virksomheder. Der er ingen dokumentation for, at det skaber bedre ældrepleje. Og hvorfor skal private virksomheder tjene penge på, at vores ældre har behov for omsorg? Hvorfor skal skattekronerne ikke gå til de ældre frem for de private virksomheder?', '0000-00-00 00:00:00'),
(64, 'b', 7, 'Det overlader vi trygt til kommunerne at tage stilling til. Det afgørende er ikke, hvem der udfører opgaven, men at den bliver udført godt, til gavn og glæde for de ældre.', '0000-00-00 00:00:00'),
(65, 'c', 7, 'Ja, det vil være dejligt, hvis mere ældrepleje blev udliciteret. Vi tror på, at fri konkurrence fører til bedre kvalitet, og det kommer de ældre medborgere til gavn', '0000-00-00 00:00:00'),
(66, 'o', 7, 'Dansk Folkeparti mener ikke, at det er en god ide at udlicitere mere inden for ældreplejen. Det er vigtigt, at det er en offentlig opgave at få hjulpet vore ældre, der har behov for pleje.', '0000-00-00 00:00:00'),
(67, 'a', 7, 'Nej. Vi skal ikke tvinge en bestemt kvote af privatisering eller udlicitering ned over kommunerne, som de borgerlige vil. Nogle kommuner har et samarbejde med private, som de er glade for. Det skal de have lov til, men vi vil ikke lave tvangskvoter.', '0000-00-00 00:00:00'),
(68, 'f', 7, 'Nej, ældreplejen skal ikke udliciteres. Vi kan se nogle forfærdelige eksempler fra blandt andet Sverige, hvor virksomhederne efterfølgende er gået konkurs, og det er ikke sjovt, når man oplever ens mor eller far kommer i klemme i et privat cirkus.', '0000-00-00 00:00:00'),
(69, 'v', 8, 'Nej. Vi er tilfredse med den dagpengereform, vi fik vedtaget i sin tid. Men hvis man kunne indrette det bedre inden for den samme økonomiske ramme, vil vi selvfølgelig være lydhøre over for det.', '0000-00-00 00:00:00'),
(70, 'i', 8, 'Nej, vi synes ikke, at det skal være nemmere at få dagpenge, end det er i øjeblikket. Vi er rigtigt glade for den dagpengereform, der er lavet.', '0000-00-00 00:00:00'),
(71, 'k', 8, 'Ja, helt klart. Vi har en model i Danmark, der bygger på stor tryghed. Den er vi begyndt at rokke ved. Konsekvensen er, at folk er begyndt at spare mere op i stedet for at investere pengene, og det er faktisk dårligt for dansk økonomi.', '0000-00-00 00:00:00'),
(72, 'aa', 8, 'Det er vigtigt, at vi gør noget ved dagpengeproblemet. Det er sørgeligt med de folk, som ryger ud af dagpengesystemet. Vi bliver nødt til at gøre det mere fleksibelt.', '0000-00-00 00:00:00'),
(73, 'oe', 8, 'Dagpengereformen er en kæmpemæssig katastrofe og bør laves om. Blandt andet skal vi sikre, at det bliver lettere at optjene ret til dagpenge. Det vil skabe langt større tryghed og sikkerhed for alle lønmodtagere i Danmark.', '0000-00-00 00:00:00'),
(74, 'b', 8, 'Vi synes, at der er en god balance i det nuværende system. Hvis man arbejder fire måneder af året, så er man berettiget til dagpenge resten af året. Men vi er selvfølgelig glade for, at en dagpengekommission nu arbejder, så vi kan få et godt og moderne dagpengesystem alt i alt.', '0000-00-00 00:00:00'),
(75, 'c', 8, 'Umiddelbart synes vi ikke, at man skal kunne optjene hurtigere dagpengeret. Men vi anerkender også, at der kan være nogle udfordringer, blandt andet i forhold til sæsonarbejde. Og det skal heller ikke være sådan, at vi har et system, der forhindrer folk i at tage ledigt arbejde.', '0000-00-00 00:00:00'),
(76, 'o', 8, 'Vi er tilhængere af, at man nemmere kan optjene ret til dagpenge. Vi har foreslået, at man halverer den periode, der skal til for at optjene retten til dagpenge. Det vil sige et halvt år i stedet for et år.', '0000-00-00 00:00:00'),
(77, 'a', 8, 'Vi var meget imod den dagpengereform, som Kristian Thulesen Dahl og Lars Løkke lavede, og vi stemte imod. Vi har brugt mange milliarder på at afbøde konsekvenserne. Men nu har vi lavet en kommission, der skal komme med anbefalinger, og den venter vi på.', '0000-00-00 00:00:00'),
(78, 'f', 8, 'Den skal gøres kortere. Vi ønsker, at man skal arbejde seks måneder og så have ret til dagpenge, og det betyder, at genoptjeningsretten skal sættes ned til seks måneder i stedet for det, den er i dag, nemlig 12 måneder.', '0000-00-00 00:00:00'),
(79, 'v', 9, 'Nej. Arbejdsmarkedets parter, altså fagbevægelsen og arbejdsgiversiden, er de bedste til at aftale, hvordan det skal være.', '0000-00-00 00:00:00'),
(80, 'i', 9, 'Nej, Liberal Alliance er imod det, der hedder kædeansvar, hvor en virksomhed får ansvar for alle de virksomheder, den handler med.', '0000-00-00 00:00:00'),
(81, 'k', 9, 'Ja. Det er den enkleste måde at sørge for, at vi får de skatteindbetalinger, vi skal have, og at der bliver givet løn på et niveau, så vi undgår social dumping.', '0000-00-00 00:00:00'),
(82, 'aa', 9, 'Det skal de. Firmaerne skal have en social politik, så vi ved, hvilke vilkår varer bliver produceret under.', '0000-00-00 00:00:00'),
(83, 'oe', 9, 'Ja. Vi går ind for kædeansvar, som det hedder i Enhedslisten. Det vil være et effektivt redskab til at bekæmpe social dumping. Vi undgår alle underselskaberne, der snyder med lønnen og snyder med skatten', '0000-00-00 00:00:00'),
(84, 'b', 9, 'Der er god grund til at lave aftaler med leverandører om, at alle regler bliver overholdt. Men det er ikke noget, vi skal lovgive om i Folketinget.', '0000-00-00 00:00:00'),
(85, 'c', 9, 'Nej. Virksomhederne skal stå til ansvar for deres eget virke, de skal ikke stå til ansvar for deres underleverandører. Vi er imod kædeansvar', '0000-00-00 00:00:00'),
(86, 'o', 9, 'Ja, vi har foreslået det, der hedder kædeansvar, hvor den, der får en ordre, også har pligt til at sørge for, at dem længere nede i kæden faktisk overholder reglerne.', '0000-00-00 00:00:00'),
(87, 'a', 9, 'Ja. Sociale klausuler og kædeansvar kan være rigtigt vigtigt. Vi vil ikke lovgive om, at det skal gælde overalt, for det fraråder CO-industri. Men vi har givet mulighed for, at man kan bruge flere sociale klausuler, og det er den rigtige vej at gå.', '0000-00-00 00:00:00'),
(88, 'f', 9, 'Selvfølgelig skal de det. Virksomheder et større ansvar end lige deres egen profitlinje, de har et samfundsansvar. Man skal have styr på sine underleverandører, og man skal ansætte lærlinge. ', '0000-00-00 00:00:00'),
(89, 'v', 10, 'Nej. Vækst i den offentlige sektor er ikke vigtigere end skattelettelser. Tværtimod ønsker vi et samfund, hvor skatten skal sættes ned, både for virksomheder og for de små arbejdsindkomster.', '0000-00-00 00:00:00'),
(90, 'i', 10, 'Nej, vi har en af de største offentlige sektorer i hele verden. Vi har brug for en mindre offentlig sektor, så vi kan få lavere skatter og gang i den private vækst.', '0000-00-00 00:00:00'),
(91, 'k', 10, 'Vi skal fastholde en offentlig sektor på det nuværende niveau. Men vi skal omlægge, så vi får mindre kontrol og flere varme hænder.', '0000-00-00 00:00:00'),
(92, 'aa', 10, 'Det synes vi ikke. Vi har rigtigt mange ressourcer bundet til den offentlige sektor - og det skal der også være. Men vi går ikke nødvendigvis ind for en større offentlig sektor.', '0000-00-00 00:00:00'),
(93, 'oe', 10, 'Ja. Det giver ikke mening at blive ved med at give skatterabatter til dem, der tjener mest, samtidig med at vi kan se, at vi har ældre på plejehjemmene og børn i børnehaverne, der ikke får den omsorg, de har behov for.', '0000-00-00 00:00:00'),
(94, 'b', 10, 'Det er vigtigt, at vi investerer i den fælles velfærd i de kommende år. Det har vi skabt råderum for. Men det er også vigtigt, at vi letter skatten på arbejde - og derfor kan man godt begge dele.', '0000-00-00 00:00:00'),
(95, 'c', 10, 'Nej. Vækst i den offentlige sektor bliver aldrig vigtigere end at give pengene tilbage til borgerne.', '0000-00-00 00:00:00'),
(96, 'o', 10, 'Ja, det er vigtigt at have en beskeden vækst i de offentlige udgifter. Skulle der også blive plads til skattelettelser, så er det kun godt.', '0000-00-00 00:00:00'),
(97, 'a', 10, 'Ja. Hvis vi vil beholde et velfærdssamfund, hvor vi tager os af hinanden, og du ikke skal have penge op af lommen, når du skal på sygehuset, er det vigtigt, at vi har plads til en lille vækst i den offentlige sektor. Det prioriterer vi.', '0000-00-00 00:00:00'),
(98, 'f', 10, 'Vi skal have vækst i den offentlige sektor, ikke mindst fordi vi får 90.000 flere ældre inden 2020. Hvis ikke vi får vækst, betyder det, at sosu-assistenten enten skal løbe hurtigere, eller at de ældre får en dårligere pleje.', '0000-00-00 00:00:00'),
(99, 'v', 11, 'Nej. I en lang periode har vi prioriteret den offentlige og kollektive transport, og nu er det vigtigt for os at få nogle gode veje i forhold til privatbilismen. ', '0000-00-00 00:00:00'),
(100, 'i', 11, 'Nej, vi synes, at der skal være en balance. Der skal være en ordentlig offentlig trafik, men vi synes, at bilerne og vejene er blevet underprioritet i mange år ', '0000-00-00 00:00:00'),
(101, 'k', 11, 'Ja. Vi hælder alt for meget asfalt på og laver trebanede motorveje. Det kan ikke være rigtigt. Vi får bare flere og flere biler, desto flere veje, vi får.', '0000-00-00 00:00:00'),
(102, 'aa', 11, 'Vi skal helt klart prioritere kollektiv trafik frem for privatbilisme. Vi skal gøre det, der styrker miljøet.', '0000-00-00 00:00:00'),
(103, 'oe', 11, 'Ja. Over de seneste mange år er det blevet dyrere at bruge bussen eller toget sammenlignet med at køre i bil. Det er en rigtig dårlig ide, for vi vil gerne have flere til at bruge den kollektive trafik.', '0000-00-00 00:00:00'),
(104, 'b', 11, 'Ja. Den kollektive trafik er helt afgørende for, at vi ikke kommer til at holde i køer på alle landets motorveje, og vi forbinder landet bedre. Derfor har vi blandt andet lavet en togfond, der sikrer, at man kan komme hurtigt rundt mellem de store byer - og fra oplandet ind til de store byer.', '0000-00-00 00:00:00'),
(105, 'c', 11, 'Nej. Vi ønsker at styrke privatbilismen, og vi ønsker at udvide motorvejsnettet, så vi kommer af med kapacitetsproblemer. Når det er sagt, så ønsker vi også at styrke den kollektive trafik.', '0000-00-00 00:00:00'),
(106, 'o', 11, 'Nej. Det er vigtigt, at der er en balance mellem investeringer i kollektiv trafik i forhold til privatbilisme. Nogle steder er det godt med privatbilisme, andre steder fungerer det kollektive trafiknet godt.', '0000-00-00 00:00:00'),
(107, 'a', 11, 'Det er vigtigt, at man både investerer i den kollektive trafik og i, at man kan køre i sin private bil. Men i de år, der kommer, prioriterer vi den kollektive trafik højest, blandt andet med togfonden, som sikrer kæmpe forbedring af vores kollektive transport.', '0000-00-00 00:00:00'),
(108, 'f', 11, 'Ja, det skal den. Togfonden er et eksempel på, hvordan vi flytter penge fra nordsøolien til at få bedre og hurtigere toge, der er til fordel for os alle. Den linje skal vi fortsætte af. ', '0000-00-00 00:00:00'),
(109, 'v', 12, 'Ja. Straffen skal skærpes. Vi halter bagud på det felt: Man slipper simpelthen for billigt.', '0000-00-00 00:00:00'),
(110, 'i', 12, 'Ja, Liberal Alliance ønsker at skærpe straffen fire steder: vold, voldtægt, trusler og overgreb mod børn.', '0000-00-00 00:00:00'),
(111, 'k', 12, 'Ja, straffen for grov vold og voldtægt skal skærpes. Det kan ikke være rigtigt, at ofrene for et overgreb bagefter skal se voldtægtsforbryderen gå frit omkring.', '0000-00-00 00:00:00'),
(112, 'aa', 12, 'Det er et svært spørgsmål. På den ene side har vi retsfølelsen, som man skal tage alvorligt. Omvendt ved vi godt, at lange straffe ikke nødvendigvis er løsningen. Så vi siger forebyggelse, forebyggelse, forebyggelse.', '0000-00-00 00:00:00'),
(113, 'oe', 12, 'Nej. Vi har intet, der tyder på, at det vil betyde mindre vold og færre voldtægter. Til gengæld har vi et kæmpe problem med, at mange voldtægter ikke bliver meldt, og at ofrene ikke får den støtte, de har behov for. Der skal gøres noget.', '0000-00-00 00:00:00'),
(114, 'b', 12, 'Nej. Vi har ganske høje straffe i Danmark. Det vigtige er, at domstolene fastsætter straffene i forhold til forbrydelsens karakter.', '0000-00-00 00:00:00'),
(115, 'c', 12, 'Ja. Den skal skærpes. Det er grundlæggende uretfærdigt, at både grov vold og voldtægt straffes så mildt i dag. Det er uretfærdigt over for ofrene og alle i samfundet.', '0000-00-00 00:00:00'),
(116, 'o', 12, 'Ja, det er vigtigt, at vi sender et klart signal til kriminelle om, at man ikke skal begå kriminalitet, og derfor skal straffen op.', '0000-00-00 00:00:00'),
(117, 'a', 12, 'Ja, det skal vi overveje. Vi har dog ikke et konkret forslag lige nu.', '0000-00-00 00:00:00'),
(118, 'f', 12, 'Voldtægter er stadig et stort problem i Danmark. Det største problem er faktisk, at der er meget få domme på området. Vi skal gøre meget mere for at få kvinderne til at melde voldtægter.', '0000-00-00 00:00:00'),
(119, 'v', 13, 'Der skal lægges et moderne kontanthjælpsloft ind, så man ikke kan få 454.000 kroner i offentlige ydelser samlet set som familie, hvis man har tre børn. Det kan man i dag.', '0000-00-00 00:00:00'),
(120, 'i', 13, 'Ja, Liberal Alliance har foreslået, at vi sænker kontanthjælpen, sådan så man får et rådighedsbeløb, der svarer til det, man har i Sverige.', '0000-00-00 00:00:00'),
(121, 'k', 13, 'Nej, kontanthjælpen skal ikke sænkes. Vi skal sørge for, at der er en ordentlig løn i Danmark. Ellers bliver det en konkurrence om at sænke lønninger, sænke udgifter og sænke sociale ydelser. Det er den onde spiral nedad.', '0000-00-00 00:00:00'),
(122, 'aa', 13, 'Vi synes, at der er en fin balance mellem det, man får på kontanthjælp, og det, man får, når man starter på sit arbejde. Vi skal sikre ordentlige vilkår for den, der er på kontanthjælp, men selvfølgelig skal man også have fornemmelsen af, at det nytter noget at arbejde.', '0000-00-00 00:00:00'),
(123, 'oe', 13, 'Nej, hetzen mod de arbejdsløse er uforskammet. Der kommer ikke flere arbejdspladser ud af, at man gør de arbejdsløse fattigere. Det betyder bare, at de får et sværere liv. Det er ikke deres skyld, at der mangler arbejdspladser i Danmark. ', '0000-00-00 00:00:00'),
(124, 'b', 13, 'Nej. Vi skal ikke gøre folk fattige. Men vi skal sørge for, at man kan få lov til at beholde mere af sin løncheck selv, og det kan vi gøre, hvis vi laver en skattereform, der letter skatten på arbejde.', '0000-00-00 00:00:00'),
(125, 'c', 13, 'Vi ønsker et loft over de samlede kontantydelser, så man altid har en gevinst på 3.000 kroner ved at tage et arbejde. Desuden skal kontanthjælpen for par, hvor begge er på kontanthjælp, sænkes, så ydelsen afspejler de stordriftsfordele, der er, når man bor to i husstanden.', '0000-00-00 00:00:00'),
(126, 'o', 13, 'Nej, selve kontanthjælpen skal ikke sænkes. Vi ønsker et kontanthjælpsloft, så der er en grænse for, hvor meget man samlet kan få i offentlige ydelser, men selve kontanthjælpen skal ikke sænkes. ', '0000-00-00 00:00:00'),
(127, 'a', 13, 'Nej. Det kan allerede betale sig at arbejde i Danmark, og sådan skal det selvfølgelig være. Men hvis man skærer i kontanthjælpen, går det hårdt ud over børnefamilier, og det vil vi ikke være med til.', '0000-00-00 00:00:00'),
(128, 'f', 13, 'Det kan allerede i dag betale sig at arbejde. Vi skal ikke ændre på kontanthjælpen, vi skal gøre vilkårene bedre for dem, der er uden for arbejdsmarkedet, så de kommer i arbejde.', '0000-00-00 00:00:00'),
(129, 'v', 14, 'Ja, der bliver taget for mange hensyn. Det kan for eksempel være en daginstitution, hvor der ikke kan serveres frikadeller eller andre helt almindelige danske retter.', '0000-00-00 00:00:00'),
(130, 'i', 14, 'Ja. Der er en tendens til, at man kommer til at tage nogle misforståede hensyn til religiøse minoriteter. Selvfølgelig skal der være plads til, at man har en religion, men det skal være på en måde, så andre ikke skal tage overdrevne hensyn.', '0000-00-00 00:00:00'),
(131, 'k', 14, 'Nej, det synes vi ikke. Det kan selvfølgelig ikke være rigtigt, at man ikke f.eks. kan få dansk mad i en dansk børnehave. Men der skal tages hensyn til, at vi alle kan være der, så både jødiske, muslimske, ateister og kristne børn kan være sammen og lære hinanden at kende.', '0000-00-00 00:00:00'),
(132, 'aa', 14, 'Nej. Der bliver ikke taget for mange hensyn til religiøse minoriteter. Vi synes, at det er vigtigt, at stat og kirke bliver adskilt, men at der er en respekt for religiøse trosretninger.', '0000-00-00 00:00:00'),
(133, 'oe', 14, 'Man har ramt balancen meget godt. Det er vigtigt, at det ikke må gå ud over andre mennesker, når man udøver sin religion. Men vi mener, man har fundet en god balance lokalt.', '0000-00-00 00:00:00'),
(134, 'b', 14, 'Nej. Vi skal alle sammen være her. Vi skal ikke bestemme, om folk skal spise frikadeller på det ene eller andet tidspunkt. Det er vigtigt, at der er plads til os alle sammen.', '0000-00-00 00:00:00'),
(135, 'c', 14, 'Ja, det mener vi efterhånden, at de gør. Når vi ser, at der skal indrettes nye bederum på eksempelvis hospitaler, så ønsker vi først og fremmest, at det skal være kristne bederum.', '0000-00-00 00:00:00'),
(136, 'o', 14, 'Ja, der er nogle steder, hvor man tager for mange hensyn til religiøse minoriteter, blandt andet i forhold til kost. Det skal vi selvfølgelig lade være med.', '0000-00-00 00:00:00'),
(137, 'a', 14, 'Nej, ikke generelt. Men der kan være eksempler, hvor de gør, for eksempel når vi diskuterer frikadeller i daginstitutionerne. Men generelt er vi på et passende niveau.', '0000-00-00 00:00:00'),
(138, 'f', 14, 'Når man lever i Danmark, så er man i den danske kultur, og det gælder også maden. Men vi er mange forskellige folk, der skal leve sammen, og det skal man tage hensyn til. Et badeforhæng i svømmehallen er i orden. Det er den balance, vi skal finde.', '0000-00-00 00:00:00'),
(139, 'v', 15, 'Vi ønsker et slankere EU, men til gengæld et EU, der blander sig i de ting, der er relevante.', '0000-00-00 00:00:00'),
(140, 'i', 15, 'Ja, EU bestemmer for meget. Vi vil gerne have EU tilbage til at handle om kerneværdierne: fred, frihed og frihandel.', '0000-00-00 00:00:00'),
(141, 'k', 15, 'Ja, i for mange forhold, og i nogle forhold bestemmer de for lidt. For eksempel burde det være en klar EU-opgave at fordele flygtninge ud mellem alle medlemslandene.', '0000-00-00 00:00:00'),
(142, 'aa', 15, 'På nogle områder bestemmer EU for meget, på andre områder gør de ikke. EU har en masse gode lovinitiativer, som vi skal være rigtigt glade for, men omvendt er der fx en ny, stor aftale i gang mellem EU og USA, som vi er fuldstændig uenig i.', '0000-00-00 00:00:00'),
(143, 'oe', 15, 'Ja. EU bestemmer alt for meget i forhold til dansk lov. Det er langt ude, at Danmark ikke selv må beslutte at forbyde hormonforstyrrende stoffer, som betyder, at vores børn og unge får problemer med at få børn senere i livet. Eller at EU blander sig i, om vi må tage effektive midler mod social dumping i brug. ', '0000-00-00 00:00:00'),
(144, 'b', 15, 'Nej. Vi er aktive medlemmer af EU-samarbejdet og har god glæde og gavn af det. Der er beslutninger, vi ikke er enige i, sådan er det jo også, når Folketinget af og til vil bestemme for meget over kommuner og regioner.', '0000-00-00 00:00:00'),
(145, 'c', 15, 'Ja, når man vælger at overimplementere EU-direktiver og ikke prøver principielle sager om eksempelvis vores velfærdsydelser ved EU-domstolen, så får EU for meget magt.', '0000-00-00 00:00:00'),
(146, 'o', 15, 'Ja, EU bestemmer alt for meget. Det suger indflydelse væk fra nationalstaterne. Vi skal have mere kompetence tilbage til Danmark.', '0000-00-00 00:00:00'),
(147, 'a', 15, 'Nej, ikke generelt. Men der kan være eksempler, hvor de bestemmer for meget eller noget forkert, og så må vi jo tage kampen i EU. Det gør vi også allerede.', '0000-00-00 00:00:00'),
(148, 'f', 15, 'Det er hovedsageligt dansk lovgivning, vi har i Danmark. Men det giver også god mening at lave regler over grænser, for eksempel omkring fødevarer, dyretransporter, eller om ren luft, for ren luft er ikke kun dansk luft.', '0000-00-00 00:00:00'),
(149, 'v', 16, 'Ja, Ulandsbistanden skal sænkes, så vi kommer på det niveau, FN anbefaler.', '0000-00-00 00:00:00'),
(150, 'i', 16, 'Ja, ulandsbistanden skal sænkes til 0,7 procent af BNI. Det er FN''s anbefaling, og det støtter Liberal Alliance op om.', '0000-00-00 00:00:00'),
(151, 'k', 16, 'Nej, ulandsbistanden skal stige. De skal mærke ude i verden, at de har en fremtid, og derfor skal vi i dag investere i veje, uddannelse, kvinders rettigheder og ordentlig regeringsførelse. Ellers banker de på vores dør om ti eller tyve år.', '0000-00-00 00:00:00'),
(152, 'aa', 16, 'Ulandsbistanden skal overhovedet ikke sænkes. Vi skal fortsætte den politik, vi har. Det er fantastisk vigtigt for vores alles tryghed, at vi styrker de områder i verden, der er rigtigt fattige.', '0000-00-00 00:00:00'),
(153, 'oe', 16, 'Nej. Ulandsbistanden skal ikke sænkes. Den gør, at vi kan hjælpe i nærområderne, så færre mennesker tvinges på flugt.', '0000-00-00 00:00:00'),
(154, 'b', 16, 'Nej, det skal den i hvert fald ikke. Der er flere mennesker i nød nu, end der har været siden de store verdenskrige. Vi har brug for at gøre mere og være mere til stede i verdens brændpunkter - ikke det modsatte.', '0000-00-00 00:00:00'),
(155, 'c', 16, 'Vi ønsker, at ulandsbistanden skal sænkes en smule, men vi ønsker stadig, at det skal være en god ulandsbistand, som ligger over de anbefalinger, som FN kommer med. Så vi siger 0,8 procent af BNP.', '0000-00-00 00:00:00'),
(156, 'o', 16, 'Ulandsbistanden skal sænkes til det niveau, som FN anbefaler, det er 0,7 procent af BNI. Det vil frigøre nogle penge til bedre ældrepleje og bedre sundhed i Danmark.', '0000-00-00 00:00:00'),
(157, 'a', 16, 'Nej. Vi skal ikke sænke ulandsbistanden for at kunne bruge pengene på skattelettelser i Danmark. Ulandsbistanden går jo blandt andet til at sikre skolegang og nødhjælp i områder, hvor vi ellers risikerer, at fundamentalister bestemmer.', '0000-00-00 00:00:00'),
(158, 'f', 16, 'Nej, udviklingsbistanden skal ikke sænkes. Bådflygtningene i Middelhavet viser, at det giver god mening at bruge udviklingsbistanden, så folk kan blive i de lande, de er født og opvokset i, og ikke får behov for at flygte.', '0000-00-00 00:00:00'),
(159, 'v', 17, 'Nej, men vi mener ikke, at man kan adskille de to ting. Man kan godt både have økonomisk vækst og et godt og sundt miljø.', '0000-00-00 00:00:00'),
(160, 'i', 17, 'Nja, selvfølgelig kan der være miljøhensyn, man skal tage, men vi skal passe på med ikke at gøre Danmark til et frilandsmuseum og begrænse den økonomiske vækst. For vi har brug for vækst, hvis Danmark skal blive et rigere land. ', '0000-00-00 00:00:00'),
(161, 'k', 17, 'Der er ikke modstrid mellem en vis form for vækst og et bedre miljø. Man kan godt have begge dele: Danmark har haft det i mange år.', '0000-00-00 00:00:00'),
(162, 'aa', 17, 'Klart. Alternativet synes, at miljødagsordenen skal være endnu stærkere, så op med miljøet!', '0000-00-00 00:00:00'),
(163, 'oe', 17, 'Ja. Det nytter ikke noget, at vi kun satser på forbrug og den kulsorte vej, for det kan vores klode simpelthen ikke holde til. Hvis vi vil overlevere en klode til vores børn og børnebørn, som er i nogenlunde stand, så bliver vi nødt til at lade hensynet til miljøet gå forrest, og det er der faktisk rigtigt mange arbejdspladser i.', '0000-00-00 00:00:00'),
(164, 'b', 17, 'Det er vigtigt, at vi tager hensyn til miljøet og sikrer en grøn omstilling. Men det kan bidrage til vores økonomiske vækst, som det eksempelvis har gjort med vindmølleindustrien, der holder masser af folk beskæftigede i Danmark. Derfor skal væksten og miljøindsatsen gå hånd i hånd.', '0000-00-00 00:00:00'),
(165, 'c', 17, 'Det skal være begge dele. Det er rigtigt vigtigt, at vi har et godt miljø, men det er også vigtigt, at det ikke koster arbejdspladser at få et godt miljø. Så de to ting skal gå hånd i hånd.', '0000-00-00 00:00:00'),
(166, 'o', 17, 'Nej, der skal være en balance mellem miljøet og økonomisk vækst. Vi skal ikke være naive og ikke påtage os en masse ekstra forpligtelser i forhold til det, vores nabolande gør.', '0000-00-00 00:00:00'),
(167, 'a', 17, 'De skal følges ad. Det er jo faktisk det, vi historisk er blevet berømmede for i Danmark - og er blevet rige på. Så det skal vi selvfølgelig fortsætte med.', '0000-00-00 00:00:00'),
(168, 'f', 17, 'Det er en falsk modsætning. Man kan både forbedre miljøet og lave økonomisk vækst. Det kan vi se i vindmøllebranchen, som har en stor eksportvare, og samtidig gør den vores energi renere.', '0000-00-00 00:00:00'),
(169, 'v', 18, 'Nej, ikke nødvendigvis, men måske kunne pengene bruges bedre.', '0000-00-00 00:00:00'),
(170, 'i', 18, 'Liberal Alliance vil gerne se på, om ikke flere ting kan klare sig på private vilkår. Og når det kan lade sig gøre, så kan man sænke støtten.', '0000-00-00 00:00:00'),
(171, 'k', 18, 'Nej. Men den skal måske fordeles på en anden måde, så vi i hele landet får glæde af de kulturkroner, der går til vores teatre, vores nationalscene, med mere.', '0000-00-00 00:00:00'),
(172, 'aa', 18, 'Vi skal have meget større respekt for kulturlivet. Det betyder meget mere for os alle sammen, end vi lige er klar over. Så vi skal støtte kulturen.', '0000-00-00 00:00:00'),
(173, 'oe', 18, 'Kulturen er en vigtig del af det danske samfund. Fodboldklubber, badmintonklubber, musikskoler er med til at gøre Danmark til et dejligt land at leve i.', '0000-00-00 00:00:00'),
(174, 'b', 18, 'Nej. Vi har brug for et levende kulturliv. Det beriger os alle sammen.', '0000-00-00 00:00:00'),
(175, 'c', 18, 'Nej, bestemt ikke. Den offentlige kulturstøtte skal hæves. Vores kulturinstitutioner er rigtigt vigtige, de er med til at skabe værdi og minde os om den kulturarv, vi alle bærer rundt på.', '0000-00-00 00:00:00'),
(176, 'o', 18, 'Den offentlige kulturstøtte skal omlægges, men ikke sænkes. Der er mange steder, hvor vi kan bruge pengene bedre, men samlet set er det godt, at vi også bruger penge på vores kultur.', '0000-00-00 00:00:00'),
(177, 'a', 18, 'Nej. Vi har for eksempel ikke lyst til, at børn og unge skal betale penge for at gå på biblioteket. Det er vigtigt, at det er gratis og frit for alle.', '0000-00-00 00:00:00'),
(178, 'f', 18, 'Nej, det skal den bestemt ikke. Vi får rigtigt meget for vores penge, vi får DR, vi får Det kongelige Teater, vi får noget, vi er fælles om i Danmark. Det er også vigtigt for at beskytte det danske sprog.', '0000-00-00 00:00:00'),
(179, 'v', 19, 'Generelt må det ikke blive dyrere at være dansker og drive virksomhed i Danmark. Venstres hovedprioritet er, at sænke skatten på arbejdsindkomster i bunden samt sænke skatter og afgifter, som forbedrer virksomhedernes konkurrenceevne, så vi kan sikre flere danske arbejdspladser.', '0000-00-00 00:00:00'),
(180, 'i', 19, 'Ja. Liberal Alliance ønsker at afskaffe topskatten. Samtidig skal man ikke betale skat af de første kr. 7000,- man tjener hver måned.', '0000-00-00 00:00:00'),
(181, 'k', 19, 'Kristendemokraterne har et krone-til-krone princip: Hver gang der bruges én krone på skattelettelser, skal der bruges én krone på sociale tiltag. ', '0000-00-00 00:00:00'),
(182, 'aa', 19, 'Alternativet vil omlægge skatten, så arbejde beskattes mindre, mens kapital såsom formue, boliger og arv beskattes højere og mere progressivt.', '0000-00-00 00:00:00'),
(183, 'oe', 19, 'Nej. Skatteindtægter financierer velfærden og derfor drejer skattepolitik sig om, hvem der skal betale for velfærden. Enhedslisten mener, at de rigeste skal betale mest, og at virksomhederne skal betale mere til vores fælles velfærd. ', '0000-00-00 00:00:00'),
(184, 'b', 19, 'Ja, vi skal fortsætte med at sænke skatten på arbejde. Både i bunden og i toppen. Til gengæld skal fastfrysningen af boligskatten ophæves, så vi stopper med at omfordele til fordel for dem, der har mest. ', '0000-00-00 00:00:00'),
(185, 'c', 19, 'Ja. Skatten i Danmark er for høj og udgør en barriere for vækst, velstand og nye arbejdspladser. Konservative ønsker at fjerne topskatten og hæve beskæftigelsesfradraget. Vi ønsker også at sænke selskabsskatten til 15 pct.', '0000-00-00 00:00:00'),
(186, 'o', 19, 'Dansk Folkeparti er ikke modstandere af at sænke skatten, men det vigtigste er, at velfærden bliver sikret. ', '0000-00-00 00:00:00'),
(187, 'a', 19, 'Socialdemokraterne har lavet en skattereform, der sænker skatten på arbejde for almindelige mennesker. Vi mener ikke at topskatten skal fjernes, da den sikrer, at dem der tjener mest, bidrager mest til fællesskabet. ', '0000-00-00 00:00:00'),
(188, 'f', 19, 'Ja, vi skal sænke skatten på arbejde ved at hæve beskæftigelsesfradraget. Skattelettelsen skal financieres med en skat på financielle transaktioner. Vi skal ikke give skattelettelser til erhvervslivet, men bruge pengene på at udbygge vores velfærd. ', '0000-00-00 00:00:00'),
(189, 'v', 20, 'Ja. Venstre vil gøre det mindre attraktivt at søge asyl i Danmark.', '0000-00-00 00:00:00'),
(190, 'i', 20, 'Ja. Flygtningebegrebet skal redefineres. Danmark skal tage imod reelt personligt forfulgte mennesker, men ikke folk, der bare vil til Danmark for at få del i de danske velfærdskasser.', '0000-00-00 00:00:00'),
(191, 'k', 20, 'Det skal være lettere at få asyl som forfulgt kristen. Danmark har i forvejen nogle af de strammeste asylregler i Europa. ', '0000-00-00 00:00:00'),
(192, 'aa', 20, 'Nej. Danmark skal løfte sin del af ansvaret for flygtninge i Europa. Hverken mere eller mindre.', '0000-00-00 00:00:00'),
(193, 'oe', 20, 'Nej. Ikke siden Anden Verdenskrig har så mange mennesker været tvunget på flugt. Danmark skal tage sin del af ansvaret for at hjælpe. ', '0000-00-00 00:00:00'),
(194, 'b', 20, 'Nej. Vi skal overholde konventionerne og give beskyttelse til alle der banker på vores dør med et legitimt behov for beskyttelse', '0000-00-00 00:00:00'),
(195, 'c', 20, 'Ja. Asylreglerne er i dag allerede stramme, men det er vigtigt at holde fast i, at man skal være personligt forfulgt for at kunne opnå asyl i Danmark. Vi mener eksempelvis ikke, at man skal tildele personer automatisk asyl blot fordi, de kommer  fra særlige områder i eksempelvis Syrien.', '0000-00-00 00:00:00'),
(196, 'o', 20, 'Ja. Regeringen har gjort det meget mere attraktivt for asylansøgere at komme til Danmark. Det skal stoppes.', '0000-00-00 00:00:00'),
(197, 'a', 20, 'Ja. Det er derfor, vi har strammet asylreglerne for første gang i 12 år.', '0000-00-00 00:00:00'),
(198, 'f', 20, 'Nej. Det er vigtigt, at Danmark løfter sin del af opgaven, når der er konflikter og krig rundt om i verden.', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `partisagsvar`
--

CREATE TABLE IF NOT EXISTS `partisagsvar` (
  `delta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `partibogstav` varchar(2) NOT NULL,
  `sagid` int(10) unsigned NOT NULL,
  `svar` tinyint(4) NOT NULL,
  PRIMARY KEY (`delta`),
  KEY `partibogstav` (`partibogstav`),
  KEY `sagid` (`sagid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=201 ;

--
-- Dumping data for table `partisagsvar`
--

INSERT INTO `partisagsvar` (`delta`, `partibogstav`, `sagid`, `svar`) VALUES
(1, 'a', 1, 1),
(2, 'b', 1, 1),
(3, 'c', 1, 0),
(4, 'f', 1, 1),
(5, 'i', 1, 0),
(6, 'k', 1, 2),
(7, 'o', 1, 1),
(8, 'v', 1, 0),
(9, 'oe', 1, 1),
(10, 'aa', 1, 2),
(11, 'a', 3, 0),
(12, 'b', 3, 0),
(13, 'c', 3, 1),
(14, 'f', 3, 0),
(15, 'i', 3, 1),
(16, 'k', 3, 2),
(17, 'o', 3, 1),
(18, 'v', 3, 1),
(19, 'oe', 3, 0),
(20, 'aa', 3, 2),
(21, 'a', 2, 2),
(22, 'b', 2, 2),
(23, 'c', 2, 2),
(24, 'f', 2, 0),
(25, 'i', 2, 1),
(26, 'k', 2, 0),
(27, 'o', 2, 0),
(28, 'v', 2, 2),
(29, 'oe', 2, 2),
(30, 'aa', 2, 2),
(31, 'v', 4, 0),
(32, 'i', 4, 1),
(33, 'k', 4, 1),
(34, 'aa', 4, 1),
(35, 'oe', 4, 1),
(36, 'b', 4, 0),
(37, 'c', 4, 1),
(38, 'o', 4, 0),
(39, 'a', 4, 0),
(40, 'f', 4, 0),
(41, 'v', 5, 0),
(42, 'i', 5, 0),
(43, 'k', 5, 1),
(44, 'aa', 5, 1),
(45, 'oe', 5, 1),
(46, 'b', 5, 1),
(47, 'c', 5, 0),
(48, 'o', 5, 0),
(49, 'a', 5, 0),
(50, 'f', 5, 1),
(51, 'v', 6, 0),
(52, 'i', 6, 2),
(53, 'k', 6, 0),
(54, 'aa', 6, 0),
(55, 'oe', 6, 0),
(56, 'b', 6, 0),
(57, 'c', 6, 0),
(58, 'o', 6, 0),
(59, 'a', 6, 0),
(60, 'f', 6, 0),
(61, 'v', 7, 1),
(62, 'i', 7, 1),
(63, 'k', 7, 0),
(64, 'aa', 7, 0),
(65, 'oe', 7, 0),
(66, 'b', 7, 2),
(67, 'c', 7, 1),
(68, 'o', 7, 0),
(69, 'a', 7, 0),
(70, 'f', 7, 0),
(71, 'v', 8, 0),
(72, 'i', 8, 0),
(73, 'k', 8, 1),
(74, 'aa', 8, 1),
(75, 'oe', 8, 1),
(76, 'b', 8, 0),
(77, 'c', 8, 0),
(78, 'o', 8, 1),
(79, 'a', 8, 2),
(80, 'f', 8, 1),
(81, 'v', 9, 0),
(82, 'i', 9, 0),
(83, 'k', 9, 1),
(84, 'aa', 9, 1),
(85, 'oe', 9, 1),
(86, 'b', 9, 0),
(87, 'c', 9, 0),
(88, 'o', 9, 1),
(89, 'a', 9, 1),
(90, 'f', 9, 1),
(91, 'v', 10, 0),
(92, 'i', 10, 0),
(93, 'k', 10, 0),
(94, 'aa', 10, 0),
(95, 'oe', 10, 1),
(96, 'b', 10, 2),
(97, 'c', 10, 0),
(98, 'o', 10, 1),
(99, 'a', 10, 1),
(100, 'f', 10, 1),
(101, 'v', 11, 0),
(102, 'i', 11, 0),
(103, 'k', 11, 1),
(104, 'aa', 11, 1),
(105, 'oe', 11, 1),
(106, 'b', 11, 1),
(107, 'c', 11, 0),
(108, 'o', 11, 0),
(109, 'a', 11, 1),
(110, 'f', 11, 1),
(111, 'v', 12, 1),
(112, 'i', 12, 1),
(113, 'k', 12, 1),
(114, 'aa', 12, 2),
(115, 'oe', 12, 0),
(116, 'b', 12, 0),
(117, 'c', 12, 1),
(118, 'o', 12, 1),
(119, 'a', 12, 1),
(120, 'f', 12, 2),
(121, 'v', 13, 2),
(122, 'i', 13, 1),
(123, 'k', 13, 0),
(124, 'aa', 13, 0),
(125, 'oe', 13, 0),
(126, 'b', 13, 0),
(127, 'c', 13, 1),
(128, 'o', 13, 0),
(129, 'a', 13, 0),
(130, 'f', 13, 0),
(131, 'v', 14, 1),
(132, 'i', 14, 1),
(133, 'k', 14, 0),
(134, 'aa', 14, 0),
(135, 'oe', 14, 0),
(136, 'b', 14, 0),
(137, 'c', 14, 1),
(138, 'o', 14, 1),
(139, 'a', 14, 0),
(140, 'f', 14, 1),
(141, 'v', 15, 2),
(142, 'i', 15, 1),
(143, 'k', 15, 2),
(144, 'aa', 15, 2),
(145, 'oe', 15, 1),
(146, 'b', 15, 0),
(147, 'c', 15, 1),
(148, 'o', 15, 1),
(149, 'a', 15, 0),
(150, 'f', 15, 2),
(151, 'v', 16, 1),
(152, 'i', 16, 1),
(153, 'k', 16, 0),
(154, 'aa', 16, 0),
(155, 'oe', 16, 0),
(156, 'b', 16, 0),
(157, 'c', 16, 1),
(158, 'o', 16, 1),
(159, 'a', 16, 0),
(160, 'f', 16, 0),
(161, 'v', 17, 0),
(162, 'i', 17, 0),
(163, 'k', 17, 2),
(164, 'aa', 17, 1),
(165, 'oe', 17, 1),
(166, 'b', 17, 2),
(167, 'c', 17, 2),
(168, 'o', 17, 0),
(169, 'a', 17, 2),
(170, 'f', 17, 2),
(171, 'v', 18, 0),
(172, 'i', 18, 1),
(173, 'k', 18, 0),
(174, 'aa', 18, 0),
(175, 'oe', 18, 0),
(176, 'b', 18, 0),
(177, 'c', 18, 0),
(178, 'o', 18, 0),
(179, 'a', 18, 0),
(180, 'f', 18, 0),
(181, 'v', 19, 1),
(182, 'i', 19, 1),
(183, 'k', 19, 2),
(184, 'aa', 19, 2),
(185, 'oe', 19, 0),
(186, 'b', 19, 1),
(187, 'c', 19, 1),
(188, 'o', 19, 2),
(189, 'a', 19, 2),
(190, 'f', 19, 1),
(191, 'v', 20, 1),
(192, 'i', 20, 1),
(193, 'k', 20, 2),
(194, 'aa', 20, 0),
(195, 'oe', 20, 0),
(196, 'b', 20, 0),
(197, 'c', 20, 1),
(198, 'o', 20, 1),
(199, 'a', 20, 1),
(200, 'f', 20, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sager`
--

CREATE TABLE IF NOT EXISTS `sager` (
  `sagid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `navn` varchar(100) NOT NULL,
  `emneid` mediumint(9) NOT NULL,
  `beskrivelse` text NOT NULL,
  `sporgsmal` varchar(140) NOT NULL,
  `upcount` mediumint(8) unsigned NOT NULL,
  `downcount` mediumint(8) unsigned NOT NULL,
  `added` datetime NOT NULL,
  `yescount` int(10) unsigned NOT NULL,
  `nocount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sagid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `sager`
--

INSERT INTO `sager` (`sagid`, `navn`, `emneid`, `beskrivelse`, `sporgsmal`, `upcount`, `downcount`, `added`, `yescount`, `nocount`) VALUES
(4, 'Lange dage i folkeskolen', 4, 'Skoledagen er blevet længere for alle elever, efter folkeskolereformen trådte i kraft. Fra børnehaveklasse til 3. klasse skal eleverne nu gå i skole 30 timer om ugen. For eleverne fra 4. til 6. klasse er skoleugen nu på 33 timer. Og de ældste elever fra 7. til 9. klasse skal i dag gå i skole 35 timer om ugen. ', 'Har eleverne fået for lange skoledage efter folkeskolereformen?', 0, 0, '0000-00-00 00:00:00', 0, 0),
(5, 'Afgift på cigaretter', 5, 'Hvert år dør 13.000 mennesker af rygningsrelaterede sygdomme – det er hvert fjerde dødsfald i Danmark. Rygning slår derfor langt flere danskere ihjel end andre af de dødelige livsstilsfaktorer som fedme, alkohol og fysisk inaktivitet. Den sociale ulighed i danskernes sundhed skyldes især rygning.', 'Skal afgiften på cigaretter sættes op?', 0, 0, '0000-00-00 00:00:00', 0, 0),
(6, 'Brugerbetaling hos lægen', 5, 'Det er i dag gratis at gå til den alment praktiserende læge. Men der er stort set ikke offentlig støtte til tandlægebehandlinger. Der er også hel eller delvis brugerbetaling på blandt andet fysioterapi, kiropraktik, briller og håndkøbs- og receptmedicin.', 'Skal et besøg hos den praktiserende læge koste penge?', 0, 0, '0000-00-00 00:00:00', 0, 0),
(7, 'Udlicitering af ældreplejen', 6, 'Kommunerne har ansvaret for, at ældre mennesker kan få hjælp, hvis de har svært ved at klare sig selv. Det kan handle om hjælp til toiletbesøg og bad samt rengøringshjælp. I dag varetages de fleste opgaver i ældreplejen af kommunerne.', 'Skal mere af ældreplejen udliciteres til private?', 0, 0, '0000-00-00 00:00:00', 0, 0),
(8, 'Genoptjening af dagpenge', 7, 'Med dagpengereformen blev perioden, hvor man kan få dagpenge, sat ned fra fire til to år. Samtidig blev genoptjeningsperioden forlænget fra et halvt til et helt års beskæftigelse, før man igen har genoptjent retten til dagpenge, hvis man først har mistet den. ', 'Skal man hurtigere kunne genoptjene retten til dagpenge?', 0, 0, '0000-00-00 00:00:00', 0, 0),
(9, 'Social dumping', 7, '<p>Virksomheder skal kunne drages til ansvar for, om deres udenlandske underleverandører i Danmark overholder danske regler om løn, moms og skat.</p>\r\n<p>For at undgå, at danske virksomheder hyrer udenlandske underleverandører, som ikke lever op til de danske regler, diskuterer man muligheden for at indføre et såkaldt kædeansvar. Det betyder, at et firma hæfter for sin udenlandske underleverandør, hvis underleverandøren for eksempel underbetaler eller misbruger sine medarbejdere, stikker af fra skatter eller bøder med mere.</p>', 'Skal virksomheder kunne drages til ansvar for social dumping?', 0, 0, '0000-00-00 00:00:00', 0, 0),
(10, 'Offentlig sektor eller skattelettelser', 1, 'Den offentlige sektor er en fællesbetegnelse for kommunerne, regionerne og staten. Den offentlige sektor løser blandt andet opgaver med uddannelse, sundhed, pleje, infrastruktur, retsvæsen og militær.', 'Er vækst i den offentlige sektor vigtigere end skattelettelser?', 0, 0, '0000-00-00 00:00:00', 0, 0),
(11, 'Kollektiv trafik over biler', 8, 'I Danmark bliver der hvert år brugt milliarder på at udbygge infrastrukturen. Men politikerne er uenige om, hvorvidt pengene bør bruges på den kollektive trafik eller på at gøre forholdene bedre for privatbilismen.', 'Skal kollektiv trafik prioriteres over privatbilisme?', 0, 0, '0000-00-00 00:00:00', 0, 0),
(12, 'Straf for vold og voldtægt', 9, 'I dag kan personer, der begår grov vold eller voldtægt, dømmes op til henholdsvis seks og otte års fængsel. Ved særlig farlig voldtægt går den øvre grænse dog ved 12 års fængsel. I 2012 var den gennemsnitlige straf for grov vold knap syv måneder og for voldtægt knap 22 måneder.', 'Skal straffen for vold og voldtægt skærpes?', 0, 0, '0000-00-00 00:00:00', 0, 0),
(13, 'Kontanthjælp', 10, 'I dag er der to satser for kontanthjælp for dem over 30 år. Har man børn, er satsen 14.416 kr. per måned. Har man ikke børn, er satsen 10.849 kr. per måned. For dem under 30 år gælder nogle særlige lave satser. Hvis man er uddannelsesparat, får man 5.943 kr., hvilket svarer til SU.', 'Skal kontanthjælpen sænkes, så gevinsten ved at arbejde hæves?', 0, 0, '0000-00-00 00:00:00', 0, 0),
(14, 'Religiøse minoriteter', 3, 'Det er en stor politisk diskussion, om det eksempelvis er i orden, at nogle daginstitutioner har valgt ikke at servere mad med svinekød til børnene af hensyn til religiøse minoriteter. Eller om det er i orden for offentligt ansatte at bære religiøs påklædning som tørklæde.', 'Tager offentlige institutioner for meget hensyn til religiøse minoriteter?', 0, 0, '0000-00-00 00:00:00', 0, 0),
(15, 'EU', 2, 'EU-samarbejdet har udviklet sig til at dække flere og flere områder. Siden 1993 har EU haft det såkaldte nærhedsprincip, som fastslår, at beslutninger skal træffes så tæt på borgerne som muligt. EU skal derfor kun vedtage regler på områder, hvor det giver bedre mening at gøre det i fællesskab på EU-niveau end på nationalt plan.', 'Bestemmer EU for meget?', 1, 0, '0000-00-00 00:00:00', 1, 0),
(16, 'Ulandsbistand', 11, 'Danmark giver ca. 17 mia. kr. om året i udviklingsbistand. Det svarer til 0,83 procent af bruttonationalindkomsten (BNI), dvs. et lands samlede indtægter. Pengene går til blandt andet opbygning af skoler og hospitaler i nogle af verdens fattigste lande samt til nødhjælp til folk på flugt eller i katastrofeområder.  ', 'Skal ulandsbistanden sænkes?', 0, 0, '0000-00-00 00:00:00', 0, 0),
(17, 'Miljø vs. vækst', 12, 'Den danske livsstil udfordrer på mange måder miljøet. Hver dansker bruger mange ressourcer, producerer meget affald og er årsag til en stor CO2-udledning. Ligeledes presser det intensive landbrug naturen og vandmiljøet.', 'Skal indsatsen for miljøet gå forud for økonomisk vækst?', 0, 0, '0000-00-00 00:00:00', 0, 0),
(18, 'Kulturstøtte', 13, 'Staten brugte i 2014 mere end 13 milliarder kroner på at støtte kunsten og kulturlivet. Pengene går til alt fra teaterforestillinger og kunstudstillinger til idrætslivet og biograffilm. Derudover brugte kommunerne mere end 10 milliarder kroner på at støtte kunsten og kulturen lokalt i 2014.', 'Skal den offentlige kulturstøtte sænkes?', 0, 0, '0000-00-00 00:00:00', 0, 0),
(19, 'Skatten ned', 1, 'Hvor meget du betaler i skat, varierer blandt andet efter din indtægt, dine fradrag og hvilken kommune, du bor i. Tjener du over 422.000 kroner om året, skal du betale topskat, 15% ekstra af sidst tjente krone. Kommuneskatten svinger og var i gennemsnit 25,6% i 2015, inklusive kirkeskat. Selskabskatten falder frem mod 2016 til 22%.', 'Skal skatten sættes ned?', 0, 0, '0000-00-00 00:00:00', 0, 0),
(20, 'Asyl', 3, 'Cirka 6.000 mennesker fik asyl i 2014, og 6.000 blev familiesammenført. Over 14.000 mennesker søgte asyl i Danmark - dobbelt så mange som i 2012.', 'Skal det være sværere at få asyl i Danmark?', 1, 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stemmer`
--

CREATE TABLE IF NOT EXISTS `stemmer` (
  `stemmeid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brugerid` int(10) unsigned NOT NULL,
  `sagid` int(10) unsigned NOT NULL,
  `stemme` tinyint(4) NOT NULL,
  PRIMARY KEY (`stemmeid`),
  UNIQUE KEY `unikstemme` (`brugerid`,`sagid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `stemmer`
--

INSERT INTO `stemmer` (`stemmeid`, `brugerid`, `sagid`, `stemme`) VALUES
(1, 1, 2, 0),
(4, 1, 1, 1),
(5, 1, 3, 0),
(6, 4, 2, 1),
(7, 4, 1, 1),
(9, 1, 15, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
