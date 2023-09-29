import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Untuk format tanggal
import 'package:sqflite/sqflite.dart'; // Untuk mengakses SQLite

class TambahPengeluaranPage extends StatefulWidget {
  @override
  _TambahPengeluaranPageState createState() => _TambahPengeluaranPageState();
}

class _TambahPengeluaranPageState extends State<TambahPengeluaranPage> {
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _jumlahController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();
  final DateTime _initialDate = DateTime(2021, 1, 1);

  Future<void> _simpanPengeluaran() async {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    final String tanggal = dateFormat.format(_initialDate);
    final String jumlah = _jumlahController.text;
    final String keterangan = _keteranganController.text;

    // Simpan data pengeluaran ke database SQLite

    // Kembali ke halaman "Beranda"
    Navigator.of(context).pop();
  }

  void _resetForm() {
    _tanggalController.text = DateFormat('dd/MM/yyyy').format(_initialDate);
    _jumlahController.text = '';
    _keteranganController.text = '';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _initialDate) {
      setState(() {
        _tanggalController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Pengeluaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Field untuk tanggal
            TextFormField(
              controller: _tanggalController,
              readOnly: true,
              onTap: () => _selectDate(context),
              decoration: InputDecoration(
                labelText: 'Tanggal',
              ),
            ),
            SizedBox(height: 10),
            // Field untuk jumlah
            TextFormField(
              controller: _jumlahController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Jumlah',
              ),
            ),
            SizedBox(height: 10),
            // Field untuk keterangan
            TextFormField(
              controller: _keteranganController,
              decoration: InputDecoration(
                labelText: 'Keterangan',
              ),
            ),
            SizedBox(height: 20),
            // Tombol Reset
            ElevatedButton(
              onPressed: _resetForm,
              child: Text('Reset'),
            ),
            SizedBox(height: 10),
            // Tombol Simpan
            ElevatedButton(
              onPressed: _simpanPengeluaran,
              child: Text('Simpan'),
            ),
            SizedBox(height: 10),
            // Tombol Kembali
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('<< Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
