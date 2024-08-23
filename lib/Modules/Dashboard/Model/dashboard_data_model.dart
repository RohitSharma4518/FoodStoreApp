class DashboardDataModel {
  int? code;
  String? message;

  DashboardDataModel({
    this.code,
    this.message,
  });

  DashboardDataModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}
