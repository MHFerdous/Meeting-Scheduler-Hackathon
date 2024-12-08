class FacMyTodoModel {
  String? status;
  int? count;
  List<Data>? data;

  FacMyTodoModel({this.status, this.count, this.data});

  FacMyTodoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    count = json['count'];
    if (json['data'] != null) {
      data = <Data>[];
      (json['data']).forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

}

class Data {
  String? sId;
  String? email;
  String? title;
  String? date;
  String? createdDate;

  Data({this.sId, this.title, this.date, this.createdDate});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    title = json['title'];
    date = json['date'];
    createdDate = json['createdDate'];
  }
}
