class FacPasswordChangeModel {
  String? status;
  String? data;

  FacPasswordChangeModel({this.status, this.data});

  FacPasswordChangeModel.fromJson(Map<String, dynamic> json) {
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
