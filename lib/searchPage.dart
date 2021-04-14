import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagramclon/createPage.dart';
import 'package:instagramclon/detail.dart';


class SearchPage extends StatefulWidget {
  final User user;

  SearchPage(this.user);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreatePage(widget.user)));
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.create),
      ),
    );
  }

  Widget buildBody() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('post').snapshots(),
      builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
        if(!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        var items = snapshot.data?.docs ?? [];

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 1,
            childAspectRatio: 1,
            mainAxisSpacing: 1,
            crossAxisCount: 3),
          itemCount: items.length,
          itemBuilder: (context, index){
            return _buildListItem(context, items[index]);
          }
          );
      },
    );
  }

  Widget _buildListItem(context, document) {
    return Hero(
      tag: document['photoUrl'],
      child: Material(
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
             return Detail(document);
            }));
          },
            child: Image.network(
              document['photoUrl'],
              fit: BoxFit.cover),

        ),
      ),
    );

  }
}
