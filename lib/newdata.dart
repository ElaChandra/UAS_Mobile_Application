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
  TextEditingController alamat = new TextEditingController();
  TextEditingController no_hp = new TextEditingController();
  TextEditingController agama = new TextEditingController();
  void addData() {
    var url = "http://192.168.56.1/uas_mobile_application/_api/add.php";
    http.post(url, body: {
      "nama": nama.text,
      "alamat": alamat.text,
      "no_hp": no_hp.text,
      "agama": agama.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data"),
      ),
      body: ListView(
        children: [
          TextField(
            controller: nama,
            decoration: InputDecoration(
                hintText: "Masukkan nama", labelText: "Ketik nama"),
          ),
          TextField(
            controller: alamat,
            decoration: InputDecoration(
                hintText: "Masukkan alamat", labelText: "Ketik alamat"),
          ),
          TextField(
            controller: no_hp,
            decoration: InputDecoration(
                hintText: "Masukkan no_hp", labelText: "Ketik no_hp"),
          ),
          TextField(
            controller: agama,
            decoration: InputDecoration(
                hintText: "Masukkan agama", labelText: "Ketik agama"),
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
