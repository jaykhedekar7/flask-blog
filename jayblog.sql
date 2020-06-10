-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2020 at 09:22 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jayblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_num` int(10) NOT NULL,
  `mes` text NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone_num`, `mes`, `date`) VALUES
(1, 'First post', 'First post', 0, 'First post', '2020-06-04 10:54:09'),
(2, 'Jay Khedekar', 'jaykheddad@gmail.com', 2147483647, 'sdgsrhdsghmhgehhmgh', NULL),
(3, 'Jay Khedekar', 'jaykhed@gmail.com', 2147483647, 'this is first message', NULL),
(4, 'raksha', 'uhhkhbkjj@hjgjh.com', 12345649, 'i am buffie', NULL),
(5, 'Sandeep Khedekar', 's.khed@gmail.com', 1234567890, 'This is a test message.', NULL),
(6, 'Sandeep Khedekar', 's.khed@gmail.com', 1234567890, 'This is a test message.', '2020-06-04 11:37:40'),
(7, 'Swapana Khedekar', 'sj@gmail.com', 2147483647, 'Hello, how are you?', '2020-06-04 11:38:03'),
(8, 'Swapana Khedekar', 'i dont have email', 13465798, 'HellooooooO!!!!!!', '2020-06-04 11:39:58'),
(9, 'Swapana Khedekar', 'i dont have email', 13465798, 'HellooooooO!!!!!!', '2020-06-04 12:11:53'),
(10, 'Swapana Khedekar', 'sj@gmail.com', 2147483647, 'Helloooooooooooooooooooooooooooooooo!', '2020-06-04 16:45:49'),
(11, 'Swapana Khedekar', 'sj@gmail.com', 2147483647, 'Mailing you now', '2020-06-04 16:46:20'),
(12, 'Swapana Khedekar', 'sj@gmail.com', 2147483647, 'Mailing you now', '2020-06-04 16:47:32'),
(13, 'Swapana Khedekar', 'sj@gmail.com', 2147483647, 'Mailing you now', '2020-06-04 16:50:27'),
(14, 'Jay Khedekar', 'jaykhed@gmail.com', 2147483647, 'Hi, I want to connect with you.', '2020-06-04 16:50:52'),
(15, 'Jay Khedekar', 'jaykhed@gmail.com', 12345, '00000000000000000000000000000000000000000', '2020-06-04 20:24:51'),
(16, 'Akshay Patil', 'akpatil@gmail.com', 1234567890, 'Hi, I need a haircut.', '2020-06-07 19:46:11'),
(17, 'Ashish Dogra', 'dogra@gmail.com', 12345678, 'Hi whats up?', '2020-06-08 14:41:38'),
(18, 'Aakansha Singh', 'aak@gmail.com', 12345678, 'Hi Polu!', '2020-06-09 18:24:05'),
(19, 'Raksha', 'ragz@gmail.com', 123456789, 'Hey I am not a buffie!', '2020-06-09 23:58:40');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `slug` varchar(300) NOT NULL,
  `content` text NOT NULL,
  `author` text NOT NULL,
  `img_file` varchar(12) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `slug`, `content`, `author`, `img_file`, `date`) VALUES
