class StuVerifyOTPModel {
  String? status;
  String? data;

  StuVerifyOTPModel({this.status, this.data});

  StuVerifyOTPModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['data'] = this.data;
    return data;
  }
}
