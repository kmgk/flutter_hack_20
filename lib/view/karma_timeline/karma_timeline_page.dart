import 'package:flutter/material.dart';
import 'package:flutter_hack20/common_widget/appbar.dart';
import 'package:flutter_hack20/common_widget/post_card.dart';
import 'package:flutter_hack20/model/karmaPost.dart';
import 'package:provider/provider.dart';

class KarmaTimelinePage extends StatelessWidget {
  const KarmaTimelinePage();
  @override
  Widget build(BuildContext context) {
    final List<KarmaPost> karmaPostList = Provider.of<List<KarmaPost>>(context);

    if (karmaPostList == null || karmaPostList.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: commonAppBar('karma posts', color: Colors.red),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: () => print('test'),
      ),
      body: ListView.builder(
        itemCount: karmaPostList.length,
        itemBuilder: (_, int index) {
          return karmaPostCard(karmaPostList[index].user, karmaPostList[index]);
        },
      ),
    );
  }
}
