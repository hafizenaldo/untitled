import 'package:flutter/material.dart';

class PagePassingData extends StatelessWidget {
  const PagePassingData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Page Passing Data'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              title: Text('Judul Berita ke ${index}'),
              subtitle: Text('ini sub judul berita ke ${index}'),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PageGetData(index)));
              },
            ),
          );
        },
      ),
    );
  }
}

class PageGetData extends StatelessWidget {
  final int index;
  const PageGetData(this.index,{super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Page Get Data'),
      ),

      body: Center(
        child: Column(
          children: [
            Text('Ini adalah judul berita ke ${index}'),
            Text('Ini adalah sub judul berita ke ${index}'),
          ],
        ),
      ),
    );
  }
}

class PageLogin extends StatefulWidget {
  const PageLogin({Key? key}) : super(key: key);

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Page Login'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            TextFormField(
              controller: txtUsername,
              decoration: InputDecoration(
                  hintText: 'Input Username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: txtPassword,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Input Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(height: 15),
            MaterialButton(
              onPressed: () {
                String username = txtUsername.text;
                String pwd = txtPassword.text;

                if (username == 'admin' && pwd == '123456') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomePage(),
                    ),
                  );
                } else {
                  _showSnackBar(context, 'password anda salah silahkan coba lagi');
                }
              },
              child: Text('Login'),
              color: Colors.green,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Welcome Admin'),
      ),
      body: Center(
        child: Text('Hello, Selamat Datang Admin'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
      home: PageLogin(),
      ));
}
