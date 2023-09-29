import 'package:flutter/material.dart';

class Uang {
  final int? id;
  final String tanggal;
  final String jumlah;
  final String keterangan;

  const Uang({
    this.id,
    required this.tanggal,
    required this.jumlah,
    required this.keterangan,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tanggal': tanggal,
      'jumlah': jumlah,
      'keterangan': keterangan
    };
  }

  @override
  String toString() {
    return 'Uang{id: $id, tanggal: $tanggal, jumlah: $jumlah, keterangan: $keterangan}';
  }
}
