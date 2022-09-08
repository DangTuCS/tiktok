import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';

import '../models/user.dart';

class SearchController extends GetxController {
  final Rx<List<User>> _searchUsers = Rx<List<User>>([]);

  List<User> get searchedUsers => _searchUsers.value;

  searchUser(String typedUser) async {
    _searchUsers.bindStream(firebaseFirestore
        .collection('users')
        .where('name', isGreaterThanOrEqualTo: typedUser)
        .snapshots()
        .map((QuerySnapshot snapshot) {
      List<User> result = [];
      for (var elem in snapshot.docs) {
        result.add(User.fromSnap(elem));
      }
      return result;
    }));
  }
}
