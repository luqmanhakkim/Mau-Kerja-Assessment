class StatusModel {
  List<Status>? results;

  StatusModel({this.results});

  StatusModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Status>[];
      json['results'].forEach((v) {
        results!.add(new Status.fromJson(v));
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

class Status {
  int? id;
  String? status;
  String? jobTitle;
  String? companyName;
  String? industry;

  Status({
    this.id,
    this.status,
    this.jobTitle,
    this.companyName,
    this.industry,
  });

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    jobTitle = json['job_title'];
    companyName = json['company_name'];
    industry = json['industry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['job_title'] = this.jobTitle;
    data['company_name'] = this.companyName;
    data['industry'] = this.industry;
    return data;
  }
}
