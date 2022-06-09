getwd()

batting <- read.csv('Batting.csv')

head(batting)

str(batting)

head(batting$AB, 6)

head(batting$X2B ,)

batting$BA <- batting$H / batting$AB

tail(batting$BA,5)


batting$OBP = (batting$H+batting$BB+batting$HBP) / 
  (batting$AB+batting$BB+batting$HBP+batting$SF)
#1B = H-2B-3B-HR
m <- batting$H-batting$X2B-batting$X3B-batting$HR

m
batting$SLG= (batting$H-batting$X2B-batting$X3B-batting$HR)
+(2 * batting$X2B) +(3 * batting$X3B) + (4*batting$HR)  / batting$AB

str(batting)


sal <- read.csv("Salaries.csv")

library()
summary(batting)

str(sal)

min(sal$yearID)
?subset()
batting <- subset(batting , yearID > 1984 , )
summary(batting)

?merge()

combo <- merge(batting , sal , by = c('playerID' , 'yearID'))

summary(combo)

lost_player <- subset(combo , playerID == 'damonjo01'| playerID == 'giambja01' | playerID == 'saenzol01' , )

lost_player <- subset(lost_player , yearID==2001)

lost_player

lost_player <- lost_player[ , c("playerID", 'H', 'X2B','X3B','HR','OBP','SLG','BA','AB')]

library(dplyr)
?arrange()

arrange(combo)

avail.players <- filter(combo , yearID == 2001)

library(ggplot2)

ggplot(avail.players , aes(OBP , salary))+ geom_point()

avail.players <- filter (avail.players , salary<8000000 , OBP>0)

avail.players <- filter(avail.players , AB>=500)
possible <- head (arrange(avail.players , desc(OBP), 10))

possible <- possible[,c('playerID', 'OBP','AB','salary')]

possible

possible[2:4, ]

getwd()
