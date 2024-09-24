/// flag : true
/// message : "request successfully"
/// user : {"_id":"66e25e3ed1e043c20643df99","email":"jwioe@gmail.com","userType":"client","is_phone_verified":true}
/// token : {"accesstoken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NmUyNWUzZWQxZTA0M2MyMDY0M2RmOTkiLCJpYXQiOjE3MjYzMDE5MTMsImV4cCI6MTcyODg5MzkxM30.sXnISSXITTszYU27jQjrcK5CsHuLdS8aePPD3riHWps","refreshtoken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NmUyNWUzZWQxZTA0M2MyMDY0M2RmOTkiLCJpYXQiOjE3MjYzMDE5MTMsImV4cCI6MTcyOTc1NzkxM30.tacke2aldqaxOVvfoH0Q1RfOIVxdqQGv3WzAhAFuduc"}

class OtpModel {
  OtpModel({
      bool? flag, 
      String? message, 
      User? user, 
      Token? token,}){
    _flag = flag;
    _message = message;
    _user = user;
    _token = token;
}

  OtpModel.fromJson(dynamic json) {
    _flag = json['flag'];
    _message = json['message'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _token = json['token'] != null ? Token.fromJson(json['token']) : null;
  }
  bool? _flag;
  String? _message;
  User? _user;
  Token? _token;
OtpModel copyWith({  bool? flag,
  String? message,
  User? user,
  Token? token,
}) => OtpModel(  flag: flag ?? _flag,
  message: message ?? _message,
  user: user ?? _user,
  token: token ?? _token,
);
  bool? get flag => _flag;
  String? get message => _message;
  User? get user => _user;
  Token? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['flag'] = _flag;
    map['message'] = _message;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_token != null) {
      map['token'] = _token?.toJson();
    }
    return map;
  }

}

/// accesstoken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NmUyNWUzZWQxZTA0M2MyMDY0M2RmOTkiLCJpYXQiOjE3MjYzMDE5MTMsImV4cCI6MTcyODg5MzkxM30.sXnISSXITTszYU27jQjrcK5CsHuLdS8aePPD3riHWps"
/// refreshtoken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NmUyNWUzZWQxZTA0M2MyMDY0M2RmOTkiLCJpYXQiOjE3MjYzMDE5MTMsImV4cCI6MTcyOTc1NzkxM30.tacke2aldqaxOVvfoH0Q1RfOIVxdqQGv3WzAhAFuduc"

class Token {
  Token({
      String? accesstoken, 
      String? refreshtoken,}){
    _accesstoken = accesstoken;
    _refreshtoken = refreshtoken;
}

  Token.fromJson(dynamic json) {
    _accesstoken = json['accesstoken'];
    _refreshtoken = json['refreshtoken'];
  }
  String? _accesstoken;
  String? _refreshtoken;
Token copyWith({  String? accesstoken,
  String? refreshtoken,
}) => Token(  accesstoken: accesstoken ?? _accesstoken,
  refreshtoken: refreshtoken ?? _refreshtoken,
);
  String? get accesstoken => _accesstoken;
  String? get refreshtoken => _refreshtoken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accesstoken'] = _accesstoken;
    map['refreshtoken'] = _refreshtoken;
    return map;
  }

}

/// _id : "66e25e3ed1e043c20643df99"
/// email : "jwioe@gmail.com"
/// userType : "client"
/// is_phone_verified : true

class User {
  User({
      String? id, 
      String? email, 
      String? userType, 
      bool? isPhoneVerified,}){
    _id = id;
    _email = email;
    _userType = userType;
    _isPhoneVerified = isPhoneVerified;
}

  User.fromJson(dynamic json) {
    _id = json['_id'];
    _email = json['email'];
    _userType = json['userType'];
    _isPhoneVerified = json['is_phone_verified'];
  }
  String? _id;
  String? _email;
  String? _userType;
  bool? _isPhoneVerified;
User copyWith({  String? id,
  String? email,
  String? userType,
  bool? isPhoneVerified,
}) => User(  id: id ?? _id,
  email: email ?? _email,
  userType: userType ?? _userType,
  isPhoneVerified: isPhoneVerified ?? _isPhoneVerified,
);
  String? get id => _id;
  String? get email => _email;
  String? get userType => _userType;
  bool? get isPhoneVerified => _isPhoneVerified;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['email'] = _email;
    map['userType'] = _userType;
    map['is_phone_verified'] = _isPhoneVerified;
    return map;
  }

}