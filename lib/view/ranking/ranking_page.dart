import 'package:flutter/material.dart';
import 'package:flutter_hack20/common_widget/post_card.dart';
import 'package:flutter_hack20/model/user.dart';
import 'package:provider/provider.dart';

class RankingPage extends StatelessWidget {
  const RankingPage();
  @override
  Widget build(BuildContext context) {
    final List<User> users = Provider.of<List<User>>(context);
    if (users == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ranking Page(β)'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView.builder(
          itemBuilder: (_, int index) {
            return userListTile(users[index]);
          },
          itemCount: users.length,
        ),
      ),
    );
  }
}
