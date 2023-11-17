import 'package:json_annotation/json_annotation.dart';

part 'payment_type.g.dart';

@JsonSerializable()
class PaymentType {
  String? responseCode;
  String? message;
  @JsonKey(defaultValue: [])
  List<Data>? data;

  PaymentType({this.responseCode, this.message, this.data});

  factory PaymentType.fromJson(Map<String, dynamic> datamap) =>
      _$PaymentTypeFromJson(datamap);

  Map<String, dynamic> toJson() => _$PaymentTypeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
  int? id;
  String? code;
  @JsonKey(name: 'title_en')
  String? titleEn;
  @JsonKey(name: 'title_fr')
  String? titleFr;
  @JsonKey(name: 'description_en')
  String? descriptionEn;
  @JsonKey(name: 'min_amount')
  int? minAmount;
  @JsonKey(name: 'description_fr')
  String? descriptionFr;
  @JsonKey(name: 'icon_image')
  String? iconImage;

  Data(
      {this.id,
      this.code,
      this.titleEn,
      this.titleFr,
      this.descriptionEn,
      this.minAmount,
      this.descriptionFr,
      this.iconImage});

  factory Data.fromJson(Map<String, dynamic> datamap) =>
      _$DataFromJson(datamap);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
