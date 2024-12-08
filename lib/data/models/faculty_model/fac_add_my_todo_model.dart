class FacAddMyToDoModel {
  String? status;
  FacAddMyToDoData? data;

  FacAddMyToDoModel({this.status, this.data});

  FacAddMyToDoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data =
        json['data'] != null ? FacAddMyToDoData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class FacAddMyToDoData {
  String? title;
  String? date;

  FacAddMyToDoData({this.title, this.date});

  FacAddMyToDoData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['date'] = date;
    return data;
  }
}
