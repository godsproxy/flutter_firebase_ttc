// custom appbar
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TTCAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TTCAppbar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}

class TTCProfile extends StatelessWidget {
  const TTCProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      auth: FirebaseAuth.instance,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Profile'),
      ),
      actions: [
        SignedOutAction((context) {
          Navigator.of(context).pop();
        })
      ],
      children: [
        const Divider(),
      ],
    );
  }
}
