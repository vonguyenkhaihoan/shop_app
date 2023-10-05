class CartModel {
  int? id;
  String? name;
  // String? description;
  int? price;
  // int? stars;
  String? img;
  // String? location;
  // String? createAt;
  // String? updateAt;
  // int? typeId;
  int? quantity;
  bool? isExist;
  String? time;

  CartModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExist,
    this.time,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    // description = json['description'];
    price = json['price'];
    // stars = json['stars'];
    img = json['img'];
    quantity = json['quantity'];
    isExist = json['is_exist'];
    time = json['time'];

    // location = json['location'];
    // createAt = json['create_at'];
    // updateAt = json['update_at'];
    // typeId = json['type_id'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['description'] = this.description;
  //   data['price'] = this.price;
  //   data['stars'] = this.stars;
  //   data['img'] = this.img;
  //   data['location'] = this.location;
  //   data['create_at'] = this.createAt;
  //   data['update_at'] = this.updateAt;
  //   data['type_id'] = this.typeId;
  //   return data;
  // }
}
