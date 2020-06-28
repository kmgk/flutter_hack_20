import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hack20/model/ecoPost.dart';
import 'package:flutter_hack20/model/karmaPost.dart';
import 'package:flutter_hack20/model/user.dart';
import 'package:flutter_hack20/sevice/firestore_service.dart';
import 'package:flutter_hack20/view/sign_in/sign_in_page.dart';
import 'package:flutter_hack20/view_model/bottom_navigation_view_model.dart';

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
      providers: <StreamProvider<dynamic>>[
        StreamProvider<User>(
          create: (_) => FirestoreService.instance.getCurrentUser(user),
        ),
        StreamProvider<List<EcoPostJson>>(
          create: (_) => FirestoreService.instance.readEcoPosts(),
          initialData: const <EcoPostJson>[],
        ),
        StreamProvider<List<KarmaPostJson>>(
          create: (_) => FirestoreService.instance.readKarmaPosts(),
          initialData: const <KarmaPostJson>[],
        ),
      ],
      child: const BottomNavigationViewModel(),
    );
  }
}
