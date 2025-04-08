

/// _id : "678211c78c763ba1b530e3a2"
/// user : {"_id":"678211ad8c763ba1b530e398","username":"Karim","phone":"0127236623","email":"karim@gmail.com","password":"$2b$10$bnpP8syfXoxQriWAEggFuutHZ3w5k0XpOIz4NbYulgqEqUOQ/dxO2","userType":"worker","is_phone_verified":true,"createdAt":"2025-01-11T06:37:33.653Z","updatedAt":"2025-01-11T06:37:59.358Z","__v":0}
/// username : "Karim"
/// role : "worker"
/// is_free : "YES"
/// phone_or_email : "0127236623"
/// languages : ["Bangla","English"]
/// ratings : 0
/// apply : false
/// services : [{"service":{"service_discount":{"discount":50,"discount_type":"Percentage Discount"},"_id":"677dfb9ce15dedad988d3204","service_category_id":"676a80e1b817e0e7ebdb198f","name":"Room Cleaning","description":"home cleaning is the best service in my office","service_overview":"","service_price":300,"image":"GlYoi9N6P-462567654_896952099172260_7180434212789286274_n.jpg","ratings":0,"schedules":["months","days","weeks"],"minimum_advance_paid":99,"reviews":[],"createdAt":"2025-01-08T04:14:21.217Z","updatedAt":"2025-01-14T05:14:06.954Z","__v":2},"_id":"67907d941b5412933a6cbc52"},{"service":{"service_discount":{"discount":0},"_id":"677e2b071bd1e8ff30097526","service_category_id":"676a80e1b817e0e7ebdb198f","name":"Kitchen Cleaning","description":"They perform tasks such as mopping floors, scrubbing countertops, cleaning equipment, and removing grease and residue. They play a crucial role in maintaining hygiene standards and promoting a safe environment for food preparation.","service_overview":"","service_price":400,"image":"KJ5jmdg_a-462570843_2876409679187204_2950175520610610049_n.jpg","ratings":0,"schedules":["months"],"minimum_advance_paid":97,"reviews":[],"createdAt":"2025-01-08T07:36:39.371Z","updatedAt":"2025-01-09T06:34:41.729Z","__v":0},"_id":"67907d941b5412933a6cbc53"},{"service":{"service_discount":{"discount":0},"_id":"677f531a376f717e76b79fb7","service_category_id":"676a7f2eb817e0e7ebdb1806","name":"Home Caretaker","description":"Caretakers look after buildings like schools, community centres and flats, keeping them secure, clean and well-maintained.","service_overview":"","service_price":398,"image":"k_lcd1WB4-older-woman-with-medical-mask-female-nurse.jpg","ratings":0,"schedules":["days","months","weeks"],"minimum_advance_paid":98,"reviews":[],"createdAt":"2025-01-09T04:39:54.510Z","updatedAt":"2025-01-09T04:39:54.510Z","__v":0},"_id":"67907d941b5412933a6cbc54"},{"service":{"service_discount":{"discount":0},"_id":"677f6f6120e89bf1efeb4db4","service_category_id":"676a80e1b817e0e7ebdb198f","name":"House Cleaning","description":"Sanitizing and disinfecting areas or surfaces within a home. Dusting furniture, vacuuming carpets or rugs, and washing windows, ceilings, and walls. Responding to complaints and inquiries from homeowners.","service_overview":"","service_price":500,"image":"MhNFbdTFu-cleaningHome.jpg","ratings":0,"schedules":["months"],"minimum_advance_paid":98,"reviews":[],"createdAt":"2025-01-09T06:40:33.977Z","updatedAt":"2025-01-09T08:15:03.689Z","__v":0},"_id":"67907d941b5412933a6cbc55"},{"service":{"service_discount":{"discount":0},"_id":"677f725220e89bf1efeb4efd","service_category_id":"676a80e1b817e0e7ebdb198f","name":"Home Item Delivery ","description":"Home delivery method includes any type of delivery at the consumer's residential or commercial address. As a general rule, customers need to answer the door and receive the goods personally.","service_overview":"","service_price":400,"image":"oG8HLGt2F-homeshifting.webp","ratings":0,"schedules":["hours"],"minimum_advance_paid":97,"reviews":[],"createdAt":"2025-01-09T06:53:06.625Z","updatedAt":"2025-01-09T08:15:40.675Z","__v":0},"_id":"67907d941b5412933a6cbc56"}]
/// reviews : []
/// createdAt : "2025-01-11T06:37:59.120Z"
/// updatedAt : "2025-01-22T05:09:40.782Z"
/// __v : 3
/// birthday : "2025-01-09"
/// blood_group : "B+"
/// emergency_contract : {"name":"asadul-islam","phone":"83472984","address":"fg","email":"sdfsdf@gmail.com","relationship":"friend","profession":"engineer"}
/// first_name : "Md"
/// gender : "Male"
/// last_name : "Karim"
/// nationality : "Bangladesh"
/// phone_number : "012373473"
/// relationship : "Married"
/// religion : "Islam"
/// avatar : "0cWJfDNf2-Screenshot 2025-01-09 104657.png"
/// nid_number : "345345"

