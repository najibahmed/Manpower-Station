/// _id : "67a0656c5a8870d869cdc999"
/// parentId : null
/// category_name : "TT"
/// frontImage : "lFxyNuttT-national-cancer-institute-N_aihp118p8-unsplash.jpg"
/// backImage : "QnWwoQujev-pexels-julia-m-cameron-4145354.jpg"
/// description : "TTT"
/// createdAt : "2025-02-03T06:42:52.492Z"
/// updatedAt : "2025-02-03T07:02:56.736Z"
/// __v : 0

class CategoryModel {
  CategoryModel({
    String? id,
    dynamic parentId,
    String? categoryName,
    String? frontImage,
    String? backImage,
    String? description,
    String? createdAt,
    String? updatedAt,
    num? v,}){
    _id = id;
    _parentId = parentId;
    _categoryName = categoryName;
    _frontImage = frontImage;
    _backImage = backImage;
    _description = description;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  CategoryModel.fromJson(dynamic json) {
    _id = json['_id'];
    _parentId = json['parentId'];
    _categoryName = json['category_name'];
    _frontImage = json['frontImage'];
    _backImage = json['backImage'];
    _description = json['description'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  dynamic _parentId;
  String? _categoryName;
  String? _frontImage;
  String? _backImage;
  String? _description;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  CategoryModel copyWith({  String? id,
    dynamic parentId,
    String? categoryName,
    String? frontImage,
    String? backImage,
    String? description,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) => CategoryModel(  id: id ?? _id,
    parentId: parentId ?? _parentId,
    categoryName: categoryName ?? _categoryName,
    frontImage: frontImage ?? _frontImage,
    backImage: backImage ?? _backImage,
    description: description ?? _description,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
    v: v ?? _v,
  );
  String? get id => _id;
  dynamic get parentId => _parentId;
  String? get categoryName => _categoryName;
  String? get frontImage => _frontImage;
  String? get backImage => _backImage;
  String? get description => _description;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['parentId'] = _parentId;
    map['category_name'] = _categoryName;
    map['frontImage'] = _frontImage;
    map['backImage'] = _backImage;
    map['description'] = _description;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}