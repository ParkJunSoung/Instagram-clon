import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  final User user;;

  CreatePage(this.user);

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
          IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                _uploadPost(context);
              })
        ],
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }



  Future<void> _uploadPost(BuildContext context) async {
    final firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('post')
        .child('${DateTime
        .now()
        .millisecondsSinceEpoch}.png');

    final task = await firebaseStorageRef.putFile(
        _image, SettableMetadata(contentType: 'image/png'));

    var uri = await task.ref.getDownloadURL();

      var doc = FirebaseFirestore.instance.collection('post').doc();
      doc.set({
        'id': doc.id,
        'photoUrl': uri.toString(),
        'contents': textEditingController.text,
        'email': widget.user.email,
        'displayName': widget.user.displayName,
        'userPhotoUrl': widget.user.photoURL
      }).then((value) {
        Navigator.pop(context);
      });
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
    File _image;
    final picker = ImagePicker();
    var image = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image.path);
    });
  }
}
