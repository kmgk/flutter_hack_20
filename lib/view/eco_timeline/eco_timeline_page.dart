import 'package:flutter/material.dart';
import 'package:flutter_hack20/common_widget/appbar.dart';
import 'package:flutter_hack20/common_widget/drawer.dart';
import 'package:flutter_hack20/common_widget/post_card.dart';
import 'package:flutter_hack20/model/ecoPost.dart';
import 'package:flutter_hack20/model/user.dart';
import 'package:flutter_hack20/view/eco_post_page/eco_post_page.dart';
import 'package:provider/provider.dart';

class EcoTimelinePage extends StatelessWidget {
  const EcoTimelinePage();
  @override
  Widget build(BuildContext context) {
    final List<EcoPost> ecoPostList = Provider.of<List<EcoPost>>(context);
    final User user = Provider.of<User>(context);
    Widget body = ListView.builder(
      itemCount: ecoPostList.length,
      itemBuilder: (_, int index) {
        return ecoPostCard(ecoPostList[index].user, ecoPostList[index]);
      },
    );

    if (ecoPostList == null) {
      body = const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (ecoPostList.isEmpty) {
      body = const Center(child: Text('Let\'s Post!'));
    }

    return Scaffold(
      drawer: drawer(context),
      appBar: commonAppBar('eco posts', color: Colors.green),
      floatingActionButton: FloatingActionButton(
        heroTag: 'eco_timeline',
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).push<dynamic>(
          MaterialPageRoute<dynamic>(
            fullscreenDialog: true,
            builder: (BuildContext context) => EcoPostPage(user: user),
          ),
        ),
      ),
      body: body,
    );
  }
}
