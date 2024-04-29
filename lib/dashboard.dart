import 'dart:async';
import 'dart:convert';
import 'package:admin/delete.dart';
import 'package:admin/tambahin.dart';
import 'package:admin/myhome.dart';
import 'package:admin/update.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Mycoba extends StatefulWidget {
  // const Myhome({Key? key}) : super(key: key);
//  final VoidCallback signOut;
//  Myhome(this.signOut);

  @override
  State<Mycoba> createState() => _MyhomeState();
}

class _MyhomeState extends State<Mycoba> {
  StreamController<dynamic> streamController = StreamController<dynamic>();
  Timer? _timer;

  Future _ambilData() async {
    var response = await http.get(Uri.parse('http://localhost/koneksi/read.php'));
    var data = jsonDecode(response.body);

    streamController.add(data);
  }
//   signOut() {
//    setState(() {
//      widget.signOut();
//    });
//  }

  getPref() async {
   SharedPreferences preferences = await SharedPreferences.getInstance();
   setState(() {
//      email = preferences.getString("email");
//      nama = preferences.getString("nama");
   });
 }

 

  @override
  void initState() {
    _ambilData();

    _timer = Timer.periodic(Duration(seconds: 5), (timer) => _ambilData());
    super.initState();

       super.initState();
   getPref();
  }

  @override
  void dispose() {
    if (_timer != null && _timer!.isActive) _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman admin"),
        // backgroundColor: Color.fromARGB(255, 252, 252, 252),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            
            StreamBuilder<dynamic>(
              stream: streamController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List dataList = snapshot.data;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: dataList.length,
                    
                    itemBuilder: (context, index) {
                      return Card(
                      elevation: 4,
                    child: ListTile(
                    title: Text(
                    dataList[index]['nama'],
                    textAlign: TextAlign.center,
                    ),),);
                    },
                  );
                }
                return Text('Loading...');
              },
            ),
          //         IconButton(
          //    onPressed: () {
          //      signOut();
          //    },
          //    icon: Icon(Icons.lock_open),
          //  )
          ],
        ),
      ),
    );
  }
  
}
