import 'package:hive/hive.dart';

part 'gorevClass.g.dart';

@HiveType(typeId: 1)
class notlar {
  @HiveField(0)
 String not;
  @HiveField(1)
  String eposta;

notlar(this.not,this.eposta);
}

@HiveType(typeId: 2)
class kullanici {
  @HiveField(0)
  String eposta;
  @HiveField(1)
  String adSoyadi;
  @HiveField(2)
  String sifre;

  kullanici(this.eposta, this.adSoyadi, this.sifre);
}

@HiveType(typeId: 3)
class AcikOturum {
  @HiveField(0)
  String eposta;

  AcikOturum(this.eposta);
}
