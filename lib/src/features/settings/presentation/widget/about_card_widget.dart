import 'package:flutter/material.dart';
import 'package:seerah/src/core/utils/S.dart';
import 'package:seerah/src/features/settings/presentation/page/about_page.dart';
import 'package:seerah/src/features/settings/presentation/widget/border_container_widget.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AboutPage()),
      ),
      child: BorderContainer(
        padding: 20,
        child: Row(
          children: [
            Image.asset(
              "assets/images/settings/info.png",
              color: Colors.green,
              width: 25,
              height: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(S.of(context).about, style: const TextStyle(fontSize: 20),),
            const Spacer(),
            Image.asset(
              "assets/images/settings/arrow_right.png",
              color: Colors.grey,
              width: 25,
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
