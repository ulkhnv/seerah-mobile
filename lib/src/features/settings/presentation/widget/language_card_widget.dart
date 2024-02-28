import 'package:flutter/material.dart';
import 'package:seerah/src/core/utils/S.dart';
import 'package:seerah/src/features/settings/presentation/page/language_page.dart';
import 'package:seerah/src/features/settings/presentation/widget/border_container_widget.dart';

class LanguageCard extends StatelessWidget {
  const LanguageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LanguagePage()),
      ),
      child: BorderContainer(
        padding: 20,
        child: Row(
          children: [
            Image.asset(
              "assets/images/settings/language.png",
              color: Colors.green,
              width: 25,
              height: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              S.of(context).language,
              style: const TextStyle(fontSize: 20),
            ),
            const Spacer(),
            Text(
              S.of(context).current_language,
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(
              width: 10,
            ),
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
