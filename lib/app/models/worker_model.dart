class WorkerModel {
  final String id;
  final User user;
  final String role;
  final String isFree;
  final String phoneOrEmail;
  final int ratings;
  final List<ServiceElement> services;
  final List<dynamic> reviews;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final String address;
  final String area;
  final String profileDescription;
  final String username;
  final String avatar;
  final List<String> languages;
  final String gender;
  final String relationship;

  WorkerModel({
    required this.id,
    required this.user,
    required this.role,
    required this.isFree,
    required this.phoneOrEmail,
    required this.ratings,
    required this.services,
    required this.reviews,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.address,
    required this.area,
    required this.profileDescription,
    required this.username,
    required this.avatar,
    required this.languages,
    required this.gender,
    required this.relationship,
  });

  factory WorkerModel.fromJson(Map<String, dynamic> json) => WorkerModel(
    id: json["_id"],
    user: User.fromJson(json["user"]),
    role: json["role"],
    isFree: json["is_free"],
    phoneOrEmail: json["phone_or_email"],
    ratings: json["ratings"],
    services: List<ServiceElement>.from(json["services"].map((x) => ServiceElement.fromJson(x))),
    reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    address: json["address"],
    area: json["area"],
    profileDescription: json["profile_description"],
    username: json["username"],
    avatar: json["avatar"],
    languages: List<String>.from(json["languages"].map((x) => x)),
    gender: json["gender"],
    relationship: json["relationship"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user": user.toJson(),
    "role": role,
    "is_free": isFree,
    "phone_or_email": phoneOrEmail,
    "ratings": ratings,
    "services": List<dynamic>.from(services.map((x) => x.toJson())),
    "reviews": List<dynamic>.from(reviews.map((x) => x)),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "address": address,
    "area": area,
    "profile_description": profileDescription,
    "username": username,
    "avatar": avatar,
    "languages": List<dynamic>.from(languages.map((x) => x)),
    "gender": gender,
    "relationship": relationship,
  };

  // New toMap() function
  Map<String, dynamic> toMap() => {
    "_id": id,
    "user": user.toMap(),
    "role": role,
    "is_free": isFree,
    "phone_or_email": phoneOrEmail,
    "ratings": ratings,
    "services": services.map((x) => x.toMap()).toList(),
    "reviews": reviews,
    "createdAt": createdAt.millisecondsSinceEpoch,
    "updatedAt": updatedAt.millisecondsSinceEpoch,
    "__v": v,
    "address": address,
    "area": area,
    "profile_description": profileDescription,
    "username": username,
    "avatar": avatar,
    "languages": languages,
    "gender": gender,
    "relationship": relationship,
  };
}

class ServiceElement {
  final ServiceService service;
  final String id;

  ServiceElement({
    required this.service,
    required this.id,
  });

  factory ServiceElement.fromJson(Map<String, dynamic> json) => ServiceElement(
    service: ServiceService.fromJson(json["service"]),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "service": service.toJson(),
    "_id": id,
  };

  // New toMap() function
  Map<String, dynamic> toMap() => {
    "service": service.toMap(),
    "_id": id,
  };
}

class ServiceService {
  final ServiceDiscount serviceDiscount;
  final String id;
  final String serviceCategoryId;
  final String name;
  final String description;
  final int servicePrice;
  final String image;
  final double ratings;
  final List<Review> reviews;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  ServiceService({
    required this.serviceDiscount,
    required this.id,
    required this.serviceCategoryId,
    required this.name,
    required this.description,
    required this.servicePrice,
    required this.image,
    required this.ratings,
    required this.reviews,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ServiceService.fromJson(Map<String, dynamic> json) => ServiceService(
    serviceDiscount: ServiceDiscount.fromJson(json["service_discount"]),
    id: json["_id"],
    serviceCategoryId: json["service_category_id"],
    name: json["name"],
    description: json["description"],
    servicePrice: json["service_price"],
    image: json["image"],
    ratings: json["ratings"]?.toDouble(),
    reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "service_discount": serviceDiscount.toJson(),
    "_id": id,
    "service_category_id": serviceCategoryId,
    "name": name,
    "description": description,
    "service_price": servicePrice,
    "image": image,
    "ratings": ratings,
    "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };

  // New toMap() function
  Map<String, dynamic> toMap() => {
    "service_discount": serviceDiscount.toMap(),
    "_id": id,
    "service_category_id": serviceCategoryId,
    "name": name,
    "description": description,
    "service_price": servicePrice,
    "image": image,
    "ratings": ratings,
    "reviews": reviews.map((x) => x.toMap()).toList(),
    "createdAt": createdAt.millisecondsSinceEpoch,
    "updatedAt": updatedAt.millisecondsSinceEpoch,
    "__v": v,
  };
}

class Review {
  final String user;
  final String comment;
  final int rating;
  final String id;
  final DateTime date;

  Review({
    required this.user,
    required this.comment,
    required this.rating,
    required this.id,
    required this.date,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    user: json["user"],
    comment: json["comment"],
    rating: json["rating"],
    id: json["_id"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "comment": comment,
    "rating": rating,
    "_id": id,
    "date": date.toIso8601String(),
  };

  // New toMap() function
  Map<String, dynamic> toMap() => {
    "user": user,
    "comment": comment,
    "rating": rating,
    "_id": id,
    "date": date.millisecondsSinceEpoch,
  };
}

class ServiceDiscount {
  final int discount;
  final String? discountType;

  ServiceDiscount({
    required this.discount,
    this.discountType,
  });

  factory ServiceDiscount.fromJson(Map<String, dynamic> json) => ServiceDiscount(
    discount: json["discount"],
    discountType: json["discount_type"],
  );

  Map<String, dynamic> toJson() => {
    "discount": discount,
    "discount_type": discountType,
  };

  // New toMap() function
  Map<String, dynamic> toMap() => {
    "discount": discount,
    "discount_type": discountType,
  };
}

class User {
  final String id;
  final String email;
  final String userType;
  final bool isPhoneVerified;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  User({
    required this.id,
    required this.email,
    required this.userType,
    required this.isPhoneVerified,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    email: json["email"],
    userType: json["userType"],
    isPhoneVerified: json["is_phone_verified"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "email": email,
    "userType": userType,
    "is_phone_verified": isPhoneVerified,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };

  // New toMap() function
  Map<String, dynamic> toMap() => {
    "_id": id,
    "email": email,
    "userType": userType,
    "is_phone_verified": isPhoneVerified,
    "createdAt": createdAt.millisecondsSinceEpoch,
    "updatedAt": updatedAt.millisecondsSinceEpoch,
    "__v": v,
  };
}
