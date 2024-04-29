// // import 'package:coba_flutter/loding.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:flutter/material.dart';
// // import 'dart:convert';

// // class HalamanUtama extends StatefulWidget {
// //   const HalamanUtama({Key? key}) : super(key: key);

// //   @override
// //   State<HalamanUtama> createState() => _HalamanUtamaState();
// // }

// // class _HalamanUtamaState extends State<HalamanUtama> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: Halaman(),
// //     );
// //   }
// // }

// // // ignore: must_be_immutable
// // class Halaman extends StatelessWidget {
// //   Halaman({Key? key}) : super(key: key);

// //   final TextEditingController nickName = TextEditingController();
// //   final TextEditingController phoneNumber = TextEditingController();
// //   final TextEditingController Room = TextEditingController();
// //   final TextEditingController PantientsName = TextEditingController();

// //   DateTime currentDate = DateTime.now();

// //   Future<void> kirimData() async {
// //     var url = Uri.http("localhost", "koneksi/simpan.php", {'q': '{http}'});
// //     var respon = await http.post(
// //       url,
// //       body: {
// //         "nama": nickName.text,
// //         "no_telp": phoneNumber.text,
// //         "ruangan": Room.text,
// //         "nama_pasien": PantientsName.text,
// //         "tanggal": currentDate.toString(),
// //       },
// //     );

// //     var data = json.decode(respon.body);
// //     if (data.toString() == 'Berhasil') {
// //       print("Tersambung!");
// //     } else {
// //       print("Gagal!");
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(
// //           "Guest Data Information",
// //           style: TextStyle(
// //             fontSize: 30.0,
// //           ),
// //         ),
// //         centerTitle: true,
// //         flexibleSpace: Container(
// //           decoration: BoxDecoration(
// //             gradient: LinearGradient(
// //               begin: Alignment.topLeft,
// //               end: Alignment.bottomRight,
// //               colors: <Color>[
// //                 Colors.green,
// //                 Colors.blue,
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: EdgeInsets.all(20),
// //           child: Column(
// //             children: <Widget>[
// //               Container(
// //                 margin: EdgeInsets.symmetric(vertical: 30),
// //                 child: TextField(
// //                   controller: nickName,
// //                   decoration: InputDecoration(
// //                       border: OutlineInputBorder(), labelText: "Name"),
// //                   onChanged: (text) {
// //                     (() {});
// //                   },
// //                 ),
// //               ),
// //               Container(
// //                 margin: EdgeInsets.symmetric(vertical: 30),
// //                 child: TextField(
// //                   controller: phoneNumber,
// //                   decoration: InputDecoration(
// //                       border: OutlineInputBorder(), labelText: "Phone Number"),
// //                   onChanged: (text) {
// //                     (() {});
// //                   },
// //                 ),
// //               ),
// //               Container(
// //                 margin: EdgeInsets.symmetric(vertical: 30),
// //                 child: TextField(
// //                   controller: Room,
// //                   decoration: InputDecoration(
// //                       border: OutlineInputBorder(), labelText: "Room"),
// //                   onChanged: (text) {
// //                     (() {});
// //                   },
// //                 ),
// //               ),
// //               Container(
// //                 margin: EdgeInsets.symmetric(vertical: 30),
// //                 child: TextField(
// //                   controller: PantientsName,
// //                   decoration: InputDecoration(
// //                       border: OutlineInputBorder(),
// //                       labelText: "Patient's Name"),
// //                   onChanged: (text) {
// //                     (() {});
// //                   },
// //                 ),
// //               ),
// //               Container(
// //                 margin: EdgeInsets.symmetric(vertical: 20),
// //                 child: Text(
// //                   "Date: ${currentDate.day}-${currentDate.month}-${currentDate.year}",
// //                   style: TextStyle(
// //                     fontSize: 18.0,
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(height: 20),
// //               ElevatedButton(
// //                 onPressed: () {
// //                   kirimData();
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => Loading(),
// //                     ),
// //                   );
// //                 },
// //                 child: Text(
// //                   "SUBMIT",
// //                   style: TextStyle(
// //                     fontSize: 30.0,
// //                     fontFamily: 'Roboto',
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }



// // // beda lagi

// // update.dart

// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:intl/intl.dart'; 
// // import 'package:latihan_yutub/tampil.dart';

// // class UpdateDataPage extends StatefulWidget {
// //   final int id;

// //   const UpdateDataPage({Key? key, required this.id}) : super(key: key);

// //   @override
// //   _UpdateDataPageState createState() => _UpdateDataPageState();
// // }

