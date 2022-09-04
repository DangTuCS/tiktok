import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  final String username;
  final String uid;
  final String id;
  final List likes;
  final int commentCount;
  final int shareCount;
  final String songName;
  final String caption;
  final String videoUrl;
  final String thumbnail;
  final String profilePhoto;

  Video({
    required this.username,
    required this.uid,
    required this.id,
    required this.likes,
    required this.commentCount,
    required this.shareCount,
    required this.songName,
    required this.caption,
    required this.videoUrl,
    required this.thumbnail,
    required this.profilePhoto,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'id': id,
        'likes': likes,
        'commentCount': commentCount,
        'shareCount': shareCount,
        'songName': songName,
        'caption': caption,
        'videoUrl': videoUrl,
        'thumbnail': thumbnail,
        'profilePhoto': profilePhoto,
      };

  static Video fromSnap(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;

    return Video(
      username: snap['username'],
      uid: snap['uid'],
      id: snap['id'],
      likes: snap['likes'],
      commentCount: snap['commentCount'],
      shareCount: snap['shareCount'],
      songName: snap['songName'],
      caption: snap['caption'],
      videoUrl: snap['videoUrl'],
      thumbnail: snap['thumbnail'],
      profilePhoto: snap['profilePhoto'],
    );
  }
}
