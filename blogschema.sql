-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'simha','simhabro@gmail.com','$2a$10$3w85nGoTLRZ52iGW9nlc.Oodvi4GFv4wWjLc3fPaRlgt72yTe7Ylq',NULL);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloodtest`
--

DROP TABLE IF EXISTS `bloodtest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bloodtest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `age` varchar(45) NOT NULL,
  `bloodgroup` varchar(45) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `verified` int NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloodtest`
--

LOCK TABLES `bloodtest` WRITE;
/*!40000 ALTER TABLE `bloodtest` DISABLE KEYS */;
INSERT INTO `bloodtest` VALUES (1,'sims','20','a+ve','testing',0,899),(2,'Simha','20','A+ve','100, JP Nagar, Bengaluru- 560078',1,599),(3,'shalom','20','o+ve','Anjanapura',1,1199),(4,'Simha','20','A+ve','Jp Nagar',1,1199),(5,'Sri Harsha','20','A+ve','100, APS College, Somanahalli, Bengaluru',1,499),(6,'just-in','20','b+ve','anjanapura,blr',1,599),(7,'Sri Harsha','20','a+ve','APS College',1,599),(8,'balagi','12','o-ve','aaaaa',0,499);
/*!40000 ALTER TABLE `bloodtest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(2555) DEFAULT NULL,
  `desc` varchar(10000) DEFAULT NULL,
  `img` varchar(2555) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `uid` int NOT NULL,
  `cat` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid_idx` (`uid`),
  CONSTRAINT `userid` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (35,'10 Ways to Move More in Everyday Life','<h2>1. Take the stairs</h2><p>I know. This is so boring, and you’ve heard it a bajillion times. Yet, it’s one of the best tips for a reason.</p><p><a href=\"https://www.healthline.com/health-news/how-fast-can-you-climb-4-flights-of-stairs-it-may-reveal-your-heart-health\" rel=\"noopener noreferrer\" target=\"_blank\">Taking the stairs</a> instead of the elevator increases your heart rate, helps with balance, and improves lower-extremity strength. If you’re feeling saucy and have a few minutes, you can even do some heel raises off the edge of a step for calf strength, or take the stairs two at a time.</p><p>Skip the elevator, your body and heart will thank you.</p><p><br></p><h2>2. Incorporate walking meetings</h2><p>If you work from home or have transitioned to virtual conference calls, schedule a walk during one call per day.</p><p>If you don’t need to be staring at a screen looking at spreadsheets, plug in your headphones, slip your phone in your pocket, and solve the world’s problems on a walk. It’s a great way to mix up your daily routine.</p><p>And if you work in an office, take your one-on-one meetings to go. Walking together enhances team bonding, and you may even come up with better ideas. Research shows <a href=\"https://www.healthline.com/health-news/walking-indoors-outdoors-increases-creativity-042814\" rel=\"noopener noreferrer\" target=\"_blank\">walking boosts creativity</a> and enhances mental acuity (<a href=\"https://www.apa.org/news/press/releases/2014/04/creativity-walk\" rel=\"noopener noreferrer\" target=\"_blank\">1</a>, <a href=\"https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5919946/\" rel=\"noopener noreferrer\" target=\"_blank\">2Trusted Source</a>, <a href=\"https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4879139/\" rel=\"noopener noreferrer\" target=\"_blank\">3Trusted Source</a>).</p><h2>3. Lunge it up</h2><p>I do this a lot, and I get funny looks sometimes, but hey — I’m a busy woman, and my time is precious!</p><p>When you’re shopping, try <a href=\"https://www.healthline.com/health/exercise-fitness/walking-lunges\" rel=\"noopener noreferrer\" target=\"_blank\">walking lunges</a> down the supermarket aisles while holding onto the cart. The cart offers a good balance point, and you can get about 10–20 lunges in a single pass, depending on how long your supermarket’s aisles are. Go for it, it’s surprisingly fun!</p><p><br></p><h2>4. Sit on an exercise ball</h2><p>Swap out your office chair for a stability ball. This can help with back pain and help improve posture, and while sitting on the ball, you can do some gentle mobility stretches for your neck, pelvis, and spine.</p><p>Try a hula-hoop motion and tucking and untuck your pelvis to help fire up your core stabilizers. If you want to add in some abdominal work, you can also try seated marches or other <a href=\"https://www.healthline.com/health/fitness/pilates-exercises-with-ball\" rel=\"noopener noreferrer\" target=\"_blank\">exercises on the ball</a> — all while sitting at your desk!</p><p><br></p><h2>5. Park far away</h2><p>While we need to be safe and alert to our surroundings, if you’re in a safe and well-lit area, consider parking further from the entrance of wherever you’re going. Adding in a few minutes of walking time here and there adds up over time and can increase your <a href=\"https://www.healthline.com/health/how-many-steps-a-day\" rel=\"noopener noreferrer\" target=\"_blank\">daily step count</a>!</p>','1670608728265walk.jpg','2022-12-09 22:18:21',3,'Fitness'),(79,'4 Nutrition and Weight Loss Myths Debunked for a Healthier 2023','<p>If you find yourself scrolling through social media for ways to kickstart new health routines, you’re not alone. According to <a href=\"https://blog.patientslikeme.com/research/perceptions-of-health-information-sources/\" rel=\"noopener noreferrer\" target=\"_blank\">data</a> from the online patient community PatientsLikeMe, 11% of Americans surveyed said they refer to social media for health information.</p><p>However, while some advice you come across online may seem helpful and trustworthy – and some might even come from doctors, registered dietitians, or other qualified people – often, this isn’t the case.</p><p>“[A] lot of times what we see is somebody who did their own weight loss plan or gut cleanse, or cured their own whatever it is, and they try to apply that to everyone…Just because it worked for them doesn’t mean it’ll work for everybody and that’s where it can get really dangerous,” <a href=\"https://www.jenscheinman.com/\" rel=\"noopener noreferrer\" target=\"_blank\">Jen Scheinman, RDN</a>, nutrition affairs manager at <a href=\"https://www.timelinenutrition.com/\" rel=\"noopener noreferrer\" target=\"_blank\">Timeline Nutrition</a>, told Healthline. “[They] find intriguing quick fixes that people want to believe, but they aren’t backed by science and can be damaging.”</p><p>Diets are often sensationalized on social media to excite people, added <a href=\"https://weillcornell.org/rbkumar\" rel=\"noopener noreferrer\" target=\"_blank\">Dr. Rekha B. Kumar</a>, associate professor of medicine at Cornell and Chief Medical Officer at Found.</p><p>“If it were all unbiased and balanced facts, it would be in a scientific journal and not on social media,” Kumar told Healthline.</p><p>While social media can be used as a tool to educate and disseminate information, she added that content “in regards to diets and nutrition might be posted by influencers who don’t always have all the facts, but likely do have some facts.”</p><p>Scheinman agreed. She said a lot of diet myths start with a nugget of truth to make them compelling to try.</p><p>“That nugget of truth can be exaggerated or misconstrued to then be wise for the population,” she said.</p><p>Deciphering between what is factual or not can be difficult. To help ease confusion, we asked health experts to debunk some of the most common nutrition myths being shared on social media.</p><h2>Myth: <strong>Everyone&nbsp;should follow&nbsp;keto or low carb eating</strong></h2><p>While keto and low carb eating can induce weight loss, Kumar noted that these eating patterns are not suited for everyone “either because of medical conditions like diabetes that might make severe carbohydrate reduction dangerous or [because] these plans don’t match the biology of an individual (i.e. a different diet would be more efficacious).”</p><p>The types of foods that are followed on these diets – particularly the keto diet, which focuses on fat – also causes concern, said Scheinman.</p><p>“[What] I start to see people doing is eating lots of cheese and butter and tons of steak or bacon or lunch meats that are highly processed and limiting vegetables and whole grains and other important nutrients, so they get an imbalance in their diet,” she said.</p><p>Studies that look at people who live the healthiest and longest lives have found that their diets are sustained on whole grains, beans, and legumes, she noted.</p><p>“Specifically beans and legumes are correlated with people living longer, so when you cut these foods out [you have to wonder] what is happening in terms of health,” said Scheinman.</p><p>Additionally, sticking to a keto or low carb diet long-term is difficult, and when people start including carbohydrates back into their diet, Scheinman said they don’t do so in a healthy way.</p><p>“[They’re] not focusing on the whole grains, the fruits, and starchy vegetables. They’re starting to go back to those simple carbohydrates like white bread and sugar and white pasta, and they put all the weight back on and then some, so it becomes this cyclical yoyo type of experience,” she said.</p>','1675850390035cook.png','2023-02-08 15:29:50',4,'Health'),(83,'Test blog','<p>This is a test blog</p><p><br></p><p>This blog has been edited by user</p>','','2023-02-09 12:50:36',4,'Mindfulness');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'simha','simhabro@gmail.com','\'$2a$10$3w85nGoTLRZ52iGW9nlc.Oodvi4GFv4wWjLc3fPaRlgt72yTe7Ylq\'',NULL),(2,'test','test123@gmail.com','$2a$10$uuLvpTGQlXw/B0PF/sH0Y.6hkWmTYHwOY3U7/.zcV9p/rvxnlinSi',NULL),(3,'test2','test@gmail.com','$2a$10$YxSrRK3dkI979bckQAhiHOGRy/o5buVJUs68xNWQsRu.VLSwerpNq',NULL),(4,'simtest','simtest@gmail.com','$2a$10$5bG1z0Xe0DdRtAaZRJsXd.fUbBTRl3A3OLB7Z7TWY3hEvUEn0qZiy',NULL),(5,'simagain','simagain@gmail.com','$2a$10$0aPsCjMNyRTX/FN9tJB1kucA67ngGjlGJ3Pk6yqTJaR8b6k8uR5aW',NULL),(7,'balagi','balagi@email.com','$2a$10$GzWQLNZrGPvPY9kwN16ii.HapIX8YteLZn14TSdikVswRtyfVHzb.',NULL),(8,'test1','testing@gmail.com','$2a$10$R9tMwZ2UX2opm7vPUmHH0O79PWjhP36JFAbM1BVchdBQuZowxtCUi',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verifyposts`
--

DROP TABLE IF EXISTS `verifyposts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verifyposts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(2555) DEFAULT NULL,
  `desc` varchar(10000) DEFAULT NULL,
  `img` varchar(2555) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `uid` int NOT NULL,
  `cat` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid_idx` (`uid`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verifyposts`
--

LOCK TABLES `verifyposts` WRITE;
/*!40000 ALTER TABLE `verifyposts` DISABLE KEYS */;
/*!40000 ALTER TABLE `verifyposts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-22 13:44:22
