import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:untitled/lat_screen%20_page/pagenavigator.dart';
import 'package:untitled/lat_screen%20_page/pagenavigator2.dart';

class PageTugas extends StatelessWidget {
  const PageTugas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Projek MI 2C'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'gambar/logo.png',
                fit: BoxFit.contain,
                height: 100,
                width: 100,
              ),
              SizedBox(
                height: 8,
              ),
              // const Image(
              // image: NetworkImage(
              // 'https://flutter.github.io/assets-for-apidocs/assets/widgets/owl.jpg'),
              // fit: BoxFit.contain,
              // height: 100,
              // width: 100,
              // ),
              Text(
                'Selamat Datang di Politeknik Negeri Padang',
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Limau Manis, Padang, Sumbar',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  showToast('Manajemen Informatika',
                      context: context,
                      animation: StyledToastAnimation.slideFromTop,
                      reverseAnimation: StyledToastAnimation.slideToTop,
                      position: StyledToastPosition.top,
                      startOffset: Offset(0.0, -3.0),
                      reverseEndOffset: Offset(0.0, -3.0),
                      duration: Duration(seconds: 4),
                      //Animation duration animDuration * 2 <= duration
                      animDuration: Duration(seconds: 1),
                      curve: Curves.elasticOut,
                      reverseCurve: Curves.fastOutSlowIn
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageNavigator()));
                },
                child: Text(
                  'Manajemen Informatika',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize:
                  12),
                ),
                color: Colors.orange,
                textColor: Colors.white,
              ),
              SizedBox(
                height: 8,
              ),
              MaterialButton(
                onPressed: () {
                  showToast(
                    'Teknik Komputer',
                    context: context,
                    axis: Axis.horizontal,
                    alignment: Alignment.center,
                    position: StyledToastPosition.bottom,
                    toastHorizontalMargin: 20,
                    fullWidth: true,
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageTekomNavigator()));
                },
                child: Text(
                  'Teknik Komputer',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize:
                  12),
                ),
                color: Colors.orange,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
