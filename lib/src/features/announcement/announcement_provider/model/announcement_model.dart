import 'package:json_annotation/json_annotation.dart';

part 'announcement_model.g.dart';

@JsonSerializable()
class AnnouncementModel {
  AnnouncementModel(
      {required this.price,
      required this.area,
      required this.floor,
      required this.address,
      required this.mortgage,
      required this.number,
      required this.images,
      required this.lat,
      required this.long,
      required this.apartmentsFloor,
      required this.apartmentsRoom,
      required this.userUid});

  final int price;
  final int area;
  final int floor;
  final int apartmentsFloor;
  final String address;
  final bool mortgage;
  final String number;
  final double lat;
  final double long;
  final int apartmentsRoom;
  final String userUid;
  final List<String> images;

  factory AnnouncementModel.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementModelToJson(this);
}
