/// _id : "677dfcf6e15dedad988d34d5"
/// user : {"_id":"67542d43ba32c9e9cd427a48","username":"user","email":"user@gmail.com","userType":"client","is_phone_verified":true,"createdAt":"2024-12-07T11:10:59.436Z","updatedAt":"2024-12-10T11:16:53.207Z","__v":0,"is_otp":"1E07","otp_expiresIn":"2024-12-11T11:16:53.200Z"}
/// workers : []
/// services : [{"service":{"service_discount":{"discount":50,"discount_type":"Percentage Discount"},"_id":"677dfb9ce15dedad988d3204","service_category_id":"676a80e1b817e0e7ebdb198f","name":"Room Cleaning","description":"home cleaning is the best service in my office","service_overview":"","service_price":300,"image":"GlYoi9N6P-462567654_896952099172260_7180434212789286274_n.jpg","ratings":0,"schedules":["months","days","weeks"],"minimum_advance_paid":99,"reviews":[],"createdAt":"2025-01-08T04:14:21.217Z","updatedAt":"2025-01-14T05:14:06.954Z","__v":2},"work_start_date":"2025-01-10T04:19:00.000Z","time_schedule":"10months","price":360000,"_id":"677dfcf6e15dedad988d34d6"}]
/// username : "islam"
/// ratings : 0
/// area : "etrer"
/// address : "fg"
/// state : "Bangladesh"
/// city : "dfg"
/// phone : "234234"
/// advance_amount : 99
/// total_amount : 360000
/// we_will_get_payment : 359901
/// paymentid : {"_id":"677dfcf6e15dedad988d34d3","user":"67542d43ba32c9e9cd427a48","tran_id":"6e5675d7-a1fe-4ccd-a656-3b386d773fb7","amount":99,"paidStatus":true,"createdAt":"2025-01-08T04:20:06.846Z","updatedAt":"2025-01-08T04:20:18.630Z","__v":0}
/// is_payment_status : "Confirmed"
/// end_date : null
/// reviews : []
/// createdAt : "2025-01-08T04:20:06.962Z"
/// updatedAt : "2025-01-27T10:02:09.278Z"
/// __v : 0

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
    String? endDate,
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
    _endDate = endDate;
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
    _endDate = json['end_date'];
    if (json['reviews'] != null) {
      _reviews =List<dynamic>.from(json["reviews"].map((x) => x),);
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
  String? _endDate;
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
    String? endDate,
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
    endDate: endDate ?? _endDate,
    reviews: reviews ?? _reviews,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
    v: v ?? _v,
  );
  String? get id => _id;
  User? get user => _user;
  List<dynamic>? get workers => _workers;
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
  dynamic get endDate => _endDate;
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
    map['end_date'] = _endDate;
    if (_reviews != null) {
      map['reviews'] = _reviews?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}

/// _id : "677dfcf6e15dedad988d34d3"
/// user : "67542d43ba32c9e9cd427a48"
/// tran_id : "6e5675d7-a1fe-4ccd-a656-3b386d773fb7"
/// amount : 99
/// paidStatus : true
/// createdAt : "2025-01-08T04:20:06.846Z"
/// updatedAt : "2025-01-08T04:20:18.630Z"
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

/// service : {"service_discount":{"discount":50,"discount_type":"Percentage Discount"},"_id":"677dfb9ce15dedad988d3204","service_category_id":"676a80e1b817e0e7ebdb198f","name":"Room Cleaning","description":"home cleaning is the best service in my office","service_overview":"","service_price":300,"image":"GlYoi9N6P-462567654_896952099172260_7180434212789286274_n.jpg","ratings":0,"schedules":["months","days","weeks"],"minimum_advance_paid":99,"reviews":[],"createdAt":"2025-01-08T04:14:21.217Z","updatedAt":"2025-01-14T05:14:06.954Z","__v":2}
/// work_start_date : "2025-01-10T04:19:00.000Z"
/// time_schedule : "10months"
/// price : 360000
/// _id : "677dfcf6e15dedad988d34d6"

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
      _reviews =List<dynamic>.from(json["reviews"].map((x) => x),);
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

/// user : "678211ad8c763ba1b530e398"
/// _id : "67874e459e7b6b11f19db48d"

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

/// _id : "67542d43ba32c9e9cd427a48"
/// username : "user"
/// email : "user@gmail.com"
/// userType : "client"
/// is_phone_verified : true
/// createdAt : "2024-12-07T11:10:59.436Z"
/// updatedAt : "2024-12-10T11:16:53.207Z"
/// __v : 0
/// is_otp : "1E07"
/// otp_expiresIn : "2024-12-11T11:16:53.200Z"

class User {
  User({
    String? id,
    String? username,
    String? email,
    String? userType,
    bool? isPhoneVerified,
    String? createdAt,
    String? updatedAt,
    num? v,
    String? isOtp,
    String? otpExpiresIn,}){
    _id = id;
    _username = username;
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
    _username = json['username'];
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
  String? _username;
  String? _email;
  String? _userType;
  bool? _isPhoneVerified;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  String? _isOtp;
  String? _otpExpiresIn;
  User copyWith({  String? id,
    String? username,
    String? email,
    String? userType,
    bool? isPhoneVerified,
    String? createdAt,
    String? updatedAt,
    num? v,
    String? isOtp,
    String? otpExpiresIn,
  }) => User(  id: id ?? _id,
    username: username ?? _username,
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
  String? get username => _username;
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
    map['username'] = _username;
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