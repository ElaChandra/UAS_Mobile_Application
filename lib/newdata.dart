import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class NewData extends StatefulWidget {
  @override
  _NewDataState createState() => _NewDataState();
}

class _NewDataState extends State<NewData> {
  TextEditingController nama = new TextEditingController();
  TextEditingController spesialis = new TextEditingController();
  TextEditingController alamat = new TextEditingController();
  TextEditingController notelp = new TextEditingController();
  void addData() {
    var url = "http://192.168.18.45/app_uas/_api/add.php";
    http.post(url, body: {
      "nama": nama.text,
      "spesialis": spesialis.text,
      "alamat": alamat.text,
      "no_telp": notelp.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Data"),
      ),
      body: ListView(
        children: [
          TextField(
            controller: nama,
            decoration: InputDecoration(
                hintText: "Enter Nama", labelText: "Enter Nama"),
          ),
          TextField(
            controller: spesialis,
            decoration: InputDecoration(
                hintText: "Enter Spesialis", labelText: "Enter Spesialis"),
          ),
          TextField(
            controller: alamat,
            decoration: InputDecoration(
                hintText: "Enter Alamat", labelText: "Enter Alamat"),
          ),
          TextField(
            controller: notelp,
            decoration: InputDecoration(
                hintText: "Enter No. Telp", labelText: "Enter No. Telp"),
          ),
          MaterialButton(
            child: Text("Add Data"),
            color: Colors.red,
            onPressed: () {
              addData();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => Home()),
              );
            },
          ),
        ],
      ),
    );
  }
}
