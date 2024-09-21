/// service_discount : {"discount":10,"discount_type":"Percentage Discount"}
/// _id : "66d2d4df926a5372012d8f04"
/// service_category_id : "66d2d18a926a5372012d8e9b"
/// name : "Home Cleaning"
/// description : "A Home Cleaner is responsible for cleaning various areas of a client's home. They are typically light-duty Cleaners responsible for sweeping, mopping, washing, ..."
/// service_price : 500
/// image : "p-r9uymbv-cleaningHome.jpg"
/// ratings : 5
/// reviews : [{"user":"66dc0583a521a07c53202aeb","comment":"nice service","rating":5,"date":"2024-09-19T06:55:20.146Z","_id":"66ebc98e7623004bb4eadd55"}]
/// createdAt : "2024-08-31T08:31:27.451Z"
/// updatedAt : "2024-09-19T06:55:20.146Z"
/// __v : 1

class CategoryServicesModel {
  CategoryServicesModel({
      ServiceDiscount? serviceDiscount, 
      String? id, 
      String? serviceCategoryId, 
      String? name, 
      String? description, 
      num? servicePrice, 
      String? image, 
      num? ratings, 
      List<Reviews>? reviews, 
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

  CategoryServicesModel.fromJson(dynamic json) {
    _serviceDiscount = json['service_discount'] != null ? ServiceDiscount.fromJson(json['service_discount']) : null;
    _id = json['_id'];
    _serviceCategoryId = json['service_category_id'];
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
  String? _serviceCategoryId;
  String? _name;
  String? _description;
  num? _servicePrice;
  String? _image;
  num? _ratings;
  List<Reviews>? _reviews;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
CategoryServicesModel copyWith({  ServiceDiscount? serviceDiscount,
  String? id,
  String? serviceCategoryId,
  String? name,
  String? description,
  num? servicePrice,
  String? image,
  num? ratings,
  List<Reviews>? reviews,
  String? createdAt,
  String? updatedAt,
  num? v,
}) => CategoryServicesModel(  serviceDiscount: serviceDiscount ?? _serviceDiscount,
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
  String? get serviceCategoryId => _serviceCategoryId;
  String? get name => _name;
  String? get description => _description;
  num? get servicePrice => _servicePrice;
  String? get image => _image;
  num? get ratings => _ratings;
  List<Reviews>? get reviews => _reviews;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_serviceDiscount != null) {
      map['service_discount'] = _serviceDiscount?.toJson();
    }
    map['_id'] = _id;
    map['service_category_id'] = _serviceCategoryId;
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

/// user : "66dc0583a521a07c53202aeb"
/// comment : "nice service"
/// rating : 5
/// date : "2024-09-19T06:55:20.146Z"
/// _id : "66ebc98e7623004bb4eadd55"

class Reviews {
  Reviews({
      String? user, 
      String? comment, 
      num? rating, 
      String? date, 
      String? id,}){
    _user = user;
    _comment = comment;
    _rating = rating;
    _date = date;
    _id = id;
}

  Reviews.fromJson(dynamic json) {
    _user = json['user'];
    _comment = json['comment'];
    _rating = json['rating'];
    _date = json['date'];
    _id = json['_id'];
  }
  String? _user;
  String? _comment;
  num? _rating;
  String? _date;
  String? _id;
Reviews copyWith({  String? user,
  String? comment,
  num? rating,
  String? date,
  String? id,
}) => Reviews(  user: user ?? _user,
  comment: comment ?? _comment,
  rating: rating ?? _rating,
  date: date ?? _date,
  id: id ?? _id,
);
  String? get user => _user;
  String? get comment => _comment;
  num? get rating => _rating;
  String? get date => _date;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user'] = _user;
    map['comment'] = _comment;
    map['rating'] = _rating;
    map['date'] = _date;
    map['_id'] = _id;
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