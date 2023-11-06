import 'package:flutter/material.dart';

class ContactInfoTextfield extends StatelessWidget {
  final void Function()? onPressed;
  final TextEditingController controller;
  final String title;
  const ContactInfoTextfield({
    super.key,
    this.onPressed,
    required this.controller,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
      subtitle: TextFormField(
        controller: controller,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      ),
      trailing: TextButton(
        onPressed: onPressed,
        child: const Text(
          'Change',
          style: TextStyle(
              fontSize: 10,
              color: Color.fromRGBO(48, 169, 94, 1),
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
