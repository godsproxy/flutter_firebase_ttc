import 'package:firebase_auth/firebase_auth.dart' hide PhoneAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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

  // // Both of the following lines are good for testing,
  // // but can be removed for release builds
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  // FirebaseAuth.instance.signOut();
  final fcmToken = await FirebaseMessaging.instance.getToken(
      vapidKey:
          "BBwcN4SJw9EUWSHCGmEj7B7pY-WDh7nM0So8HqjhEH1wXQdV1p3-d3a9raf9DUuCtfw2mC3rP0rdsluCFTPKuIk");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  List<AuthProvider<AuthListener, AuthCredential>>? providers = [
    PhoneAuthProvider()
  ];
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
            initialRoute: FirebaseAuth.instance.currentUser == null
                ? '/sign-in'
                : '/profile',
            routes: {
              '/sign-in': (context) {
                return SignInScreen(
                  providers: providers,
                  actions: [
                    AuthStateChangeAction<SignedIn>((context, state) {
                      Navigator.pushReplacementNamed(context, '/home');
                    }),
                  ],
                );
              },
              '/profile': (context) {
                return ProfileScreen(
                  providers: providers,
                  actions: [
                    SignedOutAction((context) {
                      Navigator.pushReplacementNamed(context, '/sign-in');
                    }),
                  ],
                );
              },
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
