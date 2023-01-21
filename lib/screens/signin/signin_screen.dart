import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ttc/main.dart';

class TTCSignInScreen extends StatelessWidget {
  const TTCSignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      resizeToAvoidBottomInset: true,
      sideBuilder: (context, constraints) => Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset('assets/images/ttc-logo.png'),
          ),
        ),
      ),
      headerBuilder: (context, constraints, shrinkOffset) => Padding(
        padding: const EdgeInsets.all(20),
        child: AspectRatio(
          aspectRatio: 1,
          child: Image.asset('assets/images/ttc-logo.png'),
        ),
      ),
      providers: providers,
      actions: [
        AuthStateChangeAction<SignedIn>(
          (context, state) {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      ],
      footerBuilder: (context, action) => Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          'By signing in, you agree to our Terms of Service and Privacy Policy',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.caption,
        ),
      ),
    );
  }
}
