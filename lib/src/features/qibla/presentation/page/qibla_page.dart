import 'package:flutter/material.dart';
import 'package:seerah/src/core/utils/S.dart';
import 'package:smooth_compass/utils/src/compass_ui.dart';

class QiblaScreen extends StatelessWidget {
  const QiblaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
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
          S.of(context).qibla,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: SmoothCompass(
          isQiblahCompass: true,
          compassBuilder: (context, snapshot, child) {
            return AnimatedRotation(
              turns: snapshot?.data?.turns ?? 0 / 360,
              duration: const Duration(milliseconds: 400),
              child: SizedBox(
                height: 200,
                width: 200,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Image.asset("assets/images/my_iman/compass.png"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
