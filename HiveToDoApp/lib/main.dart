import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:myproject/hive/gorevClass.dart';
import 'pages/kaydol.dart';
import 'pages/anasayfa.dart';

const String boxNameKullanici = "kullanici";
const String boxNameAcikOturum = "acikoturum";

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(notlarAdapter());
  Hive.registerAdapter(kullaniciAdapter());
  Hive.registerAdapter(AcikOturumAdapter());

  await Hive.openBox<notlar>("notlar");
  await Hive.openBox<kullanici>(boxNameKullanici);
  await Hive.openBox<AcikOturum>(boxNameAcikOturum);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Not Defteri Uygulaması',
        home: SifreEkrani(formKey: _formKey));
  }
}

class SifreEkrani extends StatelessWidget {
  SifreEkrani({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final Box<kullanici> boxk = Hive.box(boxNameKullanici);
  final Box<AcikOturum> boxa = Hive.box(boxNameAcikOturum);

  final TextEditingController ePostaController = TextEditingController();
  final TextEditingController sifreController = TextEditingController();

  final GlobalKey<FormState> _formKey;
  final List<String> kullaniciAdiListesi = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Not Defterine Hoş Geldin',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(padding: const EdgeInsets.all(5), children: [
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.local_post_office_outlined),
                  hintText: "E-posta adresi",
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "boş geçtiniz";
                  } else if (value.contains('@') || value.contains('.com')) {
                    return null;
                  }
                  return null;
                },
                controller: ePostaController,
              ),
              const SizedBox(
                height: 20,
              ),
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
                  return null;
                },
                controller: sifreController,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    for (var element in boxk.keys) {
                      kullaniciAdiListesi.add(boxk.get(element)!.eposta);
                    }
                    if (_formKey.currentState!.validate() &&
                        kullaniciAdiListesi.contains(ePostaController.text)) {
                      boxa.add(AcikOturum(ePostaController.text));

                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => anasayfa(),
                      ));
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                          title: Text("Girdiğiniz bilgileri kontrol ediniz.."),
                          icon: Icon(Icons.no_cell),
                        ),
                      );
                    }
                  },
                  child: const Text("Giriş")),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => kaydol()));
                  },
                  child: const Text("Kaydol")),
            ]),
          ),
        ),
      ),
    );
  }
}
