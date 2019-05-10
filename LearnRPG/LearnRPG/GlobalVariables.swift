//
//  GlobalVariables.swift
//  LearnRPG
//
//  Created by g on 4/29/19.
//  Copyright © 2019 cst495. All rights reserved.
//

import Foundation
import Alamofire

struct Article {
    var title: String
    var content: String
}

class GlobalVariables {
    //statics
    lazy var BASE_URL = "http://iphone.devsofthewest.com/"
    lazy var GET_ALL_USERS = BASE_URL + "user/getAll"
    lazy var GET_USER = BASE_URL + "user/get/"
    lazy var AUTH_USER = BASE_URL + "user/authenticate"
    lazy var LEVEL1_THRESHHOLD = 20
    lazy var LEVEL2_THRESHHOLD = 30
    lazy var LEVEL3_THRESHHOLD = 40
    
    //members
    private var username: String
    private var passId: Int
    private var xp: Int
    private var level: Int
    private var classId: Int
    private var readArticles: [Int]
    public var articles: [Article]

    //Default Constructor
    init(){
        self.username = "test"
        self.passId = -1
        self.xp = 0
        self.level = 0
        self.classId = 0
        self.readArticles = []
        self.articles = []
        self.seedArticles()
    }
    
    //OverloadedConstructor
    func setUser(newUsername: String, newPassId: Int, newClassId: Int){
        self.username = newUsername
        self.passId = newPassId
        self.xp = 0
        self.level = 1
        self.classId = newClassId
        self.readArticles = []
        self.articles = []
        self.seedArticles()
    }
    
    //Getters and Setters
    func getUsername() -> String {
        return username
    }
    func setUsername(newUsername: String){
        self.username = newUsername
    }
    func getPassId() -> Int {
        return passId
    }
    func setPassId(newPassId: Int) {
        self.passId = newPassId
    }
    func getXp() -> Int {
        return xp
    }
    func resetXp() {
        self.xp = 0
    }
    func addXp(addXp: Int) {
        self.xp += addXp
    }
    func getLevel() -> Int {
        return level
    }
    func addLevel() {
        self.level += 1
    }
    func getClassId() -> Int {
        return classId
    }
    func setClassId(newClassId: Int) {
        self.classId = newClassId
    }
    func getReadArticles() -> [Int] {
        return readArticles
    }
    func addReadArticle(articleNum: Int) {
        readArticles.append(articleNum)
    }
    

    func deleteArticleByTitle(removeTitle: String) {
        self.articles.removeAll { $0.title.contains(removeTitle) }
    }
    
    //Member functions
    func levelUp(){
        //do something
        print("Leveled Up!!!")
        self.addLevel();
    }
    
    func checkIfLeveledUp() -> Bool {
        let curLevel: Int = self.level
        switch curLevel {
            case 1:
                if (self.getXp() > LEVEL1_THRESHHOLD){
                    self.addLevel()
                    self.resetXp()
                    return true
                } else {
                   return false
                }
            case 2:
                if (self.getXp() > LEVEL2_THRESHHOLD){
                    self.addLevel()
                    self.resetXp()
                    return true
                } else {
                    return false
                }
            case 3:
                if (self.getXp() > LEVEL1_THRESHHOLD){
                    self.addLevel()
                    self.resetXp()
                    return true
                } else {
                    return false
                }
            default:
                return false
        }
    }
    
