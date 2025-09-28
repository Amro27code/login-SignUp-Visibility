import 'package:flutter/material.dart';
import 'package:taskamro/whatsapp_ui.dart';

class WhatsappScreen extends StatefulWidget {
  const WhatsappScreen({super.key});

  @override
  State<WhatsappScreen> createState() => _WhatsappScreenState();
}

class _WhatsappScreenState extends State<WhatsappScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
        TextButton(
        child: Text('Click to go to WhatsApp'),
        onPressed: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (_)=>WhatsAppUi())
        );
        },
        ),
      ),
    );
  }
}
