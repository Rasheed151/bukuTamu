
import 'package:admin/main.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class delete extends StatelessWidget {
  final int id;

  delete({required this.id});

  Future<void> _deleteData(BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse("http://localhost/koneksi/delete.php"),
        body: {"id": id.toString()},
      );
      if (response.statusCode == 200) {
        final Data = jsonDecode(response.body);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Data berhasil dihapus'),
        ));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyApp(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Gagal menghapus data'),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Terjadi kesalahan: $e'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hapus Datanya'),
        backgroundColor: const Color.fromARGB(255, 0, 5, 150),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            SizedBox(height: 16),
            Text(
              'yakin menghapus data ini?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _deleteData(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 94, 188, 242),
                  ),
                  child: Text(
                    'Hapus',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),

                SizedBox(width: 16),
                
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                    style:ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 54, 67, 244),
                    ),
                  child: Text(
                    'Jangan',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}