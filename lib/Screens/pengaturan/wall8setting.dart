import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper8_kelompok8/Screens/Login/login_screen.dart';
import 'package:wallpaper8_kelompok8/Screens/dashboard/dashboard.dart';
import 'package:wallpaper8_kelompok8/Screens/reset%20password/reset.dart';

class Wall8Settings extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  final TextStyle headerStyle = TextStyle(
    color: Colors.grey.shade800,
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Pengaturan',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Dashboard()));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "AKUN",
              style: headerStyle,
            ),
            const SizedBox(height: 10.0),
            Card(
              elevation: 0.5,
              margin: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 0,
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/wallpaper8-login.appspot.com/o/akun.png?alt=media&token=6c4b9645-edba-487e-8c0e-67b013680d0a'),
                    ),
                    title: Text("Pengaturan Akun"),
                    onTap: () {},
                  ),
                  _buildDivider(),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/wallpaper8-login.appspot.com/o/padlock.png?alt=media&token=3b540683-adb1-4183-a70a-e819858638b5'),
                    ),
                    title: Text("Reset Password"),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ResetScreen()));
                    },
                  ),
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0,
              ),
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Logout"),
                onTap: () {
                  auth.signOut();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ),
            const SizedBox(height: 60.0),
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade300,
    );
  }
}
