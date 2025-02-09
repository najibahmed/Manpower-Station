import 'dart:convert';

import 'package:manpower_station/app/modules/service/model/service_list_model.dart';



const String cartFieldServiceId = '_id';
const String cartFieldServiceName = 'name';
const String cartFieldServiceImageUrl = 'image';
const String cartFieldServiceMinimumCost = 'minimum_paid_cost';
const String cartFieldServicePrice = 'service_price';
const String cartFieldServiceTotalPrice = 'totalPrice';
const String cartFieldServiceStartingDate = 'startWork';
const String cartFieldServiceSchedule = 'timeSchedule';

class CartModel {
  String serviceId;
  String serviceName;
  String serviceImageUrl;
  num minimumCost;
  num servicePrice;
  num totalPrice;
  String startingDate;
  String serviceTimeSchedule;

  CartModel(
      {required this.serviceId,
        required this.serviceName,
        required this.serviceImageUrl,
        required this.minimumCost,
        required this.servicePrice ,
        required this.totalPrice,
        required this.startingDate,
        required this.serviceTimeSchedule});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      cartFieldServiceId:serviceId,
      cartFieldServiceName: serviceName,
      cartFieldServiceImageUrl: serviceImageUrl,
      cartFieldServiceMinimumCost: minimumCost,
      cartFieldServicePrice: servicePrice,
      cartFieldServiceTotalPrice: totalPrice,
      cartFieldServiceStartingDate: startingDate,
      cartFieldServiceSchedule: serviceTimeSchedule,

    };
  }
  String toJson() => json.encode(toMap());

  factory CartModel.fromMap(Map<String, dynamic> map) => CartModel(
    serviceId: map[cartFieldServiceId],
    serviceName: map[cartFieldServiceName],
    serviceImageUrl: map[cartFieldServiceImageUrl],
    minimumCost: map[cartFieldServiceMinimumCost],
    servicePrice: map[cartFieldServicePrice],
    totalPrice: map[cartFieldServiceTotalPrice],
    startingDate: map[cartFieldServiceStartingDate],
    serviceTimeSchedule: map[cartFieldServiceSchedule],
  );
}
