import 'dart:async';
import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

  // Create
  Future<void> createUser(String userId, String username, String passwordHash) async {
    await _dbRef.child("Accounts").child(userId).set({
      'username': username,
      'passwordHash': passwordHash,
      'createdAt': DateTime.now().toIso8601String(),
    });
  }

  // Read
  Future<void> readUser(String userId) async {
    final snapshot = await _dbRef.child("Accounts").child(userId).get();
    if (snapshot.exists) {
      print('User Data: ${snapshot.value}');
    } else {
      print('No user found.');
    }
  }

  // Update
  Future<void> updateUser(String userId, String newUsername) async {
    await _dbRef.child("Accounts").child(userId).update({
      'username': newUsername,
    });
  }

  // Delete
  Future<void> deleteUser(String userId) async {
    await _dbRef.child("Accounts").child(userId).remove();
  }
}
