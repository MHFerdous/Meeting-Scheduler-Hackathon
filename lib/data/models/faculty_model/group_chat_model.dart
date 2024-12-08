class GroupChatModel {
  String? status;
  List<Data>? data;

  GroupChatModel({this.status, this.data});

  GroupChatModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  String? designation;
  String? department;
  String? sId;
  List<Chat>? chat;
  String? timestamp;

  Data(
      {this.name,
        this.designation,
        this.department,
        this.sId,
        this.chat,
        this.timestamp});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    designation = json['designation'];
    department = json['department'];
    sId = json['_id'];
    if (json['chat'] != null) {
      chat = <Chat>[];
      json['chat'].forEach((v) {
        chat!.add(Chat.fromJson(v));
      });
    }
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['designation'] = designation;
    data['department'] = department;
    data['_id'] = sId;
    if (chat != null) {
      data['chat'] = chat!.map((v) => v.toJson()).toList();
    }
    data['timestamp'] = timestamp;
    return data;
  }
}

class Chat {
  String? message;
  String? sender;
  String? sId;
  String? timestamp;

  Chat({this.message, this.sender, this.sId, this.timestamp});

  Chat.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    sender = json['sender'];
    sId = json['_id'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['sender'] = sender;
    data['_id'] = sId;
    data['timestamp'] = timestamp;
    return data;
  }
}
