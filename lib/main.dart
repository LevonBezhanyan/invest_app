import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/firebase_options.dart';
import 'package:invest_app/pages/bank_account_info.dart';
import 'package:invest_app/pages/contact_info.dart';
import 'package:invest_app/pages/empty_page.dart';
import 'package:invest_app/pages/home_page.dart';
import 'package:invest_app/pages/login.dart';
import 'package:invest_app/pages/notification.dart';
import 'package:invest_app/pages/registration.dart';
import 'package:invest_app/pages/sign_up.dart';
import 'package:invest_app/pages/splash_screen.dart';
import 'package:invest_app/pages/welcome_page.dart';
import 'package:invest_app/services/firebase_streem.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
     
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(49, 160, 98, 1)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/sign_up': (context) => const SignUp(),
        '/registration': (context) => const Registration(),
        '/login': (context) => const Login(),
        '/home_page': (context) => const HomePage(),
        '/notification':(context) => const NotificationPage(),
        '/welcome':(context) => const WelcomePage(),
        '/contact_info':(context) => const ContactInfo(),
        '/bank_account_info':(context) => const BankAccountInfo(),
        '/firebase_streem':(context) => const FirebaseStream(),
        '/empty_page':(context) => const EmptyPage(),
      },
    );
  }
}
