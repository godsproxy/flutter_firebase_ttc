import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ttc/widgets/appbar/appbar_view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TTCAppbar(),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/ttc-logo.png'),
            Text(
              'Welcome to the Club!',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SignOutButton(),
          ],
        ),
      ),
    );
  }
}
