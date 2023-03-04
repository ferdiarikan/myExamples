// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gorevClass.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class notlarAdapter extends TypeAdapter<notlar> {
  @override
  final int typeId = 1;

  @override
  notlar read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return notlar(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, notlar obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.not)
      ..writeByte(1)
      ..write(obj.eposta);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is notlarAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class kullaniciAdapter extends TypeAdapter<kullanici> {
  @override
  final int typeId = 2;

  @override
  kullanici read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return kullanici(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, kullanici obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.eposta)
      ..writeByte(1)
      ..write(obj.adSoyadi)
      ..writeByte(2)
      ..write(obj.sifre);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is kullaniciAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AcikOturumAdapter extends TypeAdapter<AcikOturum> {
  @override
  final int typeId = 3;

  @override
  AcikOturum read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AcikOturum(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AcikOturum obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.eposta);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AcikOturumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
