# A/B Test Name: Signup/Sign In 1 or 2 screens
## User Story Number: 
Is a task under US1 (Account Creation)

## Metrics: 
Adoption

## Hypothesis: 
- The problem we are trying to solve is how we can best reach our customers to download and register for our app
- For our customers, if we have an app that is difficult to register an account for it could deter customers form wanting to use our product before they get started
- To elaborate, customers may get frustrated when there are too many pages and forums to create an account
- For our main focus we are attempting to figure out how many screens are needed to best reach our customers to increase our adoption rate
- For our hypothesis we can make a snack bar/pop up page to have the users chose their preferences versus having it on a seperate page

## Experiment: 
We will have half of our users have access to the pop up page and half of our users have access to the seperate page for user preferences. This way we will be able to track our adoption rate between the two groups. With our Firebase analytics we will be able to track how many users use our app versus how many users actually create an account to increase our adoption rate.

## Variations: 
One variation will be our app with a separate page for user preferences (which kinds of cards they are intersted in) versus a pop up page with those same preferences. 


# A/B Test Name: API Search directly calling or having a cloud function on our firebase that will store its own verson of the json and send that to the users device

## User Story Number: 
Is a task under USR 5: API Setup

## Metrics: 
response/ load time for searaching for cards

## Hypothesis: 
- The problem we are trying to solve is how we can best to get the information about the cards that the user searches for in a fast reliable way 
- For our customers, if we have an app that is difficult to register an account for it could deter customers form wanting to use our product before they get started
- To elaborate, customers may get frustrated when there are too many pages and forums to create an account
- For our main focus we are attempting to figure out how many screens are needed to best reach our customers to increase our adoption rate
- For our hypothesis we can make a snack bar/pop up page to have the users chose their preferences versus having it on a seperate page

## Experiment: 
We will have half of our users have access to the api being called by the user, and the other half will have the json for all off the cards as returned by the cloud function saved on device. And we will have the back end of the app send back how long it took for the card results to show up

## Variations: 
One variation will be our app will directly call the api and the other will consult the json that it has saved locally
