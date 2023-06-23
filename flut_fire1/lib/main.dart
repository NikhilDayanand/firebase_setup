import 'package:firebase_core/firebase_core.dart';
import 'package:flut_fire1/add.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final logger = Logger(); // Logger instance for logging errors

  // Initialize Firebase and handle errors
  Future<void> initializeFirebase() async {
    try {
      FirebaseOptions options = FirebaseOptions(
          apiKey: "AIzaSyA0x2Kg5ejOlV3qgBMgaWquuyMfzfNB_ZU",
          appId: "1:806957279821:web:4175e6772e46c2d4024a04",
          messagingSenderId: "806957279821",
          projectId: "firelit-14cf7",
          databaseURL: "https://firelit-14cf7-default-rtdb.firebaseio.com",
          storageBucket: "firelit-14cf7.appspot.com");
      await Firebase.initializeApp(name: "Filrelit-web", options: options);
      logger.i('Firebase initialized successfully');
    } catch (e, stackTrace) {
      logger.e('Error initializing Firebase: $e', e, stackTrace);
    }
  }

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initializeFirebase();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AddPage(),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Text("Hello"),
//     );
//   }
// }

