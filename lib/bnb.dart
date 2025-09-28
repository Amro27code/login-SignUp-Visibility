import 'package:flutter/material.dart';
import 'package:taskamro/image_picker.dart';
import 'package:taskamro/mr_potato.dart';
import 'package:taskamro/notes_screen.dart';
import 'package:taskamro/whatsapp.dart';

class BnbScreen extends StatefulWidget {
  const BnbScreen({super.key});

  @override
  State<BnbScreen> createState() => _BnbScreenState();
}

class _BnbScreenState extends State<BnbScreen> {
  final List<Widget> _pages = [
    MrPotato(),
    NotesScreen(),
    Image_Picker(),
    WhatsappScreen(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets_outlined),
            label: 'MrPotato',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.note_alt), label: 'Notes'),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'ImagePicker',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: 'WhatsApp',
          ),
        ],
      ),
    );
  }
}