// // class _UpdateDataPageState extends State<UpdateDataPage> {
// //   final _formKey = GlobalKey<FormState>();
// //   final TextEditingController namaController = TextEditingController();
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController genderController = TextEditingController();
// //   final TextEditingController lembagaController = TextEditingController();
// //   final TextEditingController keperluanController = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Update Datanya'),
// //         backgroundColor: Colors.teal,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Form(
// //           key: _formKey,
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.stretch,
// //             children: [
// //               TextFormField(
// //                 controller: namaController,
// //                 decoration: InputDecoration(labelText: 'Nama'),
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Nama Anda tidak boleh kosong';
// //                   }
// //                   return null;
// //                 },
// //               ),
// //               SizedBox(height: 12),
// //               TextFormField(
// //                 controller: emailController,
// //                 decoration: InputDecoration(labelText: 'Email / No. Telp'),
// //                 validator: (value) {
                 
// //                   return null;
// //                 },
// //               ),
// //               SizedBox(height: 12),
// //               TextFormField(
// //                 controller: genderController,
// //                 decoration: InputDecoration(labelText: 'Gender'),
// //                 validator: (value) {
                  
// //                   return null;
// //                 },
// //               ),
// //               SizedBox(height: 12),
// //               TextFormField(
// //                 controller: lembagaController,
// //                 decoration: InputDecoration(labelText: 'Lembaga'),
// //                 validator: (value) {
                 
// //                   return null;
// //                 },
// //               ),
// //               SizedBox(height: 12),
// //               TextFormField(
// //                 controller: keperluanController,
// //                 decoration: InputDecoration(labelText: 'Keperluan'),
// //                 validator: (value) {
                 
// //                   return null;
// //                 },
// //               ),
// //               SizedBox(height: 20),
// //               ElevatedButton(
// //                 onPressed: () {
// //                   if (_formKey.currentState!.validate()) {
// //                     updateData();
// //                   }
// //                 },
// //                 child: Text('Update'),
// //               ),
// //                 SizedBox(width: 15),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     Navigator.pop(context);
// //                   },
// //                    style: ElevatedButton.styleFrom(
// //                     primary: Colors.red,
// //                    ),
// //                   child: Text(
// //                     'Kembali',
// //                   style: TextStyle(

// //                     fontWeight: FontWeight.normal,
// //                   ),
// //                   ),
                   
                  
// //                 ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Future<void> updateData() async {
// //     DateTime now = DateTime.now();
// //     String date = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

// //     var url = Uri.parse('http://localhost/koneksi/update.php');
// //     var response = await http.post(url, body: {
// //       "id": widget.id.toString(),
// //       "nama": namaController.text,
// //       "email": emailController.text,
// //       "gender": genderController.text,
// //       "lembaga": lembagaController.text,
// //       "keperluan": keperluanController.text,
// //       "tanggal": date,
// //     });

// //     if (response.statusCode == 200) {
// //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //         content: Text('Data berhasil diupdate'),
// //       ));

// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(
// //           builder: (context) => HomePage(),
// //         ),
// //       );
// //     } else {
// //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //         content: Text('Gagal memperbarui data'),
// //       ));
// //     }
// //   }
// // }


// // //beda lagi juga


// // update.dart

// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:intl/intl.dart'; 
// // import 'package:latihan_yutub/tampil.dart';

// // class UpdateDataPage extends StatefulWidget {
// //   final int id;

// //   const UpdateDataPage({Key? key, required this.id}) : super(key: key);

// //   @override
// //   _UpdateDataPageState createState() => _UpdateDataPageState();
// // }

// // class _UpdateDataPageState extends State<UpdateDataPage> {
// //   final _formKey = GlobalKey<FormState>();
// //   final TextEditingController namaController = TextEditingController();
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController genderController = TextEditingController();
// //   final TextEditingController lembagaController = TextEditingController();
// //   final TextEditingController keperluanController = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Update Datanya'),
// //         backgroundColor: Colors.teal,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Form(
// //           key: _formKey,
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.stretch,
// //             children: [
// //               TextFormField(
// //                 controller: namaController,
// //                 decoration: InputDecoration(labelText: 'Nama'),
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Nama Anda tidak boleh kosong';
// //                   }
// //                   return null;
// //                 },
// //               ),
// //               SizedBox(height: 12),
// //               TextFormField(
// //                 controller: emailController,
// //                 decoration: InputDecoration(labelText: 'Email / No. Telp'),
// //                 validator: (value) {
                 
// //                   return null;
// //                 },
// //               ),
// //               SizedBox(height: 12),
// //               TextFormField(
// //                 controller: genderController,
// //                 decoration: InputDecoration(labelText: 'Gender'),
// //                 validator: (value) {
                  
// //                   return null;
// //                 },
// //               ),
// //               SizedBox(height: 12),
// //               TextFormField(
// //                 controller: lembagaController,
// //                 decoration: InputDecoration(labelText: 'Lembaga'),
// //                 validator: (value) {
                 
