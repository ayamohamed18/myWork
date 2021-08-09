class Car {
  final String title, avatar;
  final int id;
  Car.fromJson(dynamic json)
      : this.id = json['id'],
        this.title = json['title'],
        this.avatar = json['avatar'];
        

}
