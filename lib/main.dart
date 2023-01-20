import 'package:firebase_auth/firebase_auth.dart' hide PhoneAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ttc/auth_gate.dart';
import 'package:flutter_firebase_ttc/providers/ttc_auth.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseUIAuth.configureProviders([PhoneAuthProvider()]);

  // Both of the following lines are good for testing,
  // but can be removed for release builds
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  FirebaseAuth.instance.signOut();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TTCAuth>(
          create: (_) => TTCAuth(),
        ),
      ],
      child: Consumer(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'The Tobacco Club',
            routes: {
              '/phone': (context) => PhoneInputScreen(
                    actions: [
                      SMSCodeRequestedAction(
                          (context, action, flowKey, phoneNumber) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SMSCodeInputScreen(
                              flowKey: flowKey,
                            ),
                          ),
                        );
                      })
                    ],
                  ),
            },
            theme: ThemeData(
              primarySwatch: Colors.amber,
              useMaterial3: true,
            ),
            home: AuthGate(),
          );
        },
      ),
    );
  }
}
