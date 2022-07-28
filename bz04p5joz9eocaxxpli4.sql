-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: bz04p5joz9eocaxxpli4-mysql.services.clever-cloud.com:3306
-- Generation Time: Jul 28, 2022 at 04:47 AM
-- Server version: 8.0.15-5
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bz04p5joz9eocaxxpli4`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog_category`
--

CREATE TABLE `blog_category` (
  `n_category_id` int(11) NOT NULL,
  `v_category_title` varchar(75) NOT NULL,
  `v_category_meta_title` varchar(100) NOT NULL,
  `v_category_path` varchar(100) NOT NULL,
  `d_date_created` date NOT NULL,
  `d_time_created` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `blog_category`
--

INSERT INTO `blog_category` (`n_category_id`, `v_category_title`, `v_category_meta_title`, `v_category_path`, `d_date_created`, `d_time_created`) VALUES
(7, 'Country', 'Country blog', 'Country', '2022-07-23', '04:22:21'),
(8, 'Travel', 'Travel post', 'Travel', '2022-07-24', '03:06:10'),
(10, 'Animal', 'Animal blog', 'Animal', '2022-07-24', '03:23:43');

-- --------------------------------------------------------

--
-- Table structure for table `blog_comment`
--

CREATE TABLE `blog_comment` (
  `n_blog_comment_id` int(11) NOT NULL,
  `n_blog_comment_parent_id` int(11) NOT NULL,
  `n_blog_post_id` int(11) NOT NULL,
  `v_comment_author` varchar(50) NOT NULL,
  `v_comment_author_email` varchar(100) NOT NULL,
  `v_comment` varchar(500) NOT NULL,
  `d_date_created` date NOT NULL,
  `d_time_created` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `blog_comment`
--

INSERT INTO `blog_comment` (`n_blog_comment_id`, `n_blog_comment_parent_id`, `n_blog_post_id`, `v_comment_author`, `v_comment_author_email`, `v_comment`, `d_date_created`, `d_time_created`) VALUES
(4, 0, 23, 'Tan', 'tantan@gmail.com', 'Hello !', '2022-07-24', '03:47:56'),
(5, 4, 23, 'Nhat', 'nhatnhat@gmail.com', 'Beautiful !', '2022-07-24', '03:48:33'),
(6, 0, 21, 'Phan', 'phan@gmail.com', 'Comment from phone', '2022-07-24', '04:32:44'),
(7, 0, 16, 'Tam', 'tam@gmail.com', 'Nice!', '2022-07-24', '03:40:12'),
(8, 0, 25, 'vi nguyen', 'vinhs@gmail.com', 'test comment', '2022-07-25', '02:49:14'),
(9, 8, 25, 'tan', 'tan@gmail.com', 'test reply comment', '2022-07-25', '02:49:42');

-- --------------------------------------------------------

--
-- Table structure for table `blog_contact`
--

CREATE TABLE `blog_contact` (
  `n_contact_id` int(11) NOT NULL,
  `v_fullname` varchar(50) NOT NULL,
  `v_email` varchar(50) NOT NULL,
  `v_phone` varchar(50) NOT NULL,
  `v_message` text NOT NULL,
  `d_date_created` date NOT NULL,
  `d_time_created` time NOT NULL,
  `f_contact_status` int(1) NOT NULL COMMENT '1-Inactive|2-Active|3-Deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `blog_contact`
--

INSERT INTO `blog_contact` (`n_contact_id`, `v_fullname`, `v_email`, `v_phone`, `v_message`, `d_date_created`, `d_time_created`, `f_contact_status`) VALUES
(4, 'Tan Phan', 'tanphan@gmail.com', '012313132132', 'Hello Tan, Nice to meet you !', '2022-07-24', '03:50:34', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blog_post`
--

CREATE TABLE `blog_post` (
  `n_blog_post_id` int(11) NOT NULL,
  `n_category_id` int(11) NOT NULL,
  `v_post_title` varchar(100) NOT NULL,
  `v_post_meta_title` varchar(100) NOT NULL,
  `v_post_path` varchar(100) NOT NULL,
  `v_post_summary` text NOT NULL,
  `v_post_content` text NOT NULL,
  `v_main_image_url` varchar(100) NOT NULL,
  `v_second_image_url` varchar(100) NOT NULL,
  `v_alt_image_url` varchar(100) NOT NULL,
  `n_blog_post_views` int(11) NOT NULL,
  `f_post_status` int(11) NOT NULL COMMENT '0-Inactive|1-Active|2-Deleted',
  `d_date_created` date NOT NULL,
  `d_time_created` time NOT NULL,
  `d_date_updated` date DEFAULT NULL,
  `d_time_updated` time DEFAULT NULL,
  `n_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `blog_post`
--

INSERT INTO `blog_post` (`n_blog_post_id`, `n_category_id`, `v_post_title`, `v_post_meta_title`, `v_post_path`, `v_post_summary`, `v_post_content`, `v_main_image_url`, `v_second_image_url`, `v_alt_image_url`, `n_blog_post_views`, `f_post_status`, `d_date_created`, `d_time_created`, `d_date_updated`, `d_time_updated`, `n_user_id`) VALUES
(15, 7, 'United States', 'The United States of America', 'https://en.wikipedia.org/wiki/United_States', 'United States, officially United States of America, abbreviated U.S. or U.S.A., byname America, country in North America, a federal republic of 50 states. Besides the 48 conterminous states that occupy the middle latitudes of the continent, the United States includes the state of Alaska, at the northwestern extreme of North America, and the island state of Hawaii, in the mid-Pacific Ocean. The conterminous states are bounded on the north by Canada, on the east by the Atlantic Ocean, on the south by the Gulf of Mexico and Mexico, and on the west by the Pacific Ocean. The United States is the fourth largest country in the world in area (after Russia, Canada, and China). The national capital is Washington, which is coextensive with the District of Columbia, the federal capital region created in 1790.', 'The United States is a federal republic of 50 states, a federal district, five territories and several uninhabited island possessions.[211][212][213] It is the world&#039;s oldest surviving federation. It is a federal republic and a representative democracy &quot;in which majority rule is tempered by minority rights protected by law.&quot;[214] In the American federalist system, citizens are subjected to three levels of government: federal, state, and local. The local government&#039;s duties are commonly split between county and municipal governments. In almost all cases, executive and legislative officials are elected by a plurality vote of citizens by district.[citation needed]The government is regulated by a system of checks and balances defined by the U.S. Constitution, which serves as the country&#039;s supreme legal document.[215] The Constitution establishes the structure and responsibilities of the federal government and its relationship with the individual states. The Constitution has been amended 27 times;[216] the first ten amendments (Bill of Rights) and the Fourteenth Amendment form the central basis of Americans&#039; individual rights. All laws and governmental procedures are subject to judicial review, and any law can be voided if the courts determine that it violates the Constitution. The principle of judicial review, not explicitly mentioned in the Constitution, was established by the Supreme Court in Marbury v. Madison (1803).[217]The federal government comprises three branches:Legislative: The bicameral Congress, made up of the Senate and the House of Representatives, makes federal law, declares war, approves treaties, has the power of the purse,[218] and has the power of impeachment, by which it can remove sitting members of the federal government.[219]Executive: The president is the commander-in-chief of the military, can veto legislative bills before they become law (subject to congressional override), and appoints the members of the Cabinet (subject to Senate approval) and other officers, who administer and enforce federal laws and policies.[220]Judicial: The Supreme Court and lower federal courts, whose judges are appointed by the president with Senate approval, interpret laws and overturn those they find unconstitutional.[221]The House of Representatives has 435 voting members, each representing a congressional district for a two-year term. House seats are apportioned among the states by population. Each state then draws single-member districts to conform with the census apportionment. The District of Columbia and the five major U.S. territories each have one member of Congress—these members are not allowed to vote.[222]The Senate has 100 members with each state having two senators, elected at-large to six-year terms; one-third of Senate seats are up for election every two years. The District of Columbia and the five major U.S. territories do not have senators.[222] The president serves a four-year term and may be elected to the office no more than twice. The president is not elected by direct vote, but by an indirect electoral college system in which the determining votes are apportioned to the states and the District of Columbia.[223] The Supreme Court, led by the chief justice of the United States, has nine members, who serve for life.', 'wallpapersden.com_usa-new-york-.jpg', 'usa flag.jpg', 'wallpapersden.com_usa-new-york-.jpg', 8, 1, '2022-07-24', '02:22:56', '2022-07-24', '12:43:09', 3),
(16, 7, 'Germany', 'Federal Republic of Germany', 'https://en.wikipedia.org/wiki/Germany', 'Germany (German: Deutschland, pronounced [ˈdɔʏtʃlant] (listen)), officially the Federal Republic of Germany,[f] is a country in Central Europe. It is the second most populous country in Europe after Russia, and the most populous member state of the European Union. Germany is situated between the Baltic and North seas to the north, and the Alps to the south; it covers an area of 357,022 square kilometres (137,847 sq mi), with a population of over 83 million within its 16 constituent states. Germany borders Denmark to the north, Poland and the Czech Republic to the east, Austria and Switzerland to the south, and France, Luxembourg, Belgium, and the Netherlands to the west. The nation&#039;s capital and largest city is Berlin and its financial centre is Frankfurt; the largest urban area is the Ruhr.Various Germanic tribes have inhabited the northern parts of modern Germany since classical antiquity. A region named Germania was documented before AD 100. In the 10th century, German territories formed a central part of the Holy Roman Empire. During the 16th century, northern German regions became the centre of the Protestant Reformation. Following the Napoleonic Wars and the dissolution of the Holy Roman Empire in 1806, the German Confederation was formed in 1815. In 1871, Germany became a nation-state when most of the German states unified into the Prussian-dominated German Empire. After World War I and the German Revolution of 1918–1919, the Empire was replaced by the semi-presidential Weimar Republic.The Nazi seizure of power in 1933 led to the establishment of a totalitarian dictatorship, World War II, and the Holocaust. After the end of World War II in Europe and a period of Allied occupation, Germany was divided into the Federal Republic of Germany, generally known as West Germany, and the German Democratic Republic, East Germany. The Federal Republic of Germany was a founding member of the European Economic Community and the European Union, while the German Democratic Republic was a communist Eastern Bloc state and member of the Warsaw Pact. After the fall of communism, German reunification saw the former East German states join the Federal Republic of Germany on 3 October 1990—becoming a federal parliamentary republic.Germany is a great power with a strong economy; it has the largest economy in Europe, the world&#039;s fourth-largest economy by nominal GDP and the fifth-largest by PPP. As a global leader in several industrial, scientific and technological sectors, it is both the world&#039;s third-largest exporter and importer of goods. As a developed country, which ranks very high on the Human Development Index, it offers social security and a universal health care system, environmental protections, a tuition-free university education, and it is ranked as 16th most peaceful country in the world. Germany is a member of the United Nations, NATO, the G7, the G20 and the OECD. It has the third-greatest number of UNESCO World Heritage Sites.', 'Germany has a social market economy with a highly skilled labour force, a low level of corruption, and a high level of innovation.[4][170][171] It is the world&#039;s third-largest exporter and third-largest importer of goods,[4] and has the largest economy in Europe, which is also the world&#039;s fourth-largest economy by nominal GDP,[172] and the fifth-largest by PPP.[173] Its GDP per capita measured in purchasing power standards amounts to 121% of the EU27 average (100%).[174] The service sector contributes approximately 69% of the total GDP, industry 31%, and agriculture 1% as of 2017.[4] The unemployment rate published by Eurostat amounts to 3.2% as of January 2020, which is the fourth-lowest in the EU.[175]Germany is part of the European single market which represents more than 450 million consumers.[176] In 2017, the country accounted for 28% of the Eurozone economy according to the International Monetary Fund.[177] Germany introduced the common European currency, the Euro, in 2002.[178] Its monetary policy is set by the European Central Bank, which is headquartered in Frankfurt.[179][169]Being home to the modern car, the automotive industry in Germany is regarded as one of the most competitive and innovative in the world,[180] and is the fourth-largest by production.[181] The top ten exports of Germany are vehicles, machinery, chemical goods, electronic products, electrical equipments, pharmaceuticals, transport equipments, basic metals, food products, and rubber and plastics.[182]Of the world&#039;s 500 largest stock-market-listed companies measured by revenue in 2019, the Fortune Global 500, 29 are headquartered in Germany.[183] 30 major Germany-based companies are included in the DAX, the German stock market index which is operated by Frankfurt Stock Exchange.[184] Well-known international brands include Mercedes-Benz, BMW, Volkswagen, Audi, Siemens, Allianz, Adidas, Porsche, Bosch and Deutsche Telekom.[185] Berlin is a hub for startup companies and has become the leading location for venture capital funded firms in the European Union.[186] Germany is recognised for its large portion of specialised small and medium enterprises, known as the Mittelstand model.[187] These companies represent 48% global market leaders in their segments, labelled hidden champions.[188]Research and development efforts form an integral part of the German economy.[189] In 2018 Germany ranked fourth globally in terms of number of science and engineering research papers published.[190] Germany was ranked 9th in the Global Innovation Index in 2019 and 2020 and 10th in 2021.[191][192][193] Research institutions in Germany include the Max Planck Society, the Helmholtz Association, and the Fraunhofer Society and the Leibniz Association.[194] Germany is the largest contributor to the European Space Agency.[195]', 'brandz-germany-header_1500x1000.jpg', 'deutschland.jpg', 'brandz-germany-header_1500x1000.jpg', 8, 1, '2022-07-24', '02:41:15', '2022-07-24', '03:20:13', 3),
(17, 7, 'Japan', '日本 ( Nippon-koku )', 'https://en.wikipedia.org/wiki/Japan', 'Japan (Japanese: 日本, Nippon or Nihon,[nb 1] and formally 日本国, Nihonkoku[nb 2]) is an island country in East Asia. It is situated in the northwest Pacific Ocean, and is bordered on the west by the Sea of Japan, while extending from the Sea of Okhotsk in the north toward the East China Sea, Philippine Sea, and Taiwan in the south. Japan is a part of the Ring of Fire, and spans an archipelago of 6852 islands covering 377,975 square kilometers (145,937 sq mi); the five main islands are Hokkaido, Honshu (the &quot;mainland&quot;), Shikoku, Kyushu, and Okinawa. Tokyo is the nation&#039;s capital and largest city, followed by Yokohama, Osaka, Nagoya, Sapporo, Fukuoka, Kobe, and Kyoto.Japan is the eleventh most populous country in the world, as well as one of the most densely populated and urbanized. About three-fourths of the country&#039;s terrain is mountainous, concentrating its population of 125.5 million on narrow coastal plains. Japan is divided into 47 administrative prefectures and eight traditional regions. The Greater Tokyo Area is the most populous metropolitan area in the world, with more than 37.4 million residents.Japan has been inhabited since the Upper Paleolithic period (30,000 BC), though the first written mention of the archipelago appears in a Chinese chronicle (the Book of Han) finished in the 2nd century AD. Between the 4th and 9th centuries, the kingdoms of Japan became unified under an emperor and the imperial court based in Heian-kyō. Beginning in the 12th century, political power was held by a series of military dictators (shōgun) and feudal lords (daimyō) and enforced by a class of warrior nobility (samurai). After a century-long period of civil war, the country was reunified in 1603 under the Tokugawa shogunate, which enacted an isolationist foreign policy. In 1854, a United States fleet forced Japan to open trade to the West, which led to the end of the shogunate and the restoration of imperial power in 1868. In the Meiji period, the Empire of Japan adopted a Western-modeled constitution and pursued a program of industrialization and modernization. Amidst a rise in militarism and overseas colonization, Japan invaded China in 1937 and entered World War II as an Axis power in 1941. After suffering defeat in the Pacific War and two atomic bombings, Japan surrendered in 1945 and came under a seven-year Allied occupation, during which it adopted a new constitution and began a military alliance with the United States. Under the 1947 constitution, Japan has maintained a unitary parliamentary constitutional monarchy with a bicameral legislature, the National Diet.', 'Japan is the third-largest national economy in the world, after the United States and China, in terms of nominal GDP,[150] and the fourth-largest national economy in the world, after the United States, China and India, in terms of purchasing power parity as of 2019.[151] As of 2019, Japan&#039;s labor force consisted of 67 million workers.[108] Japan has a low unemployment rate of around 2.4 percent.[108] Around 16 percent of the population were below the poverty line in 2017.[152] Japan today has the highest ratio of public debt to GDP of any developed nation,[153][154] with national debt at 236% relative to GDP as of 2017.[155][156] The Japanese yen is the world&#039;s third-largest reserve currency (after the US dollar and the euro).[157]Japan&#039;s exports amounted to 18.5% of GDP in 2018.[158] As of 2019, Japan&#039;s main export markets were the United States (19.8 percent) and China (19.1 percent).[108] Its main exports are motor vehicles, iron and steel products, semiconductors and auto parts.[74] Japan&#039;s main import markets as of 2019 were China (23.5 percent), the United States (11 percent), and Australia (6.3 percent).[108] Japan&#039;s main imports are machinery and equipment, fossil fuels, foodstuffs, chemicals, and raw materials for its industries.[108]The Japanese variant of capitalism has many distinct features: keiretsu enterprises are influential, and lifetime employment and seniority-based career advancement are common in the Japanese work environment.[159][160] Japan has a large cooperative sector, with three of the ten largest cooperatives in the world, including the largest consumer cooperative and the largest agricultural cooperative in the world as of 2018.[161] Japan ranks highly for competitiveness and economic freedom. It is ranked sixth in the Global Competitiveness Report for 2015–2016.Agriculture and fisheryMain article: Agriculture, forestry, and fishing in JapanA rice paddy in Aizu, Fukushima PrefectureThe Japanese agricultural sector accounts for about 1.2% of the total country&#039;s GDP as of 2018.[108] Only 11.5% of Japan&#039;s land is suitable for cultivation.[164] Because of this lack of arable land, a system of terraces is used to farm in small areas.[165] This results in one of the world&#039;s highest levels of crop yields per unit area, with an agricultural self-sufficiency rate of about 50% as of 2018.[166] Japan&#039;s small agricultural sector is highly subsidized and protected.[167] There has been a growing concern about farming as farmers are aging with a difficult time finding successors.[168]Japan ranked seventh in the world in tonnage of fish caught and captured 3,167,610 metric tons of fish in 2016, down from an annual average of 4,000,000 tons over the previous decade.[169] Japan maintains one of the world&#039;s largest fishing fleets and accounts for nearly 15% of the global catch,[74] prompting critiques that Japan&#039;s fishing is leading to depletion in fish stocks such as tuna.[170] Japan has sparked controversy by supporting commercial whaling', 'japan-1200x729-1.jpg', 'Japan female friends .jpg', 'japan-1200x729-1.jpg', 2, 1, '2022-07-24', '02:55:15', '2022-07-24', '03:20:03', 3),
(18, 7, 'Vietnam', 'Việt Nam', 'https://en.wikipedia.org/wiki/Vietnam', 'Vietnam (Vietnamese: Việt Nam, [vîət nāːm] (listen)), officially the Socialist Republic of Vietnam,[n 3] is a country in Southeast Asia, at the eastern edge of mainland Southeast Asia, with an area of 311,699 square kilometres (120,348 sq mi) and population of 96 million, making it the world&#039;s fifteenth-most populous country. Vietnam borders China to the north, Laos and Cambodia to the west, and shares maritime borders with Thailand through the Gulf of Thailand, and the Philippines, Indonesia, and Malaysia through the South China Sea. Its capital is Hanoi and largest city Ho Chi Minh City.[n 4]Vietnam was inhabited by the Paleolithic age, with states established in the first millennium BC on the Red River Delta in modern-day northern Vietnam. The Han dynasty annexed Northern and Central Vietnam under Chinese rule from 111 BC, until the first dynasty emerged in 939. Successive monarchical dynasties absorbed Chinese influences through Confucianism and Buddhism, and expanded southward to the Mekong Delta, conquering Champa. The Nguyễn—the last imperial dynasty—fell to French colonisation in 1887. Following the August Revolution, the nationalist Viet Minh under the leadership of communist revolutionary Ho Chi Minh proclaimed independence from France in 1945.', 'Vietnam is located on the eastern Indochinese Peninsula between the latitudes 8° and 24°N, and the longitudes 102° and 110°E. It covers a total area of approximately 331,212 km2 (127,882 sq mi).[n 7] The combined length of the country&#039;s land boundaries is 4,639 km (2,883 mi), and its coastline is 3,444 km (2,140 mi) long.[167] At its narrowest point in the central Quảng Bình Province, the country is as little as 50 kilometres (31 mi) across, though it widens to around 600 kilometres (370 mi) in the north.[168] Vietnam&#039;s land is mostly hilly and densely forested, with level land covering no more than 20%. Mountains account for 40% of the country&#039;s land area,[169] and tropical forests cover around 42%.[170] The Red River Delta in the north, a flat, roughly triangular region covering 15,000 km2 (5,792 sq mi),[171] is smaller but more intensely developed and more densely populated than the Mekong River Delta in the south. Once an inlet of the Gulf of Tonkin, it has been filled in over the millennia by riverine alluvial deposits.[172][173] The delta, covering about 40,000 km2 (15,444 sq mi), is a low-level plain no more than 3 metres (9.8 ft) above sea level at any point. It is criss-crossed by a maze of rivers and canals, which carry so much sediment that the delta advances 60 to 80 metres (196.9 to 262.5 ft) into the sea every year.[174][175] The exclusive economic zone of Vietnam covers 417,663 km2 (161,261 sq mi) in the South China Sea.Southern Vietnam is divided into coastal lowlands, the mountains of the Annamite Range, and extensive forests. Comprising five relatively flat plateaus of basalt soil, the highlands account for 16% of the country&#039;s arable land and 22% of its total forested land.[177] The soil in much of the southern part of Vietnam is relatively low in nutrients as a result of intense cultivation.[178] Several minor earthquakes have been recorded in the past. Most have occurred near the northern Vietnamese border in the provinces of Điện Biên, Lào Cai and Sơn La, while some have been recorded offshore of the central part of the country.[179][180] The northern part of the country consists mostly of highlands and the Red River Delta. Fansipan (also known as Phan Xi Păng), which is located in Lào Cai Province, is the highest mountain in Vietnam, standing 3,143 m (10,312 ft) high.[181] From north to south Vietnam, the country also has numerous islands; Phú Quốc is the largest.[182] The Hang Sơn Đoòng Cave is considered the largest known cave passage in the world since its discovery in 2009. The Ba Bể Lake and Mekong River are the largest lake and longest river in the country', 'Ao-Dai-Hue.jpg', 'districts-of-HCMC-explained.jpg', 'Ao-Dai-Hue.jpg', 4, 1, '2022-07-24', '03:02:44', '2022-07-24', '03:19:47', 3),
(19, 8, 'Đà Lạt', 'Vietnam', 'https://vi.wikipedia.org/wiki/%C4%90%C3%A0_L%E1%BA%A1t', 'Đà Lạt là thành phố trực thuộc tỉnh Lâm Đồng, nằm trên cao nguyên Lâm Viên, thuộc vùng Tây Nguyên, Việt Nam. Từ xa xưa, vùng đất này vốn là địa bàn cư trú của những cư dân người Lạch, người Chil và người Srê thuộc dân tộc Cơ Ho. Cuối thế kỷ 19, khi tìm kiếm một địa điểm để xây dựng trạm nghỉ dưỡng dành cho người Pháp ở Đông Dương, Toàn quyền Paul Doumer đã quyết định chọn cao nguyên Lâm Viên theo đề nghị của bác sĩ Alexandre Yersin, người từng thám hiểm tới nơi đây vào năm 1893. Trong nửa đầu thế kỷ 20, từ một địa điểm hoang vu, người Pháp đã quy hoạch và xây dựng lên một thành phố xinh đẹp với những biệt thự, công sở, khách sạn và trường học, một trung tâm du lịch và giáo dục của Đông Dương khi đó. Trải qua những khoảng thời gian thăng trầm của hai cuộc chiến tranh cùng giai đoạn khó khăn những thập niên 1970–1980, Đà Lạt ngày nay là một thành phố khá đông dân, đô thị loại I trực thuộc tỉnh, giữ vai trò trung tâm chính trị, kinh tế và văn hóa quan trọng của tỉnh Lâm Đồng và vùng Tây Nguyên, hướng đến là thành phố trực thuộc Trung ương vào năm 2030.', 'Địa danh Đà Lạt được bắt nguồn từ chữ Đạ Lạch, tên gọi của con suối Cam Ly. Khởi nguồn từ huyện Lạc Dương, dòng suối Cam Ly chảy qua khu vực Đà Lạt theo hướng Bắc – Nam, trong đó đoạn từ khoảng Hồ Than Thở tới thác Cam Ly ngày nay được gọi là Đạ Lạch.[4] Theo ngôn ngữ của người Thượng, Da hay Dak có nghĩa là nước, tên gọi Đà Lạt có nghĩa nước của người Lạt, hay suối của người Lạt (người Cơ Ho). Trong một bài phỏng vấn đăng trên tạp chí Revue Indochine tháng 4 năm 1944, công sứ Cunhac, một trong những người tham gia xây dựng thành phố từ ngày đầu, đã nói: &quot;Cho mãi tới những năm sau này, khung cảnh ban sơ vẫn không có gì thay đổi. Ở tại chỗ của cái hồ nước trước đó, con suối nhỏ của bộ lạc người Lát đã chảy qua và người ta đã gọi suối này là Đà Lạt&quot;.[5] Vào thời kỳ đầu, các bản đồ cũng như sách báo thường chỉ nhắc đến địa danh Dankia hay Lang Biang. Nhưng sau khi Đà Lạt được chọn làm nơi nghỉ dưỡng thay vì Dankia, và đặc biệt từ khi nơi đây trở thành một thành phố, địa danh Đà Lạt mới xuất hiện thường xuyên.[5]Những người có công kiến thiết thành phố còn sáng tạo một câu cách ngôn khéo léo bằng tiếng La Tinh: Dat Aliis Laetitiam Aliis Temperiem, có nghĩa Cho người này nguồn vui, cho người khác sự mát mẻ. Tác giả André Morval đã viết câu cách ngôn chiết tự này ở đầu một bài báo nhan đề Dalat: Cité de la Jeunesse với nội dung: &quot;Những người khai sinh ra nơi nghỉ mát trên miền núi danh tiếng của chúng ta đã xác định một cách rất hợp lý những nét hấp dẫn và những đặc tính tốt bằng một câu cách ngôn ghép chữ đầu rất khéo léo để liền theo huy hiệu thành phố&quot;.[6] Năm 1937, khi xây dựng chợ Đà Lạt mới thay cho ngôi chợ cũ bằng gỗ bị cháy, người ta đã đề dòng chữ Dat Aliis Laetitiam Aliis Temperiem trên tường đầu hồi của công trình, phía trên là huy hiệu thành phố hình tròn, tạc hình một đôi thanh niên nam nữ người dân tộc cùng với hình núi đồi nhấp nhô và hình hiệu một con cọp[7] Với khí hậu ôn hòa, cảnh quan thiên nhiên tươi đẹp và những di sản kiến trúc Pháp phong phú, Đà Lạt còn được gọi bằng nhiều cái tên khác như &quot;Thành phố mù sương&quot;, &quot;Thành phố ngàn thông&quot;, &quot;Thành phố ngàn hoa&quot;, &quot;Xứ hoa Anh Đào&quot; hay &quot;Tiểu Paris&quot;', '1b265658c7086eed9e348364dc889164.jpg', 'Du-lich-da-lat-mua-dong-mytour-1.jpg', '1b265658c7086eed9e348364dc889164.jpg', 3, 1, '2022-07-24', '03:09:12', '2022-07-24', '03:18:33', 3),
(20, 8, 'Trà Vinh', 'Vietnam', 'https://vi.wikipedia.org/wiki/Tr%C3%A0_Vinh_(th%C3%A0nh_ph%E1%BB%91)', 'Thành phố Trà Vinh là tỉnh lỵ của tỉnh Trà Vinh, có diện tích tự nhiên 68,035 km² chiếm gần 3% diện tích của tỉnh. Nằm ở phía Nam sông Tiền có tọa độ địa lý từ 106o18’ đến 106o25’ kinh độ Đông và từ 9o31’ đến 10o1’ vĩ độ Bắc,[3] có vị trí địa lý:Phía bắc giáp sông Cổ Chiên, tỉnh Bến TrePhía tây bắc giáp huyện Càng LongPhía đông, nam, đông nam và tây nam giáp huyện Châu Thành.Thành phố Trà Vinh có diện tích 68,03 km², dân số năm 2019 là 112.584 người[4], mật độ dân số đạt 1.655 người/km².Thành phố Trà Vinh nằm bên bờ sông Tiền, trên Quốc lộ 53 và cách Thành phố Hồ Chí Minh khoảng 202 km và cách thành phố Cần Thơ 100 km, cách bờ biển Đông 40 km, với hệ thống giao thông đường bộ và đường thủy khá hoàn chỉnh thuận tiện để phát triển kinh tế, văn hóa - xã hội với các tỉnh đồng bằng sông Cửu Long và là vùng kinh tế trọng điểm của tỉnh.', 'Biển Ba Động thường được biết đến là một danh thắng - khu du lịch nổi tiếng nằm ở tỉnh Trà Vinh. Nhưng nơi đây còn sở hữu đường bờ biển dài, đặc biệt là có thềm lục địa nông sâu khác nhau. Những điều kiện này rất phù hợp cho các dự án đầu tư phát triển điện gió. Theo nhiều nhà đầu tư, trong tương lai không xa, vùng đất này sẽ là trung tâm năng lượng tái tạo của khu vực đồng bằng sông Cửu Long. Đặc biệt, dự án điện gió Đông Hải 1 hiện đang là nhà máy thứ 5 tại tỉnh đi vào hoạt động với tổng mức đầu tư lên đến gần 5.000 tỷ đồng. Hãy cùng LuhanhVietNam check in khu vực điện gió huyện Duyên Hải, Trà Vinh, thưởng thức trọn vẹn nét đẹp của biển và gió nhé.Du lịch Trà Vinh, du khách không chỉ được viếng thăm những ngôi chùa Khmer linh thiêng và các địa điểm tuyệt đẹp như Ao Bà Om, khu du lịch Cồn Chim… mà còn được check in tại một trong những cánh đồng điện gió đẹp như tranh vẽ của miền sông nước. Đó là cánh đồng điện gió Đông Hải 1. Công trình tọa lạc tại ấp Định An, xã Đông Hải, huyện Duyên Hải, tỉnh Trà Vinh.', 'kien-truc-tra-vinh-1.jpg', 'dien-gio-xin-duoc-bo-sung-45000-mw-vao-quy-hoach1584925631.jpg', 'kien-truc-tra-vinh-1.jpg', 4, 1, '2022-07-24', '03:16:29', '2022-07-24', '03:19:35', 3),
(21, 10, 'Siberian Tiger', 'Tiger', 'https://en.wikipedia.org/wiki/Siberian_tiger', 'The&amp;nbsp;Siberian tiger&amp;nbsp;or&amp;nbsp;Amur tiger&amp;nbsp;is a population of the&amp;nbsp;tiger&amp;nbsp;subspecies&amp;nbsp;Panthera tigris tigris&amp;nbsp;native to the&amp;nbsp;Russian Far East,&amp;nbsp;Northeast China[1]&amp;nbsp;and possibly&amp;nbsp;North Korea.[2]&amp;nbsp;It once ranged throughout the&amp;nbsp;Korean Peninsula, but currently inhabits mainly the&amp;nbsp;Sikhote-Alin&amp;nbsp;mountain region in southwest&amp;nbsp;Primorye Province&amp;nbsp;in the Russian Far East. In 2005, there were 331–393 adult and subadult Siberian tigers in this region, with a breeding adult population of about 250 individuals. The population had been stable for more than a decade because of intensive&amp;nbsp;conservation efforts, but partial surveys conducted after 2005 indicate that the Russian tiger population was declining.[3]&amp;nbsp;An initial census held in 2015 indicated that the Siberian tiger population had increased to 480–540 individuals in the Russian Far East, including 100 cubs.[4][5]&amp;nbsp;This was followed up by a more detailed census which revealed there was a total population of 562 wild Siberian tigers in Russia.[6]&amp;nbsp;As of 2014, about 35 individuals were estimated to range in the international border area between Russia and China.[7]The Siberian tiger is genetically close to the now-extinct&amp;nbsp;Caspian tiger. Results of a&amp;nbsp;phylogeographic&amp;nbsp;study comparing&amp;nbsp;mitochondrial DNA&amp;nbsp;from Caspian tigers and living tiger populations indicate that the common ancestor of the Siberian and Caspian tigers colonized Central Asia from eastern China, via the&amp;nbsp;Gansu−Silk Road&amp;nbsp;corridor, and then subsequently traversed&amp;nbsp;Siberia&amp;nbsp;eastward to establish the Siberian tiger population in the Russian Far East.[8]&amp;nbsp;The Caspian and Siberian tiger populations were the northernmost in mainland Asia.[9][10]The Siberian tiger was also called &quot;Amur&amp;nbsp;tiger&quot;, &quot;Manchurian&amp;nbsp;tiger&quot;, &quot;Korean tiger&quot;,[2]&amp;nbsp;and &quot;Ussurian&amp;nbsp;tiger&quot;, depending on the region where individuals were observed', 'Felis tigris&amp;nbsp;was the&amp;nbsp;scientific name&amp;nbsp;proposed by&amp;nbsp;Carl Linnaeus&amp;nbsp;in 1758 for the tiger.[12]&amp;nbsp;In the 19th century, several tiger specimens were collected in East Asia and described:Felis tigris altaicus&amp;nbsp;proposed by&amp;nbsp;Coenraad Jacob Temminck&amp;nbsp;in 1844 were tiger skins with long hairs and dense coats sold in Japan, which originated in Korea, most likely from animals killed in the&amp;nbsp;Altai&amp;nbsp;and Pisihan Mountains.[13]Tigris longipilis&amp;nbsp;proposed by&amp;nbsp;Leopold Fitzinger&amp;nbsp;in 1868 was based on a long-haired tiger skin in the&amp;nbsp;Natural History Museum, Vienna.[14]Felis tigris&amp;nbsp;var.&amp;nbsp;amurensis&amp;nbsp;proposed by Charles Dode in 1871 was based on tiger skins from the Amur region.[15]Felis tigris coreensis&amp;nbsp;by Emil Brass in 1904 was a tiger skin from Korea.[16]The&amp;nbsp;validity&amp;nbsp;of several tiger subspecies was questioned in 1999. Most putative subspecies described in the 19th and 20th centuries were distinguished on the basis of fur length and colouration, striping patterns and body size – characteristics that vary widely within populations.&amp;nbsp;Morphologically, tigers from different regions vary little, and&amp;nbsp;gene flow&amp;nbsp;between populations in those regions is considered to have been possible during the&amp;nbsp;Pleistocene. Therefore, it was proposed to recognize only two tiger subspecies as valid, namely&amp;nbsp;Panthera tigris tigris&amp;nbsp;in mainland Asia, and&amp;nbsp;P. t. sondaica&amp;nbsp;in the&amp;nbsp;Greater Sunda Islands&amp;nbsp;and possibly in&amp;nbsp;Sundaland.[17][18]&amp;nbsp;In 2015, morphological, ecological and molecular traits of all putative tiger subspecies were analysed in a combined approach. Results support distinction of the two evolutionary groups: continental and Sunda tigers. The authors proposed recognition of only two subspecies: namely&amp;nbsp;P. t. tigris&amp;nbsp;comprising the Bengal,&amp;nbsp;Malayan,&amp;nbsp;Indochinese,&amp;nbsp;South China, Siberian and Caspian tiger populations; and&amp;nbsp;P. t. sondaica&amp;nbsp;comprising the&amp;nbsp;Javan,&amp;nbsp;Bali&amp;nbsp;and&amp;nbsp;Sumatran tiger&amp;nbsp;populations.[19]In 2017, the Cat Specialist Group revised felid taxonomy and now recognizes all the tiger populations in mainland Asia as&amp;nbsp;P. t. tigris', 'nws-st-siberian-tiger-close-medium.jpg', 'c95ada13-2301-46a3-a4f1-6c14ba3895d3_1140x641.jpg', 'nws-st-siberian-tiger-close-medium.jpg', 7, 1, '2022-07-24', '03:26:53', NULL, NULL, 3),
(22, 10, 'Blue Whale', 'Whale', 'https://en.wikipedia.org/wiki/Blue_whale', 'The blue whale (Balaenoptera musculus) is a marine mammal and a baleen whale. Reaching a maximum confirmed length of 29.9 meters (98 ft) and weighing up to 199 metric tons (196 long tons; 219 short tons), it is the largest animal known to have ever existed. The blue whale&#039;s long and slender body can be of various shades of greyish-blue dorsally and somewhat lighter underneath. Four subspecies are recognized: B. m. musculus in the North Atlantic and North Pacific, B. m. intermedia in the Southern Ocean, B. m. brevicauda (the pygmy blue whale) in the Indian Ocean and South Pacific Ocean, B. m. indica in the Northern Indian Ocean. There is also a population in the waters off Chile that may constitute a fifth subspecies.In general, blue whale populations migrate between their summer feeding areas near the poles and their winter breeding grounds near the tropics. There is also evidence of year-round residencies, and partial or age/sex-based migration. Blue whales are filter feeders; their diet consists almost exclusively of krill. They are generally solitary or gather in small groups, and have no well-defined social structure other than mother-calf bonds. The fundamental frequency for blue whale vocalizations ranges from 8 to 25 Hz and the production of vocalizations may vary by region, season, behavior, and time of day. Orcas are their only natural predators.The blue whale was once abundant in nearly all the Earth&#039;s oceans until the end of the 19th century. It was hunted almost to the point of extinction by whalers until the International Whaling Commission banned all blue whale hunting in 1966. The International Union for Conservation of Nature has listed blue whales as endangered as of 2018. It continues to face numerous man-made threats such as ship strikes, pollution, ocean noise and climate change.', 'NomenclatureThe genus name, Balaenoptera, means winged whale[3] while the species name, musculus, could mean &quot;muscle&quot; or a diminutive form of &quot;mouse&quot;, possibly a pun by Carl Linnaeus[4][3] when he named the species in Systema Naturae.[5] One of the first published descriptions of a blue whale comes from Robert Sibbald&#039;s Phalainologia Nova,[6] after Sibbald found a stranded whale in the estuary of the Firth of Forth, Scotland, in 1692. The name &quot;blue whale&quot; was derived from the Norwegian &quot;blåhval&quot;, coined by Svend Foyn shortly after he had perfected the harpoon gun. The Norwegian scientist G. O. Sars adopted it as the common name in 1874.[7]Blue whales were referred to as &#039;Sibbald&#039;s rorqual&#039;, after Robert Sibbald, who first described the species.[6] Herman Melville called the blue whale &quot;sulphur bottom&quot; in his novel Moby Dick[8] because of the accumulation of diatoms creating a yellowish appearance on their pale undersideHybridizationBlue whales are known to interbreed with fin whales. The earliest description of a possible hybrid between a blue and fin whale was a 20-meter (65 ft) anomalous female whale with the features of both the blue and the fin whales taken in the North Pacific.[14] A whale captured off northwestern Spain in 1984, was found to have been the product of a blue whale mother and a fin whale father.[15]Two live blue-fin whale hybrids have since been documented in the Gulf of St. Lawrence, (Canada), and in the Azores, (Portugal).[16] DNA tests done in Iceland on a blue whale killed in July 2018 by the Icelandic whaling company Hvalur hf, found that the whale the offspring of a male fin whale and female blue whale;[17] however, the results are pending independent testing and verification of the samples. Because the International Whaling Commission classified blue whales as a &quot;Protection Stock&quot;, trading their meat is illegal, and the kill is an infraction that must be reported.[18] Blue-fin hybrids have been detected from genetic analysis of whale meat samples taken from Japanese markets.[19] Blue-fin whale hybrids are capable of being fertile. Molecular tests on a 21-meter (70 ft) pregnant female whale caught off Iceland in 1986 found that it had a blue whale mother and a fin whale father, while its fetus was sired by a blue whale.', '_114246517_gettyimages-639203462-594x594.jpg', 'blue-whale-article-2.jpg', '_114246517_gettyimages-639203462-594x594.jpg', 5, 1, '2022-07-24', '03:33:21', '2022-07-24', '06:19:30', 4),
(23, 8, 'München', 'Deutschland ', 'https://de.wikipedia.org/wiki/M%C3%BCnchen', 'München (hochdeutsch [ˈmʏnçn̩]  oder [ˈmʏnçən];[2] bairisch  Minga?/i [ˈmɪŋ(ː)ɐ]) ist die Landeshauptstadt des Freistaates Bayern.[3] Sie ist mit 1.488.202 Einwohnern (31. Dezember 2020) die bevölkerungsreichste Stadt Bayerns, die drittgrößte Gemeinde Deutschlands und mit 4790 Einwohnern pro Quadratkilometer die am dichtesten bevölkerte Gemeinde Deutschlands. Die Stadt bildet das Zentrum der Metropolregion München (rund 6,12 Millionen Einwohner)[4] und der Planungsregion München (2,93 Millionen Einwohner).[5]München wird zu den Weltstädten gezählt und gilt als ein Zentrum der Kultur, Politik, Wissenschaften und Medien.[6] Es ist Sitz zahlreicher Konzerne, darunter sechs DAX-Unternehmen (Allianz, BMW, Münchener Rück, Siemens, MTU und Siemens Energy). Hier befindet sich die einzige Börse Bayerns. In der Städteplatzierung des Beratungsunternehmens Mercer belegte München im Jahr 2018 unter 231 Großstädten weltweit den dritten Platz hinsichtlich der Lebensqualität.[7] Laut dem Magazin Monocle war es 2018 die lebenswerteste Stadt der Welt.[8] Andererseits wird die Lebensqualität der Bewohner zunehmend durch Agglomerationsnachteile wie Verkehrs- und Umweltbelastung eingeschränkt. Auch liegt aufgrund der sehr hohen Wohneigentumspreise und Immobiliarmieten[9][10] die Wohnfläche pro Einwohner in einigen Stadtvierteln weit unter dem Bundesdurchschnitt.[11] München gilt mit 6.469 Straftaten pro 100.000 Einwohnern im Jahr 2019 als sicherste Kommune unter den deutschen Großstädten über 100.000 Einwohnern hinsichtlich der Kriminalitätsrate aller Straftaten.', 'Das Alpenvorland zwischen Kalkalpen und Donau, in dem sich auch München befindet, liegt auf einem tiefen Senkungsbecken, das seit Millionen von Jahren hauptsächlich aus Abtragungen der Alpen aufgefüllt wird. Im Tertiär wurden dort überwiegend Sand- und Geröllmassen durch Flüsse aus den Alpen abgelagert. Während der nachfolgenden Eiszeiten, deren letzte vor etwa 10.000 Jahren endete, bildeten sich im Alpenbereich große Gletscher- und Schmelzwasserströme, die im Voralpenland Moränenhügel und Schotterebenen zurückließen. Die 55 km breite Münchner Schotterebene, die an den Endmoränen des Isarvorlandgletschers ansetzt, ist eine schiefe Ebene mit einem Höhenunterschied von 300 Metern zwischen Holzkirchen im Süden und Moosburg im Norden, deren Oberflächenformen in erster Linie durch den würmeiszeitlichen Schotter gebildet werden. Im Süden der Ebene sind die Flüsse, insbesondere die Isar, tief eingeschnitten. Auf diesen Schotterböden findet man wie im Süden von München vermehrt Wälder, wie den Perlacher Forst und den Forstenrieder Park, auch weil der Grundwasserspiegel hier relativ tief liegt. Im Norden der Stadt dagegen, wo sich der Grundwasserspiegel nahe der Oberfläche befindet, liegen große Niedermoore, wie das Dachauer Moos im Nordwesten und das Erdinger Moos im Nordosten. Siehe auch: Münchner Grüngürtel.', 'Munich-old-town-Munich-in-2-days.jpg', 'og-munich.jpg', 'Munich-old-town-Munich-in-2-days.jpg', 9, 1, '2022-07-24', '03:42:12', '2022-07-24', '03:49:46', 4),
(24, 10, 'Fox', 'Fox', 'https://en.wikipedia.org/wiki/Fox', 'Foxes&amp;nbsp;are small to medium-sized,&amp;nbsp;omnivorous&amp;nbsp;mammals&amp;nbsp;belonging to several&amp;nbsp;genera&amp;nbsp;of the family&amp;nbsp;Canidae. They have a flattened skull, upright triangular ears, a pointed, slightly upturned&amp;nbsp;snout, and a long bushy&amp;nbsp;tail&amp;nbsp;(or&amp;nbsp;brush).Twelve&amp;nbsp;species&amp;nbsp;belong to the&amp;nbsp;monophyletic&amp;nbsp;&quot;true foxes&quot; group of genus&amp;nbsp;Vulpes. Approximately another 25 current or&amp;nbsp;extinct&amp;nbsp;species are always or sometimes called foxes; these foxes are either part of the&amp;nbsp;paraphyletic&amp;nbsp;group of the South American foxes, or of the outlying group, which consists of the bat-eared fox, gray fox, and island fox.[1]Foxes live on every continent except Antarctica. The most common and widespread species of fox is the&amp;nbsp;red fox&amp;nbsp;(Vulpes vulpes) with about 47 recognized&amp;nbsp;subspecies.[2]&amp;nbsp;The global distribution of foxes, together with their widespread reputation for cunning, has contributed to their prominence in popular culture and folklore in many societies around the world. The&amp;nbsp;hunting of foxes&amp;nbsp;with packs of hounds, long an established pursuit in Europe, especially in the British Isles, was exported by European settlers to various parts of the New World.', 'General morphologyFoxes are generally smaller than some other members of the family&amp;nbsp;Canidae&amp;nbsp;such as&amp;nbsp;wolves&amp;nbsp;and&amp;nbsp;jackals, while they may be larger than some within the family, such as&amp;nbsp;Raccoon dogs. In the largest species, the&amp;nbsp;red fox, males weigh on average between&amp;nbsp;4.1 and 8.7 kilograms (9 and&amp;nbsp;19+1⁄4&amp;nbsp;pounds),[7]&amp;nbsp;while the smallest species, the&amp;nbsp;fennec fox, weighs just&amp;nbsp;0.7 to 1.6&amp;nbsp;kg (1+1⁄2&amp;nbsp;to&amp;nbsp;3+1⁄2&amp;nbsp;lb).[8]Fox features typically include a triangular face, pointed ears, an elongated&amp;nbsp;rostrum, and a bushy tail. They are&amp;nbsp;digitigrade&amp;nbsp;(meaning they walk on their toes). Unlike most members of the family Canidae, foxes have partially retractable&amp;nbsp;claws.[9]&amp;nbsp;Fox vibrissae, or&amp;nbsp;whiskers, are black. The whiskers on the muzzle, known as mystacial vibrissae, average&amp;nbsp;100–110 millimetres (3+7⁄8–4+3⁄8&amp;nbsp;inches) long, while the whiskers everywhere else on the head average to be shorter in length. Whiskers (carpal vibrissae) are also on the forelimbs and average&amp;nbsp;40&amp;nbsp;mm (1+5⁄8&amp;nbsp;in) long, pointing downward and backward.[2]&amp;nbsp;Other physical characteristics vary according to habitat and adaptive significance.PelageFox species differ in fur color, length, and density. Coat colors range from pearly white to black-and-white to black flecked with white or grey on the underside.&amp;nbsp;Fennec foxes&amp;nbsp;(and other species of fox adapted to life in the desert, such as&amp;nbsp;kit foxes), for example, have large ears and short fur to aid in keeping the body cool.[2][9]&amp;nbsp;Arctic foxes, on the other hand, have tiny ears and short limbs as well as thick, insulating fur, which aid in keeping the body warm.[10]&amp;nbsp;Red foxes, by contrast, have a typical&amp;nbsp;auburn&amp;nbsp;pelt, the tail normally ending with a white&amp;nbsp;marking.[11]A fox&#039;s coat color and texture may vary due to the change in seasons; fox pelts are richer and denser in the colder months and lighter in the warmer months. To get rid of the dense winter coat, foxes&amp;nbsp;moult&amp;nbsp;once a year around April; the process begins from the feet, up the legs, and then along the back.[9]&amp;nbsp;Coat color may also change as the individual ages', 'sad-cute-fox-erem3sz76ho2d4xa.jpg', '5298608.webp', 'sad-cute-fox-erem3sz76ho2d4xa.jpg', 5, 1, '2022-07-24', '04:22:45', NULL, NULL, 3),
(25, 7, 'United Kingdom', 'The United Kingdom of Great Britain and Northern Ireland', 'https://en.wikipedia.org/wiki/United_Kingdom', 'The&amp;nbsp;United Kingdom of Great Britain and Northern Ireland, commonly known as the&amp;nbsp;United Kingdom&amp;nbsp;(UK) or&amp;nbsp;Britain,[note 1][17]&amp;nbsp;is a&amp;nbsp;sovereign country&amp;nbsp;in&amp;nbsp;Europe, off the north-western coast of the&amp;nbsp;continental mainland.[18][19]&amp;nbsp;It comprises&amp;nbsp;England,&amp;nbsp;Wales,&amp;nbsp;Scotland, and&amp;nbsp;Northern Ireland.[20]&amp;nbsp;The United Kingdom includes the island of&amp;nbsp;Great Britain, the north-eastern part of the island of&amp;nbsp;Ireland, and many smaller islands within the&amp;nbsp;British Isles.[21]&amp;nbsp;Northern Ireland shares&amp;nbsp;a land border&amp;nbsp;with the&amp;nbsp;Republic of Ireland; otherwise, the United Kingdom is surrounded by the&amp;nbsp;Atlantic Ocean, the&amp;nbsp;North Sea, the&amp;nbsp;English Channel, the&amp;nbsp;Celtic Sea&amp;nbsp;and the&amp;nbsp;Irish Sea. The total area of the United Kingdom is 242,495 square kilometres (93,628&amp;nbsp;sq&amp;nbsp;mi), with an estimated 2020 population of more than 67 million people.[22]The United Kingdom is a unitary&amp;nbsp;parliamentary democracy&amp;nbsp;and&amp;nbsp;constitutional monarchy.[note 2][23][24]&amp;nbsp;The monarch,&amp;nbsp;Queen Elizabeth II, has reigned since 1952.[25]&amp;nbsp;The capital and&amp;nbsp;largest city&amp;nbsp;is&amp;nbsp;London, a global city and financial centre with a metropolitan area population of over 14 million. Other major cities include&amp;nbsp;Birmingham,&amp;nbsp;Manchester,&amp;nbsp;Glasgow,&amp;nbsp;Liverpool&amp;nbsp;and&amp;nbsp;Leeds.[26]&amp;nbsp;Scotland, Wales, and Northern Ireland have their own&amp;nbsp;devolved governments, each with varying powers', 'The United Kingdom has evolved from a series of annexations, unions and separations of constituent countries over several hundred years. The&amp;nbsp;Treaty of Union&amp;nbsp;between the&amp;nbsp;Kingdom of England&amp;nbsp;(which included Wales,&amp;nbsp;annexed in 1542) and the&amp;nbsp;Kingdom of Scotland&amp;nbsp;in 1707 formed the&amp;nbsp;Kingdom of Great Britain. Its&amp;nbsp;union in 1801&amp;nbsp;with the&amp;nbsp;Kingdom of Ireland&amp;nbsp;created the&amp;nbsp;United Kingdom of Great Britain and Ireland. Most of Ireland seceded from the UK in 1922, leaving the present United Kingdom of Great Britain and Northern Ireland, which formally adopted that name in 1927.[note 3]The nearby&amp;nbsp;Isle of Man,&amp;nbsp;Guernsey&amp;nbsp;and&amp;nbsp;Jersey&amp;nbsp;are not part of the UK, being&amp;nbsp;Crown Dependencies&amp;nbsp;with the&amp;nbsp;British Government&amp;nbsp;responsible for defence and international representation.[29]&amp;nbsp;There are also 14&amp;nbsp;British Overseas Territories,[30]&amp;nbsp;the last remnants of the&amp;nbsp;British Empire&amp;nbsp;which, at its height in the 1920s, encompassed almost a quarter of the world&#039;s landmass and a third of the world&#039;s population, and was the&amp;nbsp;largest empire in history. British influence can be observed in the language, culture and the legal and political systems of many of its&amp;nbsp;former colonies.[31][32]The United Kingdom has the world&#039;s&amp;nbsp;sixth-largest economy by nominal gross domestic product&amp;nbsp;(GDP), and the&amp;nbsp;eighth-largest by purchasing power parity&amp;nbsp;(PPP). It has a high-income economy and a very high&amp;nbsp;human development index rating, ranking 13th in the world. It also performs well in&amp;nbsp;international rankings&amp;nbsp;of&amp;nbsp;education,&amp;nbsp;healthcare,&amp;nbsp;life expectancy&amp;nbsp;and human development.[33][34]&amp;nbsp;The UK became the world&#039;s first&amp;nbsp;industrialised&amp;nbsp;country and was the world&#039;s&amp;nbsp;foremost power&amp;nbsp;during the 19th and early 20th centuries.[35][36]&amp;nbsp;Today the UK remains one of the world&#039;s&amp;nbsp;great powers,[37]&amp;nbsp;with considerable&amp;nbsp;economic,&amp;nbsp;cultural,&amp;nbsp;military,&amp;nbsp;scientific, technological&amp;nbsp;and&amp;nbsp;political&amp;nbsp;influence internationally.[38][39]&amp;nbsp;It is a recognised&amp;nbsp;nuclear state&amp;nbsp;and is ranked&amp;nbsp;fourth globally in military expenditure.[40]&amp;nbsp;It has been a&amp;nbsp;permanent member&amp;nbsp;of the&amp;nbsp;United Nations Security Council&amp;nbsp;since its first session in 1946.The United Kingdom is a member of the&amp;nbsp;Commonwealth of Nations, the&amp;nbsp;Council of Europe, the&amp;nbsp;G7, the&amp;nbsp;Group of Ten, the&amp;nbsp;G20, the&amp;nbsp;United Nations,&amp;nbsp;NATO,&amp;nbsp;AUKUS, the&amp;nbsp;Organisation for Economic Co-operation and Development&amp;nbsp;(OECD),&amp;nbsp;Interpol, and the&amp;nbsp;World Trade Organization&amp;nbsp;(WTO). It was a member state of the&amp;nbsp;European Communities&amp;nbsp;(EC) and its successor, the&amp;nbsp;European Union&amp;nbsp;(EU), from its&amp;nbsp;accession in 1973&amp;nbsp;until its&amp;nbsp;withdrawal in 2020&amp;nbsp;following&amp;nbsp;a referendum&amp;nbsp;held in 2016.', 'Palace-of-Westminster-Parliament.jpg', 'UK-Britain-1.jpg', 'Palace-of-Westminster-Parliament.jpg', 12, 1, '2022-07-24', '04:26:55', NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `blog_subscriber`
--

CREATE TABLE `blog_subscriber` (
  `n_sub_id` int(11) NOT NULL,
  `v_sub_email` varchar(50) NOT NULL,
  `d_date_created` date NOT NULL,
  `d_time_created` time NOT NULL,
  `f_sub_status` int(11) NOT NULL COMMENT '1-Inactive|2-Active|3-Deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `blog_subscriber`
--

INSERT INTO `blog_subscriber` (`n_sub_id`, `v_sub_email`, `d_date_created`, `d_time_created`, `f_sub_status`) VALUES
(6, 'hello@gmail.com', '2022-07-24', '04:14:16', 1),
(7, '20662001@kthcm.edu.vn', '2022-07-24', '07:47:13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blog_tags`
--

CREATE TABLE `blog_tags` (
  `n_tag_id` int(11) NOT NULL,
  `n_blog_post_id` int(11) NOT NULL,
  `v_tag` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `blog_tags`
--

INSERT INTO `blog_tags` (`n_tag_id`, `n_blog_post_id`, `v_tag`) VALUES
(26, 15, 'USA,America,NewYork,California'),
(27, 16, 'Germany,Deutschland,Berlin'),
(28, 17, 'Japan,Nihon,Tokyo,Osaka'),
(29, 18, 'Vietnam,Saigon,Hue,Travinh'),
(30, 19, 'Dalat,Vietnam,Forest'),
(31, 20, 'Travinh,Vietnam,DuyenHai'),
(32, 21, 'tiger,siberian'),
(33, 22, 'bluewhale,whale'),
(34, 23, 'Deutschland,germany,Munich'),
(35, 24, 'fox,animals'),
(36, 25, 'UK,London');

-- --------------------------------------------------------

--
-- Table structure for table `blog_user`
--

CREATE TABLE `blog_user` (
  `n_user_id` int(11) NOT NULL,
  `v_username` varchar(50) NOT NULL,
  `v_password` varchar(100) NOT NULL,
  `v_fullname` varchar(100) NOT NULL,
  `v_phone` varchar(50) NOT NULL,
  `v_email` varchar(100) NOT NULL,
  `v_image` varchar(100) NOT NULL,
  `v_message` varchar(500) NOT NULL,
  `d_date_updated` date NOT NULL,
  `d_time_updated` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `blog_user`
--

INSERT INTO `blog_user` (`n_user_id`, `v_username`, `v_password`, `v_fullname`, `v_phone`, `v_email`, `v_image`, `v_message`, `d_date_updated`, `d_time_updated`) VALUES
(3, 'Nathan Phan', 'e10adc3949ba59abbe56e057f20f883e', 'Nathan Phan', '0123131132', 'nathanphan@gmail.com', '1fec6d35-c7f0-4dd6-a098-cd2241d4351e.553e400500785e83a6e4e417d0814a0c.jpeg', 'Hi, I\'m Nathan, I\'m from North Carolina USA                                                                                                                       ', '2022-07-24', '02:17:13'),
(4, 'Phan Nhat Tan', 'e10adc3949ba59abbe56e057f20f883e', 'Phan Nhat Tan', '013154655', 'tanphan@gmail.com', '107699062_280772563145341_6619511567604317447_n.jpg', '                                            Xin chào, tôi tên là Tân, tối đến từ Việt Nam.                                            ', '2022-07-24', '03:45:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_category`
--
ALTER TABLE `blog_category`
  ADD PRIMARY KEY (`n_category_id`);

--
-- Indexes for table `blog_comment`
--
ALTER TABLE `blog_comment`
  ADD PRIMARY KEY (`n_blog_comment_id`);

--
-- Indexes for table `blog_contact`
--
ALTER TABLE `blog_contact`
  ADD PRIMARY KEY (`n_contact_id`);

--
-- Indexes for table `blog_post`
--
ALTER TABLE `blog_post`
  ADD PRIMARY KEY (`n_blog_post_id`);

--
-- Indexes for table `blog_subscriber`
--
ALTER TABLE `blog_subscriber`
  ADD PRIMARY KEY (`n_sub_id`);

--
-- Indexes for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD PRIMARY KEY (`n_tag_id`);

--
-- Indexes for table `blog_user`
--
ALTER TABLE `blog_user`
  ADD PRIMARY KEY (`n_user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog_category`
--
ALTER TABLE `blog_category`
  MODIFY `n_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `blog_comment`
--
ALTER TABLE `blog_comment`
  MODIFY `n_blog_comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `blog_contact`
--
ALTER TABLE `blog_contact`
  MODIFY `n_contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `blog_post`
--
ALTER TABLE `blog_post`
  MODIFY `n_blog_post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `blog_subscriber`
--
ALTER TABLE `blog_subscriber`
  MODIFY `n_sub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `blog_tags`
--
ALTER TABLE `blog_tags`
  MODIFY `n_tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `blog_user`
--
ALTER TABLE `blog_user`
  MODIFY `n_user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
