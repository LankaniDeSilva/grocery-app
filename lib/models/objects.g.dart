// GENERATED CODE - DO NOT MODIFY BY HAND

part of objects;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    CartItemModel(
      cartId: json['cartId'] as String,
      qty: json['qty'] as int,
      subTotal: (json['subTotal'] as num).toDouble(),
      model: ProductModel.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartItemModelToJson(CartItemModel instance) =>
    <String, dynamic>{
      'cartId': instance.cartId,
      'qty': instance.qty,
      'subTotal': instance.subTotal,
      'model': instance.model.toJson(),
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      productId: json['id'] as String,
      productName: json['productName'] as String,
      desc: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['imageUrl'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.productId,
      'productName': instance.productName,
      'description': instance.desc,
      'price': instance.price,
      'imageUrl': instance.image,
    };

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['id'] as String,
      userModel: UserModel.fromJson(json['userModel'] as Map<String, dynamic>),
      total: (json['total'] as num).toDouble(),
      items: (json['items'] as List<dynamic>)
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderState: json['orderState'] as String,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userModel': instance.userModel.toJson(),
      'total': instance.total,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'orderState': instance.orderState,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['uid'] as String,
      json['name'] as String,
      json['email'] as String,
      json['img'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'uid': instance.uid,
      'img': instance.img,
    };