// //                   return null;
// //                 },
// //               ),
// //               SizedBox(height: 12),
// //               TextFormField(
// //                 controller: keperluanController,
// //                 decoration: InputDecoration(labelText: 'Keperluan'),
// //                 validator: (value) {
                 
// //                   return null;
// //                 },
// //               ),
// //               SizedBox(height: 20),
// //               ElevatedButton(
// //                 onPressed: () {
// //                   if (_formKey.currentState!.validate()) {
// //                     updateData();
// //                   }
// //                 },
// //                 child: Text('Update'),
// //               ),
// //                 SizedBox(width: 15),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     Navigator.pop(context);
// //                   },
// //                    style: ElevatedButton.styleFrom(
// //                     primary: Colors.red,
// //                    ),
// //                   child: Text(
// //                     'Kembali',
// //                   style: TextStyle(

// //                     fontWeight: FontWeight.normal,
// //                   ),
// //                   ),
                   
                  
// //                 ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Future<void> updateData() async {
// //     DateTime now = DateTime.now();
// //     String date = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

// //     var url = Uri.parse('http://localhost/koneksi/delete.php');
// //     var response = await http.post(url, body: {
// //       "id": widget.id.toString(),
// //       "nama": namaController.text,
// //       "email": emailController.text,
// //       "gender": genderController.text,
// //       "lembaga": lembagaController.text,
// //       "keperluan": keperluanController.text,
// //       "tanggal": date,
// //     });

// //     if (response.statusCode == 200) {
// //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //         content: Text('Data berhasil diupdate'),
// //       ));

// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(
// //           builder: (context) => HomePage(),
// //         ),
// //       );
// //     } else {
// //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //         content: Text('Gagal memperbarui data'),
// //       ));
// //     }
// //   }
// // }




dsanadnasidasdhaisohdiasohdiaoshdisahdo



// import 'dart:async';
// import 'dart:convert';
// import 'package:admin/delete.dart';
// import 'package:admin/tambahin.dart';
// import 'package:admin/myhome.dart';
// import 'package:admin/update.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(MaterialApp(
//     home: Login1(),
//     theme: ThemeData(),
//   ));
// }

// class Login1 extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }

// enum LoginStatus { notSignIn, signIn }

// class _LoginState extends State<Login1> {
//   LoginStatus _loginStatus = LoginStatus.notSignIn;
//   late String username, password;
//     final TextEditingController  username1= TextEditingController();
//   final TextEditingController  password1 = TextEditingController();
//   final _key = GlobalKey<FormState>();

//   bool _secureText = true;

//   showHide() {
//     setState(() {
//       _secureText = !_secureText;
//     });
//   }

//   check() {
//     final form = _key.currentState;
//     if (form!.validate()) {
//       form.save();
//       login();
//     }
//   }

//   login() async {
//     final response = await http.post(
//       Uri.parse("http://localhost/koneksi/login1.php"),
//       body: {"username": username, "password": password},
//     );
//     final data = jsonDecode(response.body);
//     int value = data['value'];
//     String pesan = data['message'];
//     String? emailAPI = data['email'];
//     String? namaAPI = data['nama'];
//     String? id = data['id'];
//     if (value == 1 && username1 == username && password1 == password) {
//       setState(() {
//         _loginStatus = LoginStatus.signIn;
//         savePref(value, emailAPI, namaAPI, id);
//       });
//       print(pesan);
//     } else {
//       print(pesan);
//     }
//   }

//   savePref(int value, String? email, String? nama, String? id) async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     setState(() {
//       preferences.setInt("value", value);
//       preferences.setString("nama", nama ?? "");
//       preferences.setString("email", email ?? "");
//       preferences.setString("id", id ?? "");
//       preferences.commit();
//     });
//   }

//   var value;
//   getPref() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     setState(() {
//       value = preferences.getInt("value");
//       _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
//     });
//   }

//   signOut() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     setState(() {
//       preferences.remove("value");
//       preferences.commit();
//       _loginStatus = LoginStatus.notSignIn;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     getPref();
//   }

