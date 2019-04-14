# TripStop

## Table of Contents
  * [App Design](#App-design)
    * [Objective](#Objective)
    * [Audience](#Audience)
    * [User Experience](#user-experience)
  * [Technical](#technical)
    * [Screens](#Screens)
    * [External services](#external-services)
    * [Views, View Controllers, and other Classes](#Views-View-Controllers-and-other-Classes)

---

### Objective

The goal for this project is to build an iOS app that allows users to plan trips. Users can create trips and trips are defined by a collection of waypoints. Waypoints are represented by a geographic coordinate and a name. Users should be able to create, delete and modify trips.


### User Experience

#### Action 1 -   

When the user boots up the app, the will see a list of trips they have created

#### Action 2 - 

When the user clicks on a trip, they will see all the waypoints associated with the trip.

#### Action 3 - 
When the user clicks on "+", they can add a way point by choosing a location in the map.

[Back to top ^](#)

---

### Technologies

#### Client Side
* Swift 5
* Xcode
* CoreData
* CoreLocation
* Keychain
* UserDefaults
* Google Place API

#### Server Side
* Javascript
* NodeJS
* Express 
* MongoDB
* JWT

### External services
List which APIs or external services will your app use?

* Google Places API - to get the name of a given coordinates.


### Views, View Controllers, and other Classes
  
* **View Controllers**
    
  * HomePageViewController
  * TripDetailViewController
  * AddTripViewController
  * AddWayPointViewController
  

### Data models

list all data models your app will need
* User
    * First name
    * Last name
    * Email Address
    
* Trip
    * Name
    * Waypoints
    
* Waypoint
    * Name
    * Coordinates

### Services
* User Service
    * Create
    * Read
    * Update
    * Delete

* Trip Service
    * Create
    * Read
    * Update
    * Delete
    
* Waypoint Services 
    * Create
    * Read
    * Update
    * Delete



