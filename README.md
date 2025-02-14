# ZWallet - iOS Swift with Viper Architecture
ZWallet is a mobile banking application designed for transactional activities. This application can make all transactions easier, faster, more practical, and safer
<p align="center">
  <img src ="Documentation/Logo.png" width="250px">
</p>

## Tech in Use
- Swift 5 & Xcode 12.4
- JWT (JSON Web Token)
- VIPER
- Cocoapods

## Dependencies in Use
- Kingfisher
- Moya
- Netfox
- OTPFieldView
- NVActivityIndicatorView

## Screenshots
<p align="center">
<img src ="Documentation/Login.png" width="250px"> <img src ="Documentation/Home.png" width="250px"> <img src ="Documentation/Top%20Up.png" width="250px">
<img src ="Documentation/Receiver.png" width="250px"> <img src ="Documentation/Transaction%20(Input%20Amount).png" width="250px"> <img src ="Documentation/Transaction%20Confirm.png" width="250px">
<img src ="Documentation/Transaction%20Details%20(Success).png" width="250px"> <img src ="Documentation/History%20(In).png" width="250px"> <img src ="Documentation/History%20(Out).png" width="250px">
</p>

## How To Install
1. Clone the repository using this command line in terminal
```$ git clone https://gitlab.com/kamil_mistar/zwallet```
2. Dependencies manager in this project using [Cocoapods](https://cocoapods.org), so you should install cocoapods first and run in the terminal at the folder where cloned 
  ```
  $ cd App
  $ pod install 
  ```
4. Last but not least, open ZWallet.xcworkspace using XCODE
5. RUN the project and you finally can use the project

## Usage
* **View**

  View is a user interface display that contains object components that can be seen or interacted with by the user
* **Protocol**

  A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol.
  
## VIPER
<p align="center">
  <img src="https://koenig-media.raywenderlich.com/uploads/2020/02/viper.png" height"100px">  
</p>

* **View**

  The __View__ is the user interface. This corresponds to a Swift ```View```

* **Interactor**

  The __Interactor__ is a class that mediates between the presenter and the data. It takes direction from the presenter.

* **Presenter**

  The __Presenter__ is the “traffic cop” of the architecture, directing data between the view and interactor, taking user actions and calling to router to move the user between views.

* **Entity**

  An __Entity__ represents application data.

* **Router**

  The __Router__ handles navigation between screens. That’s different than it is in SwiftUI, where the view shows any new views.
