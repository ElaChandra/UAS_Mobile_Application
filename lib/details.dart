import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'editdata.dart';
import 'main.dart';

import 'package:http/http.dart' as http;


// ignore: must_be_immutable
class Details extends StatefulWidget {

  List list;
  int index;


  Details({this.list, this.index});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {


  void delete(){
    var url = "http://192.168.18.45/app_uas/_api/del.php";
    http.post(url,body: {
      'id':widget.list[widget.index]['id'],

    });
  }

void confirm(){

  AlertDialog alertDialog = new AlertDialog(
    content: Text("Yakin dihapus?"),
    actions: [
      MaterialButton(
        child: Text("Yakin"),
        onPressed: (){
          delete();
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context)=>Home())
          );
        },
      ),
      MaterialButton(
        child: Text("Batal"),
        onPressed: (){},
      ),

    ],
  );
   showDialog(builder: (context) => alertDialog, context: context);

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('${widget.list[widget.index]['nama']}'),
      ),
      body: Container(
        child: Column(
          children: [
            Text(
          widget.list[widget.index]['nama'],
          style: TextStyle(fontSize: 20.0),
        ),
            Text(
              widget.list[widget.index]['alamat'],

            ),
            MaterialButton(
              child: Text("Edit"),
              color: Colors.deepPurpleAccent,
              onPressed: ()=>Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context)=> Edit(list:widget.list,index:widget.index)),
              ),
            ),
            MaterialButton(
              child: Text("Delete"),
              color: Colors.deepPurpleAccent,
              onPressed: (){
                confirm();
              }
            )
          ],
        ),
      ),
    );
  }
}
