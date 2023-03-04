import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';
import 'package:myproject/hive/gorevClass.dart';
import 'package:myproject/main.dart';
import 'package:myproject/pages/gorevler.dart';

const String boxNameNotlar = "notlar";
const String boxNameAcikOturum = "acikoturum";

class anasayfa extends StatefulWidget {
  anasayfa({Key? key}) : super(key: key);

  @override
  State<anasayfa> createState() => _anasayfaState();
}

class _anasayfaState extends State<anasayfa> {

  Box<notlar> boxn = Hive.box<notlar>(boxNameNotlar);
  Box<AcikOturum> boxa = Hive.box(boxNameAcikOturum);

   List <String> acikOturumKullaniciNotlari=[];



  @override
  void initState() {
    super.initState();

    for(int i in boxn.keys ) {
      if(boxn.get(i)!.eposta==boxa.get(boxa.keys.last)!.eposta)
      {
        acikOturumKullaniciNotlari.add(boxn.get(i)!.not);
      }

    }

    }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("${acikOturumKullaniciNotlari.length} tane not var"),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              tooltip: 'Çıkış Yap',
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SifreEkrani(formKey:GlobalKey()),));

              },
            ),
            ElevatedButton(

                onPressed: ()  {
                    Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                         builder: (context) => Gorevler()),
                  );
                },
                child: const Icon(Icons.add_card)),
          ],
        ),
        body: ListView.builder(
            key: const PageStorageKey("value"),
            padding: const EdgeInsets.all(8),
            itemCount: acikOturumKullaniciNotlari.length,
            itemBuilder: (BuildContext context, int i) {
              return Card(
                  elevation: 5,
                  child: ListTile(
                    title: Text(acikOturumKullaniciNotlari[i]),
                    leading:  Text("(${i + 1})"),
                    onTap: () {
                      showDialog<void>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext dialogContext) {
                          return AlertDialog(
                            title: const Text('Uyarı'),
                            content: const Text(
                                'Bu notu silmek istediğineze emin misiniz?'),
                            actions: <Widget>[
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(dialogContext).pop();
                                  },
                                  child: const Text('Vazgeç')),
                              TextButton(
                                child: const Text('Sil'),
                                onPressed: () {
                                  setState(() {
                                    boxn.deleteAt(i);
                                  });
                                  Navigator.of(dialogContext)
                                      .pop(); // Dismiss alert dialog
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ));
            }),

      ),
    );
  }
}
