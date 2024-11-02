/// _id : "66f526e9c9d2890c726c88d3"
/// user : {"_id":"66dc0571a521a07c53202ae7","email":"mahim@gmail.com","userType":"client","is_phone_verified":true,"createdAt":"2024-09-07T07:49:05.151Z","updatedAt":"2024-10-07T11:18:25.800Z","__v":0,"is_otp":"04FEA4","otp_expiresIn":"2024-10-08T11:18:25.774Z"}
/// workers : [{"user":"66dc167dac0379cc0dec88b4","_id":"6700c18e260ee77b97724662"}]
/// services : [{"service":{"service_discount":{"discount":10,"discount_type":"Percentage Discount"},"_id":"66d2d4df926a5372012d8f04","service_category_id":"66d2d18a926a5372012d8e9b","name":"Home Cleaning","description":"A Home Cleaner is responsible for cleaning various areas of a client's home. They are typically light-duty Cleaners responsible for sweeping, mopping, washing, ...","service_price":500,"image":"p-r9uymbv-cleaningHome.jpg","ratings":4.5,"reviews":[{"user":"66dc0583a521a07c53202aeb","comment":"gggg","rating":4.5,"date":"2024-09-25T08:13:46.615Z","_id":"66ebc98e7623004bb4eadd55"}],"createdAt":"2024-08-31T08:31:27.451Z","updatedAt":"2024-09-25T08:13:46.616Z","__v":1},"work_start_date":"2024-09-03T09:18:00.000Z","time_schedule":"4hours","price":600,"_id":"66f526e9c9d2890c726c88d5"}]
/// username : "Asadul Islam"
/// ratings : 0
/// area : "Bolton"
/// address : "Dkaka"
/// state : "United Kingdom"
/// city : "Dhaka"
/// phone : "01612485250"
/// advance_amount : 99
/// total_amount : 600
/// we_will_get_payment : 501
/// paymentid : {"_id":"66f526e9c9d2890c726c88d1","user":"66dc0571a521a07c53202ae7","tran_id":"6267a413-bb25-4bb3-a1c0-294fd2713c41","amount":99,"paidStatus":true,"createdAt":"2024-09-26T09:18:33.623Z","updatedAt":"2024-09-26T09:18:42.225Z","__v":0}
/// is_payment_status : "Completed"
/// reviews : []
/// createdAt : "2024-09-26T09:18:33.627Z"
/// updatedAt : "2024-10-06T04:21:40.869Z"
/// __v : 1

