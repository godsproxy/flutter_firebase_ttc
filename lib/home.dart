import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ttc/widgets/appbar/appbar_view.dart';
import 'package:flutter_firebase_ttc/widgets/drawer/drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TTCDrawer(),
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.user),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<TTCProfile>(
                  builder: (context) => TTCProfile(),
                ),
              );
            },
          )
        ],
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/ttc-logo.png'),
            Text(
              'Welcome to the Club!',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SignOutButton(),
          ],
        ),
      ),
    );
  }
}
