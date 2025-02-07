import 'package:bladi/utils/ColorBladi.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class HotelsScreen extends StatefulWidget {
  @override
  _HotelsScreenState createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  List list=[];
  Future GetData() async {
    var url ="http://192.168.1.107/project/fun/getData.php";
    var res = await http.get(Uri.parse(url));
    if(res.statusCode==200){//si reussi
      var red=json.decode(res.body);

      setState(() {
        list.addAll(red);
      });print(list);
    }
  }
  @override
  void initState() {//c'est comme initialisable
    // TODO: implement initState
    super.initState();
    GetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel'),

      ),
      body : ListView.builder(
        itemCount: list.length,
          itemBuilder:(context,i){
          return Padding(padding: EdgeInsets.all(8.0),
          child: Container(
            color: ColorBladi.main2Color,
            child: ListTile(
              title: Text("${list[i]["nom"]}"),
              subtitle: Text("${list[i]["image1"]}"),
            ),
          ),
          );
      })
    );
  }
}