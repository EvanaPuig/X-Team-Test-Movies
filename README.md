#  X-Team Test Movies App

An example app for X-Team to see my coding style

## Installation

## App Architecture
This app was created with MVVM(Model View View Model) architecture and has the following layers:
- Model: Those are the objects related to MovieDB objects, they were created as plain objects, and will be gotten through AlamoFire.
- Services: This is a layer that could also be considered as part of the model, it is managed with Alamofire as mentioned in the previous point, it has two helper classes: Reach and API Manager. Each of the services also has its own protocol. It also has parsers for each of the services which are managed by SwiftyJSON.
- View Model: This is the layer for processing the API Data, with the objective to send them to the view with all the necessary customization so that the view only shows the data.
- View: This is composed of the View Controllers (although in some architectures ViewControllers are part of the ViewModel), and the View itself which is a Storyboard.
