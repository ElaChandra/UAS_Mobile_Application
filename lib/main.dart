import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'details.dart';
import 'newdata.dart';

void main()=>runApp(MaterialApp(
  title: "CRUD uas",
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primarySwatch: Colors.red,

  ),
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

  Future<List> getData() async{
    final responce = await http.get("http:192.168.56.1/uas_mobile_application/_api/getdata.php");
    return jsonDecode(responce.body);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD uas"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.of(context).push(
          MaterialPageRoute(

            builder: (BuildContext contex)=> NewData(),
            
          ),
        ),
        child: Icon(Icons.add),
      ),
      body:FutureBuilder<List>(
        future: getData(),
        builder: (ctx,ss) {
          if(ss.hasError){
            print("Error");
          }
          if(ss.hasData){
            return Items(list:ss.data);

          }
          else{
            return CircularProgressIndicator();

          }
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class Items extends StatelessWidget {

  List list;

  Items({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
       itemCount: list==null?0:list.length,
      itemBuilder: (ctx,i){
        return ListTile(

          leading: Icon(Icons.message),
          title: Text(list[i]['nama']),
          subtitle: Text(list[i]['alamat']),
          onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>Details(list:list,index:i),

          )),
        );

      }
    );
  }
}

