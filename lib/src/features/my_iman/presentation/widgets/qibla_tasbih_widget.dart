import 'package:flutter/material.dart';
import 'package:seerah/src/core/utils/S.dart';
import 'package:seerah/src/features/settings/presentation/widget/border_container_widget.dart';
import 'package:seerah/src/features/qibla/presentation/page/qibla_page.dart';

class QiblaTasbihWidget extends StatelessWidget {
  const QiblaTasbihWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const QiblaScreen()));
          },
          child: BorderContainer(
            padding: 20,
            child: Row(
              children: [
                Image.asset(
                  "assets/images/my_iman/qibla_button.png",
                  color: Colors.green,
                  width: 40,
                  height: 40,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  S.of(context).qibla,
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: BorderContainer(
            padding: 20,
            child: Row(
              children: [
                Image.asset(
                  "assets/images/my_iman/tasbih.png",
                  color: Colors.green,
                  width: 40,
                  height: 40,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text("Тасбих", style: TextStyle(fontSize: 20))
              ],
            ),
          ),
        ),
      ],
    );
  }
}


