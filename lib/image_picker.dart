import 'dart:io';
import 'package:video_player/video_player.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Image_Picker extends StatefulWidget {
  const Image_Picker({super.key});

  @override
  State<Image_Picker> createState() => _Image_PickerState();
}
class _Image_PickerState extends State<Image_Picker> {
  File? selectedImage;
  File? selectedVideo;

  selectimage({required ImageSource source})async{
    final ImagePicker picker=ImagePicker();
    final XFile? image=await picker.pickImage(source: source);

    if(image!=null){
      selectedImage=File(image.path);
    }else{
      selectedImage=null;
    }
setState(() {});
  }


  selectVideo({required ImageSource source})async{
    final ImagePicker picker=ImagePicker();
    final XFile? video =
    await picker.pickVideo(source:source);

    if(video!=null){
      selectedVideo=File(video.path);
    }else{
      selectedVideo=null;
    }
    setState(() {});
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Image'),),
      body:Column(spacing: 20,mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: selectedImage!=null?
            Image.file(selectedImage!,width:300 ,height:300 ,)
                :Text('No File Selected'),
          ),
          Center(
            child: ElevatedButton(onPressed: (){
              showDialog(context: context, builder: (_){
                return AlertDialog(title: Text('Select'),
               backgroundColor: Colors.white,
                actions: [
                  IconButton(onPressed: (){
                    selectimage(source: ImageSource.gallery);
                    Navigator.pop(context);
                  }, icon: Icon(Icons.image)),
                  IconButton(onPressed: (){
                    selectimage(source:ImageSource.camera);
                    Navigator.pop(context);
                  }, icon: Icon(Icons.camera_alt)),
                  IconButton(onPressed: (){
                    selectVideo(source:ImageSource.gallery);
                    Navigator.pop(context);
                  }, icon: Icon(Icons.video_camera_back)),
                  IconButton(onPressed: (){
                    selectVideo(source:ImageSource.camera);
                    Navigator.pop(context);
                  }, icon: Icon(Icons.videocam)),
                ],);
              });
            }, child: Text('Select',style: TextStyle(color: Colors.white),)),
          ),


        ],
      ) ,


    );
  }
}
