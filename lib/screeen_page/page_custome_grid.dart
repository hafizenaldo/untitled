import 'package:flutter/material.dart';

class DetailGrid extends StatelessWidget {
  final Map<String, dynamic> movieDetails;

  const DetailGrid(this.movieDetails, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(movieDetails["judul"]),
        ),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    "gambar/${movieDetails["gambar"]}",
                    width: 200,
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "Judul: ${movieDetails["judul"]}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    "Harga: Rp. ${movieDetails["harga"]}",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            ),
        );
    }
}


class PageCustomeGrid extends StatefulWidget {
  const PageCustomeGrid({key}) : super(key: key);

  @override
  State<PageCustomeGrid> createState() => _PageCustomeGridState();
}

class _PageCustomeGridState extends State<PageCustomeGrid> {
  List<Map<String, dynamic>> listMovie = [
    {
      "judul": "INTERSTELLAR",
      "gambar": "film1.jpeg",
      "harga": 75000,
    },
    {
      "judul": "WIDOWS",
      "gambar": "film2.jpeg",
      "harga": 85000,
    },
    {
      "judul": "AVATAR",
      "gambar": "film3.jpeg",
      "harga": 50000,
    },
    {
      "judul": "COLLATERAL",
      "gambar": "film4.jpeg",
      "harga": 65000,
    },
    {
      "judul": "AVENGERS END GAME",
      "gambar": "film5.jpeg",
      "harga": 50000,
    },
    {
      "judul": "GLASS",
      "gambar": "film7.jpeg",
      "harga": 47000,
    },
    {
      "judul": "BTAMAN",
      "gambar": "film8.jpeg",
      "harga": 60000,
    },
    {
      "judul": "LAGOMERA",
      "gambar": "film9.jpeg",
      "harga": 30000,
    },
    {
      "judul": "BIG HERO 6",
      "gambar": "film10.jpeg",
      "harga": 90000,
    },
    {
      "judul": "WALL.E",
      "gambar": "film11.jpeg",
      "harga": 80000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Custom Grid"),
          backgroundColor: Colors.green,
        ),
        body: GridView.builder(
            itemCount: listMovie.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailGrid(listMovie[index]),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridTile(
                    footer: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.black),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${listMovie[index]["judul"]}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text("Rp. ${listMovie[index]["harga"]}"),
                        ],
                      ),
                    ),
                    child: Image.asset("gambar/${listMovie[index]["gambar"]}"),
                  ),
                ),
              );
            },
            ),
        );
    }
}
