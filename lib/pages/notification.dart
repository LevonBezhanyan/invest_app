import 'package:flutter/material.dart';
import 'package:invest_app/services/services.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size(Checkbox.width, 30), 
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text('Notification', 
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold
                ),
                ),
              ],
            ),
          )
          ),
      ),
      body: notificHistory(),
    );
  }
}