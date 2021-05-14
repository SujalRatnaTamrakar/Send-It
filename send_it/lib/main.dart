import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:send_it/screens/welcome_screen.dart';
import 'package:send_it/screens/login_screen.dart';
import 'package:send_it/screens/registration_screen.dart';
import 'package:send_it/screens/chat_screen.dart';

//https://github.com/SujalRatnaTamrakar

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SendIt());
}

class SendIt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
