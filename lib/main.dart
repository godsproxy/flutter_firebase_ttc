import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:firebase_auth/firebase_auth.dart' hide PhoneAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ttc/home.dart';
import 'package:flutter_firebase_ttc/models/user.dart';
import 'package:flutter_firebase_ttc/providers/ttc_auth.dart';
import 'package:flutter_firebase_ttc/screens/signin/signin_screen.dart';
import 'package:flutter_firebase_ttc/themes.dart';
import 'package:flutter_firebase_ttc/widgets/appbar/appbar_view.dart';
import 'package:flutter_firebase_ttc/widgets/drawer/drawer.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
  // final fcmToken = await FirebaseMessaging.instance.getToken(
  //     vapidKey:
  //         "BBwcN4SJw9EUWSHCGmEj7B7pY-WDh7nM0So8HqjhEH1wXQdV1p3-d3a9raf9DUuCtfw2mC3rP0rdsluCFTPKuIk");
  // print("FCM Token: $fcmToken");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  itemBuilder(context, item) {
    return Text(item.name);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TTCAppData>(
          create: (_) => TTCAppData(),
        ),
      ],
      child: Consumer(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'The Tobacco Club',
            routes: {
              '/sign-in': (context) => TTCSignInScreen(),
              '/profile': (context) => TTCProfile(),
              '/home': (context) => HomeScreen(),
            },
            theme: TTCTheme,
            home: Scaffold(
              drawer: TTCDrawer(),
              appBar: TTCAppbar(title: 'The Tobacco Club'),
              body: FirestoreBuilder(
                  ref: userRef,
                  builder: (context, snapshot, child) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error}"),
                      );
                    }

                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/ttc-logo.png'),
                          Text(
                            'Welcome to the Club! ' +
                                snapshot.data!.docs[0].data.name,
                            style: Theme.of(context).textTheme.displayLarge,
                            textAlign: TextAlign.center,
                          ),
                          snapshot.data?.docs[0].data.smoberDate == null
                              ? Text(
                                  'You are not currently smober',
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                  textAlign: TextAlign.center,
                                )
                              : Column(
                                  children: [
                                    Text(
                                      'You are currently smober since ${snapshot.data?.docs[0].data.smoberDate} ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                      textAlign: TextAlign.center,
                                    ),
                                    Container(
                                        child: Center(
                                            child: SfCircularChart(
                                                title: ChartTitle(
                                                    text:
                                                        'Sales by sales person'),
                                                legend: Legend(isVisible: true),
                                                series: <
                                                    PieSeries<_PieData,
                                                        String>>[
                                          PieSeries<_PieData, String>(
                                              explode: true,
                                              explodeIndex: 0,
                                              dataSource: _PieData('3', 3),
                                              xValueMapper:
                                                  (_PieData data, _) =>
                                                      data.xData,
                                              yValueMapper:
                                                  (_PieData data, _) =>
                                                      data.yData,
                                              dataLabelMapper:
                                                  (_PieData data, _) =>
                                                      data.text,
                                              dataLabelSettings:
                                                  DataLabelSettings(
                                                      isVisible: true)),
                                        ]))),
                                  ],
                                ),
                          MaterialButton(
                            onPressed: () {
                              userRef
                                  .doc(snapshot.data!.docs[0].id)
                                  .update(smoberDate: DateTime.now());
                            },
                            child: Text('Get Smober'),
                          ),
                          const SignOutButton(),
                        ],
                      ),
                    );
                  }),
            ),
          );
          // return MaterialApp(}
        },
      ),
    );
  }
}
// class MyApp extends StatelessWidget {

List<AuthProvider<AuthListener, AuthCredential>>? providers = [
  PhoneAuthProvider()
];

class _PieData {
  final String xData;
  final num yData;
  final String text = '';

  _PieData(this.xData, this.yData);
}
