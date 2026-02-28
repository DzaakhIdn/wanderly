// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyTripAdapter extends TypeAdapter<MyTrip> {
  @override
  final int typeId = 0;

  @override
  MyTrip read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyTrip(
      title: fields[0] as String,
      address: fields[1] as String,
      category: fields[3] as String,
      description: fields[4] as String,
      imagePath: fields[2] as String,
      dateStart: fields[5] as String,
      dateEnd: fields[6] as String,
      isDone: fields[7] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, MyTrip obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.imagePath)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.dateStart)
      ..writeByte(6)
      ..write(obj.dateEnd)
      ..writeByte(7)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyTripAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
