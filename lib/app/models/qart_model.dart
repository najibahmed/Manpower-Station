const String cartFieldProductId = 'productId';
const String cartFieldProductName = 'productName';
const String cartFieldProductImageUrl = 'productImageUrl';
const String cartFieldQuantity = 'quantity';
const String cartFieldSalePrice = 'salePrice';
const String cartFieldCategoryId = 'categoryId';
const String cartFieldTimekey = 'timeKey';

class CartModel {
  String productId;
  String categoryId;
  String productName;
  String productImageUrl;
  num timeLimit;
  num salePrice;
  String timeKey;

  CartModel(
      {required this.productId,
        required this.categoryId,
        required this.productName,
        required this.productImageUrl,
        this.timeLimit = 3,
        required this.salePrice,
        required this.timeKey});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      cartFieldProductId: productId,
      cartFieldCategoryId: categoryId,
      cartFieldProductName: productName,
      cartFieldProductImageUrl: productImageUrl,
      cartFieldQuantity: timeLimit,
      cartFieldSalePrice: salePrice,
      cartFieldTimekey: timeKey,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) => CartModel(
    productId: map[cartFieldProductId],
    categoryId: map[cartFieldCategoryId],
    productName: map[cartFieldProductName],
    productImageUrl: map[cartFieldProductImageUrl],
    timeLimit: map[cartFieldQuantity],
    salePrice: map[cartFieldSalePrice],
    timeKey: map[cartFieldTimekey],
  );
}
