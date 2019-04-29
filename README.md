# Learn RPG

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview

### Sprint 3
<img src="https://github.com/cst495-teamceg/cst495-FinalProject/blob/master/v3.gif" width=200>

### Sprint 2
<img src="https://github.com/cst495-teamceg/cst495-FinalProject/blob/master/v2.png" width=200>


### Sprint 1
<img src="https://github.com/cst495-teamceg/cst495-FinalProject/blob/master/v2.gif" width=200>


### Description
Gamify learning like Khan Academy. Reward user with xp per article they've read. 

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Educational
- **Mobile:** This app will be completely mobile. All features are viable to develope for non-mobile devices. However developement for non-mobile devices seems unnecesary.
- **Story:** Provides users with random educational content, from which they will gain xp points the more they complete. The user will be able to level up the more xp they gain and will recieve "rewards" accordingly.
- **Market:** The market for this app is any and everyone intersted in a fun and interactive way of learning.
- **Habit:** Users can use this app as frequently as desired. Potential daily login bonuses as incentive to be more active.
- **Scope:** We would begin with an app that rewards user for reading articles and level up. Afterwards, we may develop a feature for them to play with friends. 

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [ ] User is able to create an account
- [x] User is able to log in to their account to see their stats
- [x] Each user has a profile page where they can see their level, accomplishments, etc.
- [ ] User is awarded xp points and other rewards when certain milestones are reached

**Optional Nice-to-have Stories**

- [ ] User can select general topics they're intersted in
- [ ] Specific user-curated articles and content 

### 2. Screen Archetypes

* Login
   * Allows the user to enter the username/password if already signed-up
   * Otherwise it provides a button to sign-up
* Sign-up
   * Allows user to create a new account
* Home
   * Displays several topics for the user to choose from to learn about
* Content
   * Displays the article(content) for the user to read
* Profile
   * Displays the user associated information and statistics(i.e. level, trophies, etc.)

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Current Content
* Home
* Profile

**Flow Navigation** (Screen to Screen)

* Login -> Sign-up screen if log in is not possible
* Home -> Content
* Home -> Profile

## Wireframes
<img src="https://i.imgur.com/V6HdTBw.jpg" width=200>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype
<img src="https://i.imgur.com/J8pbLLz.gif" width=200>


## Schema 
### Models
#### Articles
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | articleId      | String   | unique id for the article (default field) |
   | authorId      | String   |  id of user who submited the article |
   | articleText      | String   | text of article |
   | createdAt      | dateTime   | timestamp of when article added |
   | updatedAt      | dateTime   | timestamp of when article last updated |
   | articleTags      | list   | tags/category of article |
#### Ratings
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | ratingId      | String   | unique id for the rating (default field) |
   | articleId      | String   | id for the article  |
   | userId      | String   | id for the user  |
   | rating      | Number   | rating for article  | 
#### Users
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | userId      | String   | unique id for the user (default field) |
   | joinedAt      | dateTime   | timestamp of when user created |
   | level      | number   | level of user |
   | xp      | number   | experience points of user |
   | items      | list   | items owned by user |
   | articlesRead      | list   | articles read by user (list of ids) |
   | userImage      | Image   | image of user |
#### Items
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | itemId      | String   | unique id for the item (default field) |   
   | itemDescription      | String   | description of item |
   | itemFeature      | String   | description of feature |
   | itemImage      | Image   | image of item |
   
### Networking
   - Login Screen
      - (GET) Check if credentials are correct
         ```swift
            ...
         ```
   - Register Screen
      - (GET/POST) Create new user if not already exist
         ```swift
            ...
         ```
   - Articles View Screen
      - (GET) List all articles
         ```swift
            ...
         ```
   - Current Article Screen
      - (GET) Display selected article content
         ```swift
            ...
         ```
   -  Article Read
      - (PUT) Add article to users list of articles read and reward xp
         ```swift
            ...
         ```
   -  Article Created
      - (POST) Add article to submitted articles queue
         ```swift
            ...
         ```
   -  Rate Article
      - (PUT) Add rating of article
         ```swift
            ...
         ```
