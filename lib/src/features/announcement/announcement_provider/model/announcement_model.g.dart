// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementModel _$AnnouncementModelFromJson(Map<String, dynamic> json) =>
    AnnouncementModel(
      price: json['price'] as int,
      area: json['area'] as int,
      floor: json['floor'] as int,
      address: json['address'] as String,
      mortgage: json['mortgage'] as bool,
      number: json['number'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
      apartmentsFloor: json['apartmentsFloor'] as int,
      apartmentsRoom: json['apartmentsRoom'] as int,
      userUid: json['userUid'] as String,
    );

Map<String, dynamic> _$AnnouncementModelToJson(AnnouncementModel instance) =>
    <String, dynamic>{
      'price': instance.price,
      'area': instance.area,
      'floor': instance.floor,
      'apartmentsFloor': instance.apartmentsFloor,
      'address': instance.address,
      'mortgage': instance.mortgage,
      'number': instance.number,
      'lat': instance.lat,
      'long': instance.long,
      'apartmentsRoom': instance.apartmentsRoom,
      'userUid': instance.userUid,
      'images': instance.images,
    };
