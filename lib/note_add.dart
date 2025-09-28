import 'package:flutter/material.dart';
import 'package:taskamro/db_helper.dart';

class NoteAdd extends StatefulWidget {
  const NoteAdd({super.key});

  @override
  State<NoteAdd> createState() => _NoteAddState();
}

class _NoteAddState extends State<NoteAdd> {
  TextEditingController controllerAdd=TextEditingController();
  DbHelper db_helper=DbHelper();
  bool showError=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Note Add'),centerTitle: true,),
      body: Padding(padding: EdgeInsets.all(16),
      child: SingleChildScrollView(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(controller: controllerAdd,
          decoration: InputDecoration(
            hintText: 'Add Note',
            label:Text('Note'),
            icon: Icon(Icons.note),
            errorText: showError?'Note cannot be empty':null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
          ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: ()async{
            showError=controllerAdd.text.isEmpty;
            setState(() {});
            if(!showError){
              db_helper.insertNote(text: controllerAdd.text);
              Navigator.pop(context);
            }
          }, child: Text('Add',style: TextStyle(color: Colors.white),))
        ],),),)
    );
  }
}
