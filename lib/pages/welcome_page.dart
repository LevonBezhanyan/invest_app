
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/services/services.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final user = FirebaseAuth.instance.currentUser;
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: db.collection('userData').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final userData = snapshot.data?.docs.firstWhere((item) => item.id == user?.uid);
          var userName = (userData?['fullUserName'] as String?);

          if ((userName?.indexOf(' ') ?? 0) > 0) {
            userName = userName?.substring(0, userName.indexOf(' '));
          }

          return Scaffold(
            appBar: AppBar(
              bottom: PreferredSize(
                  preferredSize: const Size(Checkbox.width, 30),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Welcome, $userName.',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/notification');
                      },
                      icon: const Icon(Icons.notifications_active_outlined)),
                ],
              ),
            ),
            drawer:  NavigationDrawer(
    children: [
      ListTile(
        leading: const Icon(Icons.home),
        title: const Text('Home'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.favorite),
        title: const Text('Favorits'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.history),
        title: const Text('Updates'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.notifications),
        title: const Text('Notifications'),
        onTap: () {},
      ),
       ListTile(
        leading: const Icon(Icons.logout),
        title: const Text('Log out'),
        onTap: () {
          showDialog(context: context, builder:(context) {
            return AlertDialog(
            title: const Text('Are you sure to log out?'),
            actions: [
              TextButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(48, 169, 94, 1),)
                ),
                onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                }, 
                child: const Text('Confirm', 
                style: TextStyle(
                  color: Colors.white
                )
                )
                ),
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                child: const Text('Cancel'))
                ,
            ],
          );
          },
          ); 
        },
      ),
    ],
  ),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 110,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [
                              Color.fromRGBO(48, 169, 94, 1),
                              Color.fromRGBO(37, 139, 102, 1)
                            ]),
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 15, 10, 15),
                          child: Column(children: [
                            const Expanded(
                              flex: 4,
                              child: Row(
                                children: [
                                  Text(
                                    'Your total asset portfolio',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'N203,935',
                                      style: TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                    TextButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                const MaterialStatePropertyAll(
                                                    Colors.white),
                                            shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14))),
                                            minimumSize:
                                                const MaterialStatePropertyAll(
                                                    Size.zero)),
                                        onPressed: () {},
                                        child: const Text(
                                          '   Invest now   ',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color.fromRGBO(
                                                  37, 139, 102, 1),
                                              fontWeight: FontWeight.w500),
                                        ))
                                  ]),
                            )
                          ]),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Best Plans',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Row(
                              children: [
                                Text('See All ',
                                    style: TextStyle(
                                      color: Color.fromRGBO(254, 85, 93, 1),
                                      fontSize: 18,
                                    )),
                                Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 18,
                                  color: Color.fromRGBO(254, 85, 93, 1),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                  bestPlan(),
                  const SizedBox(
                    height: 40,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Investment Guide',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  investmentGuide(),
                ],
              ),
            )),
          );
        });
  }
}


