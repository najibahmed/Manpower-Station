
/// service_discount : {"discount":0}
/// _id : "677dfb9ce15dedad988d3204"
/// service_category_id : {"_id":"676a80e1b817e0e7ebdb198f","parentId":null,"category_name":"Cleaner","image":"","description":"Maintain impeccable cleanliness in all areas, including floors, surfaces, restrooms, and common spaces. Tasks will include dusting, sweeping, mopping, vacuuming, and window cleaning. Ensure that all assigned areas are cleaned to the highest standards. Adhere to health and safety guidelines and company policies.","createdAt":"2024-12-24T09:37:37.224Z","updatedAt":"2024-12-24T09:37:37.224Z","__v":0}
/// name : "Room Cleaning"
/// description : "home cleaning is the best service in my office"
/// service_overview : ""
/// service_price : 300
/// image : "GlYoi9N6P-462567654_896952099172260_7180434212789286274_n.jpg"
/// ratings : 0
/// schedules : ["months","days","weeks"]
/// minimum_advance_paid : 99
/// reviews : []
/// createdAt : "2025-01-08T04:14:21.217Z"
/// updatedAt : "2025-01-09T06:41:12.823Z"
/// __v : 2

class ServiceModel {
  ServiceModel({
    ServiceDiscount? serviceDiscount,
    String? id,
    ServiceCategoryId? serviceCategoryId,
    String? name,
    String? description,
    String? serviceOverview,
    num? servicePrice,
    String? image,
    num? ratings,
    List<String>? schedules,
    num? minimumAdvancePaid,
    List<dynamic>? reviews,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) {
    _serviceDiscount = serviceDiscount;
    _id = id;
    _serviceCategoryId = serviceCategoryId;
    _name = name;
    _description = description;
    _serviceOverview = serviceOverview;
    _servicePrice = servicePrice;
    _image = image;
    _ratings = ratings;
    _schedules = schedules;
    _minimumAdvancePaid = minimumAdvancePaid;
    _reviews = reviews;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  ServiceModel.fromJson(dynamic json) {
    _serviceDiscount = json['service_discount'] != null
        ? ServiceDiscount.fromJson(json['service_discount'])
        : null;
    _id = json['_id'];
    _serviceCategoryId = json['service_category_id'] != null
        ? ServiceCategoryId.fromJson(json['service_category_id'])
        : null;
    _name = json['name'];
    _description = json['description'];
    _serviceOverview = json['service_overview'];
    _servicePrice = json['service_price'];
    _image = json['image'];
    _ratings = json['ratings'];
    _schedules =
    json['schedules'] != null ? json['schedules'].cast<String>() : [];
    _minimumAdvancePaid = json['minimum_advance_paid'];
    if (json['reviews'] != null) {
      _reviews = [];
      json['reviews'].forEach((v) {
        reviews?.add(Reviews.fromJson(v));
      });
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
  String? _serviceOverview;
  num? _servicePrice;
  String? _image;
  num? _ratings;
  List<String>? _schedules;
  num? _minimumAdvancePaid;
  List<dynamic>? _reviews;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  ServiceModel copyWith({
    ServiceDiscount? serviceDiscount,
    String? id,
    ServiceCategoryId? serviceCategoryId,
    String? name,
    String? description,
    String? serviceOverview,
    num? servicePrice,
    String? image,
    num? ratings,
    List<String>? schedules,
    num? minimumAdvancePaid,
    List<dynamic>? reviews,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) =>
      ServiceModel(
        serviceDiscount: serviceDiscount ?? _serviceDiscount,
        id: id ?? _id,
        serviceCategoryId: serviceCategoryId ?? _serviceCategoryId,
        name: name ?? _name,
        description: description ?? _description,
        serviceOverview: serviceOverview ?? _serviceOverview,
        servicePrice: servicePrice ?? _servicePrice,
        image: image ?? _image,
        ratings: ratings ?? _ratings,
        schedules: schedules ?? _schedules,
        minimumAdvancePaid: minimumAdvancePaid ?? _minimumAdvancePaid,
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

  String? get serviceOverview => _serviceOverview;

  num? get servicePrice => _servicePrice;

  String? get image => _image;

  num? get ratings => _ratings;

  List<String>? get schedules => _schedules;

  num? get minimumAdvancePaid => _minimumAdvancePaid;

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
    map['service_overview'] = _serviceOverview;
    map['service_price'] = _servicePrice;
    map['image'] = _image;
    map['ratings'] = _ratings;
    map['schedules'] = _schedules;
    map['minimum_advance_paid'] = _minimumAdvancePaid;
    if (_reviews != null) {
      map['reviews'] = _reviews?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}

/// _id : "676a80e1b817e0e7ebdb198f"
/// parentId : null
/// category_name : "Cleaner"
/// image : ""
/// description : "Maintain impeccable cleanliness in all areas, including floors, surfaces, restrooms, and common spaces. Tasks will include dusting, sweeping, mopping, vacuuming, and window cleaning. Ensure that all assigned areas are cleaned to the highest standards. Adhere to health and safety guidelines and company policies."
/// createdAt : "2024-12-24T09:37:37.224Z"
/// updatedAt : "2024-12-24T09:37:37.224Z"
/// __v : 0

class ServiceCategoryId {
  ServiceCategoryId({
    String? id,
    dynamic parentId,
    String? categoryName,
    String? image,
    String? description,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) {
    _id = id;
    _parentId = parentId;
    _categoryName = categoryName;
    _image = image;
    _description = description;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  ServiceCategoryId.fromJson(dynamic json) {
    _id = json['_id'];
    _parentId = json['parentId'];
    _categoryName = json['category_name'];
    _image = json['image'];
    _description = json['description'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }

  String? _id;
  dynamic _parentId;
  String? _categoryName;
  String? _image;
  String? _description;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  ServiceCategoryId copyWith({
    String? id,
    dynamic parentId,
    String? categoryName,
    String? image,
    String? description,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) =>
      ServiceCategoryId(
        id: id ?? _id,
        parentId: parentId ?? _parentId,
        categoryName: categoryName ?? _categoryName,
        image: image ?? _image,
        description: description ?? _description,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
      );

  String? get id => _id;

  dynamic get parentId => _parentId;

  String? get categoryName => _categoryName;

  String? get image => _image;

  String? get description => _description;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['parentId'] = _parentId;
    map['category_name'] = _categoryName;
    map['image'] = _image;
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

class Reviews {
  Reviews({
    User? user,
    String? comment,
    num? rating,
    String? date,
    String? id,
  }) {
    _user = user;
    _comment = comment;
    _rating = rating;
    _date = date;
    _id = id;
  }

  Reviews.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _comment = json['comment'];
    _rating = json['rating'];
    _date = json['date'];
    _id = json['_id'];
  }

  User? _user;
  String? _comment;
  num? _rating;
  String? _date;
  String? _id;

  Reviews copyWith({
    User? user,
    String? comment,
    num? rating,
    String? date,
    String? id,
  }) =>
      Reviews(
        user: user ?? _user,
        comment: comment ?? _comment,
        rating: rating ?? _rating,
        date: date ?? _date,
        id: id ?? _id,
      );

  User? get user => _user;

  String? get comment => _comment;

  num? get rating => _rating;

  String? get date => _date;

  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['comment'] = _comment;
    map['rating'] = _rating;
    map['date'] = _date;
    map['_id'] = _id;
    return map;
  }
}

class User {
  User({
    String? id,
    String? user,
    String? role,
    String? phoneOrEmail,
    num? isPoint,
    String? createdAt,
    String? updatedAt,
    num? v,
    String? address,
    String? area,
    String? avatar,
    String? profileDescription,
    String? username,
  }) {
    _id = id;
    _user = user;
    _role = role;
    _phoneOrEmail = phoneOrEmail;
    _isPoint = isPoint;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _address = address;
    _area = area;
    _avatar = avatar;
    _profileDescription = profileDescription;
    _username = username;
  }

  User.fromJson(dynamic json) {
    _id = json['_id'];
    _user = json['user'];
    _role = json['role'];
    _phoneOrEmail = json['phone_or_email'];
    _isPoint = json['is_point'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _address = json['address'];
    _area = json['area'];
    _avatar = json['avatar'];
    _profileDescription = json['profile_description'];
    _username = json['username'];
  }

  String? _id;
  String? _user;
  String? _role;
  String? _phoneOrEmail;
  num? _isPoint;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  String? _address;
  String? _area;
  String? _avatar;
  String? _profileDescription;
  String? _username;

  User copyWith({
    String? id,
    String? user,
    String? role,
    String? phoneOrEmail,
    num? isPoint,
    String? createdAt,
    String? updatedAt,
    num? v,
    String? address,
    String? area,
    String? avatar,
    String? profileDescription,
    String? username,
  }) =>
      User(
        id: id ?? _id,
        user: user ?? _user,
        role: role ?? _role,
        phoneOrEmail: phoneOrEmail ?? _phoneOrEmail,
        isPoint: isPoint ?? _isPoint,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
        address: address ?? _address,
        area: area ?? _area,
        avatar: avatar ?? _avatar,
        profileDescription: profileDescription ?? _profileDescription,
        username: username ?? _username,
      );

  String? get id => _id;

  String? get user => _user;

  String? get role => _role;

  String? get phoneOrEmail => _phoneOrEmail;

  num? get isPoint => _isPoint;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  num? get v => _v;

  String? get address => _address;

  String? get area => _area;

  String? get avatar => _avatar;

  String? get profileDescription => _profileDescription;

  String? get username => _username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['user'] = _user;
    map['role'] = _role;
    map['phone_or_email'] = _phoneOrEmail;
    map['is_point'] = _isPoint;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    map['address'] = _address;
    map['area'] = _area;
    map['avatar'] = _avatar;
    map['profile_description'] = _profileDescription;
    map['username'] = _username;
    return map;
  }
}




























// /// service_discount : {"discount":10,"discount_type":"Percentage Discount"}
// /// _id : "66d2d4df926a5372012d8f04"
// /// service_category_id : {"_id":"66d2d18a926a5372012d8e9b","parentId":null,"category_name":"Cleaning","description":"Responsible for all basic cleaning in and around residences or office buildings. Cleans floors and rooms. including dust mopping, damp mopping, sweeping, vacuuming, dusting, picking up larger objects off the floor, and spot cleaning glass and windows.","createdAt":"2024-08-31T08:17:14.997Z","updatedAt":"2024-08-31T08:17:14.997Z","__v":0}
// /// name : "Home Cleaning"
// /// description : "A Home Cleaner is responsible for cleaning various areas of a client's home. They are typically light-duty Cleaners responsible for sweeping, mopping, washing, ..."
// /// service_price : 500
// /// image : "p-r9uymbv-cleaningHome.jpg"
// /// ratings : 5
// /// reviews : [{"user":{"_id":"66dc0583a521a07c53202aeb","user":"66dc0571a521a07c53202ae7","role":"client","phone_or_email":"mahim@gmail.com","is_point":0,"createdAt":"2024-09-07T07:49:23.557Z","updatedAt":"2024-09-19T07:21:29.370Z","__v":0,"address":"undefined","area":"undefined","avatar":"8DJNFOfny-avatar.svg","profile_description":"undefined","username":"Emon Mia"},"comment":"nice service","rating":5,"date":"2024-09-19T06:55:20.146Z","_id":"66ebc98e7623004bb4eadd55"}]
// /// createdAt : "2024-08-31T08:31:27.451Z"
// /// updatedAt : "2024-09-19T06:55:20.146Z"
// /// __v : 1
//
// class ServiceModel {
//   ServiceModel({
//       ServiceDiscount? serviceDiscount,
//       String? id,
//       ServiceCategoryId? serviceCategoryId,
//       String? name,
//       String? description,
//       num? servicePrice,
//       String? image,
//       num? ratings,
//       List<Reviews>? reviews,
//       String? createdAt,
//       String? updatedAt,
//       num? v,}){
//     _serviceDiscount = serviceDiscount;
//     _id = id;
//     _serviceCategoryId = serviceCategoryId;
//     _name = name;
//     _description = description;
//     _servicePrice = servicePrice;
//     _image = image;
//     _ratings = ratings;
//     _reviews = reviews;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//     _v = v;
// }
//
//   ServiceModel.fromJson(dynamic json) {
//     _serviceDiscount = json['service_discount'] != null ? ServiceDiscount.fromJson(json['service_discount']) : null;
//     _id = json['_id'];
//     _serviceCategoryId = json['service_category_id'] != null ? ServiceCategoryId.fromJson(json['service_category_id']) : null;
//     _name = json['name'];
//     _description = json['description'];
//     _servicePrice = json['service_price'];
//     _image = json['image'];
//     _ratings = json['ratings'];
//     if (json['reviews'] != null) {
//       _reviews = [];
//       json['reviews'].forEach((v) {
//         _reviews?.add(Reviews.fromJson(v));
//       });
//     }
//     _createdAt = json['createdAt'];
//     _updatedAt = json['updatedAt'];
//     _v = json['__v'];
//   }
//   ServiceDiscount? _serviceDiscount;
//   String? _id;
//   ServiceCategoryId? _serviceCategoryId;
//   String? _name;
//   String? _description;
//   num? _servicePrice;
//   String? _image;
//   num? _ratings;
//   List<Reviews>? _reviews;
//   String? _createdAt;
//   String? _updatedAt;
//   num? _v;
// ServiceModel copyWith({  ServiceDiscount? serviceDiscount,
//   String? id,
//   ServiceCategoryId? serviceCategoryId,
//   String? name,
//   String? description,
//   num? servicePrice,
//   String? image,
//   num? ratings,
//   List<Reviews>? reviews,
//   String? createdAt,
//   String? updatedAt,
//   num? v,
// }) => ServiceModel(  serviceDiscount: serviceDiscount ?? _serviceDiscount,
//   id: id ?? _id,
//   serviceCategoryId: serviceCategoryId ?? _serviceCategoryId,
//   name: name ?? _name,
//   description: description ?? _description,
//   servicePrice: servicePrice ?? _servicePrice,
//   image: image ?? _image,
//   ratings: ratings ?? _ratings,
//   reviews: reviews ?? _reviews,
//   createdAt: createdAt ?? _createdAt,
//   updatedAt: updatedAt ?? _updatedAt,
//   v: v ?? _v,
// );
//   ServiceDiscount? get serviceDiscount => _serviceDiscount;
//   String? get id => _id;
//   ServiceCategoryId? get serviceCategoryId => _serviceCategoryId;
//   String? get name => _name;
//   String? get description => _description;
//   num? get servicePrice => _servicePrice;
//   String? get image => _image;
//   num? get ratings => _ratings;
//   List<Reviews>? get reviews => _reviews;
//   String? get createdAt => _createdAt;
//   String? get updatedAt => _updatedAt;
//   num? get v => _v;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (_serviceDiscount != null) {
//       map['service_discount'] = _serviceDiscount?.toJson();
//     }
//     map['_id'] = _id;
//     if (_serviceCategoryId != null) {
//       map['service_category_id'] = _serviceCategoryId?.toJson();
//     }
//     map['name'] = _name;
//     map['description'] = _description;
//     map['service_price'] = _servicePrice;
//     map['image'] = _image;
//     map['ratings'] = _ratings;
//     if (_reviews != null) {
//       map['reviews'] = _reviews?.map((v) => v.toJson()).toList();
//     }
//     map['createdAt'] = _createdAt;
//     map['updatedAt'] = _updatedAt;
//     map['__v'] = _v;
//     return map;
//   }
//
// }
//
// /// user : {"_id":"66dc0583a521a07c53202aeb","user":"66dc0571a521a07c53202ae7","role":"client","phone_or_email":"mahim@gmail.com","is_point":0,"createdAt":"2024-09-07T07:49:23.557Z","updatedAt":"2024-09-19T07:21:29.370Z","__v":0,"address":"undefined","area":"undefined","avatar":"8DJNFOfny-avatar.svg","profile_description":"undefined","username":"Emon Mia"}
// /// comment : "nice service"
// /// rating : 5
// /// date : "2024-09-19T06:55:20.146Z"
// /// _id : "66ebc98e7623004bb4eadd55"
//
// class Reviews {
//   Reviews({
//       User? user,
//       String? comment,
//       num? rating,
//       String? date,
//       String? id,}){
//     _user = user;
//     _comment = comment;
//     _rating = rating;
//     _date = date;
//     _id = id;
// }
//
//   Reviews.fromJson(dynamic json) {
//     _user = json['user'] != null ? User.fromJson(json['user']) : null;
//     _comment = json['comment'];
//     _rating = json['rating'];
//     _date = json['date'];
//     _id = json['_id'];
//   }
//   User? _user;
//   String? _comment;
//   num? _rating;
//   String? _date;
//   String? _id;
// Reviews copyWith({  User? user,
//   String? comment,
//   num? rating,
//   String? date,
//   String? id,
// }) => Reviews(  user: user ?? _user,
//   comment: comment ?? _comment,
//   rating: rating ?? _rating,
//   date: date ?? _date,
//   id: id ?? _id,
// );
//   User? get user => _user;
//   String? get comment => _comment;
//   num? get rating => _rating;
//   String? get date => _date;
//   String? get id => _id;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (_user != null) {
//       map['user'] = _user?.toJson();
//     }
//     map['comment'] = _comment;
//     map['rating'] = _rating;
//     map['date'] = _date;
//     map['_id'] = _id;
//     return map;
//   }
//
// }
//
// /// _id : "66dc0583a521a07c53202aeb"
// /// user : "66dc0571a521a07c53202ae7"
// /// role : "client"
// /// phone_or_email : "mahim@gmail.com"
// /// is_point : 0
// /// createdAt : "2024-09-07T07:49:23.557Z"
// /// updatedAt : "2024-09-19T07:21:29.370Z"
// /// __v : 0
// /// address : "undefined"
// /// area : "undefined"
// /// avatar : "8DJNFOfny-avatar.svg"
// /// profile_description : "undefined"
// /// username : "Emon Mia"
//
// class User {
//   User({
//       String? id,
//       String? user,
//       String? role,
//       String? phoneOrEmail,
//       num? isPoint,
//       String? createdAt,
//       String? updatedAt,
//       num? v,
//       String? address,
//       String? area,
//       String? avatar,
//       String? profileDescription,
//       String? username,}){
//     _id = id;
//     _user = user;
//     _role = role;
//     _phoneOrEmail = phoneOrEmail;
//     _isPoint = isPoint;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//     _v = v;
//     _address = address;
//     _area = area;
//     _avatar = avatar;
//     _profileDescription = profileDescription;
//     _username = username;
// }
//
//   User.fromJson(dynamic json) {
//     _id = json['_id'];
//     _user = json['user'];
//     _role = json['role'];
//     _phoneOrEmail = json['phone_or_email'];
//     _isPoint = json['is_point'];
//     _createdAt = json['createdAt'];
//     _updatedAt = json['updatedAt'];
//     _v = json['__v'];
//     _address = json['address'];
//     _area = json['area'];
//     _avatar = json['avatar'];
//     _profileDescription = json['profile_description'];
//     _username = json['username'];
//   }
//   String? _id;
//   String? _user;
//   String? _role;
//   String? _phoneOrEmail;
//   num? _isPoint;
//   String? _createdAt;
//   String? _updatedAt;
//   num? _v;
//   String? _address;
//   String? _area;
//   String? _avatar;
//   String? _profileDescription;
//   String? _username;
// User copyWith({  String? id,
//   String? user,
//   String? role,
//   String? phoneOrEmail,
//   num? isPoint,
//   String? createdAt,
//   String? updatedAt,
//   num? v,
//   String? address,
//   String? area,
//   String? avatar,
//   String? profileDescription,
//   String? username,
// }) => User(  id: id ?? _id,
//   user: user ?? _user,
//   role: role ?? _role,
//   phoneOrEmail: phoneOrEmail ?? _phoneOrEmail,
//   isPoint: isPoint ?? _isPoint,
//   createdAt: createdAt ?? _createdAt,
//   updatedAt: updatedAt ?? _updatedAt,
//   v: v ?? _v,
//   address: address ?? _address,
//   area: area ?? _area,
//   avatar: avatar ?? _avatar,
//   profileDescription: profileDescription ?? _profileDescription,
//   username: username ?? _username,
// );
//   String? get id => _id;
//   String? get user => _user;
//   String? get role => _role;
//   String? get phoneOrEmail => _phoneOrEmail;
//   num? get isPoint => _isPoint;
//   String? get createdAt => _createdAt;
//   String? get updatedAt => _updatedAt;
//   num? get v => _v;
//   String? get address => _address;
//   String? get area => _area;
//   String? get avatar => _avatar;
//   String? get profileDescription => _profileDescription;
//   String? get username => _username;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['_id'] = _id;
//     map['user'] = _user;
//     map['role'] = _role;
//     map['phone_or_email'] = _phoneOrEmail;
//     map['is_point'] = _isPoint;
//     map['createdAt'] = _createdAt;
//     map['updatedAt'] = _updatedAt;
//     map['__v'] = _v;
//     map['address'] = _address;
//     map['area'] = _area;
//     map['avatar'] = _avatar;
//     map['profile_description'] = _profileDescription;
//     map['username'] = _username;
//     return map;
//   }
//
// }
//
// /// _id : "66d2d18a926a5372012d8e9b"
// /// parentId : null
// /// category_name : "Cleaning"
// /// description : "Responsible for all basic cleaning in and around residences or office buildings. Cleans floors and rooms. including dust mopping, damp mopping, sweeping, vacuuming, dusting, picking up larger objects off the floor, and spot cleaning glass and windows."
// /// createdAt : "2024-08-31T08:17:14.997Z"
// /// updatedAt : "2024-08-31T08:17:14.997Z"
// /// __v : 0
//
// class ServiceCategoryId {
//   ServiceCategoryId({
//       String? id,
//       dynamic parentId,
//       String? categoryName,
//       String? description,
//       String? createdAt,
//       String? updatedAt,
//       num? v,}){
//     _id = id;
//     _parentId = parentId;
//     _categoryName = categoryName;
//     _description = description;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//     _v = v;
// }
//
//   ServiceCategoryId.fromJson(dynamic json) {
//     _id = json['_id'];
//     _parentId = json['parentId'];
//     _categoryName = json['category_name'];
//     _description = json['description'];
//     _createdAt = json['createdAt'];
//     _updatedAt = json['updatedAt'];
//     _v = json['__v'];
//   }
//   String? _id;
//   dynamic _parentId;
//   String? _categoryName;
//   String? _description;
//   String? _createdAt;
//   String? _updatedAt;
//   num? _v;
// ServiceCategoryId copyWith({  String? id,
//   dynamic parentId,
//   String? categoryName,
//   String? description,
//   String? createdAt,
//   String? updatedAt,
//   num? v,
// }) => ServiceCategoryId(  id: id ?? _id,
//   parentId: parentId ?? _parentId,
//   categoryName: categoryName ?? _categoryName,
//   description: description ?? _description,
//   createdAt: createdAt ?? _createdAt,
//   updatedAt: updatedAt ?? _updatedAt,
//   v: v ?? _v,
// );
//   String? get id => _id;
//   dynamic get parentId => _parentId;
//   String? get categoryName => _categoryName;
//   String? get description => _description;
//   String? get createdAt => _createdAt;
//   String? get updatedAt => _updatedAt;
//   num? get v => _v;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['_id'] = _id;
//     map['parentId'] = _parentId;
//     map['category_name'] = _categoryName;
//     map['description'] = _description;
//     map['createdAt'] = _createdAt;
//     map['updatedAt'] = _updatedAt;
//     map['__v'] = _v;
//     return map;
//   }
//
// }
//
// /// discount : 10
// /// discount_type : "Percentage Discount"
//
// class ServiceDiscount {
//   ServiceDiscount({
//       num? discount,
//       String? discountType,}){
//     _discount = discount;
//     _discountType = discountType;
// }
//
//   ServiceDiscount.fromJson(dynamic json) {
//     _discount = json['discount'];
//     _discountType = json['discount_type'];
//   }
//   num? _discount;
//   String? _discountType;
// ServiceDiscount copyWith({  num? discount,
//   String? discountType,
// }) => ServiceDiscount(  discount: discount ?? _discount,
//   discountType: discountType ?? _discountType,
// );
//   num? get discount => _discount;
//   String? get discountType => _discountType;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['discount'] = _discount;
//     map['discount_type'] = _discountType;
//     return map;
//   }
//
// }