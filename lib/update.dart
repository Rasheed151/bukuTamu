import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:admin/main.dart';

class Update extends StatefulWidget {
  final int id;

  const Update({Key? key, required this.id, required Map<String, dynamic> data}) : super(key: key);

  @override
  _UpdateDataPageState createState() => _UpdateDataPageState();
}

class _UpdateDataPageState extends State<Update> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController noTelpController = TextEditingController();
  final TextEditingController ruanganController = TextEditingController();
  final TextEditingController namaPasienController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Datanya'),
        backgroundColor: Color.fromARGB(255, 29, 91, 248),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: namaController,
                decoration: InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama Anda tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: noTelpController,
                decoration: InputDecoration(labelText: 'No Telp'),
                validator: (value) {
                 
                  return null;
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: namaPasienController,
                decoration: InputDecoration(labelText: 'Nama Pasien'),
                validator: (value) {
                  
                  return null;
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: ruanganController,
                decoration: InputDecoration(labelText: 'ruangan'),
                validator: (value) {
                 
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    updateData();
                  }
                },
                child: Text('Update'),
              ),
                SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                   style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 54, 197, 244),
                   ),
                  child: Text(
                    'Kembali',
                  style: TextStyle(

                    fontWeight: FontWeight.normal,
                  ),
                  ),
                   
                  
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateData() async {

    var url = Uri.parse("http://localhost/koneksi/update.php");
    var response = await http.post(url, body: {
      "id": widget.id.toString(),
      "nama": namaController.text,
      "noTelp": noTelpController.text,
      "namaPasien": namaPasienController.text,
      "ruangan": ruanganController.text,
    });

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Succes'),
      ));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyApp(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Gagal memperbarui data'),
      ));
    }
  }
}

