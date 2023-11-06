import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/pages/contact_info.dart';


class BankAccountInfo extends StatefulWidget {
  const BankAccountInfo({super.key});

  @override
  State<BankAccountInfo> createState() => _BankAccountInfoState();
}

class _BankAccountInfoState extends State<BankAccountInfo> {
 final user = FirebaseAuth.instance.currentUser;
   final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          widthFactor: 1.7,
          child: Text(
            'Bank of account info',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 17)),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [bankAccount(), buttonAddAccount()],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> bankAccountData = [
  {
    'image': 'assets/Group 33.png',
    'title': 'Bank of Amrica - 0182128xxx',
    'popover': const Icon(Icons.more_vert)
  },
  {
    'image': 'assets/Group 33 (1).png',
    'title': 'Zenith Bank - 0182128xxx',
    'popover': const Icon(Icons.more_vert)
  },
];

  Widget bankAccountList(List<Map<String, dynamic>> data) {
    return SizedBox(
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Card(
              surfaceTintColor: Colors.white,
              shadowColor: Colors.white,
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  contentPadding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  leading: Image(image: AssetImage(data[index]['image'])),
                  title: Text(
                    data[index]['title'],
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1,
                        letterSpacing: 0.1),
                  ),
                  subtitle: StreamBuilder(
                    stream: db.collection('userData').snapshots(), 
                    builder:(context, snapshot) {
                       if (snapshot.data == null) {
                         return const Center(
                           child: CircularProgressIndicator(),
                             );
                             }
                       final userData = snapshot.data?.docs.firstWhere((item) => item.id == user?.uid);
                      return Text(
                        fullUserName.text = userData?['fullUserName'],
                    style: const TextStyle(fontSize: 14),
                  );
                    },
                    ) ,
                  trailing: Column(
                    children: [
                      PopupMenuButton(
                          surfaceTintColor: Colors.grey.shade300,
                          itemBuilder: (context) => [
                                const PopupMenuItem(
                                  child: Text('Other information'),
                                ),
                                const PopupMenuItem(child: Text('Remove'))
                              ],
                          icon: data[index]['popover']),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: 2),
    );
  }

  Widget bankAccount() {
    return bankAccountList(bankAccountData);
  }

  Widget buttonAddAccount() {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                const MaterialStatePropertyAll(Color.fromRGBO(49, 160, 98, 1)),
            foregroundColor: const MaterialStatePropertyAll(Colors.white),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)))),
        onPressed: () {},
        child: const SizedBox(
          height: 55,
          width: double.infinity,
          child: Center(
            child: Text('Add account',
                style: TextStyle(
                  fontSize: 17,
                )),
          ),
        ));
  }
}
