import 'package:flutter/material.dart';
import 'package:sports_app/Data/models/comment_model.dart';

Widget forumBody(List<Comment> allComments) {
  return Expanded(
    child: ListView.builder(
      itemCount: allComments.length,
      itemBuilder: (context, index) {
        var commentData = allComments[index];
        bool isEvenIndex = index.isEven; // Index çift mi, tek mi kontrolü
        return Container(
            color: isEvenIndex
                ? Colors.white
                : const Color.fromARGB(
                    255, 243, 243, 243), // Arka plan rengini belirleme
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${commentData.userId}:',
                        style: const TextStyle(
                          color: Color.fromARGB(
                              255, 55, 92, 174), // userId rengini mavi yapma
                          fontWeight:
                              FontWeight.bold, // Opsiyonel: Kalın yazı tipi
                        ),
                      ),
                      Text(
                        commentData.commentContent,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${getTimeAgo(commentData.timestamp)}  ',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ));
      },
    ),
  );
}

String getTimeAgo(DateTime timestamp) {
  Duration difference = DateTime.now().difference(timestamp);

  if (difference.inDays > 0) {
    return '${difference.inDays} gün önce';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} saat önce';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} dakika önce';
  } else {
    return 'Şimdi';
  }
}
