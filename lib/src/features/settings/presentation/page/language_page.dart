import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seerah/src/core/utils/S.dart';
import 'package:seerah/src/core/utils/localization_provider.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            S.of(context).language,
            style: const TextStyle(fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            ListTile(
              onTap: () {
                Provider.of<LocalizationProvider>(context, listen: false)
                    .setLocale(S.kk);
              },
              title: const Text(
                "Қазақша",
                style: TextStyle(fontSize: 20),
              ),
              trailing: S.of(context).localeName == "kk"
                  ? Image.asset(
                      "assets/images/settings/check.png",
                      color: Colors.green,
                      width: 25,
                      height: 25,
                    )
                  : null,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Divider(),
            ),
            ListTile(
              onTap: () {
                Provider.of<LocalizationProvider>(context, listen: false)
                    .setLocale(S.ru);
              },
              title: const Text(
                "Русский",
                style: TextStyle(fontSize: 20),
              ),
              trailing: S.of(context).localeName == "ru"
                  ? Image.asset(
                      "assets/images/settings/check.png",
                      color: Colors.green,
                      width: 25,
                      height: 25,
                    )
                  : null,
            ),
          ],
        ));
  }
}
