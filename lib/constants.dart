import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/controllers/auth_controller.dart';
import 'package:tiktok_clone/views/screens/profile_screen.dart';
import 'package:tiktok_clone/views/screens/search_screen.dart';
import 'package:tiktok_clone/views/screens/video_play_screen.dart';
import 'package:tiktok_clone/views/screens/pages/add_video_screen.dart';

List pages = [
  VideoPlayScreen(),
  SearchScreen(),
  AddVideoScreen(),
  Text('Messages Screen'),
  ProfileScreen(uid: authController.user.uid),
];

const backgroundColor = Colors.black;
var buttonColor = Colors.red;
const borderColor = Colors.grey;

//Firebase
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firebaseFirestore = FirebaseFirestore.instance;

//Controller
var authController = AuthController.instance;