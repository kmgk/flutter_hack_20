import 'package:flutter/material.dart';
import 'package:flutter_hack20/common_widget/appbar.dart';
import 'package:flutter_hack20/common_widget/post_card.dart';
import 'package:flutter_hack20/model/ecoPost.dart';
import 'package:provider/provider.dart';

class EcoTimelinePage extends StatelessWidget {
  const EcoTimelinePage();
  @override
  Widget build(BuildContext context) {
    final List<EcoPost> ecoPostList = Provider.of<List<EcoPost>>(context);

    if (ecoPostList == null || ecoPostList.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: commonAppBar('eco posts', color: Colors.green),
      body: ListView.builder(
        itemCount: ecoPostList.length,
        itemBuilder: (_, int index) {
          return ecoPostCard(ecoPostList[index].user, ecoPostList[index]);
        },
      ),
    );
  }
}
