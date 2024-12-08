class ShowStuTodoModel {
  String? status;
  int? count;
  List<Data>? data;

  ShowStuTodoModel({this.status, this.data});

  ShowStuTodoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    count = json['count'];
    if (json['data'] != null && json['data'] is List) {
      data = (json['data'] as List).map((item) => Data.fromJson(item)).toList();
    } else {
      data = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['count'] = count;
    if (this.data != null) {
      data['data'] = this.data!.map((item) => item.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? title;
  String? date;
  String? createdDate;

  Data({this.sId, this.title, this.date, this.createdDate});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    date = json['date'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['date'] = date;
    data['createdDate'] = createdDate;
    return data;
  }
}