class BookingsModel {
  BookingsModel({
      String? id,
      User? user,
      List<Workers>? workers,
      List<Services>? services,
      String? username,
      num? ratings,
      String? area,
      String? address,
      String? state,
      String? city,
      String? phone,
      num? advanceAmount,
      num? totalAmount,
      num? weWillGetPayment,
      Paymentid? paymentid,
      String? isPaymentStatus,
      List<dynamic>? reviews,
      String? createdAt,
      String? updatedAt,
      num? v,}){
    _id = id;
    _user = user;
    _workers = workers;
    _services = services;
    _username = username;
    _ratings = ratings;
    _area = area;
    _address = address;
    _state = state;
    _city = city;
    _phone = phone;
    _advanceAmount = advanceAmount;
    _totalAmount = totalAmount;
    _weWillGetPayment = weWillGetPayment;
    _paymentid = paymentid;
    _isPaymentStatus = isPaymentStatus;
    _reviews = reviews;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  BookingsModel.fromJson(dynamic json) {
    _id = json['_id'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['workers'] != null) {
      _workers = [];
      json['workers'].forEach((v) {
        _workers?.add(Workers.fromJson(v));
      });
    }
    if (json['services'] != null) {
      _services = [];
      json['services'].forEach((v) {
        _services?.add(Services.fromJson(v));
      });
    }
    _username = json['username'];
    _ratings = json['ratings'];
    _area = json['area'];
    _address = json['address'];
    _state = json['state'];
    _city = json['city'];
    _phone = json['phone'];
    _advanceAmount = json['advance_amount'];
    _totalAmount = json['total_amount'];
    _weWillGetPayment = json['we_will_get_payment'];
    _paymentid = json['paymentid'] != null ? Paymentid.fromJson(json['paymentid']) : null;
    _isPaymentStatus = json['is_payment_status'];
    if (json['reviews'] != null) {
      _reviews =List<dynamic>.from(json["reviews"].map((x) => x),
     );
    }
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  User? _user;
  List<Workers>? _workers;
  List<Services>? _services;
  String? _username;
  num? _ratings;
  String? _area;
  String? _address;
  String? _state;
  String? _city;
  String? _phone;
  num? _advanceAmount;
  num? _totalAmount;
  num? _weWillGetPayment;
  Paymentid? _paymentid;
  String? _isPaymentStatus;
  List<dynamic>? _reviews;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
BookingsModel copyWith({  String? id,
  User? user,
  List<Workers>? workers,
  List<Services>? services,
  String? username,
  num? ratings,
  String? area,
  String? address,
  String? state,
  String? city,
  String? phone,
  num? advanceAmount,
  num? totalAmount,
  num? weWillGetPayment,
  Paymentid? paymentid,
  String? isPaymentStatus,
  List<dynamic>? reviews,
  String? createdAt,
  String? updatedAt,
  num? v,
}) => BookingsModel(  id: id ?? _id,
  user: user ?? _user,
  workers: workers ?? _workers,
  services: services ?? _services,
  username: username ?? _username,
  ratings: ratings ?? _ratings,
  area: area ?? _area,
  address: address ?? _address,
  state: state ?? _state,
  city: city ?? _city,
  phone: phone ?? _phone,
  advanceAmount: advanceAmount ?? _advanceAmount,
  totalAmount: totalAmount ?? _totalAmount,
  weWillGetPayment: weWillGetPayment ?? _weWillGetPayment,
  paymentid: paymentid ?? _paymentid,
  isPaymentStatus: isPaymentStatus ?? _isPaymentStatus,
  reviews: reviews ?? _reviews,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
);
  String? get id => _id;
  User? get user => _user;
  List<Workers>? get workers => _workers;
  List<Services>? get services => _services;
  String? get username => _username;
  num? get ratings => _ratings;
  String? get area => _area;
  String? get address => _address;
  String? get state => _state;
  String? get city => _city;
  String? get phone => _phone;
  num? get advanceAmount => _advanceAmount;
  num? get totalAmount => _totalAmount;
  num? get weWillGetPayment => _weWillGetPayment;
  Paymentid? get paymentid => _paymentid;
  String? get isPaymentStatus => _isPaymentStatus;
  List<dynamic>? get reviews => _reviews;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_workers != null) {
      map['workers'] = _workers?.map((v) => v.toJson()).toList();
    }
    if (_services != null) {
      map['services'] = _services?.map((v) => v.toJson()).toList();
    }
    map['username'] = _username;
    map['ratings'] = _ratings;
    map['area'] = _area;
    map['address'] = _address;
    map['state'] = _state;
    map['city'] = _city;
    map['phone'] = _phone;
    map['advance_amount'] = _advanceAmount;
    map['total_amount'] = _totalAmount;
    map['we_will_get_payment'] = _weWillGetPayment;
    if (_paymentid != null) {
      map['paymentid'] = _paymentid?.toJson();
    }
    map['is_payment_status'] = _isPaymentStatus;
    if (_reviews != null) {
      map['reviews'] = List<dynamic>.from(reviews!.map((x) => x));
    }
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}

/// _id : "66f526e9c9d2890c726c88d1"
/// user : "66dc0571a521a07c53202ae7"
/// tran_id : "6267a413-bb25-4bb3-a1c0-294fd2713c41"
/// amount : 99
/// paidStatus : true
/// createdAt : "2024-09-26T09:18:33.623Z"
/// updatedAt : "2024-09-26T09:18:42.225Z"
/// __v : 0

class Paymentid {
  Paymentid({
      String? id,
      String? user,
      String? tranId,
      num? amount,
      bool? paidStatus,
      String? createdAt,
      String? updatedAt,
      num? v,}){
    _id = id;
    _user = user;
    _tranId = tranId;
    _amount = amount;
    _paidStatus = paidStatus;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  Paymentid.fromJson(dynamic json) {
    _id = json['_id'];
    _user = json['user'];
    _tranId = json['tran_id'];
    _amount = json['amount'];
    _paidStatus = json['paidStatus'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _user;
  String? _tranId;
  num? _amount;
  bool? _paidStatus;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
Paymentid copyWith({  String? id,
  String? user,
  String? tranId,
  num? amount,
  bool? paidStatus,
  String? createdAt,
  String? updatedAt,
  num? v,
}) => Paymentid(  id: id ?? _id,
  user: user ?? _user,
  tranId: tranId ?? _tranId,
  amount: amount ?? _amount,
  paidStatus: paidStatus ?? _paidStatus,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
);
  String? get id => _id;
  String? get user => _user;
  String? get tranId => _tranId;
  num? get amount => _amount;
  bool? get paidStatus => _paidStatus;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['user'] = _user;
    map['tran_id'] = _tranId;
    map['amount'] = _amount;
    map['paidStatus'] = _paidStatus;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}

/// service : {"service_discount":{"discount":10,"discount_type":"Percentage Discount"},"_id":"66d2d4df926a5372012d8f04","service_category_id":"66d2d18a926a5372012d8e9b","name":"Home Cleaning","description":"A Home Cleaner is responsible for cleaning various areas of a client's home. They are typically light-duty Cleaners responsible for sweeping, mopping, washing, ...","service_price":500,"image":"p-r9uymbv-cleaningHome.jpg","ratings":4.5,"reviews":[{"user":"66dc0583a521a07c53202aeb","comment":"gggg","rating":4.5,"date":"2024-09-25T08:13:46.615Z","_id":"66ebc98e7623004bb4eadd55"}],"createdAt":"2024-08-31T08:31:27.451Z","updatedAt":"2024-09-25T08:13:46.616Z","__v":1}
/// work_start_date : "2024-09-03T09:18:00.000Z"
/// time_schedule : "4hours"
/// price : 600
/// _id : "66f526e9c9d2890c726c88d5"

class Services {
  Services({
      Service? service,
      String? workStartDate,
      String? timeSchedule,
      num? price,
      String? id,}){
    _service = service;
    _workStartDate = workStartDate;
    _timeSchedule = timeSchedule;
    _price = price;
    _id = id;
}

  Services.fromJson(dynamic json) {
    _service = json['service'] != null ? Service.fromJson(json['service']) : null;
    _workStartDate = json['work_start_date'];
    _timeSchedule = json['time_schedule'];
    _price = json['price'];
    _id = json['_id'];
  }
  Service? _service;
  String? _workStartDate;
  String? _timeSchedule;
  num? _price;
  String? _id;
Services copyWith({  Service? service,
  String? workStartDate,
  String? timeSchedule,
  num? price,
  String? id,
}) => Services(  service: service ?? _service,
  workStartDate: workStartDate ?? _workStartDate,
  timeSchedule: timeSchedule ?? _timeSchedule,
  price: price ?? _price,
  id: id ?? _id,
);
  Service? get service => _service;
  String? get workStartDate => _workStartDate;
  String? get timeSchedule => _timeSchedule;
  num? get price => _price;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_service != null) {
      map['service'] = _service?.toJson();
    }
    map['work_start_date'] = _workStartDate;
    map['time_schedule'] = _timeSchedule;
    map['price'] = _price;
    map['_id'] = _id;
    return map;
  }

}

/// service_discount : {"discount":10,"discount_type":"Percentage Discount"}
/// _id : "66d2d4df926a5372012d8f04"
/// service_category_id : "66d2d18a926a5372012d8e9b"
/// name : "Home Cleaning"
/// description : "A Home Cleaner is responsible for cleaning various areas of a client's home. They are typically light-duty Cleaners responsible for sweeping, mopping, washing, ..."
/// service_price : 500
/// image : "p-r9uymbv-cleaningHome.jpg"
/// ratings : 4.5
/// reviews : [{"user":"66dc0583a521a07c53202aeb","comment":"gggg","rating":4.5,"date":"2024-09-25T08:13:46.615Z","_id":"66ebc98e7623004bb4eadd55"}]
/// createdAt : "2024-08-31T08:31:27.451Z"
/// updatedAt : "2024-09-25T08:13:46.616Z"
/// __v : 1

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

