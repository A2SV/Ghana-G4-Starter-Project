// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAccountModelAdapter extends TypeAdapter<UserAccountModel> {
  @override
  final int typeId = 2;

  @override
  UserAccountModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserAccountModel(
      id: fields[0] as int?,
      firstName: fields[1] as String?,
      lastName: fields[2] as String?,
      email: fields[3] as String,
      passwordHash: fields[4] as String?,
      passwordSalt: fields[5] as String?,
      createdDateTime: fields[6] as DateTime?,
      lastUpdatedDateTime: fields[7] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, UserAccountModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.passwordHash)
      ..writeByte(5)
      ..write(obj.passwordSalt)
      ..writeByte(6)
      ..write(obj.createdDateTime)
      ..writeByte(7)
      ..write(obj.lastUpdatedDateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAccountModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
