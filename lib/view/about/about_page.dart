import 'package:flutter/material.dart';
import 'package:flutter_hack20/common_widget/appbar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage();
  @override
  Widget build(BuildContext context) {
    final TextStyle headline2Style = Theme.of(context).textTheme.headline4;
    final TextStyle subtitle1Style = Theme.of(context).textTheme.subtitle1;

    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      appBar: commonAppBar('About', color: Colors.green),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('What\'s Ecomy?', style: headline2Style),
              const SizedBox(height: 15),
              Text(
                'Ecomy is a social networking application to share eco-friendly activities with everyone.',
                style: subtitle1Style,
              ),
              const SizedBox(height: 30),
              Text('How to use', style: headline2Style),
              const SizedBox(height: 15),
              Text(
                'One is a post that shares eco-friendly activities(called EcoPost), and the other is the opposite: a post that shares non-eco-friendly activities(called KarmaPost).\n\n'
                'It\'s easy to imagine sharing eco-friendly activities, but what does it mean to share non-eco-friendly activities?\n\n'
                'The point of sharing non-eco-friendly activities is to raise awareness of eco-friendly behaviors next time.'
                'Posting an EcoPost earns you 1 EcoPoint. And Posting an KarmaPoint earns you 1 KarmaPoint as well.You also earn one point for each time get a reaction to your post.\n\n'
                'In this way, you can visualize how eco-friendly or not you usually are.KarmaPoint can be cancelled out with an EcoPoint, so Don\'t be shy to post KarmaPost!\n\n'
                '\n\nHave a fun eco-life on Ecomy!',
                style: subtitle1Style,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
