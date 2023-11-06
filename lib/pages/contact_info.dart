import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invest_app/pages/contact_info_text_field.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({super.key});

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

String photo = 'assets/700674.png';
final fullUserName = TextEditingController();
final birthDay = TextEditingController();
final gender = TextEditingController();
final phoneNumber = TextEditingController();
final address = TextEditingController();
final email = TextEditingController();


class _ContactInfoState extends State<ContactInfo> {
  
  final user = FirebaseAuth.instance.currentUser;
  final db = FirebaseFirestore.instance;
  String imageUrl = '';

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 17)),
          title: const Center(
            widthFactor: 2.7,
            child: Text(
              'Contact info',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(children: [
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
                      ),
                    );
                      },
                      ),
                    Container(
                      width: 140,
                      height: 140,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(66, 62, 62, 0.4),
                          Color.fromRGBO(71, 66, 66, 0.4)
                        ]),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                          onPressed: () async {
                           
                           ImagePicker imagePicker = ImagePicker();
                           XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
                           if (file == null) return;
                           Reference referenceRoot = FirebaseStorage.instance.ref();
                           Reference referenceDirImages = referenceRoot.child('images');
                           Reference referenceImageToUpload = referenceDirImages.child(file.name);

                           try {
                            await referenceImageToUpload.putFile(File(file.path));
                            imageUrl = await referenceImageToUpload.getDownloadURL();
                           } catch(error) {
                            // error
                           }
                            changeUserData(
                              data: {
                        'image': imageUrl,
                      },
                            );
                          },
                          icon: const Icon(
                            Icons.edit_outlined,
                            size: 27,
                            color: Colors.white,
                          )),
                    )
                  ])
                ],
              ),
            ),
            contactInfoList(),
          ]),
        )));
  }

  List<Map<String, dynamic>> contactInfoListData = [
    {
      'title': 'Name',
      'subtitle': 'fullUserName',
      'trailing': 'Change',
      'controller': fullUserName
    },
    {
      'title': 'Birthdate',
      'subtitle': 'birthDay',
      'trailing': 'Change',
      'controller': birthDay
    },
    {
      'title': 'Gender',
      'subtitle': 'gender',
      'trailing': 'Change',
      'controller': gender
    },
    {
      'title': 'Email',
      'subtitle': 'email',
      'trailing': 'Change',
      'controller': email
    },
    {
      'title': 'Phone Number',
      'subtitle': 'phoneNumber',
      'trailing': 'Change',
      'controller': phoneNumber
    },
    {
      'title': 'Address',
      'subtitle': 'address',
      'trailing': 'Change',
      'controller': address
    }
  ];

  Widget contactInfoList() {
    return StreamBuilder(
        stream: db.collection('userData').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final userData = snapshot.data?.docs.firstWhere((item) => item.id == user?.uid);

          fullUserName.text = userData?['fullUserName'];
          birthDay.text = userData?['birthDay'];
          gender.text = userData?['gender'];
          email.text = userData?['email'];
          phoneNumber.text = userData?['phoneNumber'];
          address.text = userData?['address'];

          return SizedBox(
            child: Column(
              children: [
                ContactInfoTextfield(
                  controller: fullUserName,
                  title: 'Name',
                  onPressed: () {
                    changeUserData(
                      data: {
                        'fullUserName': fullUserName.text,
                      },
                    );
                  },
                ),
                ContactInfoTextfield(
                  controller: birthDay,
                  title: 'Birthdate',
                  onPressed: () {
                    changeUserData(
                      data: {
                        'birthDay': birthDay.text,
                      },
                    );
                  },
                ),
                ContactInfoTextfield(
                  controller: gender,
                  title: 'Gender',
                  onPressed: () {
                    changeUserData(
                      data: {
                        'gender': gender.text,
                      },
                    );
                  },
                ),
                ContactInfoTextfield(
                  controller: email,
                  title: 'Email',
                  onPressed: () {
                    changeUserData(
                      data: {
                        'email': email.text,
                      },
                    );
                  },
                ),
                ContactInfoTextfield(
                  controller: phoneNumber,
                  title: 'Phone Number',
                  onPressed: () {
                    changeUserData(
                      data: {
                        'phoneNumber': phoneNumber.text,
                      },
                    );
                  },
                ),
                ContactInfoTextfield(
                  controller: address,
                  title: 'Address',
                  onPressed: () {
                    changeUserData(
                      data: {
                        'address': address.text,
                      },
                    );
                  },
                ),
              ],
            ),
          );
        });
  }

  void sendData() async {

    if (imageUrl.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error')));
      return;
    }

    await db.collection('userData').add({
      'fullUserName': fullUserName.text,
      'birthDay': birthDay.text,
      'gender': gender.text,
      'email': email.text,
      'phoneNumber': phoneNumber.text,
      'address': address.text,
      'image': imageUrl,
    });

    fullUserName.clear();
    birthDay.clear();
    gender.clear();
    email.clear();
    phoneNumber.clear();
    address.clear();
  }

  void changeUserData({
    required Map<String, dynamic> data,
  }) {
    db.collection('userData').doc(user?.uid).update(data);

    showDialog(
      context: context,
      builder: (context) => const Dialog(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Success'),
            ],
          ),
        ),
      ),
    );
  }
}
