import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myproject/hive/gorevClass.dart';
import 'package:myproject/pages/anasayfa.dart';
import 'package:myproject/main.dart';

const String boxNameNotlar = "notlar";
const String boxNameKullanici = "kullanici";
const String boxNameAcikOturum = "acikoturum";

class Gorevler extends StatefulWidget {
  const Gorevler({Key? key}) : super(key: key);

  @override
  State<Gorevler> createState() => _GorevlerState();
}

class _GorevlerState extends State<Gorevler> {
  // final GlobalKey<FormState> _key = GlobalKey();

  Box<notlar> boxn = Hive.box<notlar>(boxNameNotlar);
  Box<AcikOturum> boxa = Hive.box(boxNameAcikOturum);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Yeni Not ekle"),

        ),
        body: Form(
          child: ListView(
            children: [
              TextFormField(
                controller: controller,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.add_card),
                  hintText: "Not gir",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      boxn.add(notlar(controller.text,boxa.values.last.eposta));

                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => anasayfa(),));
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                          title: Text("Boş not girilmez"),
                          icon: Icon(Icons.no_cell),
                        ),
                      );
                    }
                  },
                  child: const Text("Ekle ve dön")),
            ],
          ),
        ),
      ),
    );
  }
}
