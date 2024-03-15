import 'package:flutter/material.dart';
import 'package:untitled/screeen_page/page_colum.dart';
import 'package:untitled/screeen_page/page_passinng_data.dart';


class PageNavigationBar extends StatelessWidget {
  const PageNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Page Navigation Bar'),
      ),

      //drawer untuk menu samping
      drawer: SizedBox(
        width: 250,
        child: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Hafis Enaldo'),
                accountEmail: Text('enaldo.com'),
                currentAccountPicture: CircleAvatar(
                  radius: 55,
                  child: Icon(
                    Icons.person,
                    color: Colors.green,
                    size: 65,
                  ),
                ),
              ),
              ListTile(
                //untuk di klik
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PageRow()));
                },
                title: Text(
                    "Row Widget"
                ),
              ),
              Divider(),
              ListTile(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PageColumn()));
                },
                title: Text(
                    "Column Widget"
                ),
              ),
              Divider(),
              ListTile(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PageColumnRow()));
                },
                title: Text(
                    "Row & Column"
                ),
              ),
              Divider(),
              ListTile(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PageListHorizontal()));
                },
                title: Text(
                    "List Horizontal"
                ),
              ),
              Divider(),
              ListTile(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PagePassingData()));
                },
                title: Text(
                    "Passing Data"
                ),
              ),
              Divider(),
              ListTile(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PageLogin()));
                },
                title: Text(
                    "Login"
                ),
              ),
            ],
          ),
        ),
      ),

      body: Center(
        child: MaterialButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text('Back'),
        ),
      ),
    );
  }
}

class PageRow extends StatelessWidget {
  const PageRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Page Row'),
        ),

        //Row. column, list
        body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.add_business_sharp),
                Icon(Icons.person),
                Icon(
                  Icons.add_call,
                  color: Colors.orange,
                  size: 44,
                ),
              ],
            ),
            ),
        );
    }
}
class PageRow2 extends StatelessWidget {
  const PageRow2 ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text('Page Row'),
        ),

        //Row, Column, List
        body: Center(
            child: Row(
              // https://api.flutter.dev/flutter/widgets/Row-class.html
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                    Icons.add_business_sharp
                ),
                Icon(
                    Icons.person
                ),
                Icon(
                  Icons.add_call,
                  color: Colors.blueGrey,
                  size: 64,
                )
              ],
            )
           ),
        );
    }
}

