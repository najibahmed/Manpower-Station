/// _id : "66bdecc8b43ec07f76d39466"
/// user : "66adb2a8a5f9c341268e5f6a"
/// title : "eeee"
/// images : [{"image":"We0DR91Qc-appliance.jpg","_id":"66e16096d1e043c20643dd96"},{"image":"W7bx0N-N7v-cleaning_combo.jpg","_id":"66e16096d1e043c20643dd97"},{"image":"od2vZijirf-cleaningHome.jpg","_id":"66e16096d1e043c20643dd98"}]
/// description : "tttt"
/// isActive : true
/// start_date : "2024-08-15T11:51:06.245Z"
/// createdAt : "2024-08-15T11:55:52.134Z"
/// updatedAt : "2024-09-11T09:19:18.841Z"
/// __v : 5

class ActiveBanner {
  ActiveBanner({
      String? id, 
      String? user, 
      String? title, 
      List<Images>? images, 
      String? description, 
      bool? isActive, 
      String? startDate, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _id = id;
    _user = user;
    _title = title;
    _images = images;
    _description = description;
    _isActive = isActive;
    _startDate = startDate;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  ActiveBanner.fromJson(dynamic json) {
    _id = json['_id'];
    _user = json['user'];
    _title = json['title'];
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
      });
    }
    _description = json['description'];
    _isActive = json['isActive'];
    _startDate = json['start_date'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _user;
  String? _title;
  List<Images>? _images;
  String? _description;
  bool? _isActive;
  String? _startDate;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
ActiveBanner copyWith({  String? id,
  String? user,
  String? title,
  List<Images>? images,
  String? description,
  bool? isActive,
  String? startDate,
  String? createdAt,
  String? updatedAt,
  num? v,
}) => ActiveBanner(  id: id ?? _id,
  user: user ?? _user,
  title: title ?? _title,
  images: images ?? _images,
  description: description ?? _description,
  isActive: isActive ?? _isActive,
  startDate: startDate ?? _startDate,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
);
  String? get id => _id;
  String? get user => _user;
  String? get title => _title;
  List<Images>? get images => _images;
  String? get description => _description;
  bool? get isActive => _isActive;
  String? get startDate => _startDate;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['user'] = _user;
    map['title'] = _title;
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    map['description'] = _description;
    map['isActive'] = _isActive;
    map['start_date'] = _startDate;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}

/// image : "We0DR91Qc-appliance.jpg"
/// _id : "66e16096d1e043c20643dd96"

class Images {
  Images({
      String? image, 
      String? id,}){
    _image = image;
    _id = id;
}

  Images.fromJson(dynamic json) {
    _image = json['image'];
    _id = json['_id'];
  }
  String? _image;
  String? _id;
Images copyWith({  String? image,
  String? id,
}) => Images(  image: image ?? _image,
  id: id ?? _id,
);
  String? get image => _image;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = _image;
    map['_id'] = _id;
    return map;
  }

}