  Service.fromJson(dynamic json) {
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
Service copyWith({  ServiceDiscount? serviceDiscount,
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
}) => Service(  serviceDiscount: serviceDiscount ?? _serviceDiscount,
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
/// comment : "gggg"
/// rating : 4.5
/// date : "2024-09-25T08:13:46.615Z"
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

/// user : "66dc167dac0379cc0dec88b4"
/// _id : "6700c18e260ee77b97724662"

class Workers {
  Workers({
      String? user,
      String? id,}){
    _user = user;
    _id = id;
}

  Workers.fromJson(dynamic json) {
    _user = json['user'];
    _id = json['_id'];
  }
  String? _user;
  String? _id;
Workers copyWith({  String? user,
  String? id,
}) => Workers(  user: user ?? _user,
  id: id ?? _id,
);
  String? get user => _user;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user'] = _user;
    map['_id'] = _id;
    return map;
  }

}

/// _id : "66dc0571a521a07c53202ae7"
/// email : "mahim@gmail.com"
/// userType : "client"
/// is_phone_verified : true
/// createdAt : "2024-09-07T07:49:05.151Z"
/// updatedAt : "2024-10-07T11:18:25.800Z"
/// __v : 0
/// is_otp : "04FEA4"
/// otp_expiresIn : "2024-10-08T11:18:25.774Z"

class User {
  User({
      String? id,
      String? email,
      String? userType,
      bool? isPhoneVerified,
      String? createdAt,
      String? updatedAt,
      num? v,
      String? isOtp,
      String? otpExpiresIn,}){
    _id = id;
    _email = email;
    _userType = userType;
    _isPhoneVerified = isPhoneVerified;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _isOtp = isOtp;
    _otpExpiresIn = otpExpiresIn;
}

  User.fromJson(dynamic json) {
    _id = json['_id'];
    _email = json['email'];
    _userType = json['userType'];
    _isPhoneVerified = json['is_phone_verified'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _isOtp = json['is_otp'];
    _otpExpiresIn = json['otp_expiresIn'];
  }
  String? _id;
  String? _email;
  String? _userType;
  bool? _isPhoneVerified;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  String? _isOtp;
  String? _otpExpiresIn;
User copyWith({  String? id,
  String? email,
  String? userType,
  bool? isPhoneVerified,
  String? createdAt,
  String? updatedAt,
  num? v,
  String? isOtp,
  String? otpExpiresIn,
}) => User(  id: id ?? _id,
  email: email ?? _email,
  userType: userType ?? _userType,
  isPhoneVerified: isPhoneVerified ?? _isPhoneVerified,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
  isOtp: isOtp ?? _isOtp,
  otpExpiresIn: otpExpiresIn ?? _otpExpiresIn,
);
  String? get id => _id;
  String? get email => _email;
  String? get userType => _userType;
  bool? get isPhoneVerified => _isPhoneVerified;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;
  String? get isOtp => _isOtp;
  String? get otpExpiresIn => _otpExpiresIn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['email'] = _email;
    map['userType'] = _userType;
    map['is_phone_verified'] = _isPhoneVerified;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    map['is_otp'] = _isOtp;
    map['otp_expiresIn'] = _otpExpiresIn;
    return map;
  }

}