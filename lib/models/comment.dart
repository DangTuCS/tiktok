import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  final String username;
  final String comment;
  final publishedDate;
  final List likes;
  final String profilePhoto;
  final String uid;
  final String id;

  Comment({
    required this.username,
    required this.comment,
    required this.publishedDate,
    required this.likes,
    required this.profilePhoto,
    required this.uid,
    required this.id,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'comment': comment,
        'publishedDate': publishedDate,
        'likes': likes,
        'profilePhoto': profilePhoto,
        'uid': uid,
        'id': id,
      };

  static Comment fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Comment(
      username: snapshot['username'],
      comment: snapshot['comment'],
      publishedDate: snapshot['publishedDate'],
      likes: snapshot['likes'],
      profilePhoto: snapshot['profilePhoto'],
      uid: snapshot['uid'],
      id: snapshot ['id'],
    );
  }
}
