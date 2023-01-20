// custom appbar
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TTCAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TTCAppbar({super.key});

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
              MaterialPageRoute<ProfileScreen>(
                builder: (context) => ProfileScreen(
                  appBar: AppBar(
                    automaticallyImplyLeading: true,
                    title: const Text('User Profile'),
                    centerTitle: true,
                    backgroundColor: Colors.red,
                  ),
                  actions: [
                    SignedOutAction((context) {
                      Navigator.of(context).pop();
                    })
                  ],
                  children: [
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset('assets/images/ttc-logo.png'),
                      ),
                    ),
                  ],
                ),
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
