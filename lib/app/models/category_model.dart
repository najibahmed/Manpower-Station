/// _id : "66d2d18a926a5372012d8e9b"
/// category_name : "Cleaning"
/// description : "Responsible for all basic cleaning in and around residences or office buildings. Cleans floors and rooms. including dust mopping, damp mopping, sweeping, vacuuming, dusting, picking up larger objects off the floor, and spot cleaning glass and windows."
/// parentId : null
/// children : [{"_id":"66dbe3140c1029e2ffecf5ca","category_name":"House","description":"description","parentId":"66d2d18a926a5372012d8e9b","children":[]}]

class CategoryModel {
  CategoryModel({
    String? id,
    String? categoryName,
    String? description,
    dynamic parentId,
    List<Children>? children,
  }) {
    _id = id;
    _categoryName = categoryName;
    _description = description;
    _parentId = parentId;
    _children = children;
  }

  CategoryModel.fromJson(dynamic json) {
    _id = json['_id'];
    _categoryName = json['category_name'];
    _description = json['description'];
    _parentId = json['parentId'];
    if (json['children'] != null) {
      _children = [];
      json['children'].forEach((v) {
        _children?.add(Children.fromJson(v));
      });
    }
  }
  String? _id;
  String? _categoryName;
  String? _description;
  dynamic _parentId;
  List<Children>? _children;
  CategoryModel copyWith({
    String? id,
    String? categoryName,
    String? description,
    dynamic parentId,
    List<Children>? children,
  }) =>
      CategoryModel(
        id: id ?? _id,
        categoryName: categoryName ?? _categoryName,
        description: description ?? _description,
        parentId: parentId ?? _parentId,
        children: children ?? _children,
      );
  String? get id => _id;
  String? get categoryName => _categoryName;
  String? get description => _description;
  dynamic get parentId => _parentId;
  List<Children>? get children => _children;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['category_name'] = _categoryName;
    map['description'] = _description;
    map['parentId'] = _parentId;
    if (_children != null) {
      map['children'] = _children?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// _id : "66dbe3140c1029e2ffecf5ca"
/// category_name : "House"
/// description : "description"
/// parentId : "66d2d18a926a5372012d8e9b"
/// children : []

class Children {
  Children({
    String? id,
    String? categoryName,
    String? description,
    String? parentId,
    List<dynamic>? children,
  }) {
    _id = id;
    _categoryName = categoryName;
    _description = description;
    _parentId = parentId;
    _children = children;
  }

  Children.fromJson(dynamic json) {
    _id = json['_id'];
    _categoryName = json['category_name'];
    _description = json['description'];
    _parentId = json['parentId'];
    if (json['children'] != null) {
      _children = [];
      List<dynamic>.from(json["children"].map((x) => x));
      // json['children'].forEach((v) {
      //   _children?.add(Dynamic.fromJson(v));
      // });
    }
  }
  String? _id;
  String? _categoryName;
  String? _description;
  String? _parentId;
  List<dynamic>? _children;
  Children copyWith({
    String? id,
    String? categoryName,
    String? description,
    String? parentId,
    List<dynamic>? children,
  }) =>
      Children(
        id: id ?? _id,
        categoryName: categoryName ?? _categoryName,
        description: description ?? _description,
        parentId: parentId ?? _parentId,
        children: children ?? _children,
      );
  String? get id => _id;
  String? get categoryName => _categoryName;
  String? get description => _description;
  String? get parentId => _parentId;
  List<dynamic>? get children => _children;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['category_name'] = _categoryName;
    map['description'] = _description;
    map['parentId'] = _parentId;
    if (_children != null) {
      map['children'] = _children?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
