/// _id : "66dc1698ac0379cc0dec88b8"
/// user : {"_id":"66dc167dac0379cc0dec88b4","email":"worker@gmail.com","userType":"worker","is_phone_verified":true,"createdAt":"2024-09-07T09:01:49.556Z","updatedAt":"2024-09-07T09:02:16.654Z","__v":0}
/// role : "worker"
/// is_free : "YES"
/// phone_or_email : "worker@gmail.com"
/// ratings : 0
/// services : [{"service":{"service_discount":{"discount":50,"discount_type":"Taka Amount Discount"},"_id":"66d2d55d926a5372012d8f2b","service_category_id":"66d2d18a926a5372012d8e9b","name":"Office Cleaning","description":"They also sweep and mop floors and outdoor sidewalks and patio spaces · Upholstery/Leather Cleaning · Various hard floor duties, including stone floor polishing ...","service_price":599,"image":"fFRZM7jfB-cleaning_combo.jpg","ratings":4.3,"reviews":[{"user":"66dc0571a521a07c53202ae7","comment":"Example: Hi [name]. This is [your name] with [company]. Thanks for your recent order [link to order information]. We've shipped your product.","rating":5,"_id":"66eabf6ce9b8b63eb75c3f93","date":"2024-09-18T12:40:45.981Z"},{"user":"66dc0583a521a07c53202aeb","comment":"nice service","rating":5,"date":"2024-09-19T06:55:20.143Z","_id":"66ebc65eeb6a28289d8d196d"},{"user":"66dc0583a521a07c53202aeb","comment":"nice","rating":3,"date":"2024-09-19T06:49:50.507Z","_id":"66ebc98e7623004bb4eadd53"}],"createdAt":"2024-08-31T08:33:33.151Z","updatedAt":"2024-09-19T06:55:20.143Z","__v":3},"_id":"66f0050eba0700f65705ab04"},{"service":{"service_discount":{"discount":0},"_id":"66d2d5a1926a5372012d8f41","service_category_id":"66d2d217926a5372012d8eb5","name":"Cloth Washing","description":"Laundry is the washing of clothing and other textiles, and, more broadly, their drying and ironing as well. Laundry has been part of history since humans began to wear clothes, so the methods by which different cultures have dealt with this universal human need are of interest to several branches of scholarship.","service_price":400,"image":"Dj36-KBnw-appliance.jpg","ratings":0,"reviews":[],"createdAt":"2024-08-31T08:34:41.521Z","updatedAt":"2024-08-31T08:34:41.521Z","__v":0},"_id":"66f0050eba0700f65705ab05"},{"service":{"service_discount":{"discount":100,"discount_type":"Taka Amount Discount"},"_id":"66ee5c46e5abbf1259c92894","service_category_id":"66d2d1e2926a5372012d8eab","name":"AC Service","description":"Comprehensive AC service including installation, repair, maintenance, and cleaning for optimal cooling efficiency and air quality.","service_price":549,"image":"27M19UHj4-ac servicing.jpg","ratings":0,"reviews":[],"createdAt":"2024-09-21T05:40:22.458Z","updatedAt":"2024-09-24T05:00:21.886Z","__v":0},"_id":"66f0050eba0700f65705ab06"},{"service":{"service_discount":{"discount":10,"discount_type":"Percentage Discount"},"_id":"66d2d4df926a5372012d8f04","service_category_id":"66d2d18a926a5372012d8e9b","name":"Home Cleaning","description":"A Home Cleaner is responsible for cleaning various areas of a client's home. They are typically light-duty Cleaners responsible for sweeping, mopping, washing, ...","service_price":500,"image":"p-r9uymbv-cleaningHome.jpg","ratings":5,"reviews":[{"user":"66dc0583a521a07c53202aeb","comment":"nice service","rating":5,"date":"2024-09-19T06:55:20.146Z","_id":"66ebc98e7623004bb4eadd55"}],"createdAt":"2024-08-31T08:31:27.451Z","updatedAt":"2024-09-19T06:55:20.146Z","__v":1},"_id":"66f0050eba0700f65705ab07"},{"service":{"service_discount":{"discount":0},"_id":"66ee3e9a1f5755f957d49b11","service_category_id":"66d2d1e2926a5372012d8eab","name":"Printer Service","description":"Fast, reliable printer repair and maintenance for all major brands.","service_price":400,"image":"SoYficJbq-Printer.jpg","ratings":0,"reviews":[],"createdAt":"2024-09-21T03:33:46.882Z","updatedAt":"2024-09-21T03:34:30.006Z","__v":0},"_id":"66f0050eba0700f65705ab08"},{"service":{"service_discount":{"discount":0},"_id":"66ee40151f5755f957d49d7e","service_category_id":"66d2d1e2926a5372012d8eab","name":"Laptop/Notebook Services","description":"Expert laptop repair, screen replacement, battery issues, and performance optimization.","service_price":500,"image":"yX1GuMVxh-laptop.jpg","ratings":0,"reviews":[],"createdAt":"2024-09-21T03:40:05.228Z","updatedAt":"2024-09-21T03:40:05.228Z","__v":0},"_id":"66f0050eba0700f65705ab09"}]
/// reviews : []
/// createdAt : "2024-09-07T09:02:16.649Z"
/// updatedAt : "2024-09-22T11:52:46.659Z"
/// __v : 3
/// address : "Rangpur baggerhat "
/// area : "korpara"
/// profile_description : "Definition. Educational qualifications refers to the official confirmation, usually in the form of a certificate, diploma or degree, certifying the successful completion of an education program or a stage of a program"
/// username : "Rohim Mia"
/// avatar : "0sG5loD-C-pexels-rdne-7464724.jpg"
/// languages : ["English","Hindi","Bangla"]
/// gender : "Female"
/// relationship : "Single"

