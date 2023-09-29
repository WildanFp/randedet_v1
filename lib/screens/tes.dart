import 'package:flutter/material.dart';
import 'package:randedet_v1/screens/home_screen.dart';

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
                        builder: (context) => Screen(),
                      ),
                    );
                  },
                ),
                // Button Tambah Pengeluaran
                ImageButton(
                  image: AssetImage('assets/icons/outcome.png'),
                  label: 'Tambah Pengeluaran',
                  onPressed: () {
                    // Tambahkan logika navigasi ke halaman Tambah Pengeluaran
                  },
                ),
                // Button Detail Cash Flow
                ImageButton(
                  image: AssetImage('assets/icons/cashflow.jpeg'),
                  label: 'Detail Cash Flow',
                  onPressed: () {
                    // Tambahkan logika navigasi ke halaman Detail Cash Flow
                  },
                ),
                // Button Pengaturan
                ImageButton(
                  image: AssetImage('assets/icons/setting.png'),
                  label: 'Pengaturan',
                  onPressed: () {
                    // Tambahkan logika navigasi ke halaman Pengaturan
                  },
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

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
