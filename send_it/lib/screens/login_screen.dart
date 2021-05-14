import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:send_it/components/rounded_button.dart';
import 'package:send_it/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:send_it/screens/chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  var _username;
  var _password;
  bool showProgressSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1ABB9C),
      body: ModalProgressHUD(
        inAsyncCall: showProgressSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  child: Image.asset('images/ic_logo_plane.png'),
                  height: 100.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: SizedBox(
                  height: 48.0,
                ),
              ),
              TextField(
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  _username = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'E-mail'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    _password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: "Password",
                  )),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Login',
                color: Colors.lightBlueAccent,
                onPressed: () async {
                  setState(() {
                    showProgressSpinner = true;
                  });
                  try {
                    final userLogin = await _auth.signInWithEmailAndPassword(
                        email: _username, password: _password);
                    if (userLogin != null) {
                      setState(() {
                        showProgressSpinner = false;
                      });
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
