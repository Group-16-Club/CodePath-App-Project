Original App Design Project
===

# Parking Finder

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
The app shows users nearby parking options, and displays information to the user.

### App Evaluation
- **Category:** Map display, Location
- **Mobile:** Interactive, displays a map with pins
- **Story:** Allows users to see nearby parking according to their location. 
- **Market:** Anyone who uses a car, bike, or motorcycle can find use for this app. Especially those in cities that lack parking.
- **Habit:** Users can often check the app whenever they need parking, especially if they travel a lot throughout the day.
- **Scope:** Start off with displaying parking areas with information, but perhaps expand to users being able to rate the spaces.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can view a map and interact with a map
* User can log in or sign up
* User can view information on parking spaces
* User can favorite a parking space

**Optional Nice-to-have Stories**

* User can leave reviews on parking spaces

### 2. Screen Archetypes

* Launch Screen
   * User sees launch screen with app name and logo
* Map Display Screen
   * User can view a map and interact with a map
* Log-In/Sign-Up Screen
   * User can log in or sign up 
* Parking Details Screen
   * User can view information on parking spaces
* Profile Screen
   * User can view their favorited parking spaces
   * User can log out

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Map Display (Discover)
* User Profile (Me)

**Flow Navigation** (Screen to Screen)

* Launch Screen
  * Log-In Screen
* Log-In Screen
   * Map Display
* Map Display
   * Parking Details
   * Profile
* Profile
   * Parking Details
   * Log-out -> Log-In Screen
* Parking Details
   * Map Display
   * Profile

## Wireframes
<img src="https://github.com/Group-16-Club/CodePath-App-Project/blob/main/Parking%20Finder%20Wireframe.jpg" width=600>


### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
Parking Details
|Property   |Type   |Description            |
|-----------|-------|-----------------------|
|name       |String |name of parking lot    |
|address    |JSON object|address where the parking lot is located|
|numOfAvailabeSpaces|Number|number of available spots|
|rateDetails|Array of Strings|a list of information regarding price rates|
|typeOfParking|String|the type of parking lot|
|timingDetails|Array of Strings|a list of information regarding hours of operation|
|isOpen|Boolean|an indication of whether the parking lot is currently open|
|reviews|Array of Review Objects|list of reviews of the parking space given by users|

User
|Property   |Type   |Description            |
|-----------|-------|-----------------------|
|name|String|user’s first and last name|
|username|String|user’s chosen username|
|email|String|user’s registered email|
|password|String|user’s chosen password|
|savedParkingLocations|Array of Parking Details Objects|a list of parking locations favorited by the user|
|review|Array of Review Objects|an array of reviews composed by the user| 
|profilePic|image|a profile picture chosen by user|

Reviews
|Property   |Type   |Description            |
|-----------|-------|-----------------------|
|author|string|the user who wrote the review|
|timePosted| DateTime|the date and time the review was posted by the user|
|rating|Integer|an integer between 1-5 given as rating by the user|
|text|String|the body of the review|

### Networking
* Log-In Screen
  * (Read/GET) Query user object -> for logging in
  * (Create/POST) Create user object and add to data base -> for signing up
* Profile Screen
  * (Read/GET) Query logged in user object
  * (Update/PUT) Update user profile image
* Parking Details Screen
  * (Update/PUT) Update favorite status
  * (Create/POST) Create a new review post object
  * (Read/GET) Query all review objects


- [Create basic snippets for each Parse network request]



- [OPTIONAL: List endpoints if using existing API such as Yelp]
Base URL - https://api.spothero.com/v2

|HTTP Verb   |Endpoint   |Description            |
|------------|-----------|-----------------------|
|GET|/facilities/{facility_id}|Gets detailed information about a given facility|
|GET|/facilities|Gets summaries of multiple facilities within a specified distance|
