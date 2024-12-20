import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_app/constants.dart';
import 'package:flash_chat_app/screens/chat_screen.dart';
import 'package:flash_chat_app/widgets/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _email;
  String? _password;
  bool login = false;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: login,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    transitionOnUserGestures: true,
                    child: Container(
                      height: 200.0,
                      child: Image.asset('lib/images/logo.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    _email = value;
                  },
                  decoration: kTextFieldInputDecoration.copyWith(
                      hintText: 'Enter your email'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  obscureText: true,
                  onChanged: (value) {
                    _password = value;
                  },
                  decoration: kTextFieldInputDecoration.copyWith(
                      hintText: 'Enter your password'),
                ),
                SizedBox(
                  height: 24.0,
                ),
                CustomButton(
                    onPressed: () async{
                      setState(() {
                          login = true;
                        });
                      try{
                        final  user = await _auth.signInWithEmailAndPassword(email: _email!, password: _password!);
                        
                        if(user != null){
                          Navigator.pushNamed(context, ChatScreen.id);
                        }
                      }catch(e){
                        print(e);
                      }
                      setState(() {
                        login = false;
                      });
                    },
                    text: 'Log in',
                    color: Colors.lightBlueAccent),
              ]),
        ),
      ),
    );
  }
}
