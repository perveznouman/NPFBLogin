# NPFBLogin

This Project explains how to get user data from Facebook Login using swift 4.

# Getting Started

Download this project.

Create your project in Facebook's developer site (https://developers.facebook.com/docs/ios/getting-started || https://developers.facebook.com/docs/facebook-login/ios#)

Configure your plist (replace you **FacebookAppID** && **URL types** )

Then install pods from terminal

  ```
    $ sudo gem install cocoapods
    $ pod init
  ```
  
 In your podfile
 ```
    $ pod 'FBSDKLoginKit'
    $ pod 'FacebookCore'
    $ pod 'FacebookLogin'
    $ pod 'FacebookShare'
  ``` 
  In terminal
  ```
    $ pod install
  ```
    
 You can run the .xcworkspace project now.
 You will get your data in `parseObj` object in `parsingCompleted(_ parseObj: NPFBParser)`delegate method.
 
 # Finally
 You can set set up pods and drag and drop `NPFBParser` class in your project and confirm to the `NPFBParserDelegate` protocol.You will get your response data in your `ViewController`.
 
 Thank you for referring. You can always suggest me if we can we do the things in a better way (perveznouman@gmail.com).

# Authors

Nouman Pervez - Initial work - NPFBLogin

# License

This project is licensed under the MIT License - see the LICENSE.md file for details
