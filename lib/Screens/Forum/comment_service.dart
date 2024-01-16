import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sports_app/Data/models/comment_model.dart';

class CommentService {
  final CollectionReference commentsCollection =
      FirebaseFirestore.instance.collection('comments');

  Future<void> addCommentToMatch(
      int? matchId, String userId, String commentContent) async {
    try {
      // Belirli bir maça yorum eklemek için comments koleksiyonuna yeni bir belge ekleyin
      await commentsCollection.add({
        'matchId': matchId,
        'userId': userId,
        'comment_content': commentContent,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      // Hata durumunda burada işlem yapabilirsiniz
    }
  }

  Future<List<Comment>> getCommentsForMatch(int? matchId) async {
    try {
      // Belirli bir maça ait tüm yorumları almak için sorgu yapın
      QuerySnapshot querySnapshot =
          await commentsCollection.where('matchId', isEqualTo: matchId).get();

      // QuerySnapshot'tan Comment sınıfına dönüştürülen yorumları alın
      List<Comment> comments = querySnapshot.docs
          .map((doc) => Comment.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return comments;
    } catch (e) {
      // Hata durumunda burada işlem yapabilirsiniz

      return [];
    }
  }
}
