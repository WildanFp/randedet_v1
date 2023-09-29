import 'package:flutter/material.dart';
import 'package:randedet_v1/screens/home_screen.dart';
import 'package:randedet_v1/screens/pemasukan.dart';
import 'package:randedet_v1/screens/pengeluaran.dart';
import 'package:randedet_v1/screens/cashflow.dart';
import 'package:randedet_v1/screens/pengaturan.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final String _initialUsername = 'user';
  final String _initialPassword = 'user';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo aplikasi
            Icon(
              Icons.android, // Ganti dengan ikon aplikasi Anda
              size: 100,
            ),
            SizedBox(height: 10),
            // Nama aplikasi
            Text(
              'Nama Aplikasi Anda',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            // Field untuk username
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 10),
            // Field untuk password
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 20),
            // Tombol Login
            ElevatedButton(
              onPressed: () {
                // Verifikasi username dan password
                if (_usernameController.text == _initialUsername &&
                    _passwordController.text == _initialPassword) {
                  // Navigasi ke halaman Home
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                } else {
                  // Tampilkan pesan kesalahan jika username atau password salah
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Login Gagal'),
                        content: Text('Username atau password salah.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cash Flow Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Label total pengeluaran dan pemasukan
            Text(
              'Total Pengeluaran: \$5000',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Total Pemasukan: \$8000',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            // Grafik (gunakan gambar sebagai contoh)
            Image.asset('assets/images/grafik.jpg', height: 200),
            SizedBox(height: 20),
            // 4 Image Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Button Tambah Pemasukan
                ImageButton(
                  image: AssetImage('assets/icons/income.png'),
                  label: 'Tambah Pemasukan',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TambahPemasukanPage(),
                      ),
                    );
                  },
                ),
                // Button Tambah Pengeluaran
                ImageButton(
                  image: AssetImage('assets/icons/outcome.png'),
                  label: 'Tambah Pengeluaran',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TambahPengeluaranPage(),
                      ),
                    );
                  },
                ),
                // Button Detail Cash Flow
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ImageButton(
                      image: AssetImage('assets/icons/cashflow.jpeg'),
                      label: 'Detail Cash Flow',
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailCashFlowPage(),
                          ),
                        );
                      },
                    ),
                    // Button Pengaturan
                    ImageButton(
                      image: AssetImage('assets/icons/setting.png'),
                      label: 'Pengaturan',
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PengaturanPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ImageButton extends StatelessWidget {
  final ImageProvider image;
  final String label;
  final VoidCallback onPressed;

  const ImageButton({
    required this.image,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
