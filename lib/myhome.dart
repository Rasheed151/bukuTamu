import 'dart:async';
import 'dart:convert';
import 'package:admin/delete.dart';
import 'package:admin/tambahin.dart';
import 'package:admin/myhome.dart';
import 'package:admin/update.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Myhome extends StatefulWidget {
  // const Myhome({Key? key}) : super(key: key);
//  final VoidCallback signOut;
//  Myhome(this.signOut);

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
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
        backgroundColor: Color.fromARGB(255, 252, 252, 252),
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
    title: Text(dataList[index]['nama']),
    subtitle: Row(
      children: [
        // Text("No HP"),
        // SizedBox(width: 4), 
        Text(dataList[index]['noTelp']),
        SizedBox(width: 8), 
        // Text("Ruangan"),
        // SizedBox(width: 4), 
        Text(dataList[index]['ruangan']),
        SizedBox(width: 8), 
        Text(dataList[index]['namaPasien']),
        SizedBox(width: 8), 
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Update(
                  id: int.parse(dataList[index]['id']),
                  data: {
                    "nama": dataList[index]["nama"],
                    "noTelp": dataList[index]["noTelp"],
                    "namaPasien": dataList[index]["namaPasien"],
                    "ruangan": dataList[index]["ruangan"],
                  },
                ),
                
              ),
            );
          },
          child: Text('Update'),
          
        ),

        
        ElevatedButton(
          onPressed: () {
            int id = int.parse(dataList[index]['id']);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => delete(id: id ),
              ),
            );
          },
          
          child: Text("delete"),
        ),
      ],
    ),
  ),
);

                    },
                  );
                }
                return Text('Loading...');
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => krit(),
                  ),
                );
              },
              
              child: Text("tambahin"),
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
