import 'package:flutter/material.dart';
import 'package:flutter_hack20/model/ecoPost.dart';
import 'package:flutter_hack20/model/karmaPost.dart';
import 'package:provider/provider.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView();
  @override
  _BottomNavigationViewState createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  @override
  Widget build(BuildContext context) {
    final List<EcoPost> ecoPostList = Provider.of<List<EcoPost>>(context);
    final List<KarmaPost> karmaPostList = Provider.of<List<KarmaPost>>(context);

    return const Scaffold();
  }
}
