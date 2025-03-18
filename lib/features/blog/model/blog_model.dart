import 'dart:convert';

class BlogModel {
  BlogModel({
    this.id,
    this.body,
    this.category,
    this.imagePath,
    this.title,
  });
  String? id, title, imagePath, body, category;

  factory BlogModel.fromJson({required Map<String, dynamic> data}) {
    return BlogModel(
      id: data["id"],
      title: data["title"],
      imagePath: data["url"],
      category: data["category"],
      body: data["text"],
    );
  }

  String toJson() {
    Map<String, dynamic> dataSent = {
      "title": title,
      "text": body,
      "category": category,
      "image": imagePath,
    };
    return jsonEncode(dataSent);
  }

  @override
  String toString() {
    return {
      "id": id,
      "title": title,
      "text": body,
      "category": category,
      "image": imagePath,
    }.toString();
  }
}
