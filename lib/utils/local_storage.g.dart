// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_storage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginCredAdapter extends TypeAdapter<LoginCred> {
  @override
  final int typeId = 1;

  @override
  LoginCred read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginCred(
      token: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LoginCred obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginCredAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
