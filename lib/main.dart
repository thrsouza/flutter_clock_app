import 'package:clock_app/models/app_theme_model.dart';
import 'package:clock_app/modules/home/home_page.dart';
import 'package:clock_app/shared/themes/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppThemeModel(),
      child: Consumer<AppThemeModel>(
        builder: (context, theme, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Clock App',
          theme: AppThemeData.light(context),
          darkTheme: AppThemeData.dark(context),
          themeMode: theme.isLightTheme ? ThemeMode.light : ThemeMode.dark,
          home: const HomePage(),
        ),
      ),
    );
  }
}