class WorkerModel {
  WorkerModel({
    String? id,
    User? user,
    String? role,
    String? isFree,
    String? phoneOrEmail,
    num? ratings,
    List<Services>? services,
    List<dynamic>? reviews,
    String? createdAt,
    String? updatedAt,
    num? v,
    String? address,
    String? area,
    String? profileDescription,
    String? username,
    String? avatar,
    List<String>? languages,
    String? gender,
    String? relationship,
  }) {
    _id = id;
    _user = user;
    _role = role;
    _isFree = isFree;
    _phoneOrEmail = phoneOrEmail;
    _ratings = ratings;
    _services = services;
    _reviews = reviews;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _address = address;
    _area = area;
    _profileDescription = profileDescription;
    _username = username;
    _avatar = avatar;
    _languages = languages;
    _gender = gender;
    _relationship = relationship;
  }

  WorkerModel.fromJson(dynamic json) {
    _id = json['_id'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _role = json['role'];
    _isFree = json['is_free'];
    _phoneOrEmail = json['phone_or_email'];
    _ratings = json['ratings'];
    if (json['services'] != null) {
      _services = [];
      json['services'].forEach((v) {
        _services?.add(Services.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      List<dynamic>.from(json["reviews"].map((x) => x));
    }
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _address = json['address'];
    _area = json['area'];
    _profileDescription = json['profile_description'];
    _username = json['username'];
    _avatar = json['avatar'];
    _languages =
        json['languages'] != null ? json['languages'].cast<String>() : [];
    _gender = json['gender'];
    _relationship = json['relationship'];
  }
  String? _id;
  User? _user;
  String? _role;
  String? _isFree;
  String? _phoneOrEmail;
  num? _ratings;
  List<Services>? _services;
  List<dynamic>? _reviews;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  String? _address;
  String? _area;
  String? _profileDescription;
  String? _username;
  String? _avatar;
  List<String>? _languages;
  String? _gender;
  String? _relationship;
  WorkerModel copyWith({
    String? id,
    User? user,
    String? role,
    String? isFree,
    String? phoneOrEmail,
    num? ratings,
    List<Services>? services,
    List<dynamic>? reviews,
    String? createdAt,
    String? updatedAt,
    num? v,
    String? address,
    String? area,
    String? profileDescription,
    String? username,
    String? avatar,
    List<String>? languages,
    String? gender,
    String? relationship,
  }) =>
      WorkerModel(
        id: id ?? _id,
        user: user ?? _user,
        role: role ?? _role,
        isFree: isFree ?? _isFree,
        phoneOrEmail: phoneOrEmail ?? _phoneOrEmail,
        ratings: ratings ?? _ratings,
        services: services ?? _services,
        reviews: reviews ?? _reviews,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
        address: address ?? _address,
        area: area ?? _area,
        profileDescription: profileDescription ?? _profileDescription,
        username: username ?? _username,
        avatar: avatar ?? _avatar,
        languages: languages ?? _languages,
        gender: gender ?? _gender,
        relationship: relationship ?? _relationship,
      );
  String? get id => _id;
  User? get user => _user;
  String? get role => _role;
  String? get isFree => _isFree;
  String? get phoneOrEmail => _phoneOrEmail;
  num? get ratings => _ratings;
  List<Services>? get services => _services;
  List<dynamic>? get reviews => _reviews;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;
  String? get address => _address;
  String? get area => _area;
  String? get profileDescription => _profileDescription;
  String? get username => _username;
  String? get avatar => _avatar;
  List<String>? get languages => _languages;
  String? get gender => _gender;
  String? get relationship => _relationship;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['role'] = _role;
    map['is_free'] = _isFree;
    map['phone_or_email'] = _phoneOrEmail;
    map['ratings'] = _ratings;
    if (_services != null) {
      map['services'] = _services?.map((v) => v.toJson()).toList();
    }
    if (_reviews != null) {
      map['reviews'] = List<dynamic>.from(reviews!.map((x) => x));
    }
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    map['address'] = _address;
    map['area'] = _area;
    map['profile_description'] = _profileDescription;
    map['username'] = _username;
    map['avatar'] = _avatar;
    map['languages'] = _languages;
    map['gender'] = _gender;
    map['relationship'] = _relationship;
    return map;
  }
}

/// service : {"service_discount":{"discount":50,"discount_type":"Taka Amount Discount"},"_id":"66d2d55d926a5372012d8f2b","service_category_id":"66d2d18a926a5372012d8e9b","name":"Office Cleaning","description":"They also sweep and mop floors and outdoor sidewalks and patio spaces · Upholstery/Leather Cleaning · Various hard floor duties, including stone floor polishing ...","service_price":599,"image":"fFRZM7jfB-cleaning_combo.jpg","ratings":4.3,"reviews":[{"user":"66dc0571a521a07c53202ae7","comment":"Example: Hi [name]. This is [your name] with [company]. Thanks for your recent order [link to order information]. We've shipped your product.","rating":5,"_id":"66eabf6ce9b8b63eb75c3f93","date":"2024-09-18T12:40:45.981Z"},{"user":"66dc0583a521a07c53202aeb","comment":"nice service","rating":5,"date":"2024-09-19T06:55:20.143Z","_id":"66ebc65eeb6a28289d8d196d"},{"user":"66dc0583a521a07c53202aeb","comment":"nice","rating":3,"date":"2024-09-19T06:49:50.507Z","_id":"66ebc98e7623004bb4eadd53"}],"createdAt":"2024-08-31T08:33:33.151Z","updatedAt":"2024-09-19T06:55:20.143Z","__v":3}
/// _id : "66f0050eba0700f65705ab04"

class Services {
  Services({
    Service? service,
    String? id,
  }) {
    _service = service;
    _id = id;
  }

  Services.fromJson(dynamic json) {
    _service =
        json['service'] != null ? Service.fromJson(json['service']) : null;
    _id = json['_id'];
  }
  Service? _service;
  String? _id;
  Services copyWith({
    Service? service,
    String? id,
  }) =>
      Services(
        service: service ?? _service,
        id: id ?? _id,
      );
  Service? get service => _service;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_service != null) {
      map['service'] = _service?.toJson();
    }
    map['_id'] = _id;
    return map;
  }
}

/// service_discount : {"discount":50,"discount_type":"Taka Amount Discount"}
/// _id : "66d2d55d926a5372012d8f2b"
/// service_category_id : "66d2d18a926a5372012d8e9b"
/// name : "Office Cleaning"
/// description : "They also sweep and mop floors and outdoor sidewalks and patio spaces · Upholstery/Leather Cleaning · Various hard floor duties, including stone floor polishing ..."
/// service_price : 599
/// image : "fFRZM7jfB-cleaning_combo.jpg"
/// ratings : 4.3
/// reviews : [{"user":"66dc0571a521a07c53202ae7","comment":"Example: Hi [name]. This is [your name] with [company]. Thanks for your recent order [link to order information]. We've shipped your product.","rating":5,"_id":"66eabf6ce9b8b63eb75c3f93","date":"2024-09-18T12:40:45.981Z"},{"user":"66dc0583a521a07c53202aeb","comment":"nice service","rating":5,"date":"2024-09-19T06:55:20.143Z","_id":"66ebc65eeb6a28289d8d196d"},{"user":"66dc0583a521a07c53202aeb","comment":"nice","rating":3,"date":"2024-09-19T06:49:50.507Z","_id":"66ebc98e7623004bb4eadd53"}]
/// createdAt : "2024-08-31T08:33:33.151Z"
/// updatedAt : "2024-09-19T06:55:20.143Z"
/// __v : 3

class Service {
  Service({
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
    num? v,
  }) {
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

  Service.fromJson(dynamic json) {
    _serviceDiscount = json['service_discount'] != null
        ? ServiceDiscount.fromJson(json['service_discount'])
        : null;
    _id = json['_id'];
    _serviceCategoryId = json['service_category_id'];
    _name = json['name'];
    _description = json['description'];
    _servicePrice = json['service_price'];
    _image = json['image'];
    _ratings = json['ratings'];
    if (json['reviews'] != null) {
      _reviews = [];
      json['reviews'].forEach((v) {
        _reviews?.add(Reviews.fromJson(v));
      });
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
  Service copyWith({
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
    num? v,
  }) =>
      Service(
        serviceDiscount: serviceDiscount ?? _serviceDiscount,
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

/// user : "66dc0571a521a07c53202ae7"
/// comment : "Example: Hi [name]. This is [your name] with [company]. Thanks for your recent order [link to order information]. We've shipped your product."
/// rating : 5
/// _id : "66eabf6ce9b8b63eb75c3f93"
/// date : "2024-09-18T12:40:45.981Z"

class Reviews {
  Reviews({
    String? user,
    String? comment,
    num? rating,
    String? id,
    String? date,
  }) {
    _user = user;
    _comment = comment;
    _rating = rating;
    _id = id;
    _date = date;
  }

  Reviews.fromJson(dynamic json) {
    _user = json['user'];
    _comment = json['comment'];
    _rating = json['rating'];
    _id = json['_id'];
    _date = json['date'];
  }
  String? _user;
  String? _comment;
  num? _rating;
  String? _id;
  String? _date;
  Reviews copyWith({
    String? user,
    String? comment,
    num? rating,
    String? id,
    String? date,
  }) =>
      Reviews(
        user: user ?? _user,
        comment: comment ?? _comment,
        rating: rating ?? _rating,
        id: id ?? _id,
        date: date ?? _date,
      );
  String? get user => _user;
  String? get comment => _comment;
  num? get rating => _rating;
  String? get id => _id;
  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user'] = _user;
    map['comment'] = _comment;
    map['rating'] = _rating;
    map['_id'] = _id;
    map['date'] = _date;
    return map;
  }
}

/// discount : 50
/// discount_type : "Taka Amount Discount"

class ServiceDiscount {
  ServiceDiscount({
    num? discount,
    String? discountType,
  }) {
    _discount = discount;
    _discountType = discountType;
  }

  ServiceDiscount.fromJson(dynamic json) {
    _discount = json['discount'];
    _discountType = json['discount_type'];
  }
  num? _discount;
  String? _discountType;
  ServiceDiscount copyWith({
    num? discount,
    String? discountType,
  }) =>
      ServiceDiscount(
        discount: discount ?? _discount,
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

/// _id : "66dc167dac0379cc0dec88b4"
/// email : "worker@gmail.com"
/// userType : "worker"
/// is_phone_verified : true
/// createdAt : "2024-09-07T09:01:49.556Z"
/// updatedAt : "2024-09-07T09:02:16.654Z"
/// __v : 0

class User {
  User({
    String? id,
    String? email,
    String? userType,
    bool? isPhoneVerified,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) {
    _id = id;
    _email = email;
    _userType = userType;
    _isPhoneVerified = isPhoneVerified;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  User.fromJson(dynamic json) {
    _id = json['_id'];
    _email = json['email'];
    _userType = json['userType'];
    _isPhoneVerified = json['is_phone_verified'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _email;
  String? _userType;
  bool? _isPhoneVerified;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  User copyWith({
    String? id,
    String? email,
    String? userType,
    bool? isPhoneVerified,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) =>
      User(
        id: id ?? _id,
        email: email ?? _email,
        userType: userType ?? _userType,
        isPhoneVerified: isPhoneVerified ?? _isPhoneVerified,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
      );
  String? get id => _id;
  String? get email => _email;
  String? get userType => _userType;
  bool? get isPhoneVerified => _isPhoneVerified;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['email'] = _email;
    map['userType'] = _userType;
    map['is_phone_verified'] = _isPhoneVerified;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}
