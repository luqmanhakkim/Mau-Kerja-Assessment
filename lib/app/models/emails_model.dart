class Email {
  List<EmailModel>? results;

  Email({this.results});

  Email.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <EmailModel>[];
      json['results'].forEach((v) {
        results!.add(new EmailModel.fromJson(v));
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

class EmailModel {
  int? id;
  String? email;
  String? phone;

  EmailModel({this.id, this.email, this.phone});

  EmailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}
