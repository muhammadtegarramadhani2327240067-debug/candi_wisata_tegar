import 'package:flutter/material.dart';
import 'package:wisata_candi_tegar/widgets/profile_info_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TODO 1. deklarasikan variabel yang dibutuhkan
  bool isSignedIn = true; // ubah ke true untuk menampilkan icon kamera/edit
  String userName = 'Muhammad Tegar Ramadhani';
  String userEmail = 'mtegarmdhni@email.com';
  int favoriteCandiCount = 2;

  void signIn() {
    setState(() {
      isSignedIn = true;
    });
  }

  void signOut() {
    setState(() {
      isSignedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // BACKGROUND UNGU
          Container(
            height: 200,
            width: size.width,
            color: Colors.deepPurple,
          ),

          // KONTEN
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildProfileHeader(),       // FOTO + NAMA
                const SizedBox(height: 16),
                _buildProfileInfo(),         // FULL NAME, EMAIL, FAVORITE
                const SizedBox(height: 20),
                _buildProfileAction(),       // SIGN IN / SIGN OUT
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================== PROFILE HEADER ==================
  Widget _buildProfileHeader() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        // 200 = tinggi container ungu, 50 = radius avatar
        // supaya avatar separuh di ungu, separuh di putih
        padding: const EdgeInsets.only(top: 150), // 200 - 50
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'assets/images/placeholder_image.png',
                  ),
                ),
                if (isSignedIn)
                  Container(
                    margin: const EdgeInsets.only(right: 4, bottom: 4),
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      size: 18,
                      color: Colors.black,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            // TEKS NAMA — sudah turun sedikit dari garis, tidak tumpang tindih
            Text(
              userName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================== PROFILE INFO ==================
  Widget _buildProfileInfo() {
    return Column(
      children: [
        const SizedBox(height: 16),
        const Divider(color: Colors.grey),
        const SizedBox(height: 4),
        ProfileInfoItem(
          icon: Icons.person,
          label: 'Full Name',
          value: userName,
          iconColor: Colors.deepPurple,
          showEditIcon: isSignedIn,
          onEditPressed: () {},
        ),
        const SizedBox(height: 4),
        const Divider(color: Colors.grey),
        const SizedBox(height: 4),
        ProfileInfoItem(
          icon: Icons.email,
          label: 'Email',
          value: userEmail,
          iconColor: Colors.deepPurple,
          showEditIcon: isSignedIn,
          onEditPressed: () {},
        ),
        const SizedBox(height: 4),
        const Divider(color: Colors.grey),
        const SizedBox(height: 4),
        ProfileInfoItem(
          icon: Icons.favorite,
          label: 'Favorite Candi',
          value: favoriteCandiCount > 0 ? '$favoriteCandiCount' : '',
          iconColor: Colors.deepPurple,
          showEditIcon: false,
        ),
      ],
    );
  }

  // ================== PROFILE ACTION ==================
  Widget _buildProfileAction() {
    return Column(
      children: [
        const SizedBox(height: 4),
        const Divider(color: Colors.grey),
        const SizedBox(height: 20),
        TextButton(
          onPressed: isSignedIn ? signOut : signIn,
          child: Text(isSignedIn ? 'Sign Out' : 'Sign In'),
        ),
      ],
    );
  }
}
