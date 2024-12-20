
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat_app/screens/login_screen.dart';
import 'package:flash_chat_app/screens/registration_screen.dart';
import 'package:flash_chat_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  const WelcomeScreen({super.key});
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller = AnimationController(
    //   vsync: this,
    //   duration: Duration(seconds: 1),
    //   // upperBound: 100.0,
    // );

    // animation = CurvedAnimation(parent: controller!, curve: Curves.easeIn);

    // controller!.forward();

    // animation!.addStatusListener((value) {
    //   if (value == AnimationStatus.completed) {
    //     controller!.reverse(from: 1);
    //   }
    // });

    // controller!.addListener(() {
    //   setState(() {});
    //   print(animation!.status);
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  transitionOnUserGestures: true,
                  child: Container(
                    child: Image.asset('lib/images/logo.png'),
                    height: 60,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                      speed: const Duration(milliseconds: 500),
                    ),
                  ],
                  totalRepeatCount: 1,
                  pause: const Duration(milliseconds: 100),
                  displayFullTextOnTap: false,
                  stopPauseOnTap: true,
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                text: 'Log in',
                color: Colors.lightBlueAccent),
            CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
                text: 'Register',
                color: Colors.blueAccent),
          ],
        ),
      ),
    );
  }
}
