// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_return_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginReturnModelAdapter extends TypeAdapter<LoginReturnModel> {
  @override
  final int typeId = 1;

  @override
  LoginReturnModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginReturnModel(
      token: fields[0] as String,
      userAccount: fields[1] as UserAccountModel,
    );
  }

  @override
  void write(BinaryWriter writer, LoginReturnModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.userAccount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginReturnModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
