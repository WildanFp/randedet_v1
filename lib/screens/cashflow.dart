import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DetailCashFlowPage extends StatefulWidget {
  @override
  _DetailCashFlowPageState createState() => _DetailCashFlowPageState();
}

class _DetailCashFlowPageState extends State<DetailCashFlowPage> {
  List<Map<String, dynamic>> _data = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Cash Flow'),
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          final item = _data[index];
          final bool isPengeluaran = item['jenis'] == 'pengeluaran';

          return ListTile(
            leading: Icon(
              isPengeluaran ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
              color: isPengeluaran ? Colors.red : Colors.green,
            ),
            title: Text(item['keterangan']),
            subtitle: Text(item['tanggal']),
            trailing: Text(
              'Rp ${item['jumlah']}',
              style: TextStyle(
                color: isPengeluaran ? Colors.red : Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
