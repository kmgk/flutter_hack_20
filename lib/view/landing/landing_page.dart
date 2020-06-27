import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hack20/view/sign_in/sign_in_page.dart';

import 'package:provider/provider.dart';

class LandingView extends StatelessWidget {
  const LandingView();

  @override
  Widget build(BuildContext context) {
    final FirebaseUser user = Provider.of<FirebaseUser>(context);
    if (user == null) {
      return const SignInPage();
    }
    return MultiProvider(
      // TODO: 各種Providerの追加
      providers: <StreamProvider<dynamic>>[],
      // TODO: BottomNavigationViewModel
      // child: ,
    );
  }
}
