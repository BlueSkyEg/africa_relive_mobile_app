class ProjectModel {
  String? status;
  String? message;
  List<ProjectsData>? data;

  ProjectModel({this.status, this.message, this.data});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProjectsData>[];
      json['data'].forEach((v) {
        data!.add(new ProjectsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProjectsData {
  int? id;
  String? description;
  String? type;
  String? image;
  List <String>? image2;
  List <int>? amounts;
  String? header1;
  String? body1;
  String? header2;
  String? body2;
  String? header3;
  String? body3;
  String? title;
  ProjectsData(
      {this.id,
        this.description,
        this.type,
      this.header1,this.header2,this.header3,
      this.body1,this.body2,this.body3,
      this.image,this.title,this.image2,this.amounts,
      });

   ProjectsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    header1 = json['header1'];
    header2 = json['header2'];
    header3 = json['header3'];
    body1 = json['body1'];
    body2 = json['body2'];
    body3 = json['body3'];
    image=json['image'];
    image2=List<String>.from(json["image2"].map((x) => x));
    amounts=List<int>.from(json["amnounts"].map((x) => x));
    type=json['type'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['header1'] = this.header1;
    data['header2'] = this.header2;
    data['header1'] = this.header3;
    data['type'] = this.type;
    data['body1'] = this.body1;
    data['body2'] = this.body2;
    data['body3'] = this.body3;
    data['image'] = this.image;
    data['image2'] = List<dynamic>.from(image2!.map((x) => x));
    data['amounts'] = List<dynamic>.from(amounts!.map((x) => x));
    return data;
  }
}