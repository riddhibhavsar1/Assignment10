class BookResponse {
  BookResponse({
    required this.settings,
    required this.data,
  });
  late final Settings settings;
  late final List<Data> data;
  late Data myData;

  BookResponse.fromJson(Map<String, dynamic> json){
    settings = Settings.fromJson(json['settings']);
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();

  }
  BookResponse.fromJsonBook(Map<String, dynamic> json){
    settings = Settings.fromJson(json['settings']);
    data = [];
    myData = Data.fromJson(json['data']);
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['settings'] = settings.toJson();
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Settings {
  Settings({
    required this.status,
    required this.message,
    required this.code,
  });
  late final int status;
  late final String message;
  late final int code;

  Settings.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['code'] = code;
    return _data;
  }
}

class Data {
  Data({
    required this.courseTitle,
    required this.courseData,
    required this.booksData,
  });
  late final String courseTitle;
  late final List<CourseData> courseData;
  late final List<CourseData> booksData;

  Data.fromJson(Map<String, dynamic> json){
    if(json['courseTitle'] != null)
    courseTitle = json['courseTitle'];
    if(json['courseData'] != null)
    courseData = List.from(json['courseData']).map((e)=>CourseData.fromJson(e)).toList();
    if(json['books'] != null)
    booksData = List.from(json['books']).map((e)=>CourseData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['courseTitle'] = courseTitle;
    _data['courseData'] = courseData.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class CourseData {
  CourseData({
  required this.id,
  required this.userId,
  required this.title,
  required this.author,
  required this.className,
  required this.price,
  required this.isbn,
  required this.interestId,
  required this.conditionId,
  required this.description,
  required this.availability,
  required this.status,
  required this.createdAt,
  required this.updatedAt,
  required this.deletedAt,
  required this.viewCount,
  required this.images,
  required this.interests,
});
late final int id;
late final int userId;
late final String title;
late final String author;
late final String className;
late final double price;
late final String isbn;
late final int interestId;
late final int conditionId;
late final String description;
late final String availability;
late final String status;
late final String createdAt;
late final String updatedAt;
late final bool deletedAt;
late final int viewCount;
late final List<String> images;
late final Interests interests;

CourseData.fromJson(Map<String, dynamic> json){
id = json['id'];
userId = json['user_id'];
title = json['title'];
author = json['author'];
className = json['class'];
price = json['price'];
isbn = json['isbn'];
interestId = json['interest_id'];
conditionId = json['condition_id'];
description = json['description'];
availability = json['availability'];
status = json['status'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
deletedAt = json['deleted_at'];
viewCount = json['view_count'];
images = List.castFrom<dynamic, String>(json['images']);
if(json['interests'] != null)
interests = Interests.fromJson(json['interests']);
}

Map<String, dynamic> toJson() {
final _data = <String, dynamic>{};
_data['id'] = id;
_data['user_id'] = userId;
_data['title'] = title;
_data['author'] = author;
_data['class'] = className;
_data['price'] = price;
_data['isbn'] = isbn;
_data['interest_id'] = interestId;
_data['condition_id'] = conditionId;
_data['description'] = description;
_data['availability'] = availability;
_data['status'] = status;
_data['created_at'] = createdAt;
_data['updated_at'] = updatedAt;
_data['deleted_at'] = deletedAt;
_data['view_count'] = viewCount;
_data['images'] = images;
_data['interests'] = interests.toJson();
return _data;
}
}

class Interests {
Interests({
required this.id,
required this.interest,
required this.status,
this.createdAt,
this.updatedAt,
});
late final int id;
late final String interest;
late final String status;
late final Null createdAt;
late final Null updatedAt;

Interests.fromJson(Map<String, dynamic> json){
id = json['id'];
interest = json['interest'];
status = json['status'];
createdAt = null;
updatedAt = null;
}

Map<String, dynamic> toJson() {
final _data = <String, dynamic>{};
_data['id'] = id;
_data['interest'] = interest;
_data['status'] = status;
_data['created_at'] = createdAt;
_data['updated_at'] = updatedAt;
return _data;
}
}