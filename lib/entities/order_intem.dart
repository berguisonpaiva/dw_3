import 'dart:convert';

import 'package:deliveri_api/entities/menu_item.dart';

class OrderIntem {
  final int id;
  final MenuItem item;
  OrderIntem({
    this.id,
    this.item,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'item': item?.toMap(),
    };
  }

  factory OrderIntem.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return OrderIntem(
      id: map['id'],
      item: MenuItem.fromMap(map['item']),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderIntem.fromJson(String source) =>
      OrderIntem.fromMap(json.decode(source));
}
