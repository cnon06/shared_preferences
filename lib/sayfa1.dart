
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sayfa1 extends StatefulWidget {
  const sayfa1({Key? key}) : super(key: key);

  @override
  State<sayfa1> createState() => _sayfa1State();
}

class _sayfa1State extends State<sayfa1> {

  Future<void> veriOku () async
  {
    var sp = await SharedPreferences.getInstance();

    String? ad =  sp.getString("ad") ?? "isim yok";
    int? yas = sp.getInt("yas") ?? 0;
    double? boy = sp.getDouble("boy") ?? 0;
    bool? bekarMi =  sp.getBool("bekar_mi") ?? false;

   // var arkadasListe = <String>["Ece","Ali","Kenan","Tiffany"];

   var arkadasListesi = sp.getStringList("arkadasListesi") ?? null;


    print('Ad: ${ad}');
    print('Yaş: ${yas}');
    print('Boy: ${boy}');
    print('Bekar mı?: ${bekarMi}');

    print('Arkadaş listesi');
    for(var i in arkadasListesi!)
      {
        print('$i');
    }

  }



  Future<void> adSil () async
  {
    var sp = await SharedPreferences.getInstance();

    sp.remove("ad");

  }

  Future<void> yasGuncelle () async
  {
    var sp = await SharedPreferences.getInstance();

    sp.setInt("yas",31);

    veriOku();

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Başladı');
   // veriOku();
  }

  @override
  Widget build(BuildContext context) {


    veriOku();

    return Scaffold(
      appBar: AppBar(
        title: Text("Main PAge"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Text("Sayfa 1 ",style: TextStyle(fontSize: 30),),
            ElevatedButton(onPressed: ()
                {
                  setState(() {
                    adSil();
                  });

                },
                child: Text("Ad Sil")),

            ElevatedButton(onPressed: ()
            {

               yasGuncelle();


            },
                child: Text("Yaş Güncelle"))


          ],
        ),
      ),

    );
  }
}
