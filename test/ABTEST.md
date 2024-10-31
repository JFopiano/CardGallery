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



# A/B Test: Placement of Add Card button

## User Story 
US4: Golden Path

## Metrics 
Engagement (button presses, click-through rate)

##
- How can we ensure the UI is user-friendly and has important functions at a comfortable and accessible location?
- Our customers may value the feel of the app and want a UI with button placements that are quick to access and equally non-intrusive.
- If important buttons and icons are in places that may hinder or inconvenience the experience, they may be turned away.
- For example, if an important function such as adding a card to their collection, arguably the most crucial feature of the site, is accessed from an awkward button location, the app may be unsatisfying or frustrating to use.
- We want to determine an optimal placement for this critical function's button to ensure the UX is smooth and comfortable.

## Hypothesis 
Putting the Add Card button directly on the page as opposed to an option on the bottom navbar would more strongly encourage adding cards and further interacting with the app.

## Experiment 
We will measure the number of times the Add Card button is clicked as well as the click-through rate of the process of adding cards to the user's collection. 50% of users will see the Add Card button on the bottom navbar, and the other half will see an Icon button in the corner of the screen which will remain "above" the contents of the page which will function as the Add Card button. We will create events for the Add Card button press as well as a successful card add via Google Analytics and compare how many times the events occurred.

## Variations
One variation will have the Add Card button on the bottom navbar and the other will have it as an Icon that is always present in the corner of the screen. 


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


# A/B Test Name: Preferences shown in Bio or not

## User Stroy Number:
Number 25: Preferences shown in Bio or not

## Hypothesis:
- The problem we are trying to solve is should the card preferences be displayed in the bio or not
- For our customers, it might be optimal to have peoples preferences that they select on the register page to be displayed in their bio apart from what they can enter into after as a way to quickly find others who have the same preferences in their bio
- To elaborate, customers may not be able to connect with people as easily if they don’t know other peoples preferences
- For our main focus we will have the option to add preferences to the bio
- For our hypothesis we can make preferences show up as a selectable hashtag

## Experipemnt: 
We will have half of our users have access to show preferences in their bios, and have another group who cannot show the preferences in their bio, and see who is able to connect with more people of the same card preferences.

## Variations:
One variation will be our app show the preferences as hashtags.
