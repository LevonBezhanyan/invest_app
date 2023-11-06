import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/pages/contact_info.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String userStatus = 'Expert';
  final user = FirebaseAuth.instance.currentUser;
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(1, 211, 210, 210),
      appBar: AppBar(
        leading: IconButton(
          iconSize: 18,
          onPressed: () {
            Navigator.of(context).popAndPushNamed('/home_page');
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        bottom: const PreferredSize(
            preferredSize: Size(Checkbox.width, 30),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Profile',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StreamBuilder(
                      stream: db.collection('userData').snapshots(), 
                    builder:(context, snapshot) {
                       if (snapshot.data == null) {
                         return const Center(
                           child: CircularProgressIndicator(),
                             );
                             }
                       final userData = snapshot.data?.docs.firstWhere((item) => item.id == user?.uid);
                    return Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(userData?['image']),
                            fit: BoxFit.cover,
                          ),
                        )
                        );
                    },)
                    
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StreamBuilder(
                    stream: db.collection('userData').snapshots(), 
                    builder:(context, snapshot) {
                       if (snapshot.data == null) {
                         return const Center(
                           child: CircularProgressIndicator(),
                             );
                             }
                       final userData = snapshot.data?.docs.firstWhere((item) => item.id == user?.uid);
                      return  Text(fullUserName.text = userData?['fullUserName'],
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.3),
                  );
                    },
                    ) ,
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userStatus,
                    style: const TextStyle(fontSize: 17, letterSpacing: -0.3),
                  )
                ],
              ),
              profileComponent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileComponent() {
    return profileList(profileListData);
  }

  List<Map<String, dynamic>> profileListData = [
    {
      'icon': const Icon(Icons.photo_camera_front_rounded),
      'title': 'Contact Info',
      'arrow': const Icon(Icons.arrow_forward_ios_rounded),
      'route': '/contact_info'
    },
    {
      'icon':const Icon(Icons.payments),
      'title': 'Source of Funding Info',
      'arrow': const Icon(Icons.arrow_forward_ios_rounded),
      'route': '/empty_page'
    },
    {
      'icon': const Icon(Icons.account_balance),
      'title': 'Bank Account Info',
      'arrow': const Icon(Icons.arrow_forward_ios_rounded),
      'route': '/bank_account_info'
    },
    {
      'icon': const Icon(Icons.contact_page),
      'title': 'Document Info',
      'arrow': const Icon(Icons.arrow_forward_ios_rounded),
      'route': '/empty_page'
    },
    {
      'icon': const Icon(Icons.settings),
      'title': 'Settings',
      'arrow': const Icon(Icons.arrow_forward_ios_rounded),
      'route': '/empty_page'
    }
  ];

  Widget profileList(List<Map<String, dynamic>> data) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: SizedBox(
        child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(
              bottom: 25,
            ),
            itemBuilder: (context, index) {
              return ElevatedButton(
                  style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(EdgeInsets.all(15)),
                      elevation: const MaterialStatePropertyAll(2),
                      backgroundColor: const MaterialStatePropertyAll(Colors.white),
                      foregroundColor: const MaterialStatePropertyAll(Colors.black),
                      overlayColor:
                          MaterialStatePropertyAll(Colors.grey.shade100),
                      surfaceTintColor: const MaterialStatePropertyAll(Colors.white),
                      shadowColor:
                          MaterialStatePropertyAll(Colors.grey.shade300),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)))),
                  onPressed: () {
                    Navigator.of(context).pushNamed(data[index]['route']);
                  },
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(child: data[index]['icon'])),
                      Expanded(
                          flex: 3,
                          child: Text(
                            data[index]['title'],
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          )),
                      Expanded(flex: 1, child: data[index]['arrow'])
                    ],
                  ));
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 15,
              );
            },
            itemCount: 5),
      ),
    );
  }
}
