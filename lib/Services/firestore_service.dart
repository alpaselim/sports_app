import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sports_app/Data/models/comment_model.dart';
import 'package:sports_app/Data/models/user_model.dart';
import 'package:sports_app/Services/snackbar_service.dart';

class FireStoreService {
  static final FireStoreService _instance = FireStoreService._internal();

  factory FireStoreService() {
    return _instance;
  }

  FireStoreService._internal() {
    // initialization logic
  }
  CollectionReference farmers =
      FirebaseFirestore.instance.collection('farmers');
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference matchesCollection =
      FirebaseFirestore.instance.collection('matches');
  final CollectionReference commentsCollection =
      FirebaseFirestore.instance.collection('comments');

  Future<Matchh> getMatchById(String matchId) async {
    DocumentSnapshot matchDoc = await matchesCollection.doc(matchId).get();
    return Matchh.fromMap(
        matchDoc.data() as Map<String, dynamic>, commentsCollection);
  }

  Future<Comment> getCommentById(String commentId) async {
    DocumentSnapshot commentDoc = await commentsCollection.doc(commentId).get();
    return Comment.fromMap(commentDoc.data() as Map<String, dynamic>);
  }

  Future<Userr> getUserWithId(String userId) async {
    DocumentSnapshot userDoc = await users.doc(userId).get();
    return Userr.fromMap(userDoc.data() as Map<String, dynamic>);
  }

  Future<void> addNewUser(UserModel userModel) async {
    await users.doc(userModel.uid).set({
      "name": userModel.name,
      "email": userModel.email,
      "password": userModel.password,
      "uid": userModel.uid,
      "profilePicture": userModel.profilePicture,
      "status": userModel.status,
    }).then((value) {
      snackbarService.showSuccessSnackBar("Kullanıcı Eklendi");
    });
  }

  Future<void> addNewUserToDetail(UserModel userModel) async {
    await farmers.doc("turkey").collection("farmers").doc().set({
      "name": userModel.name,
      "email": userModel.email,
      "password": userModel.password
    }).then((value) {
      snackbarService.showSuccessSnackBar("Kullanıcı Eklendi");
    });
  }

  Future<void> addUserToFirestore(
      String userId, String userName, String email) async {
    await FirebaseFirestore.instance.collection('users').doc(userId).set({
      'userName': userName,
      'email': email,
      // Diğer kullanıcı bilgilerini ekleyebilirsiniz.
    });
  }

  Future<UserModel?> getUserById(String documentId) async {
    try {
      DocumentSnapshot userSnapshot = await users.doc(documentId).get();
      if (userSnapshot.exists) {
        // Veriyi dönüştürme işlemi
        final Map<String, dynamic>? data =
            userSnapshot.data() as Map<String, dynamic>?;

        // Eğer veri varsa ve dönüştürme işlemi başarılıysa UserModel oluştur
        if (data != null) {
          UserModel userModel = UserModel.fromJson(data);
          return userModel;
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print("Error fetching user by ID: $e");
    }
    return null;
  }
}

final FireStoreService fireStoreService = FireStoreService();
