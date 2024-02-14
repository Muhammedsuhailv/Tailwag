class SitterModel {
  String sitterid;
  String name;
  String place;
  String phone;
  String email;
  String title;
  String details;
  String imageUrl; // Add imageUrl field

  SitterModel({
    required this.sitterid,
    required this.name,
    required this.place,
    required this.phone,
    required this.email,
    required this.title,
    required this.details,
    required this.imageUrl, // Initialize imageUrl
  });

  factory SitterModel.fromMap(Map<String, dynamic> map) {
    return SitterModel(
      sitterid: map['sitterid'],
      name: map['name'],
      place: map['place'],
      phone: map['phone'],
      email: map['email'],
      title: map['title'],
      details: map['details'],
      imageUrl: map['imageUrl'], // Assign imageUrl from map
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sitterid': sitterid,
      'name': name,
      'place': place,
      'phone': phone,
      'email': email,
      'title': title,
      'details': details,
      'imageUrl': imageUrl, // Include imageUrl in the map
    };
  }
}
