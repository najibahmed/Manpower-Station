/// _id : "676a7f2eb817e0e7ebdb1806"
/// parentId : null
/// category_name : "Caretaker"
/// image : ""
/// description : "Caretaker governments may be put in place when a government in a parliamentary system is defeated in a motion of no confidence, or in the case when the house to which the government is responsible is dissolved, to be in place for an interim period until an election is held and a new government is formed. In this sense, in some countries which use a Westminster system of government, the caretaker government is simply the incumbent government, which continues to operate in the interim period between the normal dissolution of parliament for the purpose of holding an election and the formation of a new government after the election results are known. Unlike in ordinary times, the caretaker government's activities are limited by custom and convention."
/// createdAt : "2024-12-24T09:30:22.733Z"
/// updatedAt : "2024-12-24T09:30:22.733Z"
/// __v : 0

class CategoryModel {
  CategoryModel({
    String? id,
    dynamic parentId,
    String? categoryName,
    String? image,
    String? description,
    String? createdAt,
    String? updatedAt,
    num? v,}){
    _id = id;
    _parentId = parentId;
    _categoryName = categoryName;
    _image = image;
    _description = description;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  CategoryModel.fromJson(dynamic json) {
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
  CategoryModel copyWith({  String? id,
    dynamic parentId,
    String? categoryName,
    String? image,
    String? description,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) => CategoryModel(  id: id ?? _id,
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