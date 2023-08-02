// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

class ProductDetailsModel {
  bool? success;
  String? status;
  String? message;
  List<ProductMenuData>? data;

  ProductDetailsModel({this.success, this.status, this.message, this.data});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductMenuData>[];
      json['data'].forEach((v) {
        data!.add(ProductMenuData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  bool operator ==(covariant ProductDetailsModel other) {
    if (identical(this, other)) return true;

    return other.success == success && other.status == status && other.message == message && listEquals(other.data, data);
  }

  @override
  int get hashCode {
    return success.hashCode ^ status.hashCode ^ message.hashCode ^ data.hashCode;
  }

  ProductDetailsModel copyWith({
    bool? success,
    String? status,
    String? message,
    List<ProductMenuData>? data,
  }) {
    return ProductDetailsModel(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}

class ProductMenuData {
  int? id;
  int? innerPosition;
  Product? product;
  ProductColor? productColor;
  ProductSize? productSize;
  String? ribbon;
  int? amount;
  double? price;
  double? discountPrice;
  double? weightGrams;
  int? notificationAt;
  List<ImageValues>? imageValues;
  String? publishedDiscountAt;
  String? expiredDiscountAt;
  bool? isVisible;

  ProductMenuData({
    this.id,
    this.innerPosition,
    this.product,
    this.productColor,
    this.productSize,
    this.ribbon,
    this.amount,
    this.price,
    this.discountPrice,
    this.weightGrams,
    this.notificationAt,
    this.imageValues,
    this.publishedDiscountAt,
    this.expiredDiscountAt,
    this.isVisible,
  });

  ProductMenuData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    innerPosition = int.tryParse(json['inner_position'].toString()) ?? 1;
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    productColor = json['product_color'] != null ? ProductColor.fromJson(json['product_color']) : null;
    productSize = json['product_size'] != null ? ProductSize.fromJson(json['product_size']) : null;
    ribbon = json['ribbon'];
    amount = int.tryParse(json['amount'].toString()) ?? 0;
    price = double.tryParse(json['price'].toString()) ?? 0;
    discountPrice = double.tryParse(json['discount_price'].toString()) ?? 0;
    weightGrams = double.tryParse(json['weight_grams'].toString()) ?? 0.0;
    notificationAt = json['notification_at'];
    if (json['image_values'] != null) {
      imageValues = <ImageValues>[];
      json['image_values'].forEach((v) {
        imageValues!.add(ImageValues.fromJson(v));
      });
    }
    publishedDiscountAt = json['published_discount_at'];
    expiredDiscountAt = json['expired_discount_at'];
    isVisible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['inner_position'] = innerPosition;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    if (productColor != null) {
      data['product_color'] = productColor!.toJson();
    }
    if (productSize != null) {
      data['product_size'] = productSize!.toJson();
    }
    data['ribbon'] = ribbon;
    data['amount'] = amount;
    data['price'] = price;
    data['discount_price'] = discountPrice;
    data['weight_grams'] = weightGrams;
    data['notification_at'] = notificationAt;
    if (imageValues != null) {
      data['image_values'] = imageValues!.map((v) => v.toJson()).toList();
    }
    data['published_discount_at'] = publishedDiscountAt;
    data['expired_discount_at'] = expiredDiscountAt;
    data['is_visible'] = isVisible;
    return data;
  }

  @override
  bool operator ==(covariant ProductMenuData other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.innerPosition == innerPosition &&
        other.product == product &&
        other.productColor == productColor &&
        other.productSize == productSize &&
        other.ribbon == ribbon &&
        other.amount == amount &&
        other.price == price &&
        other.discountPrice == discountPrice &&
        other.weightGrams == weightGrams &&
        other.notificationAt == notificationAt &&
        listEquals(other.imageValues, imageValues) &&
        other.publishedDiscountAt == publishedDiscountAt &&
        other.expiredDiscountAt == expiredDiscountAt &&
        other.isVisible == isVisible;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        innerPosition.hashCode ^
        product.hashCode ^
        productColor.hashCode ^
        productSize.hashCode ^
        ribbon.hashCode ^
        amount.hashCode ^
        price.hashCode ^
        discountPrice.hashCode ^
        weightGrams.hashCode ^
        notificationAt.hashCode ^
        imageValues.hashCode ^
        publishedDiscountAt.hashCode ^
        expiredDiscountAt.hashCode ^
        isVisible.hashCode;
  }

  ProductMenuData copyWith({
    int? id,
    int? innerPosition,
    Product? product,
    ProductColor? productColor,
    ProductSize? productSize,
    String? ribbon,
    int? amount,
    double? price,
    double? discountPrice,
    double? weightGrams,
    int? notificationAt,
    List<ImageValues>? imageValues,
    String? publishedDiscountAt,
    String? expiredDiscountAt,
    bool? isVisible,
  }) {
    return ProductMenuData(
      id: id ?? this.id,
      innerPosition: innerPosition ?? this.innerPosition,
      product: product ?? this.product,
      productColor: productColor ?? this.productColor,
      productSize: productSize ?? this.productSize,
      ribbon: ribbon ?? this.ribbon,
      amount: amount ?? this.amount,
      price: price ?? this.price,
      discountPrice: discountPrice ?? this.discountPrice,
      weightGrams: weightGrams ?? this.weightGrams,
      notificationAt: notificationAt ?? this.notificationAt,
      imageValues: imageValues ?? this.imageValues,
      publishedDiscountAt: publishedDiscountAt ?? this.publishedDiscountAt,
      expiredDiscountAt: expiredDiscountAt ?? this.expiredDiscountAt,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}

class Product {
  int? id;
  Name? name;
  Name? smallDescription;
  Name? description;
  Category? category;
  int? position;
  bool? isVisible;

  Product({this.id, this.name, this.smallDescription, this.description, this.category, this.position, this.isVisible});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    smallDescription = json['small_description'] != null ? Name.fromJson(json['small_description']) : null;
    description = json['description'] != null ? Name.fromJson(json['description']) : null;
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    position = json['position'];
    isVisible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (smallDescription != null) {
      data['small_description'] = smallDescription!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['position'] = position;
    data['is_visible'] = isVisible;
    return data;
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.smallDescription == smallDescription &&
        other.description == description &&
        other.category == category &&
        other.position == position &&
        other.isVisible == isVisible;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ smallDescription.hashCode ^ description.hashCode ^ category.hashCode ^ position.hashCode ^ isVisible.hashCode;
  }

  Product copyWith({
    int? id,
    Name? name,
    Name? smallDescription,
    Name? description,
    Category? category,
    int? position,
    bool? isVisible,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      smallDescription: smallDescription ?? this.smallDescription,
      description: description ?? this.description,
      category: category ?? this.category,
      position: position ?? this.position,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}

class Name {
  String? key;
  String? value;

  Name({this.key, this.value});

  Name.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['value'] = value;
    return data;
  }

  @override
  bool operator ==(covariant Name other) {
    if (identical(this, other)) return true;

    return other.key == key && other.value == value;
  }

  @override
  int get hashCode => key.hashCode ^ value.hashCode;

  Name copyWith({
    String? key,
    String? value,
  }) {
    return Name(
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }
}

class Category {
  int? id;
  Name? name;
  SvgIcon? icons;

  Category({this.id, this.name, this.icons});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;

    icons = json['icons'] != null ? SvgIcon.fromJson(json['icons']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (name != null) {
      data['name'] = name!.toJson();
    }

    if (icons != null) {
      data['icons'] = icons!.toJson();
    }
    return data;
  }

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.icons == icons;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ icons.hashCode;

  Category copyWith({
    int? id,
    Name? name,
    SvgIcon? icons,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      icons: icons ?? this.icons,
    );
  }
}

class SvgIcon {
  String? svg;

  SvgIcon({this.svg});

  SvgIcon.fromJson(Map<String, dynamic> json) {
    svg = json['svg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['svg'] = svg;
    return data;
  }

  SvgIcon copyWith({
    String? svg,
  }) {
    return SvgIcon(
      svg: svg ?? this.svg,
    );
  }

  @override
  bool operator ==(covariant SvgIcon other) {
    if (identical(this, other)) return true;

    return other.svg == svg;
  }

  @override
  int get hashCode => svg.hashCode;
}

class ProductColor {
  int? id;
  SvgIcon? icon;
  String? key;
  Name? name;
  bool? isVisible;

  ProductColor({this.id, this.icon, this.key, this.name, this.isVisible});

  ProductColor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'] != null ? SvgIcon.fromJson(json['icon']) : null;
    key = json['key'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    isVisible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (icon != null) {
      data['icon'] = icon!.toJson();
    }
    data['key'] = key;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['is_visible'] = isVisible;
    return data;
  }

  @override
  bool operator ==(covariant ProductColor other) {
    if (identical(this, other)) return true;

    return other.id == id && other.icon == icon && other.key == key && other.name == name && other.isVisible == isVisible;
  }

  @override
  int get hashCode {
    return id.hashCode ^ icon.hashCode ^ key.hashCode ^ name.hashCode ^ isVisible.hashCode;
  }

  ProductColor copyWith({
    int? id,
    SvgIcon? icon,
    String? key,
    Name? name,
    bool? isVisible,
  }) {
    return ProductColor(
      id: id ?? this.id,
      icon: icon ?? this.icon,
      key: key ?? this.key,
      name: name ?? this.name,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}

class ProductSize {
  int? id;
  String? symbol;
  Name? name;
  bool? isVisible;

  ProductSize({this.id, this.symbol, this.name, this.isVisible});

  ProductSize.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    isVisible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symbol'] = symbol;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['is_visible'] = isVisible;
    return data;
  }

  @override
  bool operator ==(covariant ProductSize other) {
    if (identical(this, other)) return true;

    return other.id == id && other.symbol == symbol && other.name == name && other.isVisible == isVisible;
  }

  @override
  int get hashCode {
    return id.hashCode ^ symbol.hashCode ^ name.hashCode ^ isVisible.hashCode;
  }

  ProductSize copyWith({
    int? id,
    String? symbol,
    Name? name,
    bool? isVisible,
  }) {
    return ProductSize(
      id: id ?? this.id,
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}

class ImageValues {
  String? s64px;
  String? s128px;
  String? s256px;
  String? s512px;
  String? s1024px;

  ImageValues({this.s64px, this.s128px, this.s256px, this.s512px, this.s1024px});

  ImageValues.fromJson(Map<String, dynamic> json) {
    s64px = json['64px'];
    s128px = json['128px'];
    s256px = json['256px'];
    s512px = json['512px'];
    s1024px = json['1024px'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['64px'] = s64px;
    data['128px'] = s128px;
    data['256px'] = s256px;
    data['512px'] = s512px;
    data['1024px'] = s1024px;
    return data;
  }

  @override
  bool operator ==(covariant ImageValues other) {
    if (identical(this, other)) return true;

    return other.s64px == s64px && other.s128px == s128px && other.s256px == s256px && other.s512px == s512px && other.s1024px == s1024px;
  }

  @override
  int get hashCode {
    return s64px.hashCode ^ s128px.hashCode ^ s256px.hashCode ^ s512px.hashCode ^ s1024px.hashCode;
  }

  ImageValues copyWith({
    String? s64px,
    String? s128px,
    String? s256px,
    String? s512px,
    String? s1024px,
  }) {
    return ImageValues(
      s64px: s64px ?? this.s64px,
      s128px: s128px ?? this.s128px,
      s256px: s256px ?? this.s256px,
      s512px: s512px ?? this.s512px,
      s1024px: s1024px ?? this.s1024px,
    );
  }
}
