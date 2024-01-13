import 'package:cloud_firestore/cloud_firestore.dart';


// serve a new user record to the firestore database
class User{

  String? name;
  String? uid;
  String? image;
  String? email;
  String? youtube;
  String? instagram;
  String? facebook;
  String? twitter;

  User({
    this.name,
    this.uid,
    this.image,
    this.email,
    this.youtube,
    this.instagram,
    this.facebook,
    this.twitter,
});

  Map<String, dynamic> toJason()=>{

    "name": name,
    "uid": uid,
    "image": image,
    "email": email,
    "youtube": youtube,
    "instagram": instagram,
    "facebook": facebook,
    "twitter": twitter,

  };

  static User fromSnap(DocumentSnapshot snapshot){

    var dataSnapshot = snapshot.data() as Map<String, dynamic>;

    return User(
      name: dataSnapshot["name"],
      uid: dataSnapshot["uid"],
      image: dataSnapshot["image"],
      email: dataSnapshot["name"],
      youtube: dataSnapshot["youtube"],
      instagram: dataSnapshot["instagram"],
      facebook: dataSnapshot["facebook"],
      twitter: dataSnapshot["twitter"],
    );
  }
}