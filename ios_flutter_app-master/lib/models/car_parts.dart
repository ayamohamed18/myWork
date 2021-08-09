class CarParts{
 final String title, avatar,price;
  final int id;
  CarParts.fromJson(dynamic json)
      : this.id = json['id'],
        this.title = json['title'],
        this.price = json['price'],
        this.avatar = json['avatar'];
}