/// id : 4
/// title : "Ergonomic Granite Gloves"
/// price : 281
/// description : "The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive"
/// category : {"id":3,"name":"Furniture","image":"https://api.lorem.space/image/furniture?w=640&h=480&r=1842"}
/// images : ["https://api.lorem.space/image/furniture?w=640&h=480&r=7028","https://api.lorem.space/image/furniture?w=640&h=480&r=9985","https://api.lorem.space/image/furniture?w=640&h=480&r=7473"]

class Product {
  Product({
    num? id,
    String? title,
    num? price,
    String? description,
    Category? category,
    List<String>? images,}){
    _id = id;
    _title = title;
    _price = price;
    _description = description;
    _category = category;
    _images = images;
  }

  Product.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _price = json['price'];
    _description = json['description'];
    _category = json['category'] != null ? Category.fromJson(json['category']) : null;
    _images = json['images'] != null ? json['images'].cast<String>() : [];
  }
  num? _id;
  String? _title;
  num? _price;
  String? _description;
  Category? _category;
  List<String>? _images;
  Product copyWith({  num? id,
    String? title,
    num? price,
    String? description,
    Category? category,
    List<String>? images,
  }) => Product(  id: id ?? _id,
    title: title ?? _title,
    price: price ?? _price,
    description: description ?? _description,
    category: category ?? _category,
    images: images ?? _images,
  );
  num? get id => _id;
  String? get title => _title;
  num? get price => _price;
  String? get description => _description;
  Category? get category => _category;
  List<String>? get images => _images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['price'] = _price;
    map['description'] = _description;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    map['images'] = _images;
    return map;
  }

}

/// id : 3
/// name : "Furniture"
/// image : "https://api.lorem.space/image/furniture?w=640&h=480&r=1842"

class Category {
  Category({
    num? id,
    String? name,
    String? image,}){
    _id = id;
    _name = name;
    _image = image;
  }

  Category.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
  }
  num? _id;
  String? _name;
  String? _image;
  Category copyWith({  num? id,
    String? name,
    String? image,
  }) => Category(  id: id ?? _id,
    name: name ?? _name,
    image: image ?? _image,
  );
  num? get id => _id;
  String? get name => _name;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    return map;
  }

}