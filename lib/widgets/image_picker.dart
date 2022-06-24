import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker(this.imagePickFn);

  final void Function(File pickedImage) imagePickFn;

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _pickedImage;

  void _pickImageFromCamera() async {
    final File pickedImageFile =
        (await ImagePicker.pickImage(source: ImageSource.gallery));
    setState(() {
      _pickedImage = pickedImageFile;
    });
    widget.imagePickFn(pickedImageFile);
  }

  void _pickImageFromGallery() async {
    final File pickedImageFile =
        (await ImagePicker.pickImage(source: ImageSource.gallery));
    setState(() {
      _pickedImage = pickedImageFile;
    });
    widget.imagePickFn(pickedImageFile);
  }

  void _showPrompt() {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text("Pick Image From"),
              actions: [
                TextButton(onPressed: () {}, child: Text("Camera")),
                TextButton(
                  onPressed: () {},
                  child: Text("Gallery"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage) : null,
        ),
        FlatButton.icon(
          textColor: Theme.of(context).primaryColor,
          onPressed: _showPrompt,
          icon: Icon(Icons.image),
          label: Text('Add Image'),
        ),
      ],
    );
  }
}
