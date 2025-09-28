import 'package:flutter/material.dart';
import 'package:taskamro/db_helper.dart';
import 'package:taskamro/note.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key, required this.note});
final Note note;
  @override
  State<UpdateScreen> createState() => _NoteAddState();
}

class _NoteAddState extends State<UpdateScreen> {
  TextEditingController controllerAdd=TextEditingController();
  DbHelper db_helper=DbHelper();
  bool showError=false;
@override
  void initState() {
    super.initState();
    controllerAdd.text=widget.note.text;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Update note'),centerTitle: true,),
        body: Padding(padding: EdgeInsets.all(16),
          child: SingleChildScrollView(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(controller: controllerAdd,
                decoration: InputDecoration(
                    hintText: 'Update Note',
                    label:Text('Note'),

                    icon: Icon(Icons.update),
                    errorText: showError?'Note cannot be empty':null,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: ()async{
                showError=controllerAdd.text.isEmpty;
                setState(() {});
                if(!showError){
                  db_helper.updateNote(id: widget.note.id, text: controllerAdd.text);
                  Navigator.pop(context);
                }
              }, child: Text('Update',style: TextStyle(color: Colors.white),))
            ],),),)
    );
  }
}
