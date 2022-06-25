import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker(this.imagePickFn);

  final void Function(XFile pickedImage) imagePickFn;

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _pickedImage;
  final ImagePicker _picker = ImagePicker();

  void _pickImageFromCamera() async {
    final XFile pickedImageFile =
        (await ImagePicker().pickImage(source: ImageSource.camera));
    final File file = File(pickedImageFile.path);
    setState(() {
      _pickedImage = file;
    });
    widget.imagePickFn(pickedImageFile);
  }

  void _pickImageFromGallery() async {
    final XFile pickedImageFile =
        (await ImagePicker().pickImage(source: ImageSource.gallery));
    final File file = File(pickedImageFile.path);
    setState(() {
      _pickedImage = file;
    });
    widget.imagePickFn(pickedImageFile);
  }

  void _showPrompt() {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text("Pick Image From"),
              actions: [
                TextButton(onPressed: _pickImageFromCamera, child: Text("Camera")),
                TextButton(
                  onPressed: _pickImageFromGallery,
                  child: Text("Gallery"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: double.infinity,
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width/2,
          child: CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage as File) : null,
        ),),
        FlatButton.icon(
          textColor: Theme.of(context).primaryColor,
          onPressed: _showPrompt,
          icon: Icon(Icons.image),
          label: Text('Add Image'),
        ),
      ],
    ));
  }
}
