/// service_discount : {"discount":10,"discount_type":"Percentage Discount"}
/// _id : "66d2d4df926a5372012d8f04"
/// service_category_id : {"_id":"66d2d18a926a5372012d8e9b","parentId":null,"category_name":"Cleaning","description":"Responsible for all basic cleaning in and around residences or office buildings. Cleans floors and rooms. including dust mopping, damp mopping, sweeping, vacuuming, dusting, picking up larger objects off the floor, and spot cleaning glass and windows.","createdAt":"2024-08-31T08:17:14.997Z","updatedAt":"2024-08-31T08:17:14.997Z","__v":0}
/// name : "Home Cleaning"
/// description : "A Home Cleaner is responsible for cleaning various areas of a client's home. They are typically light-duty Cleaners responsible for sweeping, mopping, washing, ..."
/// service_price : 500
/// image : "p-r9uymbv-cleaningHome.jpg"
/// ratings : 0
/// reviews : []
/// createdAt : "2024-08-31T08:31:27.451Z"
/// updatedAt : "2024-09-11T04:03:54.021Z"
/// __v : 0

class ServiceModel {
  ServiceModel({
    ServiceDiscount? serviceDiscount,
    String? id,
    ServiceCategoryId? serviceCategoryId,
    String? name,
    String? description,
    num? servicePrice,
    String? image,
    num? ratings,
    List<dynamic>? reviews,
    String? createdAt,
    String? updatedAt,
    num? v,}){
    _serviceDiscount = serviceDiscount;
    _id = id;
    _serviceCategoryId = serviceCategoryId;
    _name = name;
    _description = description;
    _servicePrice = servicePrice;
    _image = image;
    _ratings = ratings;
    _reviews = reviews;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  ServiceModel.fromJson(dynamic json) {
    _serviceDiscount = json['service_discount'] != null ? ServiceDiscount.fromJson(json['service_discount']) : null;
    _id = json['_id'];
    _serviceCategoryId = json['service_category_id'] != null ? ServiceCategoryId.fromJson(json['service_category_id']) : null;
    _name = json['name'];
    _description = json['description'];
    _servicePrice = json['service_price'];
    _image = json['image'];
    _ratings = json['ratings'];
    if (json['reviews'] != null) {
      _reviews = [];
      List<dynamic>.from(json["reviews"].map((x) => x));
      // json['reviews'].forEach((v) {
      //   _reviews?.add(Dynamic.fromJson(v));
      // });
    }
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  ServiceDiscount? _serviceDiscount;
  String? _id;
  ServiceCategoryId? _serviceCategoryId;
  String? _name;
  String? _description;
  num? _servicePrice;
  String? _image;
  num? _ratings;
  List<dynamic>? _reviews;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  ServiceModel copyWith({  ServiceDiscount? serviceDiscount,
    String? id,
    ServiceCategoryId? serviceCategoryId,
    String? name,
    String? description,
    num? servicePrice,
    String? image,
    num? ratings,
    List<dynamic>? reviews,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) => ServiceModel(  serviceDiscount: serviceDiscount ?? _serviceDiscount,
    id: id ?? _id,
    serviceCategoryId: serviceCategoryId ?? _serviceCategoryId,
    name: name ?? _name,
    description: description ?? _description,
    servicePrice: servicePrice ?? _servicePrice,
    image: image ?? _image,
    ratings: ratings ?? _ratings,
    reviews: reviews ?? _reviews,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
    v: v ?? _v,
  );
  ServiceDiscount? get serviceDiscount => _serviceDiscount;
  String? get id => _id;
  ServiceCategoryId? get serviceCategoryId => _serviceCategoryId;
  String? get name => _name;
  String? get description => _description;
  num? get servicePrice => _servicePrice;
  String? get image => _image;
  num? get ratings => _ratings;
  List<dynamic>? get reviews => _reviews;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_serviceDiscount != null) {
      map['service_discount'] = _serviceDiscount?.toJson();
    }
    map['_id'] = _id;
    if (_serviceCategoryId != null) {
      map['service_category_id'] = _serviceCategoryId?.toJson();
    }
    map['name'] = _name;
    map['description'] = _description;
    map['service_price'] = _servicePrice;
    map['image'] = _image;
    map['ratings'] = _ratings;
    if (_reviews != null) {
      map['reviews'] = _reviews?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}

/// _id : "66d2d18a926a5372012d8e9b"
/// parentId : null
/// category_name : "Cleaning"
/// description : "Responsible for all basic cleaning in and around residences or office buildings. Cleans floors and rooms. including dust mopping, damp mopping, sweeping, vacuuming, dusting, picking up larger objects off the floor, and spot cleaning glass and windows."
/// createdAt : "2024-08-31T08:17:14.997Z"
/// updatedAt : "2024-08-31T08:17:14.997Z"
/// __v : 0

class ServiceCategoryId {
  ServiceCategoryId({
    String? id,
    dynamic parentId,
    String? categoryName,
    String? description,
    String? createdAt,
    String? updatedAt,
    num? v,}){
    _id = id;
    _parentId = parentId;
    _categoryName = categoryName;
    _description = description;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  ServiceCategoryId.fromJson(dynamic json) {
    _id = json['_id'];
    _parentId = json['parentId'];
    _categoryName = json['category_name'];
    _description = json['description'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  dynamic _parentId;
  String? _categoryName;
  String? _description;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  ServiceCategoryId copyWith({  String? id,
    dynamic parentId,
    String? categoryName,
    String? description,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) => ServiceCategoryId(  id: id ?? _id,
    parentId: parentId ?? _parentId,
    categoryName: categoryName ?? _categoryName,
    description: description ?? _description,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
    v: v ?? _v,
  );
  String? get id => _id;
  dynamic get parentId => _parentId;
  String? get categoryName => _categoryName;
  String? get description => _description;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['parentId'] = _parentId;
    map['category_name'] = _categoryName;
    map['description'] = _description;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}

/// discount : 10
/// discount_type : "Percentage Discount"

class ServiceDiscount {
  ServiceDiscount({
    num? discount,
    String? discountType,}){
    _discount = discount;
    _discountType = discountType;
  }

  ServiceDiscount.fromJson(dynamic json) {
    _discount = json['discount'];
    _discountType = json['discount_type'];
  }
  num? _discount;
  String? _discountType;
  ServiceDiscount copyWith({  num? discount,
    String? discountType,
  }) => ServiceDiscount(  discount: discount ?? _discount,
    discountType: discountType ?? _discountType,
  );
  num? get discount => _discount;
  String? get discountType => _discountType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['discount'] = _discount;
    map['discount_type'] = _discountType;
    return map;
  }

}