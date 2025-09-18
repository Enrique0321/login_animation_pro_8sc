## 🐻 Bear login animation 

## 🏹 Explanation of application functionalities

In the first part, a login is demonstrated where it has different functionalities in the part of the bear animation.

## 🐻 Bear Animation Features 

The bear gets sad when we enter incorrect credentials.

If we enter valid credentials, the bear will become happy.

As we can see, the animation shows if we enter our button in the password field, the bear's animation is covering its eyes. This contributes to the security we would have.

In the email field, if we start typing, the bear continues reading with its eyes, and if we stop typing, the bear returns to its normal viewing mode.

## 📂 Main Files  
- lib/main.dart → Entry point of the app.  
- lib/screens/login_screen.dart → Login screen with animation and interaction.  
- assets/animated_login_character.riv → Rive bear animation file.  
- pubspec.yaml → Dependencies and asset configuration.  

## ⚙ Technologies and Tools  
- [Flutter](https://flutter.dev/)  
- [Dart](https://dart.dev/)  
- [Visual Studio Code](https://code.visualstudio.com/)  

## 🚀 How to Run the Project  
1. Clone this repository:  
   
   git clone https://github.com/Enrique0321/login_animation_pro_8sc.git 
2. Navigate to the project folder:

- cd login_animation_pro_8sc


3. Install dependencies:

- flutter pub get


4. Run the application:

- flutter run

## 📝 Code Details

- The email TextField activates the eye animation to follow the typed text.

- The password TextField activates the hands covering the eyes animation.

- The Login button triggers:

- trigSuccess → if the email and password are correct (osopech@gmail.com / 12345).

- trigFail → if either the email or password is incorrect.

- debounce timer is used to detect when the user stops typing and update the animation.

## 👨‍🏫 Teacher 

RODRIGO FIDEL GAXIOLA SOSA 

## 📝 Subject name

Mobile application programming

## ✅ Credits 

[Rive](https://rive.app/) → [Interactive bear animation CREDITS](https://rive.app/marketplace/3645-7621-remix-of-login-machine/) 

## 🎯 Demo login 

![Demo de la app](/Vídeo%20sin%20título%20‐%20Hecho%20con%20Clipchamp.gif)




