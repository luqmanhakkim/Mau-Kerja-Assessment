class BlogModel {
  List<Blog>? results;

  BlogModel({this.results});

  BlogModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Blog>[];
      json['results'].forEach((v) {
        results!.add(new Blog.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Blog {
  int? id;
  String? title;
  String? subTitle;
  String? photo;
  String? content;
  String? author;
  int? createAt;
  String? tag;

  Blog(
      {this.id,
      this.title,
      this.subTitle,
      this.photo,
      this.content,
      this.author,
      this.createAt,
      this.tag});

  Blog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subTitle = json['subTitle'];
    photo = json['photo'];
    content = json['content'];
    author = json['author'];
    createAt = json['create_at'];
    tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subTitle'] = this.subTitle;
    data['photo'] = this.photo;
    data['content'] = this.content;
    data['author'] = this.author;
    data['create_at'] = this.createAt;
    data['tag'] = this.tag;
    return data;
  }
}