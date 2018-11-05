##mac sievert
##exercise 8

rm(list=ls())
setwd('')##set working directory
data=read.table('UWvMSU_1-22-13.txt', header=T)

#1. plot game score
MSUpoints = 0 #set running total points for each team
UWpoints = 0
data$teamtotal = NA #add total points column to dataframe

##go through rows in data and add up the points for each team after each basket
##add the total to each row
for (i in 1:nrow(data)){
  if(data$team[i]=='MSU'){
    MSUpoints= MSUpoints + data$score[i]
    data$teamtotal[i] = MSUpoints  
  }else{
    UWpoints= UWpoints + data$score[i]
    data$teamtotal[i] = UWpoints  
  }
}

#subset the data to be team specific
MSU=(subset(data, team == 'MSU'))
UW=(subset(data, team == 'UW'))

#plot the score for each team verse time
plot(x=MSU$time, y=MSU$teamtotal, col='green', type='l', lwd=2, 
     main='MSU vs. UW', xlab='Time', 
     ylab='Total Team Points')
lines(x=UW$time, y=UW$teamtotal, col='red', lwd=2)

#2. game function
game = function(){
guess = readline(prompt="guess a number between 1 & 100---> ")#get user first guess
number = sample(1:100, 1, replace = T)##set random number
#print(number) ##for testing
  while (guess != number){
    if (guess > number){
      guess = readline(prompt="guess lower---> ")#get user guess
    } else if (guess < number){
        guess = readline(prompt="guess higher---> ")#get user guess
    }
  }
print('correct!!!')
}
game()#call game function
