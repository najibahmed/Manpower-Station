import 'package:manpower_station/app/models/date_model.dart';
import 'package:manpower_station/app/modules/service/model/address_model.dart';
import 'package:manpower_station/app/modules/service/model/service_list_model.dart';

const String orderFieldOrderId = 'orderId';
const String orderFieldUserId = 'userId';
const String orderFieldGrandTotal = 'grandTotal';
const String orderFieldDiscount = 'discount';
const String orderFieldVAT = 'VAT';
const String orderFieldOrderStatus = 'orderStatus';
const String orderFieldPaymentMethod = 'paymentMethod';
const String orderFieldOrderDate = 'orderDate';
const String orderFieldDeliveryAddress = 'deliveryAddress';
const String orderFieldDeliveryCharge = 'deliveryCharge';
const String orderFieldProductDetails = 'productDetails';

class OrderModel {
  String orderId;
  String userId;
  String orderStatus;
  String paymentMethod;
  num grandTotal;
  num discount;
  num VAT;
  num deliveryCharge;
  DateModel orderDate;
  AddressModel deliveryAddress;
  List<ServiceModel> productDetails;

  OrderModel(
      {required this.orderId,
        required this.userId,
        required this.orderStatus,
        required this.paymentMethod,
        required this.grandTotal,
        required this.discount,
        required this.VAT,
        required this.deliveryCharge,
        required this.orderDate,
        required this.deliveryAddress,
        required this.productDetails});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      orderFieldOrderId: orderId,
      orderFieldUserId: userId,
      orderFieldOrderStatus: orderStatus,
      orderFieldPaymentMethod: paymentMethod,
      orderFieldGrandTotal: grandTotal,
      orderFieldDiscount: discount,
      orderFieldVAT: VAT,
      orderFieldDeliveryCharge: deliveryCharge,
      orderFieldOrderDate: orderDate.toMap(),
      orderFieldDeliveryAddress: deliveryAddress.toMap(),
      orderFieldProductDetails: List.generate(
          productDetails.length, (index) => productDetails[index].toJson()),
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> map) => OrderModel(
    orderId: map[orderFieldOrderId],
    userId: map[orderFieldUserId],
    orderStatus: map[orderFieldOrderStatus],
    paymentMethod: map[orderFieldPaymentMethod],
    grandTotal: map[orderFieldGrandTotal],
    discount: map[orderFieldDiscount],
    VAT: map[orderFieldVAT],
    deliveryCharge: map[orderFieldDeliveryCharge],
    orderDate: DateModel.fromMap(map[orderFieldOrderDate]),
    deliveryAddress: AddressModel.fromMap(map[orderFieldDeliveryAddress]),
    productDetails: (map[orderFieldProductDetails] as List)
        .map((e) => ServiceModel.fromJson(e))
        .toList(),
  );
}