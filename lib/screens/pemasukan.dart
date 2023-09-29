import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../data/model/model.dart';

class TambahPemasukanPage extends StatefulWidget {
  @override
  _TambahPemasukanPageState createState() => _TambahPemasukanPageState();
}

class _TambahPemasukanPageState extends State<TambahPemasukanPage> {
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _jumlahController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();
  final DateTime _initialDate = DateTime(2021, 1, 1);

//WidgetsFlutterBinding.ensureInitialized();

  Future<void> _initDatabase() async {}

  Future<void> _simpanPemasukan(Uang uang) async {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    final String tanggal = dateFormat.format(_initialDate);
    final String jumlah = _jumlahController.text;
    final String keterangan = _keteranganController.text;

    // Simpan data ke database SQLite
    final database = openDatabase(
      join(await getDatabasesPath(), 'pemasukan.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE uangs(id INTEGER PRIMARY KEY, tanggal TEXT, jumlah TEXT, keterangan TEXT)');
      },
      version: 1,
    );

    final db = await database;

    print('Data berhasil dimasukan: ${uang}');
    await db.insert(
      'uangs',
      uang.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    // Kembali ke halaman "Beranda"
    //Navigator.of(context).pop();
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
        title: Text('Tambah Pemasukan'),
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
              onPressed: () {
                Uang _uang = new Uang(
                    tanggal: _tanggalController.text,
                    jumlah: _jumlahController.text,
                    keterangan: _keteranganController.text);
                _simpanPemasukan(_uang);
              },
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
