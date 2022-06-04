class AddressModel {
  List<Address>? results;

  AddressModel({this.results});

  AddressModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Address>[];
      json['results'].forEach((v) {
        results!.add(new Address.fromJson(v));
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

class Address {
  int? id;
  String? address;
  String? city;
  String? state;
  int? zipCode;

  Address({this.id, this.address, this.city, this.state, this.zipCode});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip_code'] = this.zipCode;
    return data;
  }
}
