import 'package:flutter/material.dart';
import 'package:seerah/src/core/utils/S.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    var text = S.of(context).aa;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset(
              "assets/images/settings/arrow-left.png",
              color: Colors.green,
              width: 30,
              height: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            S.of(context).about,
            style: const TextStyle(fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              text,
              style: const TextStyle(fontSize: 20),
            )));
  }
}
