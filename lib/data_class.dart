class Admin {
  int id;
  String adminUsername;
  String adminPassword;

  //Admin(this.id, this.adminUsername, this.adminPassword);
  Admin(
      {required this.id,
      required this.adminUsername,
      required this.adminPassword});

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      id: json['id'],
      adminUsername: json['admin_username'],
      adminPassword: json['admin_password'],
    );
  }
}

class Item {
  final String propertyNum;
  final String description;
  final String acquisitionDate;
  final String estimatedLife;
  final String officeDesignation;
  final String serialNum;

  const Item(
      {required this.propertyNum,
      required this.description,
      required this.acquisitionDate,
      required this.estimatedLife,
      required this.officeDesignation,
      required this.serialNum});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      propertyNum: json['property_no'],
      description: json['description'],
      acquisitionDate: json['acquisiton_date'],
      estimatedLife: json['estimated_life'],
      officeDesignation: json['office_designation'],
      serialNum: json['brand_serial_no'],
    );
  }
}
