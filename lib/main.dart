import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smiler/di/provider_setup.dart';
import 'package:smiler/presentation/main/main_screen.dart';
import 'package:smiler/ui/service_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    MultiProvider(
      providers: await getProviders(),
      child: const SmilerApp(),
    ),
  );
}

class SmilerApp extends StatelessWidget {
  const SmilerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Smiler",
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: "Pretendard",
        primaryColor: ServiceColors.primary,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w900,
              color: ServiceColors.primary),
          titleMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: ServiceColors.textColor),
          titleSmall: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: ServiceColors.textColor),
          bodyLarge: TextStyle(fontSize: 20, color: ServiceColors.textColor),
          bodyMedium: TextStyle(fontSize: 14, color: ServiceColors.textColor),
          bodySmall: TextStyle(
              fontSize: 9,
              color: ServiceColors.textColor,
              fontWeight: FontWeight.w500),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: ServiceColors.primary,
          primary: ServiceColors.primary,
        ),
      ),
      home: const MainScreen(),
    );
  }
}
