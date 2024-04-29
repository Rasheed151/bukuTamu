import 'dart:convert';
import 'package:admin/Dashboard.dart';
import 'package:admin/myhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MaterialApp(
      home: LoginPage(),
    ));

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  Future _login() async {
    print("\n=======|> memanggil fungsi _login() ");

    var url = Uri.http("localhost", "flutter/login.php", {'q': '{http}'});
    var response = await http.post(
      url, 
      body: {
        "email" : email.text,
        "password" : password.text
        });
    var data = json.decode(response.body);
    
    if ( data.toString() == "Success") {
      print("Data 'log in' ditemukan!\n");
      setState(() {
        email.clear();
        password.clear();
      });

      Navigator.push(context,
       MaterialPageRoute(builder: (context) => Myhome()
       ));
    } else {
      print("Data tidak ada...\n"+data.toString());

      setState(() {
        password.clear();
      });
    }
        
  }



  

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Container(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          width: MediaQuery.of(context).size.width,
          // decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //         begin: Alignment.topRight,
          //         end: Alignment.bottomLeft,
          //         // ignore: prefer_const_literals_to_create_immutables
          //         colors: [
          //       Colors.deepOrangeAccent,
          //       Colors.red,
          //       Colors.redAccent
          //     ])),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(10),
                // child: error? Errormsg(Errormsg)  : Container(),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: const EdgeInsets.only(top: 10),
                child: TextField(
                  controller: email,
                  decoration: const InputDecoration(
                      label: Text("Username"), icon: Icon(Icons.person)),
                  onChanged: (value) {},
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: const EdgeInsets.only(top: 10),
                child: TextField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                      label: Text("Kata Sandi"), icon: Icon(Icons.lock_clock)),
                  onChanged: (value) {},
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 20),
                child: SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                           _login();
                        },
                        child: Text("Masuk"))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Login Demo',
//       home: LoginPage(),
//     );
//   }
// }

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   TextEditingController username = TextEditingController();
//   final TextEditingController password = TextEditingController();
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   // Future<void> _login() async {
//   //   if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
//   //     showDialog(
//   //       context: context,
//   //       builder: (BuildContext context) {
//   //         return AlertDialog(
//   //           title: Text('Login Failed'),
//   //           content: Text('Username and password cannot be empty'),
//   //           actions: <Widget>[
//   //             TextButton(
//   //               onPressed: () {
//   //                 Navigator.of(context).pop();
//   //               },
//   //               child: Text('OK'),
//   //             ),
//   //           ],
//   //         );
//   //       },
//   //     );
//   //     return;
//   //   }

//   //   final String url = 'http://localhost/koneksi/login.php';
    
// Future login() async {
//     var url = Uri.http("http://localhost/koneksi/login.php");
//     var respon = await http.post(url,
//     body: {
//       "username":_usernameController.text,
//       "password":_passwordController.text,
//     });

//     var data = jsonDecode(respon.body);
//     if(data.toString() == "success"){
//        Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => MyApp()),
//                     );

//     }else{
//       Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => MyApp()),
//                     );
//     };
// }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: username,
//               decoration: InputDecoration(labelText: 'Username'),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: password,
//               obscureText: true,
//               decoration: InputDecoration(labelText: 'Password'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: login,
//               child: Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }

