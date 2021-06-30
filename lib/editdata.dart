import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:http/http.dart' as http;

class Edit extends StatefulWidget {
  final List list;
  final int index;

  Edit({this.list, this.index});

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController nama;
  TextEditingController alamat;
  TextEditingController no_hp;
  TextEditingController agama;

  void editData() {
    var url = "hhttp://192.168.18.45/app_uas/_api/edit.php";
    http.post(url, body: {
      'id': widget.list[widget.index]['id'],
      'nama': nama.text,
      'alamat': alamat.text,
      'no_hp': no_hp.text,
      'agama': agama.text,
    });
  }

  @override
  void initState() {
    nama = TextEditingController(text: widget.list[widget.index]['nama']);
    alamat = TextEditingController(text: widget.list[widget.index]['alamat']);
    no_hp = TextEditingController(text: widget.list[widget.index]['no_hp']);
    agama = TextEditingController(text: widget.list[widget.index]['agama']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Data ${widget.list[widget.index]['name']}"),
      ),
      body: ListView(
        children: [
          TextField(
            controller: nama,
            decoration: InputDecoration(
                hintText: "Masukkan nama baru", labelText: "Masukkan nama baru"),
          ),
          TextField(
            controller: alamat,
            decoration: InputDecoration(
                hintText: "Masukkan alamat baru", labelText: "Masukkan alamat baru"),
          ),
          TextField(
            controller: no_hp,
            decoration: InputDecoration(
                hintText: "Ketik no_hp baru", labelText: "Ketik no_hp baru"),
          ),
          TextField(
            controller: agama,
            decoration: InputDecoration(
                hintText: "Masukkan agama", labelText: "Masukkan agama "),
          ),
          MaterialButton(
            child: Text("Edit Data"),
            onPressed: () {
              editData();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => Home()),
              );
            },
          )
        ],
      ),
    );
  }
}
