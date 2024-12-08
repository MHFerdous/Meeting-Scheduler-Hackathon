class StuVerifyEmailModel {
  String? status;
  String? data;

  StuVerifyEmailModel({this.status, this.data});

  StuVerifyEmailModel.fromJson(Map<String, dynamic> json) {
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
