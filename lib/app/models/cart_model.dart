import 'dart:convert';

import 'package:manpower_station/app/modules/service/model/service_list_model.dart';



const String cartFieldServiceId = '_id';
const String cartFieldServiceName = 'name';
const String cartFieldServiceImageUrl = 'image';
const String cartFieldServiceDiscountModel = 'service_discount';
const String cartFieldServicePrice = 'service_price';
const String cartFieldServiceTotalPrice = 'totalPrice';
const String cartFieldServiceStartingDate = 'startWork';
const String cartFieldServiceSchedule = 'timeSchedule';

class CartModel {
  String serviceId;
  String serviceName;
  String serviceImageUrl;
  ServiceDiscount discountModel;
  String startingDate;
  num totalPrice;
  num servicePrice;
  String serviceTimeSchedule;

  CartModel(
      {required this.serviceId,
        required this.serviceName,
        required this.serviceImageUrl,
        required this.discountModel,
        required this.startingDate,
        this.totalPrice = 99,
        required this.servicePrice,
        required this.serviceTimeSchedule});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      cartFieldServiceId:serviceId,
      cartFieldServiceName: serviceName,
      cartFieldServiceImageUrl: serviceImageUrl,
      cartFieldServiceDiscountModel: discountModel.toJson(),
      cartFieldServiceStartingDate: startingDate,
      cartFieldServiceTotalPrice: totalPrice,
      cartFieldServicePrice: servicePrice,
      cartFieldServiceSchedule: serviceTimeSchedule,

    };
  }
  String toJson() => json.encode(toMap());

  factory CartModel.fromMap(Map<String, dynamic> map) => CartModel(
    serviceId: map[cartFieldServiceId],
    serviceName: map[cartFieldServiceName],
    discountModel: ServiceDiscount.fromJson(map[cartFieldServiceDiscountModel]),
    startingDate: map[cartFieldServiceStartingDate],
    totalPrice: map[cartFieldServiceTotalPrice],
    servicePrice: map[cartFieldServicePrice],
    serviceTimeSchedule: map[cartFieldServiceSchedule],
    serviceImageUrl: map[cartFieldServiceImageUrl],
  );
}
