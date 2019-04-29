# TripStop

### Objective

The goal for this project is to build an iOS app that allows users to plan trips. Users can create trips and trips are defined by a collection of waypoints. Waypoints are represented by a geographic coordinate and a name. Users should be able to create, delete and modify trips.

### Goals

* Understand and apply different client side caching systems.
* Learn more about the UIKIT framework(Search bar, tab bar, etc..)
* Code cleaness with SwiftLint.
* Custom backend to build a fullstack ios app.

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



