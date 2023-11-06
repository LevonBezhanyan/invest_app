import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Image(
              width: 300,
              height: 273,
              image: AssetImage('assets/Asset 1 1.png')
              ),
          ),
          const Center(
            child: Text('Stay on top of your finance with us.',
            textAlign: TextAlign.center,
             style: TextStyle(
              fontSize: 32, 
              fontWeight: FontWeight.bold,
              )
             ),
          ),
          const Center(
            child: Text('We are your new financial Advisors\n to recommed the best investments for\n you.',
            textAlign: TextAlign.center,
             style: TextStyle(
              fontSize: 16, 
              fontWeight: FontWeight.w500,
              )
             ),),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Color.fromRGBO(49, 160, 98, 1)),
                  foregroundColor: const MaterialStatePropertyAll(Colors.white),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
                  ),
                onPressed: (){
                 Navigator.of(context).pushNamed('/registration');
                }, 
                child: Container(
                  padding: const EdgeInsets.fromLTRB(80, 16, 80, 16),
                  child: const Text('Create account', 
                  style: TextStyle(
                    fontSize: 16,
                  )
                  ),
                )
                ),
            ),
          ),
          Center(
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStatePropertyAll(Colors.grey.shade100),
                
              ),
              onPressed: (){
                Navigator.of(context).pushNamed('/login');
              }, 
              child: const Text('Login',
              style: TextStyle(
                color: Color.fromRGBO(49, 160, 98, 1),
                fontSize: 16,
              ),
              )
              ),
          ),
      ],
      )
    );
  }
}