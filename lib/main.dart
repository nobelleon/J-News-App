import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:j_news_app/layar/layar_utama.dart';
import 'package:j_news_app/opening.dart';
import 'package:j_news_app/utils/sized_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
            ]);

            return GetMaterialApp(
              title: 'JNews App 📰',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                textTheme: Theme.of(context)
                    .textTheme
                    .apply(displayColor: Colors.green[400]),
              ),
              home: Opening(),
            );
          },
        );
      },
    );
  }
}
