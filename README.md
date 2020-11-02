# Trivia App

# Introduction: 
Hello! My name is Eloho Obaro-Best but you can call me EJ. I found out about this oppurtunity when I woke up this morning and I knew that I had to toss my hat in the ring! I decided to complete this challenge in swift using XCode because I figured that a mobile app would be a great way to have fun with some trivia. That being said, I'd like to move on to discuss issues, complexity and reach features for the future. Thank you for taking time to view my Trivia iOS Mobile App! 

# How To Run:
Interface: XCode 12.1
Language: Swift 5.1
Simulator Type: iPhone 11


Download code from github. Using XCode, simply press cmd+r to run app simulation.

# Code Breakdown:

[*1. Loading Trivia Questions from given JSON file*]

 -Swift has a built in extension called 'Codable' which allows you to break down JSON files into codable variables. Using that, I created variables that matched the JSON format \n
 -After that, I safetly load in the JSON file content into an Array, catching any error that may occur. If said error exists, an error message is returned to console and the app safely exits.
 
[*2. Displaying Trivia Game*]

-Once the trivia is started I display a random trivia question with its choice opens in a table below

-To select an answer a user can simply tap on the choice they believe is correct. This gesture also locks in their answer

-If selected answer is incorrect, an error message with the correct answer is shown. Else, we move on to the next question.

-This goes on for about 10 questions total and then finally the endOfGameScreen displays their final score with the option to go back to the home screen or view the scoreboard*

# Reach Goals:
[*1. Scoreboard*]


-Currently the Scoreboard button doesnt do anything due to lack of time, however...

-...I would use XCode's coredata to store player's username and scores

-With cd I would also implent a tableView that holds the top scorers in a scoreboard

-An even bigger reach would be to implent a firebase back end to hold all of this information, in cases which a large amount of people are using my Trivia app

-This would improve the space time complexity

[*2.Realtime Score*]


-In thinking like a user, I would want to be able to see my score as play along

-I would implement a label that updates the score with every question asked 

*Training Features*

-I would have loved to features that would help the user improve on their trivia skills. Including;

    a)levels: if the user gets a certain percantage of questions correct, they can level up. Which would include a second round of questions with some sort of increased difficulty. ie harder questions or
    
    b)Timer: rather than giving the user an infinite amount of time, I would have loved to implement a timer feature that would add pressure onto the user and give the app more of a game-like feel. This time could decrease while difficulty level increases
    
# Testing:

# Conclusion:

 -I had an incredible time working on this challenge and I look forward to making the reach goals come to life. If this is what I can do in less than 24 hours, wait till you see how much I can do and grow through this oppurtunity. I look forward to hearing from you all soon :) !
