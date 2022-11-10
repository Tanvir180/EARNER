class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? qualification;
  String? experience;
  String? address;
  String? img;

  UserModel(
      {this.uid,
      this.email,
      this.firstName,
      this.secondName,
      this.address,
      this.experience,
      this.qualification,
      this.img});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      qualification: map['qualification'],
      experience: map['experience'],
      address: map['address'],
      img: map['img'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'qualification': qualification,
      'experience': experience,
      'address': address,
      'img': img,
    };
  }
}