class WorkerModel {
  WorkerModel({
    String? id,
    User? user,
    String? username,
    String? role,
    String? isFree,
    String? phoneOrEmail,
    List<String>? languages,
    num? ratings,
    bool? apply,
    List<Services>? services,
    List<dynamic>? reviews,
    String? createdAt,
    String? updatedAt,
    num? v,
    String? birthday,
    String? bloodGroup,
    EmergencyContract? emergencyContract,
    String? firstName,
    String? gender,
    String? lastName,
    String? nationality,
    String? phoneNumber,
    String? relationship,
    String? religion,
    String? avatar,
    String? nidNumber,}){
    _id = id;
    _user = user;
    _username = username;
    _role = role;
    _isFree = isFree;
    _phoneOrEmail = phoneOrEmail;
    _languages = languages;
    _ratings = ratings;
    _apply = apply;
    _services = services;
    _reviews = reviews;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _birthday = birthday;
    _bloodGroup = bloodGroup;
    _emergencyContract = emergencyContract;
    _firstName = firstName;
    _gender = gender;
    _lastName = lastName;
    _nationality = nationality;
    _phoneNumber = phoneNumber;
    _relationship = relationship;
    _religion = religion;
    _avatar = avatar;
    _nidNumber = nidNumber;
  }

  WorkerModel.fromJson(dynamic json) {
    _id = json['_id'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _username = json['username'];
    _role = json['role'];
    _isFree = json['is_free'];
    _phoneOrEmail = json['phone_or_email'];
    _languages = json['languages'] != null ? json['languages'].cast<String>() : [];
    _ratings = json['ratings'];
    _apply = json['apply'];
    if (json['services'] != null) {
      _services = [];
      json['services'].forEach((v) {
        _services?.add(Services.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      json['reviews'].forEach((v) {
        List<dynamic>.from(json["reviews"].map((x) => x));
      });
    }
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _birthday = json['birthday'];
    _bloodGroup = json['blood_group'];
    _emergencyContract = json['emergency_contract'] != null ? EmergencyContract.fromJson(json['emergency_contract']) : null;
    _firstName = json['first_name'];
    _gender = json['gender'];
    _lastName = json['last_name'];
    _nationality = json['nationality'];
    _phoneNumber = json['phone_number'];
    _relationship = json['relationship'];
    _religion = json['religion'];
    _avatar = json['avatar'];
    _nidNumber = json['nid_number'];
  }
  String? _id;
  User? _user;
  String? _username;
  String? _role;
  String? _isFree;
  String? _phoneOrEmail;
  List<String>? _languages;
  num? _ratings;
  bool? _apply;
  List<Services>? _services;
  List<dynamic>? _reviews;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  String? _birthday;
  String? _bloodGroup;
  EmergencyContract? _emergencyContract;
  String? _firstName;
  String? _gender;
  String? _lastName;
  String? _nationality;
  String? _phoneNumber;
  String? _relationship;
  String? _religion;
  String? _avatar;
  String? _nidNumber;
  WorkerModel copyWith({  String? id,
    User? user,
    String? username,
    String? role,
    String? isFree,
    String? phoneOrEmail,
    List<String>? languages,
    num? ratings,
    bool? apply,
    List<Services>? services,
    List<dynamic>? reviews,
    String? createdAt,
    String? updatedAt,
    num? v,
    String? birthday,
    String? bloodGroup,
    EmergencyContract? emergencyContract,
    String? firstName,
    String? gender,
    String? lastName,
    String? nationality,
    String? phoneNumber,
    String? relationship,
    String? religion,
    String? avatar,
    String? nidNumber,
  }) => WorkerModel(  id: id ?? _id,
    user: user ?? _user,
    username: username ?? _username,
    role: role ?? _role,
    isFree: isFree ?? _isFree,
    phoneOrEmail: phoneOrEmail ?? _phoneOrEmail,
    languages: languages ?? _languages,
    ratings: ratings ?? _ratings,
    apply: apply ?? _apply,
    services: services ?? _services,
    reviews: reviews ?? _reviews,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
    v: v ?? _v,
    birthday: birthday ?? _birthday,
    bloodGroup: bloodGroup ?? _bloodGroup,
    emergencyContract: emergencyContract ?? _emergencyContract,
    firstName: firstName ?? _firstName,
    gender: gender ?? _gender,
    lastName: lastName ?? _lastName,
    nationality: nationality ?? _nationality,
    phoneNumber: phoneNumber ?? _phoneNumber,
    relationship: relationship ?? _relationship,
    religion: religion ?? _religion,
    avatar: avatar ?? _avatar,
    nidNumber: nidNumber ?? _nidNumber,
  );
  String? get id => _id;
  User? get user => _user;
  String? get username => _username;
  String? get role => _role;
  String? get isFree => _isFree;
  String? get phoneOrEmail => _phoneOrEmail;
  List<String>? get languages => _languages;
  num? get ratings => _ratings;
  bool? get apply => _apply;
  List<Services>? get services => _services;
  List<dynamic>? get reviews => _reviews;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;
  String? get birthday => _birthday;
  String? get bloodGroup => _bloodGroup;
  EmergencyContract? get emergencyContract => _emergencyContract;
  String? get firstName => _firstName;
  String? get gender => _gender;
  String? get lastName => _lastName;
  String? get nationality => _nationality;
  String? get phoneNumber => _phoneNumber;
  String? get relationship => _relationship;
  String? get religion => _religion;
  String? get avatar => _avatar;
  String? get nidNumber => _nidNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['username'] = _username;
    map['role'] = _role;
    map['is_free'] = _isFree;
    map['phone_or_email'] = _phoneOrEmail;
    map['languages'] = _languages;
    map['ratings'] = _ratings;
    map['apply'] = _apply;
    if (_services != null) {
      map['services'] = _services?.map((v) => v.toJson()).toList();
    }
    if (_reviews != null) {
      map['reviews'] = _reviews?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    map['birthday'] = _birthday;
    map['blood_group'] = _bloodGroup;
    if (_emergencyContract != null) {
      map['emergency_contract'] = _emergencyContract?.toJson();
    }
    map['first_name'] = _firstName;
    map['gender'] = _gender;
    map['last_name'] = _lastName;
    map['nationality'] = _nationality;
    map['phone_number'] = _phoneNumber;
    map['relationship'] = _relationship;
    map['religion'] = _religion;
    map['avatar'] = _avatar;
    map['nid_number'] = _nidNumber;
    return map;
  }

}

/// name : "asadul-islam"
/// phone : "83472984"
/// address : "fg"
/// email : "sdfsdf@gmail.com"
/// relationship : "friend"
/// profession : "engineer"

class EmergencyContract {
  EmergencyContract({
    String? name,
    String? phone,
    String? address,
    String? email,
    String? relationship,
    String? profession,}){
    _name = name;
    _phone = phone;
    _address = address;
    _email = email;
    _relationship = relationship;
    _profession = profession;
  }

  EmergencyContract.fromJson(dynamic json) {
    _name = json['name'];
    _phone = json['phone'];
    _address = json['address'];
    _email = json['email'];
    _relationship = json['relationship'];
    _profession = json['profession'];
  }
  String? _name;
  String? _phone;
  String? _address;
  String? _email;
  String? _relationship;
  String? _profession;
  EmergencyContract copyWith({  String? name,
    String? phone,
    String? address,
    String? email,
    String? relationship,
    String? profession,
  }) => EmergencyContract(  name: name ?? _name,
    phone: phone ?? _phone,
    address: address ?? _address,
    email: email ?? _email,
    relationship: relationship ?? _relationship,
    profession: profession ?? _profession,
  );
  String? get name => _name;
  String? get phone => _phone;
  String? get address => _address;
  String? get email => _email;
  String? get relationship => _relationship;
  String? get profession => _profession;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['phone'] = _phone;
    map['address'] = _address;
    map['email'] = _email;
    map['relationship'] = _relationship;
    map['profession'] = _profession;
    return map;
  }

}

/// service : {"service_discount":{"discount":50,"discount_type":"Percentage Discount"},"_id":"677dfb9ce15dedad988d3204","service_category_id":"676a80e1b817e0e7ebdb198f","name":"Room Cleaning","description":"home cleaning is the best service in my office","service_overview":"","service_price":300,"image":"GlYoi9N6P-462567654_896952099172260_7180434212789286274_n.jpg","ratings":0,"schedules":["months","days","weeks"],"minimum_advance_paid":99,"reviews":[],"createdAt":"2025-01-08T04:14:21.217Z","updatedAt":"2025-01-14T05:14:06.954Z","__v":2}
/// _id : "67907d941b5412933a6cbc52"

class Services {
  Services({
    Service? service,
    String? id,}){
    _service = service;
    _id = id;
  }

  Services.fromJson(dynamic json) {
    _service = json['service'] != null ? Service.fromJson(json['service']) : null;
    _id = json['_id'];
  }
  Service? _service;
  String? _id;
  Services copyWith({  Service? service,
    String? id,
  }) => Services(  service: service ?? _service,
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


// user : "66dc0571a521a07c53202ae7"
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
/// service_discount : {"discount":50,"discount_type":"Percentage Discount"}
/// _id : "677dfb9ce15dedad988d3204"
/// service_category_id : "676a80e1b817e0e7ebdb198f"
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
/// updatedAt : "2025-01-14T05:14:06.954Z"
/// __v : 2

class Service {
  Service({
    ServiceDiscount? serviceDiscount,
    String? id,
    String? serviceCategoryId,
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
    num? v,}){
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

  Service.fromJson(dynamic json) {
    _serviceDiscount = json['service_discount'] != null ? ServiceDiscount.fromJson(json['service_discount']) : null;
    _id = json['_id'];
    _serviceCategoryId = json['service_category_id'];
    _name = json['name'];
    _description = json['description'];
    _serviceOverview = json['service_overview'];
    _servicePrice = json['service_price'];
    _image = json['image'];
    _ratings = json['ratings'];
    _schedules = json['schedules'] != null ? json['schedules'].cast<String>() : [];
    _minimumAdvancePaid = json['minimum_advance_paid'];
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
  Service copyWith({  ServiceDiscount? serviceDiscount,
    String? id,
    String? serviceCategoryId,
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
  }) => Service(  serviceDiscount: serviceDiscount ?? _serviceDiscount,
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
  String? get serviceCategoryId => _serviceCategoryId;
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
    map['service_category_id'] = _serviceCategoryId;
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

/// discount : 50
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

/// _id : "678211ad8c763ba1b530e398"
/// username : "Karim"
/// phone : "0127236623"
/// email : "karim@gmail.com"
/// password : "$2b$10$bnpP8syfXoxQriWAEggFuutHZ3w5k0XpOIz4NbYulgqEqUOQ/dxO2"
/// userType : "worker"
/// is_phone_verified : true
/// createdAt : "2025-01-11T06:37:33.653Z"
/// updatedAt : "2025-01-11T06:37:59.358Z"
/// __v : 0

class User {
  User({
    String? id,
    String? username,
    String? phone,
    String? email,
    String? password,
    String? userType,
    bool? isPhoneVerified,
    String? createdAt,
    String? updatedAt,
    num? v,}){
    _id = id;
    _username = username;
    _phone = phone;
    _email = email;
    _password = password;
    _userType = userType;
    _isPhoneVerified = isPhoneVerified;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  User.fromJson(dynamic json) {
    _id = json['_id'];
    _username = json['username'];
    _phone = json['phone'];
    _email = json['email'];
    _password = json['password'];
    _userType = json['userType'];
    _isPhoneVerified = json['is_phone_verified'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _username;
  String? _phone;
  String? _email;
  String? _password;
  String? _userType;
  bool? _isPhoneVerified;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  User copyWith({  String? id,
    String? username,
    String? phone,
    String? email,
    String? password,
    String? userType,
    bool? isPhoneVerified,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) => User(  id: id ?? _id,
    username: username ?? _username,
    phone: phone ?? _phone,
    email: email ?? _email,
    password: password ?? _password,
    userType: userType ?? _userType,
    isPhoneVerified: isPhoneVerified ?? _isPhoneVerified,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
    v: v ?? _v,
  );
  String? get id => _id;
  String? get username => _username;
  String? get phone => _phone;
  String? get email => _email;
  String? get password => _password;
  String? get userType => _userType;
  bool? get isPhoneVerified => _isPhoneVerified;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['username'] = _username;
    map['phone'] = _phone;
    map['email'] = _email;
    map['password'] = _password;
    map['userType'] = _userType;
    map['is_phone_verified'] = _isPhoneVerified;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}