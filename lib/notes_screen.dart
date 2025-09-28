import 'package:flutter/material.dart';
import 'package:taskamro/db_helper.dart';
import 'package:taskamro/note_add.dart';

import 'note.dart';
import 'update_screen.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}
class _NotesScreenState extends State<NotesScreen> {
  List<Note> notes=[];
  DbHelper dbHelper=DbHelper();
  @override
  void initState(){
    super.initState();
    getNotes();
    dbHelper.getNotes();
  }
  getNotes()async{
    notes=await dbHelper.getNotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('Note'),centerTitle: true
    ),
      body: Padding(padding: EdgeInsets.all(16),
      child: ListView.builder(itemCount: notes.length,
        itemBuilder:(_,index){
        return InkWell(
          onTap: ()async{
            await Navigator.push(context,
                MaterialPageRoute(builder: (_)=>UpdateScreen(note: notes[index],)));
            getNotes();
          },
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(

              title: Text(notes[index].text,style: TextStyle(color: Colors.white),),
               trailing: IconButton(
                  onPressed: ()async{
                   await dbHelper.deleteNote(id: notes[index].id);
                   // setState(() {
                   // });
                   getNotes();
                  },
                  icon: Icon(Icons.delete,color: Colors.white,)
              ),
            ),
          ),
        );
        },
      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          await Navigator.push(context,
              MaterialPageRoute(
                  builder:(context)=>NoteAdd()
              )
          );
         getNotes();
        },
        child: Icon(Icons.add),
      ),
      

    );
  }
}
