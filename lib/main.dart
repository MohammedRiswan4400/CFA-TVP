import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:trappra_chat/firebase_options.dart';
import 'package:trappra_chat/view/splash/screen_splash.dart';

import 'controller/provider/home_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ImageChangingProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        // navigatorKey: navigatorKey,
        title: "Trappra App",
        // theme: ThemeData.dark(),
        builder: (_, child) => _UnFocus(child: child!),
        home: const ScreenSplash(),
      ),
    );
  }
}

class _UnFocus extends StatelessWidget {
  const _UnFocus({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}
