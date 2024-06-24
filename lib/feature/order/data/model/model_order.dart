
import 'package:equatable/equatable.dart';

class ModelOrder extends Equatable {
  final String? deliveryRequestId;
  final String? clientid;
  final String? clientName;
  final String? customerName;
  final String? customerNumber;
  final String? productType;
  final String? deliveryArea;
  final String? deliveryAddressExtra;
  final String? pickUpAddress;
  final String? pickUpAddressLat;
  final String? pickUpAddressLang;
  final String? clientToken;
  final int? pickupCharge;
  final int? deliveryCharge;
  final int? productPrice;
  final int? pickupTime;
  final String? requestPlacedTime;
  final int? deliveryStatus;
  final String? riderName;
  final String? riderid;
  final String? riderClearance;
  final String? clientPaymentStatus;
  final String? pickupCode;

  ModelOrder({
    this.deliveryRequestId,
    this.clientid,
    this.clientName,
    this.customerName,
    this.customerNumber,
    this.productType,
    this.deliveryArea,
    this.deliveryAddressExtra,
    this.pickUpAddress,
    this.pickUpAddressLat,
    this.pickUpAddressLang,
    this.clientToken,
    this.pickupCharge,
    this.deliveryCharge,
    this.productPrice,
    this.pickupTime,
    this.requestPlacedTime,
    this.deliveryStatus,
    this.riderName,
    this.riderid,
    this.riderClearance,
    this.clientPaymentStatus,
    this.pickupCode,
  });

  // fromJson method
  factory ModelOrder.fromJson(Map<String, dynamic> json) {
    return ModelOrder(
      deliveryRequestId: json['deliveryRequestId'] as String?,
      clientid: json['clientid'],
      clientName: json['clientName'],
      customerName: json['customerName'],
      customerNumber: json['customerNumber'],
      productType: json['productType'],
      deliveryArea: json['deliveryArea'],
      deliveryAddressExtra: json['deliveryAddressExtra'],
      pickUpAddress: json['pickUpAddress'],
      pickUpAddressLat: json['pickUpAddressLat'],
      pickUpAddressLang: json['pickUpAddressLang'],
      clientToken: json['clientToken'],
      pickupCharge: json['pickupCharge'],
      deliveryCharge: json['deliveryCharge'],
      productPrice: json['productPrice'],
      pickupTime: json['pickupTime'],
      requestPlacedTime: json['requestPlacedTime'],
      deliveryStatus: json['deliveryStatus'],
      riderName: json['riderName'],
      riderid: json['riderid'],
      riderClearance: json['riderClearance'],
      clientPaymentStatus: json['clientPaymentStatus'],
      pickupCode: json['pickupCode'],
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'deliveryRequestId': deliveryRequestId,
      'clientid': clientid,
      'clientName': clientName,
      'customerName': customerName,
      'customerNumber': customerNumber,
      'productType': productType,
      'deliveryArea': deliveryArea,
      'deliveryAddressExtra': deliveryAddressExtra,
      'pickUpAddress': pickUpAddress,
      'pickUpAddressLat': pickUpAddressLat,
      'pickUpAddressLang': pickUpAddressLang,
      'clientToken': clientToken,
      'pickupCharge': pickupCharge,
      'deliveryCharge': deliveryCharge,
      'productPrice': productPrice,
      'pickupTime': pickupTime,
      'requestPlacedTime': requestPlacedTime,
      'deliveryStatus': deliveryStatus,
      'riderName': riderName,
      'riderid': riderid,
      'riderClearance': riderClearance,
      'clientPaymentStatus': clientPaymentStatus,
      'pickupCode': pickupCode,
    };
  }


  @override
  List<Object?> get props => [
    deliveryRequestId,
    clientid,
    clientName,
    customerName,
    customerNumber,
    productType,
    deliveryArea,
    deliveryAddressExtra,
    pickUpAddress,
    pickUpAddressLat,
    pickUpAddressLang,
    clientToken,
    pickupCharge,
    deliveryCharge,
    productPrice,
    pickupTime,
    requestPlacedTime,
    deliveryStatus,
    riderName,
    riderid,
    riderClearance,
    clientPaymentStatus,
    pickupCode,
  ];
}
