import 'dart:convert';

import 'package:deliveri_api/entities/order_intem.dart';

class Order {
  final int id;
  final String paymentType;
  final String address;
  final List<OrderIntem> items;
  Order({
    this.id,
    this.paymentType,
    this.address,
    this.items,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'paymentType': paymentType,
      'address': address,
      'items': items?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Order(
      id: map['id'],
      paymentType: map['paymentType'],
      address: map['address'],
      items: List<OrderIntem>.from(
          map['items']?.map((x) => OrderIntem.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}
