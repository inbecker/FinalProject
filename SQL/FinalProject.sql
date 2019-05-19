/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`FinalProject` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `FinalProject`;

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE users (
    id INT NOt NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Orders Table*/
DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `orderDate` date NOT NULL,
  `shippedDate` date DEFAULT NULL,
  `status` varchar(15) ,
  `comments` text,
  `customerID` int(11) NOT NULL,
  PRIMARY KEY (`orderID`),
  KEY `customerID` (`customerID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customers` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `orders` */

INSERT  INTO `orders`(`orderDate`,`shippedDate`,`status`,`comments`,`customerID`) VALUES 

('2019-01-06','2019-01-13','Shipped',NULL,1),
('2019-01-09','2019-01-18','Shipped','Check on availability.',2),
('2019-01-10','2019-01-18','Shipped',NULL,3);


/*OrderDetails Table*/

DROP TABLE IF EXISTS `orderdetails`;

CREATE TABLE `orderdetails` (
  `orderID` int(11) NOT NULL,
  `beerID` varchar(15) NOT NULL,
  `quantityOrdered` int(11) NOT NULL,
  PRIMARY KEY (`orderID`,`beerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*data for order details*/
insert  into `orderdetails`(`orderID`,`beerID`,`quantityOrdered`) values 
(1,'181',3),
(2,'811',3),
(3,'901',2);

/*BEER INFORMATION*/
DROP TABLE IF EXISTS `beerCategory`;

CREATE TABLE `beerCategory` (
  `catID` int(11) NOT NULL,
  `catName` varchar(50) NOT NULL,
  PRIMARY KEY (`catID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT  INTO `beerCategory`(`catID`,`catName`) VALUES 
(1,'British Ale'),
(2	,'Irish Ale'),
(3	,'North American Ale'),
(4	,'German Ale'),
(5	,'Belgian and French Ale'),
(6	,'International Ale'),
(7	,'German Lager'),
(8	,'North American Lager'),
(9	,'Other Lager'),
(10,'International Lager'),
(11, 'Other Styles');


DROP TABLE IF EXISTS `beerStyle`;

CREATE TABLE `beerStyle` (
  `styleID` int(11) NOT NULL,
  `catID` int(11) NOT NULL,
  `price` double,
  `styleName` varchar(50) NOT NULL,
  PRIMARY KEY (`styleID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `beerStyle`(`styleID`,`catID`,`price`,`styleName`) VALUES 
(	1	,	1	,	11	,	'Classic English-Style Pale Ale')	,																							
(	2	,	1	,	11	,	'English-Style India Pale Ale')	,																							
(	3	,	1	,	11	,	'Ordinary Bitter')	,																							
(	4	,	1	,	11	,	'Special Bitter or Best Bitter')	,																							
(	5	,	1	,	11	,	'Extra Special Bitter')	,																							
(	6	,	1	,	11	,	'English-Style Summer Ale')	,																							
(	7	,	1	,	11	,	'Scottish-Style Light Ale')	,																							
(	8	,	1	,	11	,	'Scottish-Style Heavy Ale')	,																							
(	9	,	1	,	11	,	'Scottish-Style Export Ale')	,																							
(	10	,	1	,	11	,	'English-Style Pale Mild Ale')	,																							
(	11	,	1	,	11	,	'English-Style Dark Mild Ale')	,																							
(	12	,	1	,	11	,	'English-Style Brown Ale')	,																							
(	13	,	1	,	11	,	'Old Ale')	,																							
(	14	,	1	,	11	,	'Strong Ale')	,																							
(	15	,	1	,	11	,	'Scotch Ale')	,																							
(	16	,	1	,	11	,	'British-Style Imperial Stout')	,																							
(	17	,	1	,	11	,	'British-Style Barley Wine Ale')	,																							
(	18	,	1	,	11	,	'Robust Porter')	,																							
(	19	,	1	,	11	,	'Brown Porter')	,																							
(	20	,	1	,	21	,	'Sweet Stout')	,																							
(	21	,	1	,	21	,	'Oatmeal Stout')	,																							
(	22	,	2	,	21	,	'Irish-Style Red Ale')	,																							
(	23	,	2	,	15	,	'Classic Irish-Style Dry Stout')	,																							
(	24	,	2	,	15	,	'Foreign (Export)-Style Stout')	,																							
(	25	,	2	,	15	,	'Porter')	,																							
(	26	,	3	,	15	,	'American-Style Pale Ale')	,																							
(	27	,	3	,	15	,	'Fresh Hop Ale')	,																							
(	28	,	3	,	15	,	'Pale American-Belgo-Style Ale')	,																							
(	29	,	3	,	15	,	'Dark American-Belgo-Style Ale')	,																							
(	30	,	3	,	15	,	'American-Style Strong Pale Ale')	,																							
(	31	,	3	,	15	,	'American-Style India Pale Ale')	,																							
(	32	,	3	,	15	,	'Imperial or Double India Pale Ale')	,																							
(	33	,	3	,	31	,	'American-Style Amber/Red Ale')	,																							
(	34	,	3	,	31	,	'Imperial or Double Red Ale')	,																							
(	35	,	3	,	31	,	'American-Style Barley Wine Ale')	,																							
(	36	,	3	,	31	,	'American-Style Wheat Wine Ale')	,																							
(	37	,	3	,	31	,	'Golden or Blonde Ale')	,																							
(	38	,	3	,	31	,	'American-Style Brown Ale')	,																							
(	39	,	3	,	31	,	'Smoke Porter')	,																							
(	40	,	3	,	31	,	'American-Style Sour Ale')	,																							
(	41	,	3	,	31	,	'American-Style India Black Ale')	,																							
(	42	,	3	,	9.99	,	'American-Style Stout')	,																							
(	43	,	3	,	9.99	,	'American-Style Imperial Stout')	,																							
(	44	,	3	,	9.99	,	'Specialty Stouts')	,																							
(	45	,	3	,	9.99	,	'American-Style Imperial Porter')	,																							
(	46	,	3	,	9.99	,	'Porter')	,																							
(	47	,	4	,	9.99	,	'German-Style Kolsch')	,																							
(	48	,	4	,	9.99	,	'Berliner-Style Weisse')	,																							
(	49	,	4	,	9.99	,	'Leipzig-Style Gose')	,																							
(	50	,	4	,	9.99	,	'South German-Style Hefeweizen')	,																							
(	51	,	4	,	9.99	,	'South German-Style Kristal Weizen')	,																							
(	52	,	4	,	9.99	,	'German-Style Leichtes Weizen')	,																							
(	53	,	4	,	15	,	'South German-Style Bernsteinfarbenes Weizen')	,																							
(	54	,	4	,	15	,	'South German-Style Dunkel Weizen')	,																							
(	55	,	4	,	15	,	'South German-Style Weizenbock')	,																							
(	56	,	4	,	15	,	'Bamberg-Style Weiss Rauchbier')	,																							
(	57	,	4	,	15	,	'German-Style Brown Ale/Altbier')	,																							
(	58	,	4	,	15	,	'Kellerbier - Ale')	,																							
(	59	,	5	,	15	,	'Belgian-Style Flanders/Oud Bruin')	,																							
(	60	,	5	,	15	,	'Belgian-Style Dubbel')	,																							
(	61	,	5	,	15	,	'Belgian-Style Tripel')	,																							
(	62	,	5	,	15	,	'Belgian-Style Quadrupel')	,																							
(	63	,	5	,	15	,	'Belgian-Style Blonde Ale')	,																							
(	64	,	5	,	15	,	'Belgian-Style Pale Ale')	,																							
(	65	,	5	,	15	,	'Belgian-Style Pale Strong Ale')	,																							
(	66	,	5	,	15	,	'Belgian-Style Dark Strong Ale')	,																							
(	67	,	5	,	15	,	'Belgian-Style White')	,																							
(	68	,	5	,	15	,	'Belgian-Style Lambic')	,																							
(	69	,	5	,	15	,	'Belgian-Style Gueuze Lambic')	,																							
(	70	,	5	,	19	,	'Belgian-Style Fruit Lambic')	,																							
(	71	,	5	,	19	,	'Belgian-Style Table Beer')	,																							
(	72	,	5	,	19	,	'Other Belgian-Style Ales')	,																							
(	73	,	5	,	19	,	'French-Style Biere de Garde')	,																							
(	74	,	5	,	19	,	'French & Belgian-Style Saison')	,																							
(	75	,	6	,	19	,	'International-Style Pale Ale')	,																							
(	76	,	6	,	19	,	'Australasian-Style Pale Ale')	,																							
(	77	,	7	,	19	,	'German-Style Pilsener')	,																							
(	78	,	7	,	19	,	'Bohemian-Style Pilsener')	,																							
(	79	,	7	,	19	,	'European Low-Alcohol Lager')	,																							
(	80	,	7	,	19	,	'Munchner-Style Helles')	,																							
(	81	,	7	,	19	,	'Dortmunder/European-Style Export')	,																							
(	82	,	7	,	19	,	'Vienna-Style Lager')	,																							
(	83	,	7	,	19	,	'German-Style Marzen')	,																							
(	84	,	7	,	19	,	'German-Style Oktoberfest')	,																							
(	85	,	7	,	19	,	'European-Style Dark')	,																							
(	86	,	7	,	19	,	'German-Style Schwarzbier')	,																							
(	87	,	7	,	19	,	'Bamberg-Style Marzen')	,																							
(	88	,	7	,	19	,	'Bamberg-Style Helles Rauchbier')	,																							
(	89	,	7	,	19	,	'Bamberg-Style Bock Rauchbier')	,																							
(	90	,	7	,	19	,	'Traditional German-Style Bock')	,																							
(	91	,	7	,	19	,	'German-Style Heller Bock/Maibock')	,																							
(	92	,	7	,	19	,	'German-Style Doppelbock')	,																							
(	93	,	7	,	19	,	'German-Style Eisbock')	,																							
(	94	,	7	,	19	,	'Kellerbier - Lager')	,																							
(	95	,	8	,	19	,	'American-Style Lager')	,																							
(	96	,	8	,	19	,	'American-Style Light Lager')	,																							
(	97	,	8	,	19	,	'American-Style Low-Carb Light Lager')	,																							
(	98	,	8	,	19	,	'American-Style Amber Lager')	,																							
(	99	,	8	,	19	,	'American-Style Premium Lager')	,																							
(	100	,	8	,	19	,	'American-Style Pilsener')	,																							
(	101	,	8	,	19	,	'American-Style Ice Lager')	,																							
(	102	,	8	,	19	,	'American-Style Malt Liquor')	,																							
(	103	,	8	,	19	,	'American-Style Amber Lager')	,																							
(	104	,	8	,	19	,	'American-Style Marzen/Oktoberfest')	,																							
(	105	,	8	,	19	,	'American-Style Dark Lager')	,																							
(	106	,	9	,	19	,	'Baltic-Style Porter')	,																							
(	107	,	9	,	19	,	'Australasian-Style Light Lager')	,																							
(	108	,	9	,	19	,	'Latin American-Style Light Lager')	,																							
(	109	,	9	,	19	,	'Tropical-Style Light Lager')	,																							
(	110	,	10	,	19	,	'International-Style Pilsener')	,																							
(	111	,	10	,	19	,	'Dry Lager')	,																							
(	112	,	11	,	19	,	'Session Beer')	,																							
(	113	,	11	,	19	,	'American-Style Cream Ale or Lager')	,																							
(	114	,	11	,	19	,	'California Common Beer')	,																							
(	115	,	11	,	19	,	'Japanese Sake-Yeast Beer')	,																							
(	116	,	11	,	19	,	'Light American Wheat Ale or Lager')	,																							
(	117	,	11	,	19	,	'Fruit Wheat Ale or Lager')	,																							
(	118	,	11	,	19	,	'Dark American Wheat Ale or Lager')	,																							
(	119	,	11	,	19	,	'American Rye Ale or Lager')	,																							
(	120	,	11	,	19	,	'German-Style Rye Ale')	,																							
(	121	,	11	,	19	,	'Fruit Beer')	,																							
(	122	,	11	,	19	,	'Field Beer')	,																							
(	123	,	11	,	19	,	'Pumpkin Beer')	,																							
(	124	,	11	,	19	,	'Chocolate/Cocoa-Flavored Beer')	,																							
(	125	,	11	,	19	,	'Coffee-Flavored Beer')	,																							
(	126	,	11	,	19	,	'Herb and Spice Beer')	,																							
(	127	,	11	,	19	,	'Specialty Beer')	,																							
(	128	,	11	,	19	,	'Specialty Honey Lager or Ale')	,																							
(	129	,	11	,	19	,	'Gluten-Free Beer')	,																							
(	130	,	11	,	19	,	'Smoke Beer')	,																							
(	131	,	11	,	19	,	'Experimental Beer')	,																							
(	132	,	11	,	19	,	'Out of Category')	,																							
(	133	,	11	,	19	,	'Wood- and Barrel-Aged Beer')	,																							
(	134	,	11	,	19	,	'Wood- and Barrel-Aged Pale to Amber Beer')	,																							
(	135	,	11	,	19	,	'Wood- and Barrel-Aged Dark Beer')	,																							
(	136	,	11	,	19	,	'Wood- and Barrel-Aged Strong Beer')	,																							
(	137	,	11	,	19	,	'Wood- and Barrel-Aged Sour Beer')	,																							
(	138	,	11	,	19	,	'Aged Beer')	,																							
(	139	,	11	,	19	,	'Other Strong Ale or Lager')	,																							
(	140	,	11	,	19	,	'Non-Alcoholic Beer')	,																							
(	141	,	11	,	19	,	'Winter Warmer')	;																							
																															

DROP TABLE IF EXISTS `brewery`;

CREATE TABLE `brewery` (
  `breweryID` int(11) NOT NULL,
  `breweryName` varchar(50) NOT NULL,
  `address` varchar(100) ,
  `city` varchar(50) ,
  `state` varchar(50) ,
  `postalCode` varchar(15) ,
  `country` varchar(50) ,
  `phone` varchar(50) ,
  `website` varchar(50),
  `description` varchar(5000) ,
  PRIMARY KEY (`breweryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

							
INSERT INTO `brewery` ( `breweryID`,
  `breweryName` ,
  `address`,
  `city` ,
  `state`,
  `postalCode`,
  `country` ,
  `phone` ,
  `website` ,
  `description`) VALUES
(	1	,"(512) Brewing Company","407 Radam, F200","Austin","Texas","78745","United States","512.707.2337","http://512brewing.com/","(512) Brewing Company is a microbrewery located in the heart of Austin that brews for the community using as many local, domestic and organic ingredients as possible.")	,				
(	2	,"21st Amendment Brewery Cafe","563 Second Street","San Francisco","California","94107","United States","1-415-369-0900","http://www.21st-amendment.com/","The 21st Amendment Brewery offers a variety of award winning house made brews and American grilled cuisine in a comfortable loft like setting. Join us before and after Giants baseball games in our outdoor beer garden. A great location for functions and parties in our semi-private Brewers Loft. See you soon at the 21A!")	,				
(	8	,"Abbey Wright Brewing/Valley Inn","204 Valley Street","Williamsport","Pennsylvania","17702","United States","570.326.3383","http://www.valleyinnonline.com/",NULL)	,				
(	9	,"Aberdeen Brewing","210 Aberdeen Dr.","Valparaiso","Indiana",NULL,"United States","(219) 548-3300",NULL,NULL)	,				
(	10	,"Abita Brewing Company","PO Box 1510","Abita Springs","Louisiana","70420","United States","800-737-2311","http://www.abita.com/","Founded in 1986, the Abita Brewing Company is nestled in the piney woods 30 miles north of New Orleans. In its first year, the brewery produced 1,500 barrels of beer. We had no idea what we started. Customers loved our beer! By 1994, we outgrew the original site (now our 100 seat brew pub) and were forced to move up the road to a larger facility to keep up with demand. Today, we brew over 62,000 barrels of beer and 3,000 barrels of root beer, and we're still growing! But don't let our growth fool you. Our lagers and ales are still brewed in small batches, hand-crafted by a team of dedicated workers with only the highest ideals of quality. This pride, along with our brewing process, is what creates our great brews. Abita uses only the finest ingredients British and American barley, German yeast, European and Washington State hops and the pure artesian water of Abita Springs. In Abita, we are blessed with the purest of water. Drawn from our deep wells, our pristine water is not altered in any way. Abita Beer has no preservatives, additives or stabilizers and is cold filtered. The result is beer that is the finest and freshest tasting as proven by our loyal customers and great chefs of the south who use Abita Beer in their recipes. We're proud of our brewery and the beers we make. Try Abita Beer today and taste a bit of the South!")	,				
(	14	,"Aksarben Brewing (BOP)","11337 Davenport St.","Omaha","Nebraska","68130","United States",NULL,NULL,"This brewery is closed.")	,				
(	16	,"Alameda Brewhouse","4765 NE Fremont","Portland","Oregon","97213","United States","1-503-460-9025",NULL,NULL)	,				
(	17	,"Alaskan Brewing","5429 Shaune Drive","Juneau","Alaska","99801","United States","1-907-780-5866","http://www.alaskanbeer.com/","The popularity of our beers has led to heroic efforts to keep up with the demand. We claim the unofficial record for production on a 10 barrel brewing system, with a whopping 42 batches in a single week. The addition of a new, 100-barrel brewhouse in 1995, and a Sankey-type keg system installed the following year, finally made it possible for us to serve the entire Pacific Northwest and later the Desert Southwest. Brewing beer in Alaska isn't easy. In the coastal community of Juneau, without road connections to the lower 48 states, everything arrives and leaves by water or air, and the weather always has the last word. We have learned to coordinate shipments for barges that couldn't dock in high winds, ferries that broke down, airplanes that overheaded, and trucks delayed by spring thaws that turned the roads to mush. We learned which suppliers were willing to airlift supplies and spare parts on short notice (at $1 per pound). We mastered wiring, plumbing, waste disposal and air quality control. We discovered that, if you had to, you could pour concrete in January by thawing the ground with heaters. Ah, but it all seems worthwhile if you can go home to a dinner of king crab or fresh halibut.")	,				
(	20	,"Ale Asylum","3698 Kinsman Blvd","Madison","Wisconsin","53704","United States","6086633926","http://www.aleasylum.com/","HOURS OF OPERATION:")	,				
(	21	,"AleSmith Brewing","9368 Cabot Drive","San Diego","California","92126","United States","1-858-549-9888","http://alesmith.com/",NULL)	,				
(	22	,"Ali`i Brewing",NULL,"Honolulu","Hawaii",NULL,"United States",NULL,NULL,NULL)	,				
(	23	,"Allagash Brewing","100 Industrial Way","Portland","Maine","4103","United States","1-800-330-5385","http://www.allagash.com/","Allagash Brewing Company sold its first batch of beer in the summer of 1995. The Allagash story, however, has roots that go much further back then the ten years the Portland, Maine brewery has been in operation. The roots go into the early 1990's when founder Rob Tod saw something missing in the American beer market. They are interwoven in the craft brewing movement that has allowed the creativity of brewers to flourish over the last twenty years, and those same roots have ties that go back centuries-to the monasteries of Belgium, whose own ancient brewing methods are now practiced today by the brewers of Allagash. Allagash began as a one-man operation, with Tod assuming all brewing duties in a small space located in a building on the outskirts of the maritime city of Portland. Tod had worked in brewery settings before and recognized a void within the craft brewing movement. While both German and British styles had become prevalent throughout the U.S., the ever-creative Belgian-styles were very difficult to find. Through his travels, Tod had sampled many of these unique beers and felt that the flavors and traditions of this European nation needed to be shared with the American drinking public. He designed a small 15-barrel brewhouse specifically to embrace the Belgian tradition of beer making, gathered the finest array of authentic raw materials and began his quest towards the production of traditional Belgian style ales. Allagash began with the release of its Allagash White, modeled after the traditional White beers of Belgium. Also referred to as wit beers, they get their unique flavor from the use of wheat in place of barley, Curacao orange peel and the careful sprinkling of coriander and other spices. Allagash combined these ingredients with their very own proprietary Belgian yeast strain to create the remarkably unique and refreshing beer that is today their flagship brand. Allagash White developed a strong cult following around the Portland area where it was available at selected draft accounts. Due to its immediate success, the beer was soon made available in 12-ounce six-packs throughout the state of Maine. With the success of the first brand, Rob realized two things: The public was asking for some new styles and the workload was getting to be too much for one person. Soon after, two experienced brewers were hired and Allagash released their second brew, Allagash Double Ale. Using the philosophy and techniques created by the Trappist Monks of Belgium centuries ago, the staff created this beer using seven different malts, a traditional sugar, and their own Belgian yeast strain. The result was another unique yet balanced beer crafted in the classic Belgian style. To truly appreciate the classic styles and brewing traditions of Belgium, one must experience beer created in the classic Belgian package. This is why Allagash, after an extensive period of research, released their distinctive Reserve line of cork finished 750 ML bottles. This unique line employs the ancient tradition referred to as the m√©thode champenoise. The technique calls for two fermentations, one in the Brewery's fermenting tanks and the second in the bottle itself. It is this second fermentation that produces a notable increase in carbonation, a softer mouthfeel, and beers of remarkable complexity. This method of bottle conditioning leaves a small amount of yeast in the bottle, creating what is known as a living beer. As a result, these styles have a greatly enhanced shelf life and some styles will age exceptionally, much like a fine wine. Just as the styles originate in Belgium, so does the package itself. To insure authenticity, Allagash imports the bottles and corks directly from the same country that designed the techniques. This enables the beers to reach carbonation levels similar to champagne while allowing the corks to pop characteristically upon serving. Today, Allagash still remains one of very few breweries in North America using this distinctive package. From the very beginning, Allagash has strived to produce the finest Belgian-style and experimental ales this side of the Atlantic. It began as New England's original Belgian-Style brewery and has grown into one of the industry's most distinguished and well-respected brands. Following the time-tested brewing traditions of ancient Belgium, Allagash now produces a broad-ranging portfolio of artisanal beers with uncompromising quality.")	,				
(	25	,"Allentown Brew Works","814 W Hamilton St","Allentown","Pennsylvania","18101","United States","610.433.7777","http://www.thebrewworks.com/allentown-brewworks/","The Allentown Brew Works is housed inside the historic Harold's Furniture Building at 812 W Hamilton Street. Years in the making, the new Allentown restaurant and brewery are part of the continuing vision of the Fegley family that established the original Bethlehem Brew Works in 1998. Proud to be part of the resurging downtown, the 400 seat restaurant is a testament to the vibrant heartbeat that thrives in this Queen City. Offering two and a half levels of dining, plus state of the art banquet facilities in The Hamilton Room, and multiple bars offering different atmospheres, as well as an outdoor casual Biergarten and a new seductive lower level lounge ÔøΩ Silk.")	,				
(	28	,"Alltech's Lexington Brewing Company","401 Cross Street","Lexington","Kentucky","40508","United States","1-859-887-3406","http://www.kentuckyale.com/kentuckyale/Index.html","Producers of Kentucky Ale brand. Also a very esteemed educational institution, specializing in distilling sciences and fermentation sciences.")	,				
(	29	,"Alpine Beer Company","2351 Alpine Boulevard","Alpine","California","91901","United States","1-619-445-2337","http://www.alpinebeerco.com/",NULL)	,				
(	32	,"America's Brewing","205 North Broadway","Aurora","Illinois","60505","United States","1-630-264-2739",NULL,NULL)	,				
(	33	,"American River Brewing",NULL,"Auburn","California",NULL,"United States",NULL,NULL,NULL)	,				
(	34	,"Amerisports Brew Pub","8201 NE Birmingham Road","Kansas City","Missouri","64161","United States","1-816-414-7000",NULL,NULL)	,				
(	35	,"Amherst Brewing Company","24 North Pleasant Street","Amherst","Massachusetts","1002","United States","413-253-4400","http://www.amherstbrewing.com/","Amherst Brewing Company is a full-service brewpub located in downtown Amherst, Massachusetts. Our 10-Barrel brewery is visible from the bar and produces some of the finest ales and lagers for serving in our 150-seat restaurant and 100-seat lounge and game room. Brewery tours can be made by appointment. Our giant, brass-top bar seats over 30 people and is fully stocked, including Single Malt Scotches and Small Batch Bourbons. An additional 40 seats are available on our seasonal patio; the best place in town to relax and enjoy an ABC draft or specialty brew while watching passersby. --From Amherst Website")	,				
(	36	,"Amicas Pizza, Microbrews and More","136 East Second Street","Salida","Colorado","81201","United States","1-719-539-5219",NULL,NULL)	,				
(	38	,"Anacortes Brewing","320 Commercial Avenue","Anacortes","Washington","98221","United States","360-588-1720","http://www.anacortesrockfish.com/","Our brewers focus on high quality ingredients, a carefully controlled process and delicate handling to provide one of the best beers you will find in the industry. We operate a seven barrel brewery designed and installed by Sound Brewing Systems of Seattle with vessels fabricated by Ripley Stainless in British Columbia. Our brewery features a cold room specially designed for lagering to provide our beers with a traditional character and complexity.")	,				
(	39	,"Anchor Brewing","1705 Mariposa Street","San Francisco","California","94107","United States","1-415-863-8350",NULL,NULL)	,				
(	41	,"Anderson Valley Brewing","17700 Boonville Rd","Boonville","California","95415","United States","1-800-207-2337","http://avbc.com/",NULL)	,				
(	42	,"Andrew's Brewing",NULL,"Lincolnville","Maine","4849","United States","(207) 763-3305",NULL,"Andy Hazen is a workhorse of a brewer. From start to finish, he is a one-man operation. The former cabinetmaker is also a self-reliant Mainer through and through. He was originally an all-grain homebrewer who decided to take it to the next level when his friends expressed interest in his beers. He designed the 12-barrel brewing system himself and enlisted a local welder to help put it together. Hazen notes that when you live in Maine, you have to find some service to provide to others in order to survive. For him, brewing is the service he provides to his local community. Located in the rolling hills of Lincolnville, Maine, Andrew's is housed in a renovated farmhouse next to Hazen's home. Finding the brewery is more than half the battle. Have no fear, however, as everyone knows about Andrew's. Also, be aware that due to some thieving souls, the brewery no longer has any signage to announce its existence to the visiting public. The only indication that a brewery exists in the farmhouse are the occasional keg deliveries in Hazen's front yard. And Hazen hasn't been quick to replace the sign either. While he welcomes visitors, you have to remember to clear a path for the busy brewer. Like many other unsung small brewers, running his 5OO-barrel per year brewery is a seven day a week operation for Hazen. Watching Hazen run the brewery is a little like watching Willy Wonka run the Chocolate Factory. When I visit him during a bottling day, Hazen runs between the bottling line and the packaging supplies in a hurried yet methodical manner. He stands up bottles on the line, starts the machine, slides his way across the brewhouse to the packaging materials, and hand assembles the six-packs that will hold the soon-to-be bottled beer. Andrew's beer is straightforward, unassuming and entirely enjoyable. His product line includes the St. Nick Porter, the Northern Brown Ale, the English Pale Ale, and the summer seasonal Ruby's Golden Ale. A celebration of the Amarillo hop, Hazen's English Pale Ale is a delightfully balanced product that neither over or underwhelms the palate. from beerscribe.com")	,				
(	43	,"Angelic Brewing",NULL,"Madison","Wisconsin","53703","United States","1-608-257-2707",NULL,"(No longer brewing)")	,				
(	44	,"Anheuser-Busch","One Busch Place","Saint Louis","Missouri","63118","United States","1-800-342-5283","http://www.anheuser-busch.com/","Anheuser-Busch operates 12 breweries in the United States, 14 in China and one in the United Kingdom. Anheuser-Busch's operations and resources are focused on adding to life's enjoyment not only through the responsible consumption of beer by adults, but through theme park entertainment and packaging. In the United States, the company holds a 48.5 percent share of U.S. beer sales. Worldwide, Anheuser-Busch's beer sales volume was 128.4 million barrels in 2007. The St. Louis-based company's subsidiaries include one of the largest U.S. manufacturers of aluminum beverage containers and one of the world's largest recyclers of aluminum beverage cans. Anheuser-Busch also has interests in malt production, rice milling, real estate development, turf farming, metalized and paper label printing, bottle production and transportation services.")	,				
(	45	,"Appalachian Brewing Company","50 N. Cameron St.","Harrisburg","Pennsylvania","17110","United States","717.221.1080","http://www.abcbrew.com","Appalachian Brewing Company is a unique large-capacity microbrewery and full-service brewpub located at 50 North Cameron Street Harrisburg, PA.")	,				
(	46	,"Appleton Brewing",NULL,"Appleton","Wisconsin",NULL,"United States",NULL,NULL,NULL)	,				
(	47	,"Arcadia Brewing","103 West Michigan Avenue","Battle Creek","Michigan","49017","United States","1-269-963-9690","http://www.arcadiaales.com/",NULL)	;	


/*Beer Table*/

DROP TABLE IF EXISTS `beer`;

CREATE TABLE `beer` (
  `beerID` int(11) NOT NULL,
  `breweryID` varchar(50) NOT NULL,
  `beerName` varchar(100) ,
  `catID` int(11) NOT  NULL,
  `styleID` int(11) NOT  NULL,
  `ABV` double ,
  `description` varchar(5000) ,
  PRIMARY KEY (`beerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `beer` (`beerID`,`breweryID`, `beerName`, `catID`, `styleID`,`ABV`,  `description`  ) VALUES
(	923	,	21	,	"Speedway Stout",	3	,	43	,	12	,	"A HUGE Imperial Stout that weighs in at an impressive 12% ABV! As if that's not enough, we added pounds of coffee for a little extra kick. Our special-edition Brewer's Reserve Speedway Stout, which is aged in Bourbon barrels, has been rated the #1 BEST BEER IN THE WORLD at ratebeer.com. It was also featured on CNBC's 'Squawk Box' in a segment on the best dark beers in America.")	,					
(	1256	,	29	,	"Pure Hoppiness",	3	,	32	,	8	,	"A West Coast Double IPA
So mega-hopped it will take you to hop heaven. We've used hops in the boil, more hops in the giant hopback, and added to that, an incredible amount of dry-hopping for that cutting-edge hop bite. Once you've tasted this unique beer, all others pale in comparison. 1.072 OG Classified IBU 8%ABV")	,							
(	3784	,	44	,	"Bud Light",	8	,	96	,	4.199999809	,	"Introduced nationally in 1982, Bud Light is brewed using a blend of domestic and imported hops as well as a combination of barley malts and rice. It contains more malt and hops by ratio of ingredients than Budweiser, which gives the brew a distinctively clean and crisp taste.")	,							
(	3785	,	44	,	"Budweiser Select",	8	,	96	,	4.300000191	,	"Bud Select is a new beer offering a bold taste with a full and distinct flavor that finishes clean. Budweiser Select was developed using two-row and roasted specialty malts for a rich color. It offers excellent drinkability and a taste that does not linger.")	,							
(	3788	,	45	,	"Broad Street Barleywine",	3	,	35	,	8.699999809	,	"Our Barley Wine is dark red in color and has an original gravity of 1.120 (24 Plato). The malt complexity of this classic ale style is incredible.

The Broad Street Market is located just blocks from the Appalachian Brewing Company. This indoor farmers market was built in 1863 and is one of the oldest continuously operating farmers markets in the United States. The beautiful brick facade and natural wood doors are typical of the structures in Downtown Harrisburg; including our own building.")	,							
(	3789	,	45	,	"Water Gap Wheat",	11	,	116	,	4.5	,	"This light refreshing wheat beer is sure to delight. Our special yeast and blend of malted and unmalted wheat provide the haze in our unfiltered style ale. This beer is traditionally served with a lemon slice on the side. 
There are many water gaps along the Appalachian Trail. These water gaps were established where large rivers cut through the Appalachian Mountain Range. The Susquehanna River creates one of the more visually appealing water gaps just north of Harrisburg in the area at the Dauphin Narrows.")	,							
(	3790	,	45	,	"Mountain Lager",	8	,	95	,	4.5	,	"The Dortmunder-Export style of beer was developed in Westfalen, Germany, and is a classic light lager with great character. This style boasts a light golden blonde color and exhibits a moderate hop palate. The finish of our Mountain Lager is rich yet mellow.
Our brewers have developed this beer as a tribute to the Appalachian Mountains where we live and play.")	,							
(	3791	,	45	,	"Volks Weizenbock",	4	,	55	,	7.199999809	,	"Volks Weizenbock combines the strong malty component of a bock bier with the tangy, spiciness of the Hefe Weizen.  This beer is brewed 1 1/2 times stronger than our Hefe Weizen and is aged commensurately longer for extra smoothness!  
Volks Weizenbock is 'The Peoples Beer'!")	,							
(	3792	,	45	,	"Purist Pale Ale",	3	,	26	,	4.900000095	,	"Our light copper pale ale has a delicate malt attribute balanced by an aggressive hop flavor and aroma. Many American micros have developed their own version of this classic English style beer. Our brewers anticipate that you will enjoy their variation. 
Hikers on the Appalachian Trail are considered 'purist hikers' if they cover every inch of the trail during the hike. Our brewers refuse to compromise the quality of our products with the 'purist hiker' in mind.")	,							
(	3793	,	45	,	"Jolly Scot Scottish Ale",	1	,	15	,	5.199999809	,	"This flavorful sweet ale has a smooth malt finish balanced against a light hop flavor. This beer is very quaffable and has become a brewpub favorite throughout the United States. 
'Jolly Scot' was a famed local beer produced by R.H. Graupners Brewery that was located at 10th and Market √¢‚Ç¨‚Äú one block from our brewery.")	,							
(	3794	,	45	,	"Hoppy Trails India Pale Ale",	3	,	31	,	6.199999809	,	"This IPA is an exciting beer with a floral in aroma and an incredible hop flavor. The maltiness is increased (over a regular pale ale) to help balance the aggressive hop usage. This contributes to the higher alcohol content as well. 
When India was part of the British Empire, pale ale shipped to the troops would often spoil due to the rough voyage and temperature extremes. The brewers had a theory that if they loaded the beer with extra hops, the hops would preserve the beer. Of course, this added significantly to the beer's flavor and aroma. When the troops returned to Britain, they had become 'hop-heads', appreciating the beauty of the hop 'over-influence'. Regular pale ale was simply not enough anymore! A new beer style, India Pale Ale, had been created: an aggressively hoppy and now quite happy to be home pale ale.")	,							
(	3795	,	45	,	"Susquehanna Stout",	3	,	42	,	4.599999905	,	"This representation of the classic Irish Dry Stout has a smooth roast flavor due to the use of specially roasted barley. The barley kernels are kilned at very high temperatures until they are dark brown to black in color. 
The Susquehanna River is named after the Susquehannock Indians who settled in our area. This shallow river is over one mile wide in the Harrisburg area and flows from southern New York through Pennsylvania to the Chesapeake Bay.")	,							
(	3796	,	45	,	"Zoigl Star Lager",	8	,	95	,	5.900000095	,	"Zoigl is a golden, unfiltered lager beer which was originally brewed only in the region of Eastern Bavaria, between Franconia and the Czech Republic. For centuries, Zoigl was brewed in brewhouses owned by the town or an association of small brewers. 

The Zoigl-Star, a six-angular star similar to the Star of David, was the sign of brewers in the middle ages. The star symbolizes the three elements (water, earth, and fire) and the three ingredients (water, malt, and hops) used for brewing. The importance of the yeast was not yet known in the 1400's.")	,							
(	3797	,	45	,	"Abbey Roade Belgian Ale",	5	,	72	,	6.400000095	,	"Abbey Roade is brewed in the tradition of the famous Belgian Abbey-style ales.  This wonderful brew is soft and sweet up front.  The complex and spicy middle palate is in most part due to the generous addition of dark Belgian candy sugar.  This semi-dry ale has notes of ripe plum and pear with a peppery finish. 
The origins of the Abbey-style ale date back to the Middle Ages.  Monks residing in monasteries, called Abbeys, brewed beer as a source of nutrition during their frequent and often lengthy fasting periods.")	,							
(	3798	,	45	,	"Celtic Knot Irish Red",	3	,	33	,	4.800000191	,	"This wonderful red ale has a perfect balance of hops and malt.  The clean finish will leave your palate begging for more.")	,							
(	3799	,	45	,	"Peregrine Pilsner",	7	,	77	,	4.800000191	,	"This Czechoslovakian style Pilsner is golden in color and hopped with a bunch of genuine Czechoslovakian Saaz hops. These hops provide a special floral aroma and a delightfully hoppy finish.
Peregrine Falcons were recently reintroduced to the Harrisburg area as well as other large cities in Pennsylvania. This Falcon is one of the fastest birds, reaching speeds in excess of 200 miles per hour. Its unique ability to rid urban areas of its nemesis, the pigeon, has cities throughout the region clamoring for the Peregrine as a permanent resident.")	,							
(	3800	,	45	,	"Anniversary Maibock",	7	,	91	,	7.199999809	,	"The Maibock style was traditionally produced in the winter and released in early May to celebrate the coming of Spring. This malty lager is deep golden in color and medium in body. The finish holds a bold sweetness that is balanced by a subtle hop flavor and aroma. 

We will be releasing this beer every spring in celebration of our Anniversary.")	,							
(	3801	,	45	,	"Hinterland Hefe Weizen",	4	,	50	,	5.300000191	,	"A special German wheat ale yeast produces clove and banana flavors during fermentation leaving this unfiltered beer with an incredibly spicy and fruity complexity!

Our Brewmaster has acquired many medals at the Great American Beer Festival for this beer style. A difficult, four-step infusion mash schedule produces the complexity of this traditional beer style.")	,							
(	3803	,	45	,	"Kipona Fest",	7	,	84	,	5.199999809	,	"This Oktoberfest style Marzen is a favorite at the famous Bavarian fall beer festivals. The distinct toasted malt flavor of this amber lager finishes quite crisp due to the extensive lagering of this beer. One sip and you'll swear you're in Munich.

'Kipona' is the Indian word for 'sparkling water'. Each year, over Labor Day weekend, Harrisburg celebrates Kipona with a carnival and festival along the Susquehanna River and on City Island.")	,							
(	3804	,	45	,	"Trail Blaze Organic Brown Ale",	3	,	38	,	5.300000191	,	"Trail Blaze Organic American Brown Ale exhibits a beautiful deep copper color and an evident hop bitterness & aroma.  This is balanced against roasted caramel-like characteristics and hints of chocolate. 

Our first in a series of organic beers is named for the markers that keep a hiker on the correct path.  Many of the hiking trails in our area have simple to very distinguished trail blazes.  After a long hike, there is nothing better at the end of the trail than ABC organic ale.")	,							
(	3805	,	45	,	"Pennypacker Porter",	2	,	25	,	5.400000095	,	"This full-bodied dry cousin of the stout has a slight roast flavor and is dark brown in color with a red hue. This is London's classic beer style named for the baggage carriers that appreciated it so much.
Governor Pennypacker was one of Pennsylvania's more notable politicians. He oversaw the construction and held the lavish ceremonies designating the opening of the Commonwealth's beautiful Capitol Building")	,							
(	3806	,	45	,	"Grinnin' Grizzly Spiced Ale",	3	,	33	,	5.699999809	,	"This amber ale is dosed with cinnamon, nutmeg, ginger, and fresh orange zest. It is well balanced with low hop flavor and nice hint of the spices in the finish. This spiced ale is not overbearing; rather it is smooth and very drinkable.")	,							
(	3976	,	44	,	"Wild Blue Blueberry Lager",	5	,	70	,	8	,	"Wild Blue is brewed with a blend of German hops from the Hallertau region in Bavaria and classic Aroma hops from the Willamette Valley in the Pacific Northwest. A combination of two- and six-row barley malt was also chosen specifically for this recipe. Beer lovers will also appreciate this specialty fruit-infused lager's striking burgundy color, ripe blueberry aroma and its ability to stand up to the strongest of foods.")	,							
(	3977	,	44	,	"Shock Top",	5	,	67	,	5.199999809	,	"Shock Top is an unfiltered Belgian-style wheat ale (also known as a White or Wit beer due to its appearance) that is naturally cloudy with a billowy white foam head, light golden hue and slight taste of orange citrus peel and coriander.")	,							
(	3978	,	2	,	"South Park Blonde",	3	,	37	,	5	,	"Light golden color. Sweet dry aroma with crisp, clear bitterness. Brewed with imported German hops.The perfect beer to have when you'd like to have more than one.")	,							
(	3979	,	2	,	"Bitter American",	1	,	4	,	3.599999905	,	"An American session beer. Loaded with hop character and a malty presence, but lower in alcohol.")	,							
(	3980	,	2	,	"Watermelon Wheat",	5	,	70	,	5.5	,	"The definition of summer in a pint glass. This unique, American-style wheat beer, is brewed with 400 lbs. of fresh pressed watermelon in each batch. Light turbid, straw color, with the taste and essence of fresh watermelon. Finishes dry and clean. Now Available in Cans!")	,							
(	3981	,	2	,	"Amendment Pale Ale",	3	,	26	,	5.199999809	,	"Rich golden hue color. Floral hop with sweet malt aroma. Medium mouth feel with malt sweetness, hop quenching flavor and well-balanced bitterness.")	,							
(	3982	,	2	,	"Potrero ESB",	1	,	4	,	5.199999809	,	"Traditional English E.S.B. made with English malt and hops. Fruity aroma with an imparted tart flavor brought about by replicating the water profile in England at Burton on Trent.")	,							
(	3983	,	2	,	"North Star Red",	3	,	33	,	5.800000191	,	"Deep amber color. Subtle hop floral nose intertwined with sweet crystal malt aromas. Rich malt flavors supporting a slight bitterness finish.")	,							
(	3984	,	2	,	"General Pippo's Porter",	2	,	25	,	5.5	,	"Deep toffee color with rich roasty and subtle hop aroma. Chocolate flavors dominate the palate and interact with back-end sweetness.")	,							
(	3985	,	2	,	"21A IPA",	3	,	31	,	7.199999809	,	"Deep golden color. Citrus and piney hop aromas. Assertive malt backbone supporting the overwhelming bitterness. Dry hopped in the fermenter with four types of hops giving an explosive hop aroma. Many refer to this IPA as Nectar of the Gods. Judge for yourself. Now Available in Cans!")	,							
(	3986	,	2	,	"Oyster Point Oyster Stout",	3	,	42	,	5.900000095	,	"Deep black color. Chocolate milk color head, providing an array of Belgian lace. Toffee and light roasty aromas and flavors. A malty sweet taste is evident but, this rich oatmeal based stout finishes dry. Made with 20 lbs. of oysters, in the boil, from our good friends at Hog Island Oyster Company.")	,							
(	3987	,	2	,	"563 Stout",	3	,	42	,	5	,	"Deep black color, toasted black burnt coffee flavors and aroma. Dispensed with Nitrogen through a slow-flow faucet giving it the characteristic cascading effect, resulting in a rich dense creamy head.")	,							
(	3988	,	2	,	"Double Trouble IPA",	3	,	32	,	9.800000191	,	"Deep, golden, rich malt flavor huge citrus, fruity grassy, ethanol sweetness aroma with a profound bitterness, yet balanced malt back bone with grapefruit, mellow citric overtones. Dry hopped three times in the fermenter. Brewed with over 65 lbs of hops for 300 gallons of beer. The beer to bring world peace and end the war. Bronze Medal - 2006 Imperial IPA Festival at the Bistro in Hayward, California.")	,							
(	4079	,	17	,	"Alaskan Amber",	1	,	13	,	5.300000191	,	"Alt. The name of this beer style comes from the German word 'alt' meaning 'old'. This refers to the aging that alts undergo since they ferment more slowly and at colder temperatures than most ales. Slow fermentation helps condition the flavors in Alaskan Amber, contributing to its overall balance and smoothness.

Richly malty and long on the palate, with just enough hop backing to make this beautiful amber colored 'alt' style beer notably well balanced.

Alaskan Amber is made from glacier-fed water and a generous blend of the finest quality European and Pacific Northwest hop varieties and premium two-row pale and specialty malts.  Our water originates in the 1,500 square-mile Juneau Ice Field and the more than 90 inches of rainfall we receive each year.")	,							
(	4080	,	17	,	"Alaskan Pale",	3	,	37	,	5.199999809	,	"Golden Ale. A blonde, lighter bodied beer with a floral aroma and a crisp, hoppy finish that's not bitter. The hop character of Alaskan Pale is due to dry hopping by hand during the fermentation process.

A clean, softly malted body with a hint of citrus overtones, followed by a hop-accented dry, crisp finish.

Alaskan Pale is made from glacier-fed water and a generous blend or European and Pacific Northwest hop varieties and premium two-row pale and specialty malts. Our water originates in the 1,500 square-mile Juneau Ice Field and the more than 90 inches or rainfall we receive each year.")	,							
(	4081	,	17	,	"Alaskan Stout",	1	,	21	,	5.699999809	,	"Oatmeal Stout. The origins of Oatmeal Stout go back hundreds of years when oats were added to Stouts to promote a healthier image than other beers available during that time period.

The unique blend of the oats and malts in Alaskan Stout produce a balanced, smooth beer with hints of coffee and caramel.

Alaskan Stout is made from glacier-fed water and a generous belnd of European and Pacific Northwest hop varieties and premium two-row and specialty malts. Our water originates in the 1,500 square-mile Juneau Ice Field and the from the more than 90 inches of rainfall Juneau receives each year.")	,							
(	4082	,	17	,	"Alaskan ESB",	1	,	5	,	5	,	"Extra Special Bitter Ale. Alaskan ESB is darker and hoppier and is brewed and fermented at different temperatures than our popular Alt-style Amber. It has an exquisite copper color derived from Crystal malt and an aggressive, yet pleasant hop character.

Malty with roasted overtones, Alaskan ESB has a crisp finish resulting from the use of premium Northwest hops.

Alaskan ESB is made from glacier-fed water and a generous blend of the finest quality European and Pacific Northwest hop varieties and premium two-row and specialty malts. Our water originates in the 1,500 square-mile Juneau Ice Field and from the more than 90 inches of rainfall we receive each year.")	,							
(	4083	,	17	,	"Alaskan IPA",	3	,	31	,	6.199999809	,	"India Pale Ales are characterized by intense hop flavor and aroma accompanied by higher alcohol content. This style possesses medium maltiness and body while also being crisp and dry. Citrus flavors and aromas are moderate to very strong.

Alaskan IPA is honey gold in color with a fruity, citrus aroma. An enticing blend of hops and our dry hopping process, in which hops are added directly to tanks during fermentation, give this brew a very intense, complex aromatic character with a refreshing hop finish.

Alaskan IPA is made from glacier-fed water and a generous blend of the finest quality European and Pacific Northwest hop varieties and premium two-row and specialty malts. Our water originates in the 1,500-square-mile Juneau Ice Field and from more than 90 inches of rainfall each year.")	,							
(	4084	,	17	,	"Alaskan Smoked Porter",	2	,	25	,	6.5	,	"Smoked Beer. Known as 'rauchbier' in Germany, smoke-flavored beers were virtually unknown in the U.S. until Alaskan Smoked Porter was developed in 1988.

The dark, robust body and pronounced smoky flavor of this limited edition beer make it an adventuresome taste experience. Alaskan Smoked porter is produced in limited 'vintages' each year and unlike most beers, may be aged in the bottle much like fine wine.

Water, five types of malt, 2 varieties of hops and yeast with no adjuncts, no preservatives and no pasteurization. Our glacier-fed water originates in the 1,500 square-mile Juneau Ice Field. Prior to brewing, selected malts are smoked in small batches under carefully controlled conditions in a commercial food smoker using local alder wood.")	,							
(	4085	,	17	,	"Winter Ale",	11	,	141	,	6.400000095	,	"English Olde Ale. Traditionally malty with the warming sensation of alcohol, Olde Ales are brewed in the fall as winter warmers.

Brewed in the style of an English Olde Ale, this ale balances the sweet heady aroma of spruce tips with the clean crisp finish of noble hops. Its malty richness is complemented by the warming sensation of alcohol.

Alaskan Winter is made from glacier-fed water, Sitka spruce tips and a generous blend of the finest quality European and Pacific Northwest hop varieties and specialty malts. Our water originates in the 1,500-square-mile Juneau Ice Field and from the more than 90 inches of rainfall we receive each year.")	,							
(	4087	,	17	,	"Alaskan Barley Wine Ale",	3	,	35	,	10.39999962	,	"Alaskan Barley Wine is produced in small batches each year. Typically this higher alcohol beverage is brewed in the spring, cellared in the tunnels of the Alaska-Juneau Gold Mine for the summer and retrieved in time for its release at the Great Alaska Beer and Barley Wine Festival in January. The cool tunnels of the mine shaft provide natural refrigeration and a prime environment for the aging process. 

Like a fine wine, Alaskan Barley Wine can be aged for years. The bottling of the 2007 vintage of Alaskan Barley Wine will allow individuals to age it to their liking. We figured we'd leave it up to individuals as to how long to age their Alaskan Barley Wine, said Quality Assurance Analyst Ryan Harvey. Some people like barley wines fresh, and others store it for years.")	,							
(	4105	,	25	,	"Pig Pen Pilsener",	7	,	77	,	4.699999809	,	"Crisp Clean and refreshing Golden Lager brewed with German Malt and Hops for an authentic flavor. Pig Pen Pils is a great introduction into the world of Craft Brewed beer.")	,							
(	4106	,	25	,	"Fegley's Amber Lager",	3	,	33	,	5.199999809	,	"Amber Colored lager with a nice caramel malt flavor backed by a nice dose of Imported Hersbrucker Hops for a nice easy drinking lager.")	,							
(	4107	,	25	,	"Steelgaarden Wit",	5	,	67	,	5.199999809	,	"Unfiltered Belgian Style beer is brewed with special yeast that lends a unique refreshing flavor to the beer. Brewed with Chamomile, Curacao Orange peel and Coriander to create a smooth citrus finish. Usually enjoyed with a slice of lemon.")	,							
(	4108	,	25	,	"Hop Explosion",	3	,	31	,	7	,	"Hoppiest Brew Works beer ever? The smell of grapefruit, a sweet malt flavor, and oh by the way, lots of hop bitterness. Brewed in the tradition of West Coast ales, we have put loads of malt and hops in our kettle to come up with this sensational ale. Brewed with pale, and crystal malts, hopped with Tomahawks for Yakima Valley, WA. This beer styled has made many a microbrewery famous and this one is sure to please all those who love hops.")	,							
(	4109	,	25	,	"Pawn Shop Porter",	2	,	25	,	5.699999809	,	"Dark brown with ruby highlights this brew has a deep chocolate flavor backed by a smooth caramel finish. Brewed with English malt and hops for an authentic flavor")	,							
(	4110	,	25	,	"Apricot Ale",	11	,	116	,	5.400000095	,	"Unfiltered wheat beer brewed with apricots creating a smooth and thirst quenching full flavored fruit beer.")	,							
(	4111	,	25	,	"Pumpkin Ale",	11	,	123	,	5.199999809	,	"Our Holiday beer is made with real pumpkins, cloves, ginger, all-spice, nutmeg and cinnamon. This light copper colored winter ale will tantalize your taste buds. Pumkin pie in a glass!")	,							
(	4112	,	25	,	"Rude Elf's Reserve",	3	,	29	,	10.5	,	"Our silver medal winning Belgian style Holiday beer brewed with dark Belgian candied sugar and special spices. This brew has a spicy aroma and flavor with a sweet malt taste. At 10.5% alcohol it is sure to warm you up during the Holiday season.")	,							
(	4282	,	23	,	"Allagash White",	5	,	67	,	5	,	"Our interpretation of a traditional Belgian wheat beer, Allagash White is unique and truly refreshing. Brewed with a generous portion of wheat and our own special blend of spices, this beer is light and slightly cloudy in appearance, with a spicy aroma. Overall, it is a beer that is very drinkable and smooth any time of the year.



Available in: 12 oz and 750 ml bottles, 15.5 and 5.17 gal kegs
ABV: 5.0%
Original Gravity: 1048
Recommended Serving Temp: 34F to 50F")	,							
(	4347	,	41	,	"Barney Flats Oatmeal Stout",	3	,	42	,	5.699999809	,	"With its deep, dark brown-black color, thick, full-bodied, velvety-smooth mouth feel, mocha character, and, strong yet subtle hop bite,  Barney Flats Oatmeal Stout  is one of the thickest, richest, and most complex stouts on the market today. In 1990, it became our first gold medal winner, at the Great American Beer Festival.  Barney Flats  was judged so superior to the other stouts that no other medals were even awarded in its catagory. Try it and see why Stewart Kallen described it as, 'Slippery, creamy, dark, and sweet as a Pacific May morning,' in his book,  The 50 Greatest Beers in the World

Barney Flats Oatmeal Stout Most recently won the Silver Medal at the 2004 World Beer Cup¬Æ and the Bronze Medal at the 2004 GABF , as well as several other medals . Click the blue ribbon to see the entire list.

As with all of our products, Barney Flats Oatmeal Stout is never sterile filtered nor heat pasteurized, and should be stored in refrigeration. However, to fully enjoy its rich and complex flavor, it should be served between 40¬∞ and 45¬∞F")	,							
(	4377	,	44	,	"Bud Dry",	8	,	96	,	5	,	"Introduced in 1989 Bud Dry is the first dry-brewed beer produced by an American brewer. It is brewed with select hops, grains and barley malt, which results in a lighter body and less-sweet taste. As with all Anheuser-Busch beers, it is cold-filtered for a smooth draft taste, but then goes through a second cold-filtered finishing process to provide its unique taste.")	,							
(	4379	,	44	,	"Bud Light Lime",	8	,	96	,	4.199999809	,	"Exactly what it says, Bud Light and Lime. Brewed in Georgia.")	,							
(	4383	,	44	,	"Bud Ice",	8	,	95	,	5.5	,	"Actually an Ice Lager. Introduced in 1984.")	,							
(	4384	,	44	,	"Bud Ice Light",	8	,	95	,	4.099999905	,	"Introduced in 1994.")	,							
(	4385	,	44	,	"Michelob Amber Bock",	8	,	95	,	5.199999809	,	"Michelob AmerBock is American-style bock beer with a rich, malty and smooth taste that is hearty and full-bodied, yet finishes cleanly. Anheuser-Busch introduced this premium-plus beer nationally in 1995.")	,							
(	4386	,	44	,	"Michelob Ultra Amber",	8	,	95	,	5	,	"Michelob ULTRA Amber is an American-style amber lager that boasts a beautifully rich, dark-amber color with a full-bodied, malty taste that also is low in calories and carbohydrates.")	,							
(	4387	,	44	,	"Michelob Beer",	8	,	95	,	5	,	"Michelob is a malty and full-bodied lager with an elegant European hop profile.")	,							
(	4390	,	44	,	"Michelob Light",	8	,	96	,	4.300000191	,	"Michelob Light is a full-flavored and rich-tasting light lager offering a malty sweetness and aromatic hop profile")	,							
(	4428	,	39	,	"Anchor Summer Beer",	11	,	116	,	4.599999905	,	"Anchor Summer is the first American wheat beer in modern times. Our first brew of this light and refreshing beer was in the summer of 1984.

Anchor Summer is an all-malt beer, and over 50% of its malt comes from malted wheat. It is fermented with a Triticum aestivum, AKA wheat traditional top-fermenting 'ale' yeast because we prefer the clean flavors developed by this yeast. We believe that this style best celebrates the refreshingly light flavor of malted wheat. You may notice that the head on this beer is unusually abundant, with a consistency similar to whipped egg whites. This is due to protein contributed by the wheat.

The brewers at Anchor are proud to have revived not only rich hearty dark beers, but also this light crisp style of a modern American wheat beer.

Summer getaway Wheat malt contributes to an unusual lightness and dryness to the palate, and this√¢‚Ç¨‚Äùcombined with the distinctive flavor of the wheat√¢‚Ç¨‚Äùmakes for a perfect thirst-quenching beverage. It is the ideal drink for beer lovers who appreciate tradition and character in their beer, but also seek a lighter, refreshing style, perfect for warm weather.

-http://www.anchorbrewing.com/beers/summerbeer.htm")	,							
(	4474	,	47	,	"Cocoa Loco",	3	,	43	,	7	,	"Great chocolate stoudt.")	,							
(	4482	,	41	,	"Hop Ottin IPA",	3	,	31	,	7	,	"Hop Ottin' IPA is as hoppy as they come. The name means 'hard working hops,' in Boontling, and that tells it all. Generous additions of high-alpha Pacific Northwest hops added during a vigorous boil, plus traditional dry hopping, with whole hop cones, give this ale a delicious citrus aroma, and an intense hoppy bite. This IPA is a hop lover's dream.")	,							
(	4508	,	41	,	"Summer Solstice Cerveza Crema",	11	,	113	,	5.599999905	,	"This copper colored ale is smooth, malty, and lightly sweet, with a delicate hint of spice for that oh-so-drinkable, extra velvety flavor.  The character is lighter in body than its cousin our wildly popular Winter Solstice Seasonal Ale.  This is a silky, creamy dream, perfect as a warm weather beer.")	,							
(	4538	,	47	,	"Hopmouth Double IPA",	3	,	32	,	8	,	"The first in our Brew Crew Big Beer Series, Hopmouth Double IPA is a hop lover's delight!  Deep amber hue with a generous white head, Hopmouth showcases a rich, toasty flavor and a sweet caramel notes as a result of the high-quality Maris Otter Malt, imported from the UK.  The hops are right up front in the aroma, reminiscent of citrus and pine, while the resin-like flavors linger well after the last sip.

This is a BIG beer.  True to our original vision, we have achieved a level of balance and drinkability rarely found in this style.  Delicious on its own, Hopmouth is also a brilliant pair with many boldly-flavored foods, including many cheeses and desserts.")	,							
(	4548	,	35	,	"North Pleasant Pale Ale",	3	,	26	,	5.25	,	"Light gold in color, slightly malty and hoppy, with a mild flowery hop finish.")	,							
(	4549	,	35	,	"Massatucky Brown",	3	,	38	,	5.25	,	"Light brown medium bodied ale. Smooth, malty and slightly roasted flavor.")	,							
(	4550	,	35	,	"Two Sisters Imperial Stout",	3	,	43	,	6.699999809	,	"Dark, rich, hearty, smooth and chocolaty. The two siloettes on the logo are Marina and Kshusha adopted from Russia by Amherst Brewing Company's owners, John and Terrie.")	,							
(	4551	,	35	,	"Heather Ale",	11	,	126	,	5.400000095	,	"2003 Silver medal winner herb and spice catagory Great American Beer Fest, made without hops, 100% heather flowers giving it a flowery aroma, subtle sweetness, and crisp, clean finish.")	,							
(	4552	,	35	,	"Lewmeister Oktoberfest",	7	,	84	,	5.400000095	,	"Amber, full-bodied lager made in the traditional style with German hops. Brewed in early August and put on tap with a keg of the previous years batch by October of each year. This beer is brewed in memory of 'Lewis', the owners beer-drinking long-haired Dachsund, who passed away at 17-1/2 on 8/17/99.")	,							
(	4553	,	35	,	"Raspberry Brown Ale",	3	,	38	,	4.900000095	,	"Our Massatucky Brown Ale with a subtle raspberry flavoring")	,							
(	4554	,	35	,	"Workingman's Wheat",	4	,	50	,	4.900000095	,	"Light crisp American style wheat with a medium hop finish. Made using 25% German wheat malt. Brewed and on tap each summer.")	,							
(	4555	,	35	,	"Righteous Red",	3	,	33	,	4.599999905	,	"Reddish amber in color, mild and malty with hop aroma and finish.")	,							
(	4556	,	35	,	"Graduation Ale",	3	,	26	,	5.5	,	"Golden pale ale, slightly hoppy. Brewed each May for the upcoming graduates. It took you four hard years to graduate so we made this one easy to drink. Congratulations!")	,							
(	4557	,	35	,	"Patriots Pilsner",	7	,	77	,	4.800000191	,	"A traditional European Pilsner light in body and color. This brew possesses mild hoppy flavors and a crisp clean finish. It is made with traditional European hops: Hallertau and Saaz.")	,							
(	4558	,	35	,	"Amherst ESB",	1	,	5	,	5.349999905	,	"Amber in color, medium body with very hoppy aroma and bitter finish. Dry hopped with Oregon Goldings")	,							
(	4559	,	35	,	"Honey Pilsner",	7	,	77	,	5.199999809	,	"Crisp light lager, slightly malty with subtle hints of wildflower honey. Finished with Hallertau and Saaz hops")	,							
(	4560	,	35	,	"Puffers Smoked Porter",	2	,	25	,	4.599999905	,	"Dark, full bodied ale with a prominent smoked malt flavor")	,							
(	4561	,	35	,	"Boltwood Bock",	7	,	90	,	5.699999809	,	"Light in color, full bodied and very malty, this lager has a toasted malt flavor. Brewed in February and usually on tap by May with a keg of the previous year's batch.")	,							
(	4562	,	35	,	"Bankers Gold",	3	,	37	,	4.599999905	,	"Just another day at the bank. Very light, mild ale with a subtle hop finish. Brewed once a year in early Spring.")	,							
(	4563	,	35	,	"Half in the Bagpipe",	1	,	15	,	7.199999809	,	"Amber in color, full-bodied strong ale with a prominent malt flavor delicately balanced with Goldings hops. Made with a hint of molasses, this beer is usually on tap for Super Bowl with a keg or two of the previous year's batch.")	,							
(	4564	,	35	,	"Cascade IPA",	3	,	31	,	5.300000191	,	"Light in color, medium body, with a hop bitterness and Cascade hop finish.")	,							
(	4565	,	35	,	"Olde #8 Anniversary Ale",	4	,	57	,	6.849999905	,	"Brewed for August each year to celebrate our Anniversary this strong ales maltiness is balenced by a generous amount of hops")	,							
(	4927	,	44	,	"Beach Bum Blonde Ale",	3	,	37	,	5.400000095	,	"Beach Bum Blonde Ale is a traditional American 
blonde ale with a slightly spicy hop note and balanced malty flavor.")	,							
(	4941	,	44	,	"Budweiser American Ale",	3	,	33	,	5.099999905	,	"Budweiser American Ale is brewed with barley from America's heartland and dry hopped with Cascade hops from the Pacific Northwest.

Available Fall 2008.")	,							
(	4995	,	10	,	"Abita Purple Haze",	11	,	116	,	4.75	,	"Purple Haze is a crisp, American style wheat beer with raspberry puree added after filtration. Therefore, you may see raspberry pulp in the beer. The raspberries provide the lager with a subtle purple coloration and haze, a fruity aroma, and a tartly sweet taste.")	,							
(	5001	,	44	,	"Jack's Pumpkin Spice Ale",	11	,	123	,	5.5	,	"Our fall seasonal is a subtle, well-balanced ale, copper in color, offering rich, full flavors and aromas of pumpkin and spices.")	,							
(	5002	,	44	,	"Sun Dog Amber Wheat",	11	,	116	,	5.300000191	,	"Sun Dog is an unfiltered beer, with a naturally cloudy appearance and fuller texture which allows it to stand up to spicy foods like Thai noodle salads and Cuban sandwiches.  The beer is best served in a tall, wide-mouthed glass which opens up the aromas of the beer and showcases its beautiful long-lasting head of white foam.")	,							
(	5131	,	44	,	"Michelob Dunkel Weisse",	3	,	29	,	5.5	,	"Dunkel Weisse fills a glass like few beers can. The pour releases banana and clove aromas. Roasted malt flavor is complemented by caramel and chocolate undertones. Then a crisp finish refreshes the palate. Undeniable proof that brewing is truly an art.")	,							
(	5173	,	39	,	"Liberty Ale",	3	,	26	,	6	,	"San Francisco's famouse Liberty Ale was first brewed on the 18th of April, 1975 to celebrate the 200th anniversary of Paul Revere's historic ride. It is virtually handmade by the brewers of Anchor Steam Beer in one of the smallest and most traditional breweries in the world. Liberty Ale is made with the finest barley malt, fresh, whole hops, top fermenting yeast, pure water and the simple natural methods which reflect our exceptional respect for the ancient art of brewing. It is 'dry hopped,' a classic ale tradition, and slowly completes its fermentation in sealed vats in our cellars. This unique process creates Liberty Ale's distinctive bouquet and uncommonly delicate, entirely natural carbonation.")	,							
(	5224	,	44	,	"Michelob Hop Hound Amber Wheat",	11	,	116	,	5.300000191	,	"Unfiltered American amber wheat ale brewed with a blend of imported and domestic hops for a balanced slightly citrus hop aroma and caramel malty taste.")	,							
(	5432	,	10	,	"Restoration Pale Ale",	3	,	26	,	5	,	"Abita Restoration Pale Ale was created after the back-to-back hurricanes devastated Louisiana. With your help, the abita Brewing Company raised over $500,000 for hurricane relief. This brilliant, golden pale ale has a rich body, mild bitterness and a snappy, fresh citrus hop flavor and aroma. Cold filtered and brewed in small batches using no additives or preservatives, the Abita Company is proud to be Louisiana True.")	,							
(	5495	,	47	,	"Big Dick's Olde Ale",	1	,	13	,	8.199999809	,	"Somewhat of a cousin to Barleywine, Big Dick's is a classic English-style Olde Ale.  Sweet and full-bodied malt flavors are complemented by a fragrant but mild hop bitterness.  Sweet, bready malt aromas combine with rich flavors of dark fruit, brown sugar, caramel, and sweet nuts. A beer for keeping, Big Dick's Olde Ale will age gracefully, while fruity flavors continue to develop and bitterness will subside.

This is not only a BIG beer, it is a Well-Endowed Ale!  We took a traditional English-style Ale and made it our own.  Delightful on its own or as a digestif with a full-bodied cigar, Big Dick's is also big enough to stand up to many boldly-flavored foods.")	,							
(	5565	,	10	,	"Satsuma Harvest Wit",	5	,	67	,	5.099999905	,	"Real Louisiana Satsumas, golden wheat, oats and the finest barley create Abita Satsuma Harvest Wit. Pale and cloudy, like the haze on a hot summer day, this white beer has a sweet and subtle citrus flavor with a touch of spice that is cool and refreshing. 

Abita Satsuma Harvest Wit is very versatile and can compliment a number of dishes. This brew pairs well with salads, fish, shrimp and lobster, as long as the dishes are not too spicy. Thai dishes, which often have citric notes in their flavor profile, would also perfectly compliment the orange flavors in Abita Satsuma Harvest Wit.")	,							
(	5626	,	17	,	"Alaskan White Ale",	5	,	67	,	5.300000191	,	"Alaskan White Ale has a soft, slightly sweet base with the unique spice aroma of coriander and crisp, citrus finish of orange peel. A light and effervescent body combined with the smooth palate creates a complex and delicate beer that is deliciously refreshing in any season.")	,							
(	5627	,	10	,	"Andygator",	7	,	92	,	8	,	"The Andygator is a fearsome beast...much too big for any little bottle. Don't let his toothy grin, slightly sweet flavor and subtle fruit aroma fool you: this cold-blooded creature is a Helles Doppelbock that can sneak up on you. Sip, don't gulp and taste the wild of Abita Andygator")	,							
(	5676	,	44	,	"Michelob Winter's Bourbon Cask Ale",	11	,	141	,	6	,	"During even the coldest of weather, warm up to the smooth, robust taste of our Winter's Bourbon Cask Ale. Full of rich aromas that you find in the winter months, hints of vanilla and flavorful hops, this is a beer that is great for pouring into a large tulip glass and enjoying with friends around a fireplace.")	,							
(	5735	,	1	,	"(512) Wit",	5	,	67	,	5.199999809	,	"Made in the style of the Belgian wheat beers that are so refreshing, (512) Wit is a hazy ale spiced with coriander and domestic grapefruit peel. 50% US Organic 2-row malted barley and 50% US unmalted wheat and oats make this a light, crisp ale well suited for any occasion.")	,							
(	5736	,	1	,	"(512) Pale",	3	,	26	,	5.800000191	,	"With Organic 2-row malted barley, (512) Pale is a copper colored American Pale Ale that balances earthy hop bitterness and hop flavor with a rich malty body.")	,							
(	5737	,	1	,	"(512) IPA",	3	,	31	,	7	,	"(512) India Pale Ale is a big, aggressively dry-hopped American IPA with smooth bitterness (~65 IBU) balanced by medium maltiness. Organic 2-row malted barley, loads of hops, and great Austin water create an ale with apricot and vanilla aromatics that lure you in for more.")	,							
(	5738	,	1	,	"(512) Pecan Porter",	2	,	25	,	6.800000191	,	"Nearly black in color, (512) Pecan Porter is made with Organic US 2-row and Crystal malts along with Baird's Chocolate and Black malts. Its full body and malty sweetness are balanced with subtle pecan aroma and flavor from locally grown pecans. Yet another true Austin original!")	,							
(	5739	,	1	,	"(512) ALT",	4	,	57	,	6	,	"(512) ALT is a German-style amber ale that is fermented cooler than typical ales and cold conditioned like a lager. ALT means old in German and refers to a beer style made using ale yeast after many German brewers had switched to newly discovered lager yeast. This ale has a very smooth, yet pronounced, hop bitterness with a malty backbone and a characteristic German yeast character. Made with 98% Organic 2-row and Munch malts and US noble hops.")	,							
(	5740	,	1	,	"(512) Bruin",	3	,	38	,	7.599999905	,	"At once cuddly and ferocious, (512) BRUIN combines a smooth, rich maltiness and mahogany color with a solid hop backbone and stealthy 7.6% alcohol. Made with Organic 2 Row and Munich malts, plus Chocolate and Crystal malts, domestic hops, and a touch of molasses, this brew has notes of raisins, dark sugars, and cocoa, and pairs perfectly with food and the crisp fall air.")	,							
(	5741	,	1	,	"(512) Whiskey Barrel Aged Double Pecan Porter",	2	,	25	,	8.199999809	,	"Our first barrel project is in kegs and on it's way to beer bars around Austin. This is a bigger, bolder version of our mainstay Pecan Porter, with a richer finish. Two months on recently emptied Jack Daniels select barrels imparted a wonderful vanilla character from the oak and a pleasant amount of whiskey nose and flavor. All in all, I'm really proud of the hard work and effort put into this beer. Our first attempt at brewing it and our first attempt at managing barrels has paid off for everyone! Seek out this beer, but don't put it off. There is a very limited number of kegs available and it might go fast√¢‚Ç¨¬¶")	,							
(	5804	,	29	,	"Duet",	3	,	31	,	7	,	"A West Coast IPA. Our original single IPA made with Simcoe and Amarillo hops in harmony. 1.065 OG 45 IBU 7%ABV")	,							
(	5805	,	29	,	"Nelson",	3	,	31	,	7	,	"A Golden Rye IPA.
An outstanding hop from New Zealand, Nelson Sauvin, is generously used throughout the brewing and dry-hopping of this unique beer. European rye is added for a smooth, malty addition to flavor. 1.065 OG 7%ABV")	,							
(	5843	,	1	,	"One",	5	,	65	,	8	,	"Our first anniversary release is a Belgian-style strong ale that is amber in color, with a light to medium body. Subtle malt sweetness is balanced with noticeable hop flavor, light raisin and mildly spicy, cake-like flavors, and is finished with local wildflower honey aromas. Made with 80% Organic Malted Barley, Belgian Specialty grains, Forbidden Fruit yeast, domestic hops and Round Rock local wildflower honey, this beer is deceptively high in alcohol. ")	,							
(	5856	,	10	,	"Christmas Ale",	3	,	38	,	5.5	,	"Abita Christmas Ale is an American style Brown Ale. It is hopped with Willamette, Cascade, and Columbus hops and has a good hop flavor and aroma.")	;							


  ALTER TABLE beer
  ADD CONSTRAINT `beer_ibfk_1` FOREIGN KEY (`breweryID`) REFERENCES `breweryID` (`brewery`);
  
  ALTER TABLE beer
  ADD CONSTRAINT `beer_ibfk_2` FOREIGN KEY (`catID`) REFERENCES `catID` (`beerCategory`);

  ALTER TABLE beer
  ADD CONSTRAINT `beer_ibfk_3` FOREIGN KEY (`styleID`) REFERENCES `styleID` (`beerStyle`);

  ALTER TABLE orderDetails
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`);

  ALTER TABLE orderDetails
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`beerID`) REFERENCES `beerID` (`beerID`);
  
  DROP TABLE IF EXISTS `cart_items`;
  
CREATE VIEW v_irishAle AS
SELECT 
b.beerID as beerID,
b.beerName as beerName, 
br.description as description, 
br.breweryName as brewery, 
bs.price as price
FROM beer b
JOIN beerCategory bc
ON b.catID = bc.catID
JOIN beerStyle bs
ON b.styleID = bs.styleID
JOIN brewery br
ON br.breweryID = b.breweryID
where b.catID = 2;

CREATE VIEW v_americanAle AS
SELECT 
b.beerID as beerID,
b.beerName as beerName, 
br.description as description, 
br.breweryName as brewery, 
bs.price as price
FROM beer b
JOIN beerCategory bc
ON b.catID = bc.catID
JOIN beerStyle bs
ON b.styleID = bs.styleID
 JOIN brewery br
ON br.breweryID = b.breweryID
where b.catID = 3;


CREATE VIEW v_americanLager AS
SELECT 
b.beerID as beerID,
b.beerName as beerName, 
br.description as description, 
br.breweryName as brewery, 
bs.price as price
FROM beer b
JOIN beerCategory bc
ON b.catID = bc.catID
JOIN beerStyle bs
ON b.styleID = bs.styleID
 JOIN brewery br
ON br.breweryID = b.breweryID
where b.catID = 8;

CREATE VIEW v_belgianAndFrenchAle AS
SELECT 
b.beerID as beerID,
b.beerName as beerName, 
br.description as description, 
br.breweryName as brewery, 
bs.price as price
FROM beer b
JOIN beerCategory bc
ON b.catID = bc.catID
JOIN beerStyle bs
ON b.styleID = bs.styleID
 JOIN brewery br
ON br.breweryID = b.breweryID
where b.catID = 5;

CREATE VIEW v_britishAle AS
SELECT 
b.beerID as beerID,
b.beerName as beerName, 
br.description as description, 
br.breweryName as brewery, 
bs.price as price
FROM beer b
JOIN beerCategory bc
ON b.catID = bc.catID
JOIN beerStyle bs
ON b.styleID = bs.styleID
 JOIN brewery br
ON br.breweryID = b.breweryID
where b.catID = 1;

CREATE VIEW v_otherStyles AS
SELECT 
b.beerID as beerID,
b.beerName as beerName, 
br.description as description, 
br.breweryName as brewery, 
bs.price as price
FROM beer b
JOIN beerCategory bc
ON b.catID = bc.catID
JOIN beerStyle bs
ON b.styleID = bs.styleID
 JOIN brewery br
ON br.breweryID = b.breweryID
where b.catID NOT IN (1,2,3,5,8);


CREATE VIEW v_beerByStyle AS
SELECT bs.styleName as styleName, count(b.beerID) as beerTotal FROM beer b
JOIN beerCategory bc
ON b.catID = bc.catID
JOIN beerStyle bs
ON b.styleID = bs.styleID
JOIN brewery br
ON br.breweryID = b.breweryID
GROUP BY bs.styleName
ORDER BY 2 DESC;


CREATE VIEW v_beerByCategory AS
SELECT bc.catName as catName, count(b.beerID) as beerTotal FROM beer b
JOIN beerCategory bc
ON b.catID = bc.catID
JOIN beerStyle bs
ON b.styleID = bs.styleID
JOIN brewery br
ON br.breweryID = b.breweryID
GROUP BY bc.catName
ORDER BY 2 DESC;

DELIMITER $$
CREATE PROCEDURE p_totalBeerByStyle(
 IN styleID int)
BEGIN
SELECT bs.styleName, count(b.beerID) FROM beer b
JOIN beerCategory bc
ON b.catID = bc.catID
JOIN beerStyle bs
ON b.styleID = bs.styleID
JOIN brewery br
ON br.breweryID = b.breweryID
WHERE bs.styleID = styleID
GROUP BY bs.styleName
ORDER BY 2 DESC;
END$$
DELIMITER ;


CREATE VIEW v_beerByStyleName AS
SELECT 
b.beerName as beerName,
br.breweryName as brewery,
b.description as beerDescription,
bs.styleName as styleName, 
price
FROM beer b
JOIN beerCategory bc
ON b.catID = bc.catID
JOIN beerStyle bs
ON b.styleID = bs.styleID
JOIN brewery br
ON br.breweryID = b.breweryID
ORDER BY 2 DESC;


