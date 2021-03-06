import 'package:flutter/material.dart';
import 'package:flutter_hack20/common_widget/appbar.dart';
import 'package:flutter_hack20/common_widget/drawer.dart';
import 'package:flutter_hack20/common_widget/post_card.dart';
import 'package:flutter_hack20/model/karmaPost.dart';
import 'package:flutter_hack20/model/user.dart';
import 'package:flutter_hack20/view/karma_post/karma_post_page.dart';
import 'package:provider/provider.dart';

class KarmaTimelinePage extends StatelessWidget {
  const KarmaTimelinePage();
  @override
  Widget build(BuildContext context) {
    final List<KarmaPost> karmaPostList = Provider.of<List<KarmaPost>>(context);
    final User user = Provider.of<User>(context);
    Widget body = ListView.builder(
      itemCount: karmaPostList.length,
      itemBuilder: (_, int index) {
        return karmaPostCard(karmaPostList[index].user, karmaPostList[index]);
      },
    );

    if (karmaPostList == null) {
      body = const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (karmaPostList.isEmpty) {
      body = const Center(child: Text('Let\'s Post!'));
    }

    return Scaffold(
      drawer: drawer(context),
      appBar: commonAppBar('karma posts', color: Colors.red),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: () => Navigator.of(context).push<dynamic>(
          MaterialPageRoute<dynamic>(
            fullscreenDialog: true,
            builder: (BuildContext context) => KarmaPostPage(user: user),
          ),
        ),
      ),
      body: body,
    );
  }
}