(1, '21 Great Small Business Blogs to lookout in 2020 1', '21-Great-Small-Business-Blogs-to-lookout-in-2020-1-38841', 'A blog with small business news and tips that is crowd-curated. BizSugar’s community of readers share business blog posts, videos and other content from which readers of the blog can learn something, For those that share content, they are reinforcing their reputation and brand and bringing online visibility to their content. The community votes on member-submitted tips, advice and information, advancing the most popular (and what’s considered by the community to be most useful) posts to the home page. Top posts are pushed to the top or can make it into the BizSugar Top 10 list.', '', 'home-bg.jpg', '2020-06-09 18:58:04'),
(2, 'Best Personal and Niche Blogs are cool to create', 'Best-Personal-and-Niche-Blogs-are-cool-to-create-92954', 'We all love to read quality blogs. It’s a great way to learn something new, something useful; or to be entertained. However, a lot of people want to become influential bloggers, since that position has a lot of potential for monetization.\r\n\r\n\r\nIf you are thinking about starting a blog, you can do so pretty quickly.\r\n\r\nFor whatever reason, you want to create a blog; you can be sure that it is one of the best decisions you can make. Because, blogging can provide you with numerous benefits, from the powerful feeling of fulfillment from educating, inspiring and helping others to build awareness, gaining influence and forming connections that may even lead to an excellent job offer. Blogging can open a lot of opportunity doors for you and help you make a difference not only in your personal and professional life but also in the lives of your readers.\r\n\r\nOf course, spreading the word about it and attracting the right kind of readers who will find your content interesting and useful requires having good and efficient strategies in place.\r\n\r\nSo what are you going to do? Well, your homework, for starters; you’ve got to know your stuff to stand out in this crowd. A good place to start might be this article with the list of the best blogs on the web. Find the people who are doing what you want to do, and doing it well. Then take their best practices, find your own spin to put on the concept, and write, write, write!', '', 'about-bg.jpg', '2020-06-07 16:11:22'),
(3, 'How to make pastrami at home without mircrowave', 'How-to-make-pastrami-at-home-without-mircrowave-6217', 'It’s the unofficial start of summer and I’m celebrating by making some pastrami at home. We don’t have a large fancy smoker or anything, but as it turns out, you don’t need one to make juicy, smoky, totally addictive pastrami.\r\n\r\nMaking pastrami at home is really easy and really rewarding. It just takes a little time and patience, which is easy when you don’t have to do much: just plan ahead 1 week and some pink salt, which you can easily get on Amazon.', '', 'post-bg.jpg', '2020-06-09 19:36:05'),
(4, '12 THINGS TO SEE AND DO IN BERGEN, NORWAY', '12-THINGS-TO-SEE-AND-DO-IN-BERGEN,-NORWAY-20951', '<p>Enveloped by steep mountains and sitting next to the country&rsquo;s deepest and longest fjord, Bergen is a small city tucked away on the west coast of Norway. Though home to only<strong> 220,000</strong> people, there&rsquo;s a surprising amount of things to see and do in this tiny city. You can easily spend days here hiking its natural surroundings, relaxing on a fjord cruise, eating fresh seafood, and learning about its long history. I stayed about three days during my visit and felt I could have stayed a little longer. It&rsquo;s pretty, historic, and filled with a lot of good food options. Bergen is a pretty big tourist destination in Norway so you sadly won&rsquo;t have this city to yourself. To help you make the most of your trip, here are my top 12 things to see and do in Bergen:</p>', '', 'home-bg.jpg', '2020-06-07 16:40:12'),
(5, 'Apple reportedly will offer monthly payment plans', 'Apple-reportedly-will-offer-monthly-payment-plans-26551', 'Apple will allow customers to buy products including iPads, Macs, and AirPods, via monthly installment payments on the Apple Card, Bloomberg reported. Payments will be managed through the Apple Card section in the iPhone Wallet app and added to customers’ monthly Apple Card bills, according to Bloomberg.\r\n\r\nFor iPads, Macs, the Apple Pencil, iPad keyboards, and the Mac XDR Display monitor, a 12-month, interest-free payment plan will be available, and for AirPods, HomePod, and Apple TV, the plans will be six months interest free.\r\n\r\nLast year, Apple rolled out a 24-month, interest-free payment plan for iPhones purchased with an Apple Card, and gives 3 percent cash back.\r\n\r\nApple launched the Apple Card last August in partnership with Goldman Sachs. Users get a digital card connected to the Apple Wallet app and a physical card made of titanium.\r\n\r\nApple did not immediately reply to a request for comment Saturday', '', 'home-bg.jpg', '2020-06-09 20:33:50'),
(6, 'Twitter, Facebook, and Instagram removed a Trump campaign', 'sixth-post', 'Twitter, Facebook, and Instagram have all removed a Trump campaign video from their platforms after receiving copyright complaints, Reuters reported. The nearly four-minute video featured images of the late George Floyd of Minneapolis, who died May 25th after a police officer kneeled on his neck for more than eight minutes. A video of the incident has prompted nationwide protests of police violence.\r\n\r\nTwitter disabled the video, while Facebook and Instagram removed posts containing the video. When President Trump objected to the removal in a tweet, calling it “illegal,” Twitter CEO Jack Dorsey responded: “Not true and not illegal. This was pulled because we got a DMCA complaint from copyright holder.”', '', 'post-bg.jpg', '2020-06-07 16:42:39'),
(9, 'LinkedIn Social Icon is buzzing with thunder', 'LinkedIn-Social-Icon-is-buzzing-with-thunder-12412', 'Jinja templates that reuse other templates tend to have limited layout elements (e.g. HTML tags) and more Jinja block statements to override content. This is beneficial because as I outlined previously, it lets you establish the overall layout once and define content on a page by page basis.\r\n\r\nThe re-usability of Jinja templates can occur multiple times. For example, you can have templates A, B and C, where B requires to reuse A, but C requires to reuse parts of B. The only difference is template C needs to use the {% extends \"B\" %} tag instead of the {% extends \"A\"%} tag. But since template B reuses A, template C also has access to the same elements in template A.\r\n\r\nWhen reusing Jinja templates, it\'s also possible to access the block content from a parent template. Jinja exposes the block content from a parent template through the super() method. Listing 4-7 illustrates three templates that show this mechanism for a block containing web page paths or \'breadcrumbs\'.', '', '', '2020-06-08 01:41:46'),
(11, 'Shiv Sena mocks Bollywood actor Sonu Sood for helping migrants, says he will soon meet PM Narendra Modiii', 'Shiv-Sena-leader-Sanjay-R', 'Shiv Sena leader Sanjay Raut on Sunday (June 7) slammed Bollywood actor Sonu Sood for helping the migrant workers and said that Sood would \"soon meet Prime Minister Narendra Modi and become the celebrity manager of Mumbai.\"\r\n\r\nRaut wrote in his \'Saamna\' Editorial that during the coronavirus COVId-19 lockdown period, a new \"Mahatma\" named Sonu Sood has appeared out of nowhere. \"It is being said that Sonu Sood transported millions of migrant laborers to his home in other states,\" and the Governor of Maharashtra has also praised \"Mahatma Sood\" for his work.\r\n\r\nRaut said that Sood\'s actions suggests that the state governments and the Central government have failed to do anything for the migrant workers and it was only Sood who was helping them go to their native places during the lockdown.', '', '', '2020-06-08 01:44:12'),
(13, 'How To Use Virtual Backgrounds In Zoom Desktop For Mac And Windows', 'Due-to-the-2020-Covid-19-', 'Due to the 2020 Covid-19 pandemic, the increase in social distancing made us rely on virtual meetings and conferences. The rise in restrictions caused more and more workplaces to convert in work from home and travel plans are halted for an extended period. A large number of users are likely experiencing online meetings and remote work via Zoom, Google Meet, and Microsoft Teams for the first time.\r\n\r\nNot everyone has a home office, many of us are comfortable with work from home, however, some of you are attending a video meeting in a messy bedroom, in a kitchen, in a room with your nasty roommates, in a backyard to stay away from the house disturbances. These places can be seen by all attendees in the video meeting when the video is enabled. If you don’t want your coworkers to see your home during a Zoom meeting, make use of the virtual backgrounds feature in the Zoom app.\r\n\r\nThe Zoom app offers virtual backgrounds that allow you to easily hide what’s behind you. The virtual backgrounds will help you to replace the background with something that looks good and distraction-free while being there in the video.', '', 'post-bg.jpg', '2020-06-08 01:53:16'),
(15, 'That error message shows that you are using Jinja2 as the template engine', 'That-error-message-shows-', 'Airports: The following airports  will be operable from 1 August in Sri Lanka:\r\n\r\nBandaranaike International Airport [BIA]\r\nColombo Ratmalana Airport [RMA] \r\nMattala Rajapaksa Hambantota Airport [MRIA]\r\n4. Choice of hotels: You will have to select from a hotel listed on the Sri Lanka tourism website. Independent professional audits will be done to certify accommodation providers, which will be listed on the Sri Lanka tourism website. Details of bookings made with certified accommodation providers are required for the visa application.\r\n\r\n5. Covid tests: You will have to get tested for coronavirus before you board the flight. A negative PCR test is required prior to boarding the flight and on arrival. The test should be no older than 72 hours before you board. The PCR test on arrival will be conducted free of charge.\r\n\r\n5. Sri Lanka’s quarantine rules: \r\n\r\nYou will be tested free of charge and there will be no quarantine unless you show symptoms. The results will take 24 hours initially. But the government says it’s working towards getting the results in 4-6 hours. If it takes 24 hours, you will be able to select a hotel for a one-night stay from a list of certified 4- or 5-star hotels in Colombo or Negombo until the test results are received.\r\nYou will be tested again after 4-5 days by a mobile unit at your hotel. ', '', '', '2020-06-08 12:14:51'),
(16, 'Generating a Single Random Number', 'Generating-a-Single-Rando', 'There is a need to generate random numbers when studying a model or behavior of a program for different range of values. Python can generate such random numbers by using the random module. In the below examples we will first see how to generate a single random number and then extend it to generate a list of random numbers.', '', '', '2020-06-08 12:17:30'),
(19, 'No benefit to reopening Taj Mahal right now, says Agra tourism industry', 'No-benefit-to-reopening-T', 'Agra\'s local tourism industry was waiting with bated breath for Union Minister of State (MoS) for Tourism and Culture, Prahlad Singh Patel to announce reopening of 820 monuments protected by the Archeological Survey of India (ASI). They were hopeful that the list of monuments would feature the Taj Mahal which has been closed for tourists since March 17, the longest closure of the monument in its 372 years.\r\n\r\nConfusion prevailed till Saturday evening when the notification finally arrived, permitting 820 protected monuments that have places of worship inside them to reopen.\r\n\r\nThe list does not mention the Taj Mahal or any other tourist-centric monument in Agra or elsewhere. It deals only with centrally protected monuments that have active places of worship. Although the Taj Mahal has a mosque where regular Namaz is conducted every Friday, the day itself is a weekly closure for the monument and will have no impact on tourism.\r\n\r\nReacting to the decision, Rajiv Tiwari, President of the Federation of Travel Associations said that opening the monuments at this time is not a well-thought-out decision that will have long-term repercussions for the entire country. Tiwari added that there was little hope that the tourism industry will recover from this blow by the beginning of the tourist season in September.\r\n\r\nFederation members said that if everything becomes normal, the industry will take a couple of years to recover. Right now, there is a need for giving some much-needed push to this industry through relief packages as the tourism industry has a GDP contribution of 9.2 per cent and provides employment to over 4 crore people, they added.', '', '', '2020-06-08 12:20:50'),
(22, 'Here are UNWTO\'s global guidelines to help restart tourism', 'Here-are-UNWTO\'s-global-g', 'str(random.randint(1000,100000))', '', '', '2020-06-08 12:22:57'),
(25, '5 Waterfalls Near Ranchi you must Visit this Monsoon', '5-Waterfalls-Near-Ranchi-you-must-Visit-this-Monsoon-85497', 'English humourist Terry Pratchett once quipped that waterfalls are good for five minutes before people begin to wonder if they could get coffee nearby. Well, we don’t fully agree with him here. Waterfalls may not lure everyone but we can’t dismiss the fact that seeing one almost always garners a primal reaction. By the time, we’d be venturing out to travel post the lockdown (keeping our fingers crossed), the monsoon will be here in full swing. Waterfalls and monsoons are a match made in heaven.\r\n\r\nAnd when we talk about waterfalls, we can’t forget the sylvan state of Jharkhand. Embarking on a waterfall trail in Jharkhand will take you through unsullied forests, while also introducing you to gorgeous back-to-nature tribal habitats. Here are five waterfalls near Ranchi, that must be on your monsoon bucket list.', '', '', '2020-06-08 12:26:51'),
(35, 'Movie Review', 'Movie-Review-68389', '<p>What\'s happening in the <em>world</em>?</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', '', '', '2020-06-09 23:53:39'),
(36, 'You\'re ready to dream big', 'You\'re-ready-to-dream-big-76664', 'The docs are a great resource for those who want to add custom configurations, learn more about our integrations, or want to find out more about TinyMCE. Take a look at the Introduction & Getting Started section as a next step.', '', '', '2020-06-09 23:59:34'),
(37, 'Crazy new life', 'Crazy-new-life-91995', 'IDK what am I doing!', '', '', '2020-06-11 00:07:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
