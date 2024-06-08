
class PostOffice {
  String? name;
  String? description;
  String? branchType;
  String? deliveryStatus;
  String? circle;
  String? district;
  String? division;
  String? region;
  String? block;
  String? state;
  String? country;
  String? pincode;

  PostOffice({
    required this.name,
    this.description,
    required this.branchType,
    required this.deliveryStatus,
    required this.circle,
    required this.district,
    required this.division,
    required this.region,
    required this.block,
    required this.state,
    required this.country,
    required this.pincode,
  });

  factory PostOffice.fromJson(Map<String, dynamic> json) {
    return PostOffice(
      name: json['Name'] ?? '',
      description: json['Description'] ?? '',
      branchType: json['BranchType'] ?? '',
      deliveryStatus: json['DeliveryStatus'] ?? '',
      circle: json['Circle'] ?? '',
      district: json['District'] ?? '',
      division: json['Division'] ?? '',
      region: json['Region'] ?? '',
      block: json['Block'] ?? '',
      state: json['State'] ?? '',
      country: json['Country'] ?? '',
      pincode: json['Pincode'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Description': description,
      'BranchType': branchType,
      'DeliveryStatus': deliveryStatus,
      'Circle': circle,
      'District': district,
      'Division': division,
      'Region': region,
      'Block': block,
      'State': state,
      'Country': country,
      'Pincode': pincode,
    };
  }
}

class PostOfficeResponse {
  String message;
  String status;
  List<PostOffice> postOffices;

  PostOfficeResponse({
    required this.message,
    required this.status,
    required this.postOffices,
  });

  factory PostOfficeResponse.fromJson(Map<String, dynamic> json) {
    var list = json['PostOffice'] as List;
    List<PostOffice> postOfficeList =
        list.map((i) => PostOffice.fromJson(i)).toList();

    return PostOfficeResponse(
      message: json['Message'] ?? '',
      status: json['Status'] ?? '',
      postOffices: postOfficeList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Message': message,
      'Status': status,
      'PostOffice': postOffices.map((e) => e.toJson()).toList(),
    };
  }
}