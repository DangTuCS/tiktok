import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/models/video.dart';

class VideoController extends GetxController {
  final Rx<List<Video>> _videoList = Rx<List<Video>>([]);

  List<Video> get videoList => _videoList.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _videoList.bindStream(
      firebaseFirestore.collection('videos').snapshots().map(
        (QuerySnapshot query) {
          List<Video> results = [];
          for (var element in query.docs) {
            results.add(
              Video.fromSnap(element),
            );
          }
          return results;
        },
      ),
    );
  }

  likeVideo(String id) async {
    DocumentSnapshot snapshot =
    await firebaseFirestore.collection('videos').doc(id).get();
    String uid = firebaseAuth.currentUser!.uid;
    if ((snapshot.data()! as dynamic)['likes'].contains(uid)) {
      await firebaseFirestore.collection('videos').doc(id).update({
        'likes': FieldValue.arrayRemove([uid])
      });
    } else {
      await firebaseFirestore.collection('videos').doc(id).update({
        'likes': FieldValue.arrayUnion([uid])
      });
    }
  }
}