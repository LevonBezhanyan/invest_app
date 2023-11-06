import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
     Future splash() {
    return Future.delayed(const Duration(seconds: 3), () => Navigator.of(context).pushNamed('/sign_up'));
  }
  splash();
    return const Scaffold (
      body: Center(
        child: Image (
          image: AssetImage('assets/1 (5) 1.png'),
        )
      ),
    );
    
  }

 
}