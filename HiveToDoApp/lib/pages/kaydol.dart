import "package:flutter/material.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:myproject/hive/gorevClass.dart";


const String boxName = "kullanici";

class kaydol extends StatefulWidget {
   kaydol({Key? key}) : super(key: key);

  @override
  State<kaydol> createState() => _kaydolState();
}


class _kaydolState extends State<kaydol> {
final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

Box <kullanici> boxk = Hive.box(boxName);

final TextEditingController adSoyadController=TextEditingController();
final TextEditingController ePostaController=TextEditingController();
final TextEditingController sifreController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Lütfen Kaydolunuz',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child:
              ListView(padding: const EdgeInsets.all(5),
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_outline),
                        hintText: "Ad & Soyadın",
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "boş geçtiniz";
                        }
                      },
                      controller: adSoyadController,
                    ),
                    const SizedBox(
                      height: 20,),
                    TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.local_post_office_outlined),
                          hintText: "E-posta adresi",
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "boş geçtiniz";
                          }
                          else if (value.contains('@') || value.contains('.com'))
                            return null;

                        },
                      controller: ePostaController,
                    ),
                    const SizedBox(
                      height: 20,),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.password_outlined),
                        hintText: "Şifre",
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "boş geçtiniz";
                        }
                      },
                      controller: sifreController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        boxk.add( kullanici(ePostaController.text,adSoyadController.text, sifreController.text));
                        }


                      Navigator.of(context).pop();
                    }, child: const Text("Kaydol ve Giriş yap")),
                  ]



              ),
            ),
          ),
        ),
      );

  }
}
