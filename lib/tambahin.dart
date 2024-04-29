import 'package:admin/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(krit());
}

class krit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
   MyHomePage({super.key});

  final TextEditingController nickName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController room = TextEditingController();
  final TextEditingController pantientsName = TextEditingController();

  Future kirimData() async {
    var url = Uri.http("localhost", "koneksi/simpan.php", {'q': '{http}'});
    var respon = await http.post(url,
    body: {
      "nama": nickName.text,
      "noTelp": phoneNumber.text,
      "ruangan": room.text,
      "namaPasien": pantientsName.text
    });

    var data = json.decode(respon.body);
    if (data.toString() == "Berhasil") {
      print("Gass");
    } else {
      print("Gagal");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menjenguk Pasien"),
        leading: Icon(Icons.account_circle_outlined),
        actions: [Icon(Icons.logout)],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: nickName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nama Penjenguk',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: phoneNumber,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'No Telp',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: pantientsName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nama Pasien',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                  controller: room,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ruangan',
                  )),
            ),
            ElevatedButton(
              onPressed: () {
                kirimData();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(20.0, 100.0),
              ),
              child: Text("Selesai"),
            ),
          ],
        ),
      ),
    );
  }
}
