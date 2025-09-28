import 'dart:math';

import 'package:flutter/material.dart';
import 'package:taskamro/whats_folder.dart';

class WhatsAppUi extends StatefulWidget {
  const WhatsAppUi({super.key});

  @override
  State<WhatsAppUi> createState() => _WhatsAppUiState();
}

class _WhatsAppUiState extends State<WhatsAppUi> {
  List<String> text=['All','Unread 1','Favourites','Groups 1',' + '];
 Random time=Random();
List<WhatsApp> chats=[
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),
  WhatsApp(
      image: 'assets/hh.png',
      title: '+962782573330',
      subTitle: 'My name is Amro Abu Srour'),

];
@override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0x000b1014),
          title: Row(
        children: [
          Text('WhatsApp'),
          Spacer(),
           Icon(Icons.more_vert),
          SizedBox(width: 15,),
          Icon(Icons.camera_alt_outlined),
        ],
      )) ,
      backgroundColor: Color(0x000b1014),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(20) ,
                color: Colors.grey.shade700
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  spacing:5,
                  children: [
                    Icon(Icons.search,color: Colors.grey.shade500),
                  Text('Ask Meta Ai or Search',style: TextStyle(color: Colors.grey.shade500),),

                ],),
              ),
            ),
            // Row(
            //   children: List.generate(5, (item){
            //     return Container(
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         //color: Colors.white,
            //         border: Border.all(color:Colors.grey ,width: 1)
            //       ),
            //       margin: EdgeInsets.symmetric(horizontal: 7),
            //       child:Padding(
            //         padding: const EdgeInsets.all(5.0),
            //         child: Text(text[item],style: TextStyle(color: Colors.grey),),
            //       ) ,
            //     );
            //   }),
            // ),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  _buildChip('All', selected: true),
                  _buildChip('Unread 1'),
                  _buildChip('Favourites'),
                  _buildChip('Groups 1'),
                  _buildChip('+'),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context,index){
                  return ListTile(
                  contentPadding: const EdgeInsets.symmetric( vertical: 12),

                  leading: CircleAvatar( backgroundImage:AssetImage(chats[index].image),radius: 26,),
                  title: Text(chats[index].title,style: TextStyle(color: Colors.white),),
                  subtitle: Text(chats[index].subTitle),
                    trailing:
                    Text('${time.nextInt(24)+1}:${time.nextInt(5)}${time.nextInt(9)}',style: TextStyle(color: Colors.grey),),
                );},

              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: 0,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: [BottomNavigationBarItem(icon: Icon(Icons.chat_outlined),label: 'Chats'),
            BottomNavigationBarItem(icon: Icon(Icons.update_rounded),label: 'Updates'),
            BottomNavigationBarItem(icon: Icon(Icons.group),label: 'Communities'),
            BottomNavigationBarItem(icon: Icon(Icons.call),label: 'Calls'),

      ]),

    );
  }
  Widget _buildChip(String text, {bool selected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF174D37) : const Color(0xFF1B1B1B),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}


