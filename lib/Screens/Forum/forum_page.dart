import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Data/models/comment_model.dart';
import 'package:sports_app/Data/models/user_model.dart';
import 'package:sports_app/Screens/Forum/comment_service.dart';
import 'package:sports_app/Screens/Forum/forum_body.dart';
import 'package:sports_app/Services/auth_service.dart';
import 'package:sports_app/Services/firestore_service.dart';

class ForumPage extends StatefulWidget {
  final int? matchId;

  const ForumPage({Key? key, required this.matchId}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  final TextEditingController _commentController = TextEditingController();
  final CommentService _commentService = CommentService();
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          FutureBuilder<List<Comment>>(
            future: _commentService.getCommentsForMatch(widget.matchId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return forumBody(snapshot.data!);
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                return const Text('Henüz yorum yapılmamış.');
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _commentController,
                    decoration: const InputDecoration(
                      hintText: 'Yorum yaz...',
                      border: InputBorder.none,
                    ),
                    onEditingComplete: () {
                      _postComment();
                      FocusScope.of(context).unfocus(); // Klavyeyi kapat
                    },
                  ),
                ),
                Ink(
                  decoration: const ShapeDecoration(
                    color: kBlackColor, // #848D94 rengi
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send,
                        color: kGreyColor), // Gönder ikonu rengi
                    onPressed: () {
                      _postComment();
                      FocusScope.of(context).unfocus(); // Klavyeyi kapat
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _postComment() async {
    String commentContent = _commentController.text.trim();
    String? currentUserName = authService.getCurrentUserDisplayName();
    User? user = FirebaseAuth.instance.currentUser;
    if (commentContent.isNotEmpty) {
      await _commentService.addCommentToMatch(
          widget.matchId, user?.displayName ?? 'Anonymous', commentContent);
      _commentController.clear();
      FutureBuilder<UserModel?>(
        future: fireStoreService.getUserById(user!.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("loading");
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Text("User not found");
          } else {
            return Text(
              snapshot.data!.name.toString(),
              style: const TextStyle(
                fontSize: 18, // İstediğiniz font büyüklüğünü burada belirleyin
              ),
            );
          }
        },
      );

      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen bir yorum girin')),
      );
    }
  }
}
