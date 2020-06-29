import 'package:flutter/material.dart';
import 'package:flutter_hack20/model/user.dart';
import 'package:flutter_hack20/sevice/firestore_service.dart';
import 'package:flutter_hack20/view/ranking/ranking_page.dart';
import 'package:provider/provider.dart';

class RankingViewModel extends StatelessWidget {
  const RankingViewModel();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<User>>(
      create: (_) => FirestoreService.instance.getAllUserOrderByEcoPoint(),
      child: const RankingPage(),
    );
  }
}
