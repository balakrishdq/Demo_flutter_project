import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

//pages

final pages = [
  Text('Home Page'),
  Text('Search Page'),
  Text('Loop Page'),
  Text('Message Page'),
  Text('Profile Page'),
];

//colors

var backgroundColor = Color(0xFFc334eb);

var buttonColor = Color(0xFFc334eb);

var textbuttonColor = Colors.white;

//Firebase

var firebaseAuth = FirebaseAuth.instance;

var firebaseStore = FirebaseFirestore.instance;

var firebaseStorage = FirebaseStorage.instance;
