import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();
  File _image;
 @override
  void dispose() {
   textEditingController.dispose();
    super.dispose();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     actions: [
       IconButton(icon: Icon(Icons.send), onPressed: (){})
     ],
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(onPressed: _getImage,
      child: Icon(Icons.add_a_photo),),
    );
  }

 Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
      children: [
        _image == null ? Text('No IMAGE') : Image.file(_image),
        TextField(
          decoration: InputDecoration(hintText: '내용을 입력하세요'),
          controller: textEditingController,
        )
      ],
    ),
    );
 }

Future _getImage() async {
  File image = await ImagePicker.pickImage(source: ImageSource.gallery);
  setState(() {
    _image = image;
  });
 }
}
