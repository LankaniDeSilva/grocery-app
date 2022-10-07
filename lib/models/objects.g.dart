// GENERATED CODE - DO NOT MODIFY BY HAND

part of objects;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['uid'] as String,
      json['name'] as String,
      json['email'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'uid': instance.uid,
    };
