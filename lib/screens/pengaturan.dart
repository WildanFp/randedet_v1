import 'package:flutter/material.dart';

class PengaturanPage extends StatefulWidget {
  @override
  _PengaturanPageState createState() => _PengaturanPageState();
}

class _PengaturanPageState extends State<PengaturanPage> {
  TextEditingController _passwordLamaController = TextEditingController();
  TextEditingController _passwordBaruController = TextEditingController();
  bool _passwordBenar =
      true; // Anda bisa mengganti ini sesuai logika validasi password lama

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Input password lama
            TextField(
              controller: _passwordLamaController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password Lama',
              ),
            ),
            SizedBox(height: 10),
            // Input password baru
            TextField(
              controller: _passwordBaruController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password Baru',
              ),
            ),
            SizedBox(height: 20),
            // Tombol untuk menyimpan password baru
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika validasi password lama di sini
                if (_passwordLamaController.text == 'password_lama') {
                  // Simpan password baru
                  // Anda dapat menambahkan logika penyimpanan password baru ke dalam database atau penyimpanan yang sesuai.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Password berhasil diubah!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else {
                  // Tampilkan pesan jika password lama salah
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Password lama salah.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: Text('Simpan Password Baru'),
            ),
            SizedBox(height: 20),
            // Foto, nama, dan nim Anda
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/foto_anda.jpg'), // Ganti dengan foto Anda
            ),
            SizedBox(height: 10),
            Text(
              'Nama Anda', // Ganti dengan nama Anda
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'NIM Anda', // Ganti dengan NIM Anda
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