//   @override
//   Widget build(BuildContext context) {
//     switch (_loginStatus) {
//       case LoginStatus.notSignIn:
//         return Scaffold(
//           appBar: AppBar(
//             title: Text("Login"),
//           ),
//           body: Form(
//             key: _key,
//             child: ListView(
//               padding: EdgeInsets.all(16.0),
//               children: <Widget>[
//                 TextFormField(
//                   validator: (e) {
//                     if (e!.isEmpty) {
//                       return "Please insert email";
//                     }
//                   },
//                   controller: username1,
//                   onSaved: (e) => username = e!,
//                   decoration: InputDecoration(
//                     labelText: "email",
//                   ),
//                 ),
//                 TextFormField(
//                   validator: (e) {
//                     if (e!.isEmpty) {
//                       return "Please insert email";
//                     }
//                   },
//                   controller: password1,
//                   obscureText: _secureText,
//                   onSaved: (e) => password = e!,
//                   decoration: InputDecoration(
//                     labelText: "Password",
//                     suffixIcon: IconButton(
//                       onPressed: showHide,
//                       icon: Icon(_secureText
//                           ? Icons.visibility_off
//                           : Icons.visibility),
//                     ),
//                   ),
//                 ),
//                 MaterialButton(
//                   onPressed: () {
//                     check();
//                   },
//                   child: Text("Login"),
//                 ),
//               ],
//             ),
//           ),
//         );
//       case LoginStatus.signIn:
//         return Myhome(signOut);
//     }
//   }
// }


// // class Myhome extends StatefulWidget {
// //   // const Myhome({Key? key}) : super(key: key);
// //  final VoidCallback signOut;
// //  Myhome(this.signOut);

// //   @override
// //   State<Myhome> createState() => _MyhomeState();
// // }

// // class _MyhomeState extends State<Myhome> {
// //   StreamController<dynamic> streamController = StreamController<dynamic>();
// //   Timer? _timer;

// //   Future _ambilData() async {
// //     var response = await http.get(Uri.parse('http://localhost/koneksi/read.php'));
// //     var data = jsonDecode(response.body);

// //     streamController.add(data);
// //   }
// //   signOut() {
// //    setState(() {
// //      widget.signOut();
// //    });
// //  }

// //   getPref() async {
// //    SharedPreferences preferences = await SharedPreferences.getInstance();
// //    setState(() {
// // //      email = preferences.getString("email");
// // //      nama = preferences.getString("nama");
// //    });
// //  }

 

// //   @override
// //   void initState() {
// //     _ambilData();

// //     _timer = Timer.periodic(Duration(seconds: 5), (timer) => _ambilData());
// //     super.initState();

// //        super.initState();
// //    getPref();
// //   }

// //   @override
// //   void dispose() {
// //     if (_timer != null && _timer!.isActive) _timer!.cancel();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Halaman admin"),
// //         backgroundColor: Color.fromARGB(255, 252, 252, 252),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: <Widget>[
// //             StreamBuilder<dynamic>(
// //               stream: streamController.stream,
// //               builder: (context, snapshot) {
// //                 if (snapshot.hasData) {
// //                   List dataList = snapshot.data;
// //                   return ListView.builder(
// //                     shrinkWrap: true,
// //                     itemCount: dataList.length,
                    
// //                     itemBuilder: (context, index) {
// //                       return Card(
// //   elevation: 4,
// //   child: ListTile(
// //     title: Text(dataList[index]['nama']),
// //     subtitle: Row(
// //       children: [
// //         // Text("No HP"),
// //         // SizedBox(width: 4), 
// //         Text(dataList[index]['noTelp']),
// //         SizedBox(width: 8), 
// //         // Text("Ruangan"),
// //         // SizedBox(width: 4), 
// //         Text(dataList[index]['ruangan']),
// //         SizedBox(width: 8), 
// //         Text(dataList[index]['namaPasien']),
// //         SizedBox(width: 8), 
// //         ElevatedButton(
// //           onPressed: () {
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(
// //                 builder: (context) => Update(
// //                   id: int.parse(dataList[index]['id']),
// //                   data: {
// //                     "nama": dataList[index]["nama"],
// //                     "noTelp": dataList[index]["noTelp"],
// //                     "namaPasien": dataList[index]["namaPasien"],
// //                     "ruangan": dataList[index]["ruangan"],
// //                   },
// //                 ),
                
// //               ),
// //             );
// //           },
// //           child: Text('Update'),
          
// //         ),

        
// //         ElevatedButton(
// //           onPressed: () {
// //             int id = int.parse(dataList[index]['id']);
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(
// //                 builder: (context) => delete(id: id ),
// //               ),
// //             );
// //           },
          
// //           child: Text("delete"),
// //         ),
// //       ],
// //     ),
// //   ),
// // );

// //                     },
// //                   );
// //                 }
// //                 return Text('Loading...');
// //               },
// //             ),
// //             ElevatedButton(
// //               onPressed: () {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(
// //                     builder: (context) => krit(),
// //                   ),
// //                 );
// //               },
              
// //               child: Text("tambahin"),
// //             ),
// //                   IconButton(
// //              onPressed: () {
// //                signOut();
// //              },
// //              icon: Icon(Icons.lock_open),
// //            )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
  
// // }
