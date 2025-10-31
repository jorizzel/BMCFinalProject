import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:ecommerce_app/screens/auth_wrapper.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


void main() async {

  // 1. Preserve the splash screen
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // 2. Initialize Firebase (from Module 1)
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 3. Run the app (from Module 1)
  runApp(const MyApp());

  // 4. Remove the splash screen after app is ready
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Added const constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eCommerce App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        useMaterial3: true, // Optional: for Material 3
      ),
      home: const AuthWrapper(),
    );
  }
}
