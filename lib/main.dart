import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled46/sayfa1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

 Future<void> veriKaydi () async
  {
    var sp = await SharedPreferences.getInstance();

    sp.setString("ad", "ahmet");
    sp.setInt("yas", 18);
    sp.setDouble("boy", 1.78);
    sp.setBool("bekar_mi", false);

    var arkadasListe = <String>["Ece","Ali","Kenan","Tiffany"];

    sp.setStringList("arkadasListesi", arkadasListe);

  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Ana sayfa yüklendi.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main PAge"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: ()
                {
                  veriKaydi();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => sayfa1()));
                }, child: Text("Basınız"),)

          ],
        ),
      ),

    );
  }
}
