import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const  ProfileScreen ({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //TODO: 1. Deklarasikan variabel yang dibutuhkan
  bool isSignedIn = false;
  String fullName = '';
  String userName = '';
  int favoriteCandiCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200, width: double.infinity, color: Colors.deepPurple,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  // TODO: 2. Buat bagian ProfileHeader yang berisi gambar profile
                  // TODO: 3. Buat bagian  ProfileInfo yang berisi info profile
                  // TODO: 4. Buat ProfileActions yang berisi TextButton sign in/out
                ],
              ),
          )
        ],
      ),
    );
  }
}



