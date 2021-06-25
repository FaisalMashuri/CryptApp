import 'package:flutter/material.dart';
import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String apiUrl =
      "https://api.nomics.com/v1/currencies/ticker?key=2c2e7f25370b8257b85f92c5f8bfda8302a7b4f3&ids=BTC,ETH,XRP,BNB,DOGE,ADA,BTT,ETC,LTC,MATIC,TFUEL,VIDY,&interval=1d,30d&convert=EUR&per-page=100&page=1";

  Future<List<dynamic>> _fecthDataUsers() async {
    var result = await http.get(apiUrl);
    return json.decode(result.body);
  }

int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext contexr) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CryptApp'),
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: _fecthDataUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            NetworkImage(snapshot.data[index]['logo_url']),
                      ),
                      title: Text("( " + snapshot.data[index]['symbol'] +
                          " " + " ) " +
                          snapshot.data[index]['name']),
                      subtitle: Text(snapshot.data[index]['price'] + " USD"),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Call"),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: "Camera"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
