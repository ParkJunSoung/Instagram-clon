import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final User user;
  HomePage(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'instagram_clon',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              Text(
                '인스타그램오신것을 환영합니다.',
                style: TextStyle(fontSize: 24),
              ),
              Padding(padding: EdgeInsets.all(8)),
              Text('사진과 동영상을 보려면 팔로우하세요'),
              Padding(padding: EdgeInsets.all(16)),
              SizedBox(
                width: 260,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                user.photoURL),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Text(
                          '이메일 주소',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Text('이름'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 70,
                              height: 70,
                              child: Image.network(
                                  'https://spnimage.edaily.co.kr/images/Photo/files/NP/S/2018/07/PS18070900090.jpg',
                                  fit: BoxFit.cover),
                            ),
                            Padding(padding: EdgeInsets.all(1)),
                            SizedBox(
                              width: 70,
                              height: 70,
                              child: Image.network(
                                  'https://spnimage.edaily.co.kr/images/Photo/files/NP/S/2018/07/PS18070900090.jpg',
                                  fit: BoxFit.cover),
                            ),
                            Padding(padding: EdgeInsets.all(1)),
                            SizedBox(
                              width: 70,
                              height: 70,
                              child: Image.network(
                                'https://spnimage.edaily.co.kr/images/Photo/files/NP/S/2018/07/PS18070900090.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(6)),
                        Text('Facebook 친구'),
                        Padding(padding: EdgeInsets.all(4)),
                        ElevatedButton(
                          child: Text('팔로우'),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
