class ProviderModel {
  ProviderModel({
    required this.success,
    required this.message,
    required this.data,
  });
  late final bool success;
  late final String message;
  late final List<Data> data;


  ProviderModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();

    return _data;
  }
}

class Data {
  Data({
    required this.uuid,
    required this.businessName,
    required this.vatNo,
    required this.regNo,
    required this.idNo,
    required this.type,
    required this.email,
    required this.phone,
    required this.note,
    required this.webLink,
    required this.highlight,
    required this.category,
    required this.imagePath,
    required this.backgroundImagePath,
    required this.file,
    required this.cashback,
  });
  late final String uuid;
  late final String businessName;
  late final String vatNo;
  late final String regNo;
  late final String idNo;
  late final String type;
  late final String email;
  late final String phone;
  late final String note;
  late final String webLink;
  late final int highlight;
  late final String category;
  late final String imagePath;
  late final String backgroundImagePath;
  late final File file;
  late final Cashback cashback;

  Data.fromJson(Map<String, dynamic> json){
    uuid = json['uuid'];
    businessName = json['business_name'];
    vatNo = json['vat_no'];
    regNo = json['reg_no'];
    idNo = json['id_no'];
    type = json['type'];
    email = json['email'];
    phone = json['phone'];
    note = json['note'];
    webLink = json['web_link'];
    highlight = json['highlight'];
    category = json['category'];
    imagePath = json['image_path'];
    backgroundImagePath = json['background_image_path'];
    file = File.fromJson(json['file']);
    cashback = Cashback.fromJson(json['cashback']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uuid'] = uuid;
    _data['business_name'] = businessName;
    _data['vat_no'] = vatNo;
    _data['reg_no'] = regNo;
    _data['id_no'] = idNo;
    _data['type'] = type;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['note'] = note;
    _data['web_link'] = webLink;
    _data['highlight'] = highlight;
    _data['category'] = category;
    _data['image_path'] = imagePath;
    _data['background_image_path'] = backgroundImagePath;
    _data['file'] = file.toJson();
    _data['cashback'] = cashback.toJson();
    return _data;
  }
}

class File {
  File({
    required this.id,
    required this.uuid,
    required this.name,
    required this.extension,
    required this.creatorUuid,
    required this.createdAt,
    required this.updatedAt,
    required this.backgroundImage,
  });
  late final int id;
  late final String uuid;
  late final String name;
  late final String extension;
  late final String creatorUuid;
  late final String createdAt;
  late final String updatedAt;
  late final String backgroundImage;

  File.fromJson(Map<String, dynamic> json){
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    extension = json['extension'];
    creatorUuid = json['creator_uuid'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    backgroundImage = json['background_image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['uuid'] = uuid;
    _data['name'] = name;
    _data['extension'] = extension;
    _data['creator_uuid'] = creatorUuid;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['background_image'] = backgroundImage;
    return _data;
  }
}

class Cashback {
  Cashback({

    required this.percentage,
  });

  late final int percentage;

  Cashback.fromJson(Map<String, dynamic> json){

    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['percentage'] = percentage;
    return _data;
  }
}

