import 'package:flutter/material.dart';
import 'package:flutter_hack20/model/ecoPost.dart';
import 'package:flutter_hack20/model/karmaPost.dart';
import 'package:flutter_hack20/sevice/firestore_service.dart';
import 'package:flutter_hack20/view/bottom_navigation/bottom_navigatioin_view.dart';
import 'package:provider/provider.dart';

class BottomNavigationViewModel extends StatelessWidget {
  const BottomNavigationViewModel();
  @override
  Widget build(BuildContext context) {
    final List<EcoPostJson> eList = Provider.of<List<EcoPostJson>>(context);
    final List<KarmaPostJson> kList = Provider.of<List<KarmaPostJson>>(context);

    return MultiProvider(
      providers: <StreamProvider<dynamic>>[
        StreamProvider<List<EcoPost>>.value(
          value: FirestoreService.instance.getEcoPosts(eList),
          initialData: const <EcoPost>[],
        ),
        StreamProvider<List<KarmaPost>>.value(
          value: FirestoreService.instance.getKarmaPosts(kList),
          initialData: const <KarmaPost>[],
        ),
      ],
      child: const BottomNavigationView(),
    );
  }
}
