/// _id : "66dc0583a521a07c53202aeb"
/// user : {"_id":"66dc0571a521a07c53202ae7","email":"mahim@gmail.com","userType":"client","is_phone_verified":true,"createdAt":"2024-09-07T07:49:05.151Z","updatedAt":"2024-10-07T12:34:17.923Z","__v":0}
/// role : "client"
/// phone_or_email : "mahim@gmail.com"
/// is_point : 0
/// createdAt : "2024-09-07T07:49:23.557Z"
/// updatedAt : "2024-10-07T11:07:23.974Z"
/// __v : 0
/// address : "hi"
/// area : "hu"
/// avatar : "8DJNFOfny-avatar.svg"
/// profile_description : "na"
/// username : "Mahim"

class UserModel {
  UserModel({
      String? id, 
      User? user, 
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
      String? username,}){
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

  UserModel.fromJson(dynamic json) {
    _id = json['_id'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
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
  User? _user;
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
UserModel copyWith({  String? id,
  User? user,
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
}) => UserModel(  id: id ?? _id,
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
  User? get user => _user;
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
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
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

/// _id : "66dc0571a521a07c53202ae7"
/// email : "mahim@gmail.com"
/// userType : "client"
/// is_phone_verified : true
/// createdAt : "2024-09-07T07:49:05.151Z"
/// updatedAt : "2024-10-07T12:34:17.923Z"
/// __v : 0

class User {
  User({
      String? id, 
      String? email, 
      String? userType, 
      bool? isPhoneVerified, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
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
User copyWith({  String? id,
  String? email,
  String? userType,
  bool? isPhoneVerified,
  String? createdAt,
  String? updatedAt,
  num? v,
}) => User(  id: id ?? _id,
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