    private func seedArticles() {
        self.articles.append(Article(title: "Apollo 12", content:"Apollo 12 was the sixth manned flight in the United States Apollo program and the second to land on the Moon. It was launched on November 14, 1969, from the Kennedy Space Center, Florida, four months after Apollo 11. Commander Charles 'Pete' Conrad and Lunar Module Pilot Alan L. Bean performed just over one day and seven hours of lunar surface activity while Command Module Pilot Richard F. Gordon remained in lunar orbit. The landing site for the mission was located in the southeastern portion of the Ocean of Storms.\nUnlike the first landing on Apollo 11, Conrad and Bean achieved a precise landing at their expected location, the site of the Surveyor 3 unmanned probe, which had landed on April 20, 1967. They carried the first color television camera to the lunar surface on an Apollo flight, but transmission was lost after Bean accidentally destroyed the camera by pointing it at the Sun. On one of two moonwalks, they visited the Surveyor and removed some parts for return to Earth. The mission ended on November 24 with a successful splashdown."))
        self.articles.append(Article(title: "Hurricane Dora (1999)", content:"Hurricane Dora was one of few tropical cyclones to track across all three north Pacific basins and the first since Hurricane John in 1994. The fourth named storm, third hurricane, and second major hurricane of the 1999 Pacific hurricane season,[nb 1] Dora developed on August 6 from a tropical wave to the south of Mexico. Forming as a tropical depression, the system gradually strengthened and was upgraded to Tropical Storm Dora later that day. Thereafter Dora began heading in a steadily westward direction, before becoming a hurricane on August 8. Amid warm sea surface temperatures and low wind shear, the storm continued to intensify, eventually peaking as a 140 mph (220 km/h) Category 4 hurricane on August 12.Thereafter, Dora fluctuated significantly in intensity due to changes in water temperatures and wind shear, with the storm ranging from peak intensity as a Category 4 hurricane to a low-end Category 1 hurricane over a period of four days. While passing well south of the island of Hawaii on August 16, Dora briefly regained major hurricane status. On August 18, the cyclone passed just south of Johnston Atoll as a Category 1 hurricane. Although it never made landfall, Dora produced high surf, gale-force winds, and light rain across the islands of Hawaii and Johnston Atoll, but resulted in minimal damage. While crossing the International Dateline on August 20, Dora weakened to a tropical storm. After weakening to a tropical depression on August 22, Dora dissipated on August 23 while centered several hundred miles north of Wake Island."))
                self.articles.append(Article(title: "Periscope (arcade game)", content:"Periscope is an electromechanical shooting gallery arcade game. Two different companies independently developed and released the game: Nakamura Manufacturing Co. (initially as Torpedo Launcher) and Sega Enterprises, Ltd. Masaya Nakamura claims it to be the first arcade game he built, with his company claiming a release in Japan as early as 1965. Sega's version of Periscope is the company's first produced arcade game, released in Japan in 1966.\r\nPeriscope popularized the US$0.25 cost per play of arcade games in the United States. Its success surprised Sega, leading to Sega's further manufacture of eight to ten new arcade games a year for the next few years. Periscope performed well in locations that would not have normally hosted coin-operated machines at the time, such as malls and department stores. The game's success has been referred to as a \"turning point\" in the industry.\r\nIn a 1977 interview, Masaya Nakamura of Nakamura Manufacturing Co., later known as Namco, claimed that Periscope is the first amusement device that he built. Namco states that its Japanese release of the game was in 1965. Initially known as Torpedo Launcher, the game is featured as Periscope in the April 1967 issue of Cashbox, with Nakamura offering direct import assistance to distributors. It has been speculated that the original version built by Namco may have been a custom model for department store rooftops, a year prior to the mass-produced model. It has also been speculated that Namco may have licensed the game to Sega; Nakamura stated that he did sell some of his games to competitors.\nAccording to former Sega CEO David Rosen, poor conditions in the US coin-op manufacturing market prompted the company's development of electromechanical games. His company, Rosen Enterprises, had just merged with Nihon Goraku Bussan to form Sega Enterprises, Ltd. the previous year, and both companies had engineers on staff.[2] Rosen sketched out the design of Periscope personally. Released in 1966, Sega's original release of the game is a three-player cabinet. Its original price per play of \\u00A530 is twice the price of earlier games. As the latest in the well-received genre of torpedo shooter games, Sega demonstrated it alongside such competition as slot machines, slot racing games, and pinball games at the 23rd London Amusement Trades Exhibition (A.T.E.) show in December and at the Hotel Equipment Exhibition in Paris in October 1967. The popular three-player cabinet drew in Fr500 (approximately US$100 then and equivalent to $795 in 2018) per day at the Paris show, which was sparsely attended. \r\nAt the time, Periscope's large cabinet was cost-prohibitive for international export, but its popularity among distributors flying in to see the game prompted Sega to develop a smaller model for the worldwide market."))
                self.articles.append(Article(title: "Edmund Hillary", content:"Sir Edmund Percival Hillary KG ONZ KBE (20 July 1919 – 11 January 2008) was a New Zealand mountaineer, explorer, and philanthropist. On 29 May 1953, Hillary and Nepalese Sherpa mountaineer Tenzing Norgay became the first climbers confirmed to have reached the summit of Mount Everest. They were part of the ninth British expedition to Everest, led by John Hunt. From 1985 to 1988 he served as New Zealand's High Commissioner to India and Bangladesh and concurrently as Ambassador to Nepal.Hillary became interested in mountaineering while in secondary school. He made his first major climb in 1939, reaching the summit of Mount Ollivier. He served in the Royal New Zealand Air Force as a navigator during World War II. Prior to the Everest expedition, Hillary had been part of the British reconnaissance expedition to the mountain in 1951 as well as an unsuccessful attempt to climb Cho Oyu in 1952. As part of the Commonwealth Trans-Antarctic Expedition he reached the South Pole overland in 1958. He subsequently reached the North Pole, making him the first person to reach both poles and summit Everest.Following his ascent of Everest, Hillary devoted himself to assisting the Sherpa people of Nepal through the Himalayan Trust, which he established. His efforts are credited with the construction of many schools and hospitals in Nepal. Hillary had numerous honours conferred upon him, including the Order of the Garter in 1995. Upon his death in 2008, he was given a state funeral in New Zealand."))
                self.articles.append(Article(title: "Demographics of Croatia", content:"The demographic characteristics of the population of Croatia are known through censuses, normally conducted in ten-year intervals and analysed by various statistical bureaus since the 1850s. The Croatian Bureau of Statistics has performed this task since the 1990s. The latest census in Croatia was performed in April 2011. The permanent population of Croatia at the 2011 census had reached 4.29 million. The population density is 75.8 inhabitants per square kilometre, and the overall life expectancy in Croatia at birth was 78 years in 2012.[1] The population rose steadily (with the exception of censuses taken following the two world wars) from 2.1 million in 1857 until 1991, when it peaked at 4.7 million. Since 1991, Croatia's death rate has continuously exceeded its birth rate; the natural growth rate of the population is negative. Croatia is in the fourth or fifth stage of the demographic transition. In terms of age structure, the population is dominated by the 15‑ to 64‑year‑old segment. The median age of the population is 41.4, and the gender ratio of the total population is 0.93 males per 1 female. The country is projected to lose 350,000 citizens by 2045.[2]Croatia is inhabited mostly by Croats (90.4%), while minorities include Serbs (4.36%), and 21 other ethnicities (less than 1% each). The demographic history of Croatia is marked by significant migrations, including the arrival of the Croats in the area growth of Hungarian and German speaking population since the union of Croatia and Hungary, and joining of the Habsburg Empire, migrations set off by Ottoman conquests and growth of Italian speaking population in Istria and in Dalmatia during Venetian rule there. After the collapse of Austria-Hungary, the Hungarian population declined, while the German-speaking population was forced or compelled to leave after World War II and similar fate was suffered by the Italian population. Late 19th century and the 20th century were marked by large scale economic migrations abroad. The 1940s and the 1950s in Yugoslavia were marked by internal migrations in Yugoslavia, as well as by urbanisation. The most recent significant migrations came as a result of the Croatian War of Independence when hundreds of thousands were displaced.The Croatian language is the official language, but minority languages are officially used in some local government units. Croatian is declared as the native language by 95.60% of the population. A 2009 survey revealed that 78% of Croatians claim knowledge of at least one foreign language—most often English. The main religions of Croatia are Roman Catholic (86.28%), Eastern Orthodoxy (4.44%) and Islam (1.47%). Literacy in Croatia stands at 98.1%. The proportion of the population aged 15 and over attaining academic degrees grew rapidly since 2001, doubling and reaching 16.7% by 2008. An estimated 4.5% of the GDP is spent for education. Primary and secondary education are available in Croatian and in languages of recognised minorities. Croatia has a universal health care system and in 2010, the nation spent 6.9% of its GDP on healthcare. Net monthly income in September 2011 averaged 5,397 kuna (c. 729 euro). The most significant sources of employment in 2008 were manufacturing industry, wholesale and retail trade and construction. In October 2011, unemployment rate was 17.4%. Croatia's median equivalent household income tops average Purchasing Power Standard of the ten countries which joined the EU in 2004, while trailing the EU average. 2011 census recorded a total of 1.5 million private households, which predominantly owned their own housing. Average urbanisation rate in Croatia stands at 56%, with augmentation of urban population and reduction of rural population."))
        
        self.articles.append(Article(title: "History of paleontology", content:"The history of paleontology traces the history of the effort to understand the history of life on Earth by studying the fossil record left behind by living organisms. Since it is concerned with understanding living organisms of the past, paleontology can be considered to be a field of biology, but its historical development has been closely tied to geology and the effort to understand the history of Earth itself.In ancient times, Xenophanes (570–480 BC), Herodotus (484–425 BC), Eratosthenes (276–194 BC), and Strabo (64 BC-24 AD) wrote about fossils of marine organisms, indicating that land was once under water. During the Middle Ages, fossils were discussed by Persian naturalist Ibn Sina (known as Avicenna in Europe) in The Book of Healing (1027), which proposed a theory of petrifying fluids that Albert of Saxony would elaborate on in the 14th century. The Chinese naturalist Shen Kuo (1031–1095) would propose a theory of climate change based on evidence from petrified bamboo.In early modern Europe, the systematic study of fossils emerged as an integral part of the changes in natural philosophy that occurred during the Age of Reason.[1] The nature of fossils and their relationship to life in the past became better understood during the 17th and 18th centuries, and at the end of the 18th century, the work of Georges Cuvier had ended a long running debate about the reality of extinction, leading to the emergence of paleontology- in association with comparative anatomy- as a scientific discipline. The expanding knowledge of the fossil record also played an increasing role in the development of geology, and stratigraphy in particular.In 1822, the word \"paleontology\" was used by the editor of a French scientific journal to refer to the study of ancient living organisms through fossils, and the first half of the 19th century saw geological and paleontological activity become increasingly well organized with the growth of geologic societies and museums and an increasing number of professional geologists and fossil specialists. This contributed to a rapid increase in knowledge about the history of life on Earth, and progress towards definition of the geologic time scale largely based on fossil evidence. As knowledge of life's history continued to improve, it became increasingly obvious that there had been some kind of successive order to the development of life. This would encourage early evolutionary theories on the transmutation of species.[2] After Charles Darwin published Origin of Species in 1859, much of the focus of paleontology shifted to understanding evolutionary paths, including human evolution, and evolutionary theory.[2]The last half of the 19th century saw a tremendous expansion in paleontological activity, especially in North America.[1] The trend continued in the 20th century with additional regions of the Earth being opened to systematic fossil collection, as demonstrated by a series of important discoveries in China near the end of the 20th century. Many transitional fossils have been discovered, and there is now considered to be abundant evidence of how all classes of vertebrates are related, much of it in the form of transitional fossils.[3] The last few decades of the 20th century saw a renewed interest in mass extinctions and their role in the evolution of life on Earth.[4] There was also a renewed interest in the Cambrian explosion that saw the development of the body plans of most animal phyla. The discovery of fossils of the Ediacaran biota and developments in paleobiology extended knowledge about the history of life back far before the Cambrian."))
        
    }
    
//    class User {
//        var username: String
//        var token: String
//        init(username: String, token: String) {
//            self.username = username
//            self.token = token
//        }
//        
//        
//    }

    
    // Here is how you would get to it without there being a global collision of variables.
    // , or in other words, it is a globally accessable parameter that is specific to the
    // class.
    class var sharedManager: GlobalVariables {
        struct Static {
            static let instance = GlobalVariables()
        }
        return Static.instance
    }
}
