# Tonal Coding Challenge

## Main File Structure
 **main.dart** 
Entrypoint to the app 

 **models** 
Contains data model for the metrics widget

**widgets** 
Reusable widgets that take in parameters to render the visual elements 

## State Management
### Provider
I chose to use provider in order to pass data and keep the UI seperated from the business logic. In order to allow each metric widget to be updated individually, I created three classes with their own Change Notifier, allowing the UI to update when individual values are changed