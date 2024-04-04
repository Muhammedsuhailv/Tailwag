class UserModel {
  String userid;
  String username;
  String email;
  String? petname;
  String? breedname;
  String? petage;
  String? petsex;
  String? petkg;
  String? aboutmypet;
  String? image;

  UserModel(
      {required this.userid,
      required this.username,
      required this.email,
      this.petname,
      this.breedname,
      this.petage,
      this.petsex,
      this.petkg,
      this.aboutmypet,
      this.image});
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        userid: map['userid'],
        username: map['username'],
        email: map['email'],
        petname: map['petname'],
        breedname: map['breedname'],
        petage: map['petage'],
        petsex: map['petsex'],
        petkg: map['petkg'],
        aboutmypet: map['aboutmypet'],
        image: map['image']);
  }
  Map<String, dynamic> tomap() {
    return {
      'userid': userid,
      'username': username,
      'email': email,
      'petname': petname,
      'breedname': breedname,
      'petage': petage,
      'petsex': petsex,
      'petkg': petkg,
      'aboutmypet': aboutmypet,
      'image': image,
    };
  }
}

class MyNotesModel {
  String noteid;
  String date;
  String hospital;
  String description;

  MyNotesModel(
      {required this.noteid,
      required this.date,
      required this.hospital,
      required this.description});

  factory MyNotesModel.fromMap(Map<String, dynamic> map) {
    return MyNotesModel(
      noteid: map['noteid'],
      date: map['date'],
      hospital: map['hospital'],
      description: map['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'noteid': noteid,
      'date': date,
      'hospital': hospital,
      'description': description,
    };
  }
}
