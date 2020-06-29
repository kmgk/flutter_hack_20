import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hack20/view/about/about_page.dart';
import 'package:flutter_hack20/view/landing/landing_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>(
      create: (_) => FirebaseAuth.instance.onAuthStateChanged,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecomy',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: <String, Widget Function(BuildContext)>{
          '/': (_) => const LandingView(),
          '/about': (_) => const AboutPage()
        },
      ),
    );
  }
}
