import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/model/model_user.dart';



class PageListUsers extends StatefulWidget {
  const PageListUsers({super.key});

  @override
  State<PageListUsers> createState() => _PageListUsersState();
}

class _PageListUsersState extends State<PageListUsers> {

  bool isLoading = false;
  List<ModelUsers> listUser = [];

  //method untuk get data dari api
  Future getUser() async{
    try{
      setState((){
        isLoading = true;
      });
      http.Response response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      var data = jsonDecode(response.body);
      setState(() {
        for(Map<String, dynamic> i in data){
          listUser.add(ModelUsers.fromJson(i));
        }
      });
    }catch(e){
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString()))
        );
      });
    }
  }





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('list Users Api'),
        ),
        body: ListView.builder(
            itemCount: listUser.length,
            itemBuilder: (context, index){
              return Padding(
                padding: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(
                    listUser[index].name ?? "",
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),
                  subtitle: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(listUser[index].email ?? ""),
                      // Text(listUser[index].address.city ?? ""),
                      Text("Company :${listUser[index].company.name} ?? """),
                      Text("City :${listUser[index].address.city} ?? """),
                    ],
                  ),
                ),
              );
            }
        ),
        );
    }


}
