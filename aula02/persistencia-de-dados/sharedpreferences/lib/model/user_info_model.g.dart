// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserInfoModelAdapter extends TypeAdapter<UserInfoModel> {
  @override
  final int typeId = 0;

  @override
  UserInfoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserInfoModel()
      ..name = fields[0] as String?
      ..lastName = fields[1] as String?
      ..birthday = fields[2] as String?
      ..experienceLevel = fields[3] as String?
      ..favoriteLanguages = (fields[4] as List).cast<String>()
      ..salaryExpectation = fields[5] as double?
      ..experienceTime = fields[6] as int?;
  }

  @override
  void write(BinaryWriter writer, UserInfoModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.birthday)
      ..writeByte(3)
      ..write(obj.experienceLevel)
      ..writeByte(4)
      ..write(obj.favoriteLanguages)
      ..writeByte(5)
      ..write(obj.salaryExpectation)
      ..writeByte(6)
      ..write(obj.experienceTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInfoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
