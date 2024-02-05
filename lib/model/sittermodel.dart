class SitterModel {
  String  sitterid;
  String  name;
  String  place;
  String phone;
  String email;
  String title;
  String details;


  SitterModel(
      {required this.sitterid,
        required this.name,
        required this.place,
        required   this.phone,
        required  this.email,
        required   this.title,
        required   this.details,

      });
  factory SitterModel.fromMap(Map<String, dynamic> map) {
return SitterModel(sitterid: map['sitterid'], name: map['name'], place: map['place'], phone: map['phone'], email: map['email'], title: map['title'], details: map['details']);

  }
  Map<String, dynamic> tomap() {
    return {'sitterid': sitterid, 'name': name, 'place': place, 'phone': phone, 'email': email, 'title': title, 'details': details};
  }
}


