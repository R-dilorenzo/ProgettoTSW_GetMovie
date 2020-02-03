-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: ntsw
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admin` (
  `username` varchar(15) NOT NULL,
  `password` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrello`
--

DROP TABLE IF EXISTS `carrello`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `carrello` (
  `nome` varchar(50) DEFAULT NULL,
  `img` varchar(500) DEFAULT NULL,
  `prezzo` double(10,2) DEFAULT NULL,
  `usr` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrello`
--

LOCK TABLES `carrello` WRITE;
/*!40000 ALTER TABLE `carrello` DISABLE KEYS */;
INSERT INTO `carrello` VALUES ('Asterix e il regno degli dei','img/asterix.jpg',7.40,'qwer'),('127 ore','img/127.jpg',12.50,'rob'),('Benvenuti al sud','img/sud.jpg',11.50,'rob'),('Jack Reacher 1','img/jack reacher.jpg',9.99,'rob'),('Inferno','img/inferno.jpg',15.70,'rob'),('Tomb Raider','img/Tomb Raider.jpg',13.98,'rob'),('007-Spectre','img/spectre.jpg',14.79,'rob'),('127 ore','img/127.jpg',12.50,'poi'),('007-Spectre','img/spectre.jpg',14.79,'iiii');
/*!40000 ALTER TABLE `carrello` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datiutente`
--

DROP TABLE IF EXISTS `datiutente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `datiutente` (
  `usr` varchar(15) NOT NULL,
  `dataNascita` date DEFAULT NULL,
  `numeroCarta` int(16) DEFAULT NULL,
  `scadenzaCarta` date DEFAULT NULL,
  `residenza` varchar(30) DEFAULT NULL,
  `luogoNascita` varchar(15) DEFAULT NULL,
  `boolDati` varchar(1) DEFAULT NULL,
  KEY `usr` (`usr`),
  CONSTRAINT `datiutente_ibfk_1` FOREIGN KEY (`usr`) REFERENCES `utente` (`usr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datiutente`
--

LOCK TABLES `datiutente` WRITE;
/*!40000 ALTER TABLE `datiutente` DISABLE KEYS */;
/*!40000 ALTER TABLE `datiutente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `film` (
  `nome` varchar(50) CHARACTER SET utf8 NOT NULL,
  `regista` char(50) CHARACTER SET utf8 DEFAULT NULL,
  `img` varchar(500) DEFAULT NULL,
  `genere` char(20) CHARACTER SET utf8 DEFAULT NULL,
  `attori` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `descrizione` varchar(5000) CHARACTER SET utf8 DEFAULT NULL,
  `anno` int(5) DEFAULT NULL,
  `prezzo` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES ('007-Spectre','Sam Mendes','immagini/007-Spectrespectre.jpg','azione','Jesper Christensen, Monica Bellucci, Daniel Craig, Ralph Fiennes','Un misterioso messaggio riguardante il proprio passato convince James Bond a partire verso una nuova missione in Messico, per poi raggiungere Roma, dove incontra Lucia Sciarra, la splendida e intoccabile vedova di un noto criminale. Bond si infiltra in una riunione segreto e scopre l\'esistenza di una sinistra organizzazione nota col nome di SPECTRE. Nel frattempo, a Londra, Max Denbigh, il nuovo capo del Centro per la Sicurezza Nazionale, indaga sulla missione di Bond e mette in dubbio il valore della sezione MI6 guidato da M. Bond di nascosto coinvolge Moneypenny e Q per aiutarlo a trovare Madeleine Swann, la figlia del suo vecchio nemico Mr. White, che potrebbe avere la soluzione per risolvere la trama di SPECTRE. Da figlia di un assassino, la ragazza riesce a comprendere Bond meglio di chiunque altro. Mentre Bond si inoltra nel cuore di SPECTRE, scopre l\'esistenza di un legame raccapricciante tra se stesso e il nemico da lui inseguito.',2015,14.79),('127 ore','Danny Boyle','immagini/127 ore127.jpg','drammatico','A.R.Rahman, Treat Williams, James Franco, Amber Tamblyn, Kate Mara, Kate Burton','Il film ripercorre la storia vera di Aron Ralston, un\'alpinista statunitense che precipitò in una crepa di canyon isolato nello Utah, con un braccio incastrato sotto un masso distaccatosi dalla roccia. Ralston rimase intrappolato per cinque giorni, provato e fortemente disidratato. Lo spirito di sopravvivenza lo portò ad un gesto estremo per ritrovare la libertà. Nei giorni di \'prigionia\' Ralston ricorda gli amici, la famiglia, gli amori e le due escursioniste incontrate prima dell\'incidente.',2010,12.50),('Asterix e il regno degli dei','Alexandre Astier','immagini/Asterix e il regno degli deiasterix.jpg','animazione','Computer grafica','Asterix, Obelix e compagni tornano, in questa nuova pellicola d\'animazione, con una nuova avventura, la prima realizzata completamente in computer grafica 3D. Si tratta della trasposizione animata del diciassettesimo albo della serie e racconta di un nuovo pericolo che incombe sui Galli. Privandoli della loro principale risorsa, il bosco, e nel tentativo di indebolirli e \'civilizzarli\', Cesare decide, infatti, di costruire proprio fuori dal loro villaggio una zona residenziale per nobili romani chiamata \'il regno degli Dei\'. I quali naturalmente vanno al villaggio per rifornirsi, alterando così abitudini ed equilibri. Tra tutti solo Panoramix, Asterix ed Obelix si accorgono del pericolo e come sempre toccherà ai nostri eroi salvare la situazione.',2014,7.40),('Benvenuti al sud','Luca Miniero','immagini/Benvenuti al sudsud.jpg','commedia','Claudio Bisio, Alessandro Siani, Francesco Albanese, Angela Finocchiaro','Alberto è il responsabile dell\'ufficio postale di una piccola cittadina della Brianza e per accontentare sua moglie Silvia, che vorrebbe trasferirsi a Milano, è disposto a tutto: anche a fingersi invalido per salire in graduatoria e ottenere un incarico nella grande metropoli. Il suo trucco però viene scoperto, e per punizione Alberto si ritrova a essere trasferito in una piccola filiale in Campania. Rassegnato al suo destino, Alberto parte da solo verso la sua nuova meta, aspettandosi soltanto degrado, strade invase dai rifiuti e colleghi scansafatiche. Così, quando si ritrova davanti persone meravigliose e disponibili e un nuovo amico, Mattia, che tenta in ogni modo di farlo sentire a proprio agio, ad Alberto sembra di vivere in un sogno. Come dirlo però a Silvia e agli amici che hanno iniziato a vederlo sotto una nuova luce?',2010,11.50),('E fuori nevica','Vincenzo Salemme','immagini/E fuori nevicanevica.jpg','commedia','Carlo Buccirosso, Vincenzo Salemme, Giorgio Panariello, Nando Paone','Enzo Righi ha cinquant\'anni e vive cantando (male) sulle navi da crociera. Eterno immaturo, è allergico a qualsiasi tipo di responsabilità. Quando arriva la notizia della morte di sua madre, è costretto a rientrare a Napoli per la lettura del testamento, dove, dopo anni, incontrerà i fratelli Stefano e Cico. Ad attenderli una sopresa: l\'unico modo per ereditare la casa di famiglia è convivere tutti insieme. La quotidianità non si rivelerà affatto semplice e i tre fratelli ne vedranno delle belle...finché una trovata geniale e spietata di Cico risolverà il nuovo, complicato, \'stato di famiglia\'.',2014,11.00),('Elysium','Neill Blomkamp','immagini/Elysiumelysium.jpg','fantascienza','Jodie Foster, Matt Damon, Sharlto Copley','Nell\'anno 2154, esistono due classi di esseri umani: i benestanti che vivono su una incontaminata stazione spaziale costruita dall\'uomo e chiamata Elysium, e il resto della popolazione che vive in un sovrappopolato e disastrato pianeta Terra. Le persone sulla Terra sono disperate e vorrebbero fuggire dal crimine e dalla povertà dilaganti. Inoltre, hanno un drammatico bisogno di cure mediche disponibili soltanto su Elysium. Purtroppo, ad Elysium le legge anti-immigrazione e le forze in atto per preservare il lussuoso stile di vita dei propri cittadini sono ferree. L\'unica persona che ha qualche possibilità di portare equilibrio tra questi due mondi è Max, un uomo ordinario con un disperato bisogno di entrare ad Elysium. Con la vita appesa ad un filo, Max dovrà suo malgrado affrontare una missione pericolosissima che lo vedrà ostacolare il Segretario di Elysium Delacourt e le sue forze armate. Eppure, se Max riuscirà a trovare un varco, potrebbe non soltanto salvare la propria vita ma anche quella di milioni di abitanti del pianeta Terra.',2013,9.99),('I Primitivi','Nick Park','immagini/I Primitiviprimitivi.jpg','animazione','Computer Grafica','Il giovane cavernicolo Dug vive nella foresta in armonia con la sua tribù, ancorata allo stile di vita elementare dell\'Età della pietra, finché un gruppo di guerrieri già entrati pienamente nell\'Età del bronzo caccia tutti i (relativamente più) primitivi nelle aride Badlands, sottraendo loro le terre più fertili. Ma Dug non si rassegna e si infiltra nel territorio del nemico, dove apprenderà che il gioco preferito nell\'Età del bronzo è.... il calcio. E poiché alcune pitture su pietre rupestri rivelano alla sua tribù di aver avuto antenati calciatori, Dug decide di sfidare i nemici ad una partita: se vincerà riavrà la sua terra, in caso contrario tutta la sua tribù dovrà lavorare in miniera per i vincitori.',2018,11.50),('I Simpson-il film','David Silvermann','immagini/I Simpson-il filmsimpson.jpg','animazione','Computer grafica','Tutto inizia con Homer, il suo nuovo maialino domestico e la sua notevole produzione di escrementi, una combinazione che provoca un disastro di proporzioni mai viste a Springfield. Mentre Marge è sconvolta dall\'errore monumentale di Homer, una folla in rivolta si dirige verso la casa dei Simpson. La famiglia riesce a salvarsi per un pelo, ma in breve tempo è divisa sia fisicamente che sentimentalmente. La cittadina di Springfield ha delle buone ragioni per volere la testa dei Simpson. La calamità scatenata da Homer ha suscitato l\'attenzione del presidente statunitense Arnold Schwarzenegger e del responsabile dell\'agenzia per la protezione ambientale (l\'EPA) Russ Cargill. Mentre il destino di Springfield e del mondo intero è in bilico, Homer si imbarca in un\' odissea personale di redenzione, cercando di ottenere il perdono da Marge, riunire la sua famiglia divisa e salvare la città.',2007,9.99),('Inferno','Ron Howard','immagini/Infernoinferno.jpg','thriller','Tom Hanks, Felicity Jones, Omar Sy','Le avventure del simbolista di Harvard non sono finite. Robert Langdon si risveglia in un ospedale di Firenze, vittima di una profonda amnesia, dopo che alcuni uomini misteriosi hanno tentato di ucciderlo e sembrano voler portare a termine il lavoro. Si affida al medico Sienna Brooks per recuperare i suoi ricordi e svelare ancora una volta i misteri che si annidano intorno all\'opera immortale di Dante, le cui immagini criptiche sembrano non voler abbandonare la mente dello studioso. Il Consortium, un\'organizzazione segreta, sarà il nuovo nemico da sconfiggere. Un ritmo ricco di tensione in una battaglia tra il bene e il male che sembra avere confini molto sottili.',2016,15.70),('Jack Reacher 1','Christopher Mcquarrie','immagini/Jack Reacher 1jack reacher.jpg','thriller','Robert Duvall, Richard Jenkins, Tom Cruise, Rosamund Pike, Werner Herzog, Joe Kraemer','In una città pacifica e tranquilla, cinque persone sono uccise da un cecchino. Gli indizi portano velocemente ad un ex soldato di nome James Barr. Durante il suo interrogatorio viene brutalmente pestato e giusto prima di entrare in coma, fa il nome di Jack Reacher, un ex poliziotto militare. La polizia non ha idea di come rintracciarlo, e alla fine lui si presenta spontaneamente alla polizia. L\'avvocato difensore di Barr, assieme ad una teoria di Reacher, andranno a scoprire la verità',2012,9.99),('La Profezia','Patrick Lussier','immagini/La Profeziaprofezia.jpg','horror','Christopher Walken, Brad Dourif, Vincent Spano','Gabriel, l\'arcangelo rinnegato da Dio è tornato.. Il profeta del male scende tra i mortali per continuare la sua battaglia estrema e definitiva, pronto a seminare morte e distruzione ..',2000,6.89),('La Setta Dei Dannati','Brian Helgeland','immagini/La Setta Dei Dannatisetta dei dannati.jpg','horror','Heath Ledger, Benno Furmann, Rosalinda Celentano, Peter Weller, David Torn','Da secoli esiste un ordine religioso segreto all\'interno della Chiesa. A seguito dell\'inquietante morte del suo mentore, un sacerdote tormentato avvia un\'indagine che lo condurrà in uno scenario di inimmaginabile malignità, su cui si staglia l\'inquietante figura del divoratore di peccati. Scoprirà così che esiste un destino ben peggiore della morte.',2003,6.79),('Lo chiamavano Jeeg Robot','Gabriele Mainetti','immagini/Lo chiamavano Jeeg Robotjeeg.jpg','drammatico','Claudio Santamaria, Luca Marinelli, Ilenia Pastorelli','Enzo Ceccotti non è nessuno, vive a Tor Bella Monaca e sbarca il lunario con piccoli furti sperando di non essere preso. Un giorno, proprio mentre scappa dalla polizia, si tuffa nel Tevere per nascondersi e cade per errore in un barile di materiale radioattivo. Ne uscirà completamente ricoperto di non si sa cosa, barcollante e mezzo morto. In compenso il giorno dopo però si risveglia dotato di forza e resistenza sovraumane. Mentre Enzo scopre cosa gli è successo e cerca di usare i poteri per fare soldi, a Roma c\'è una vera lotta per il comando, alcuni clan provenienti da fuori stanno terrorizzando la città con attentati bombaroli e un piccolo pesce intenzionato a farsi strada minaccia la vicina di casa di Enzo, figlia di un suo amico morto da poco. La ragazza ora si è aggrappata a lui ed è così fissata con la serie animata Jeeg Robot da pensare che esista davvero. Tutto sta per esplodere, tutti hanno bisogno di un eroe.',2014,11.50),('Padri e figlie','Gabriele Muccino','immagini/Padri e figliepadri e figlie.jpg','drammatico','Jane Fonda, Russell Crowe, Diane Kruger, Amanda Seyfried, Kylie Rogers','Un racconto originale che si svolge su due piani paralleli ma lontani nel tempo. La trama infatti si sposta avanti e indietro tra gli anni ‘80, il periodo in cui Jake Davis, romanziere premio Pulitzer rimasto vedovo, lotta contro un serio disturbo mentale mentre cerca di crescere nel miglior modo possibile la figlioletta Katie di 5 anni. Venticinque anni dopo, Katie è una splendida ragazza che vive a Manhattan, da anni lontana dal padre. Combatte ancora i demoni della sua infanzia tormentata e l’incapacità di abbandonarsi ad una storia d\'amore.',2015,9.99),('Parker','Taylor Hackford','immagini/Parkerparker.jpg','azione','Jason Statham, Jennifer Lopez,Nick Nolte.','Dopo una rapina andata bene, la banda di criminali, capeggiata da Parker, decide di tradire il loro capo e di ucciderlo. Parker, sopravvissuto, si metterà sulle loro tracce per vendicarsi.',2013,8.50),('Smetto quando voglio','Sydney Sibilia','immagini/Smetto quando vogliosqv.jpg','commedia','Paolo Calabresi, Neri Marcore\', Libero De Rienzo, Edoardo Leo, Pietro Sermonti','Pietro Zinni ha trentasette anni, fa il ricercatore ed è un genio. Ma questo non è sufficiente. Arrivano i tagli all\'università e viene licenziato. Cosa può fare per sopravvivere un nerd che nella vita ha sempre e solo studiato? L\'idea è drammaticamente semplice: mettere insieme una banda criminale come non se ne sono mai viste. Recluta i migliori tra i suoi ex colleghi, che nonostante le competenze vivono ormai tutti ai margini della società. Il successo è immediato e deflagrante, arrivano finalmente i soldi, il potere, le donne e il successo. Il problema sarà gestirli...',2014,7.99),('Spy','Paul Feig','immagini/Spyspy.jpg','commedia','Jude Law, Jason Statham, Melissa Mccarthy, Rose Byrne','Susan Cooper è una normale analista della CIA e lavora duramente dietro le missioni più pericolose condotte dall\'Agenzia. Quando il suo partner è disperso e un altro agente è compromesso, si offre volontaria per infiltrarsi sotto copertura nel mondo di un commerciante di armi di contrabbando per prevenire un disastro globale.',2015,7.80),('The Post','Steven Spielberg','immagini/The Postpost.jpg','drammatico','Tom Hanks, Bruce Greenwood, Sarah Paulson, Meryl Streep','La Guerra del Vietnam terminata nel 1975, costò la vita a 58.220 soldati americani e causò la morte di oltre un milione di persone. I Pentagon Papers svelarono gli inganni che portarono a questo massacro. Una storia oscura di assassini, violazioni della Convenzione di Ginevra, elezioni truccate e bugie raccontate al Congresso.',2017,15.99),('The Presence','Tom Provost','immagini/The Presencepresence.jpg','horror','Mira Sorvino, Kirk Justin, Shane West','Una donna va in uno chalet isolato in montagna per ritrovare la serenità perduta. Ma in quello chalet si aggira un\' oscura presenza. Con l\'arrivo imprevisto del suo fidanzato lo spirito oscuro comincerà a manifestarsi sempre più ossessivamente. Non appena poi la donna inizierà a comportarsi in modo strano e irrazionale, sarà difficile stabilire il confine tra pazzia e regno del male...',2010,7.80),('The War - Il pianeta delle scimmie','Matt Reeves','immagini/The War - Il pianeta delle scimmiewar.jpg','fantascienza','Andy Serkis,Woody Harrelson,Steve Zahn,Amiah Miller','Nonostante la morte di Koba, la guerra scatenata da questi tra le scimmie e gli umani procede senza sosta. I soldati americani, guidati dal Colonnello, vogliono catturare Cesare, geniale condottiero dei primati super-intelligenti, e ristabilire il primato della razza umana.',2017,14.99),('Tomb Raider','Roar Uthaug','immagini/Tomb RaiderTomb Raider.jpg','azione','Kristin Scott Thomas, Dominic West, Alicia Vikander, Walton Goggins','Londra. Lara non accetta l\'idea che il padre Richard, partito anni prima in viaggio, sia morto, e rifiuta di firmare le carte che la renderebbero ereditiera di enormi ricchezze. Quando scopre che la vera professione del padre era quella di archeologo, parte per Hong Kong per mettersi sulle sue tracce.',2018,13.98);
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `utente` (
  `nome` char(20) DEFAULT NULL,
  `cognome` char(20) DEFAULT NULL,
  `usr` varchar(15) NOT NULL,
  `psw` varchar(15) NOT NULL,
  `email` varchar(25) NOT NULL,
  `dataNascita` date DEFAULT NULL,
  `numeroCarta` int(16) DEFAULT NULL,
  `scadenzaCarta` date DEFAULT NULL,
  `residenza` varchar(30) DEFAULT NULL,
  `luogoNascita` varchar(15) DEFAULT NULL,
  `boolDati` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`usr`,`email`),
  UNIQUE KEY `usr` (`usr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES ('weqew','wqewq','iiii','uuu','i@f.com','2019-09-18',21313,'2019-01-01','wqeq','qweq','1'),('','','la','servlet','cambiando',NULL,NULL,NULL,NULL,NULL,NULL),('prova','senza','nell ','account','dati','2019-08-21',3232,'2019-01-01','wqeqe','wqeqwe','1'),('','prova','or','jsp','con ',NULL,NULL,NULL,NULL,NULL,NULL),('rob','dilo','poi','poi','modifica32','1994-02-08',4444,'2023-01-01','mod','av','1'),(NULL,NULL,'ppp','ooo','q@.q',NULL,NULL,NULL,NULL,NULL,NULL),(NULL,NULL,'qqq','111','a@a.com',NULL,NULL,NULL,NULL,NULL,NULL),('','','qweqweqw','wqeqeq','qwe',NULL,NULL,NULL,NULL,NULL,NULL),('qwer','qwer','qwer','qwer','qwer',NULL,NULL,NULL,NULL,NULL,'1'),('Nome con spazi','cognome con spazi','qwertyuop','qwertyuiop','waewqewqe',NULL,NULL,NULL,NULL,NULL,NULL),('qwq','qwq','qwq','qwq','qwq',NULL,NULL,NULL,NULL,NULL,NULL),('','','senza','nome','prova@com',NULL,NULL,NULL,NULL,NULL,NULL),('','','username','password','email',NULL,NULL,NULL,NULL,NULL,NULL),('nome1','cognome1','username1','password1','email1',NULL,NULL,NULL,NULL,NULL,NULL),('nome','cognome','usr','psw','email',NULL,NULL,NULL,NULL,NULL,NULL),('Stefano','Mamone Capria','wewqeqwewqe','wqewqeqweqw','wqewqeqw@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL),('eqewq','wqeq','wqe','wqe','wqe',NULL,NULL,NULL,NULL,NULL,NULL),('wqewqe','wqeqw','wqeq','wqeq','wqewq',NULL,NULL,NULL,NULL,NULL,NULL),('Stefano','Mamone Capria','wqewqe','wqeqw','weqwqeq',NULL,NULL,NULL,NULL,NULL,NULL),('wwwwwww','wewqeqw','wwwwww','wwwwwww','wqewqe',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voti`
--

DROP TABLE IF EXISTS `voti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `voti` (
  `usr` varchar(15) DEFAULT NULL,
  `nomeFilm` varchar(50) DEFAULT NULL,
  `starRating` double(10,2) DEFAULT NULL,
  `numeroVoti` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voti`
--

LOCK TABLES `voti` WRITE;
/*!40000 ALTER TABLE `voti` DISABLE KEYS */;
/*!40000 ALTER TABLE `voti` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-03 13:54:38
