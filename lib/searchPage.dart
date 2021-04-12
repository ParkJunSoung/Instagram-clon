
import 'package:flutter/material.dart';
import 'package:instagram_clon/createPage.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context,
        MaterialPageRoute(builder: (context)=> CreatePage()));
      }
        ,
      backgroundColor: Colors.blue,
      child: Icon(Icons.create),),

    );
  }

 Widget buildBody() {
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      childAspectRatio: 1,
      mainAxisSpacing: 1,
      crossAxisSpacing: 1),
        itemCount: 5,
        itemBuilder: (context, index){
    return _buildListItem(context, index);
   });

 }

  Widget _buildListItem(BuildContext context, int index) {
    return Image.network('https://spnimage.edaily.co.kr/images/Photo/files/NP/S/2018/07/PS18070900090.jpg',fit: BoxFit.cover,);
  }
}
