import 'package:firebase_database/firebase_database.dart';

class Memo {
  String? key;
  String title;
  String content;
  String createTime;

  Memo(this.title, this.content, this.createTime);

  // 데이터베이스에서 데이터 가져올때 클래스의 변수에 넣어 줌
  Memo.fromSnapshot(DataSnapshot snapshot) : 
    key = snapshot.key,
    title = snapshot.value['title'],
    content = snapshot.value['content'],
    createTime = snapshot.value['createTime'];

  // JSON 형태로 반환 
  toJson() {
    return {
      'title': title,
      'content': content,
      'createTime': createTime,
    };
  }
}