import 'package:flutter/material.dart';
import 'package:flutter_hack20/common_widget/appbar.dart';
import 'package:flutter_hack20/common_widget/drawer.dart';
import 'package:flutter_hack20/model/user.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage();
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    if (user != null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: commonAppBar('profile', color: Colors.blue),
      drawer: drawer(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 50.0),
          const CircleAvatar(
            //ここをクリックした時に更新するメソッドを作る。
            // backgroundImage: ,
            child: Icon(
              Icons.spa,
              color: Colors.greenAccent,
              size: 60.0,
            ),
            radius: 60.0,
            // backgroundColor: Colors.greenAccent,
          ),
          const SizedBox(height: 30.0),
          Center(
            child: Text(
              'name: ${user.name}',
              style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          const SizedBox(height: 30.0),
          Center(
            child: Text(
              'eco point: ${user.ecoPoint}',
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          Center(
            child: Text(
              'karma point: ${user.karmaPoint}',
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
