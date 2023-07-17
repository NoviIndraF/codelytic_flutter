import 'package:codelytic/domain/entities/home/get_all_data_by_room_code_response_entity.dart';
import 'package:equatable/equatable.dart';

class GetAllDataByRoomCodeResponse extends Equatable{
  GetAllDataByRoomCodeResponse({
    this.id,
    this.code,
    this.slug,
    this.name,
    this.major,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.materi,
    this.quiz,
    this.task,
  });
  int? id;
  String? code;
  String? slug;
  String? name;
  String? major;
  String? description;
  String? createdAt;
  String? updatedAt;
  User? user;
  List<Materi>? materi;
  List<Quiz>? quiz;
  List<Task>? task;

  GetAllDataByRoomCodeResponse.fromJson(Map<String?, dynamic> json){
    id = json['id'];
    code = json['code'];
    slug = json['slug'];
    name = json['name'];
    major = json['major'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = User.fromJson(json['user']);
    materi = List.from(json['materi']).map((e)=>Materi.fromJson(e)).toList();
    quiz = List.from(json['quiz']).map((e)=>Quiz.fromJson(e)).toList();
    task = List.from(json['task']).map((e)=>Task.fromJson(e)).toList();
  }

  GetAllDataByRoomCodeEntity toEntity() => GetAllDataByRoomCodeEntity(id: id, code: code, slug: slug, name: name, major: major, description: description, createdAt: createdAt, updatedAt: updatedAt, user: user, materi: materi, quiz: quiz, task: task);

  @override
  List<Object?> get props => [id, code, slug, name, major, description, createdAt, updatedAt, user, materi, quiz, task];
}

class User extends Equatable{
  User({
    this.name,
    this.username,
    this.email,
    this.status,
    this.showingStatus,
  });
  String? name;
  String? username;
  String? email;
  String? status;
  String? showingStatus;

  User.fromJson(Map<String?, dynamic> json){
    name = json['name']  ?? "";
    username = json['username']  ?? "";
    email = json['email']  ?? "";
    status = json['status']  ?? "";
    showingStatus = json['showing_status']  ?? "";
  }

  UserEntity toEntity() => UserEntity(name: name, username: username, email: email, showingStatus: showingStatus, status: status);

  @override
  List<Object?> get props => [name, username, email, status, showingStatus];
}

class Materi extends Equatable{
  Materi({
    this.id,
    this.slug,
    this.title,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
  });
  int? id;
  String? slug;
  String? title;
  String? description;
  int? status;
  String? createdAt;
  String? updatedAt;

  Materi.fromJson(Map<String?, dynamic> json){
    id = json['id'] ?? "";
    slug = json['slug'] ?? "";
    title = json['title'];
    description = json['description'] ?? "";
    status = json['status'] ?? "";
    createdAt = json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? "";
  }

  MateriEntity toEntity() => MateriEntity(id: id, slug: slug, title: title, description: description, status: status, createdAt: createdAt, updatedAt: updatedAt);

  @override
  List<Object?> get props => [id, slug, title, description, status, createdAt, updatedAt];
}

class Quiz extends Equatable{
  Quiz({
    this.id,
    this.slug,
    this.title,
    this.description,
    this.level,
    this.status,
    this.createdAt,
    this.updatedAt,
  });
  int? id;
  String? slug;
  String? title;
  int? level;
  String? description;
  int? status;
  String? createdAt;
  String? updatedAt;

  Quiz.fromJson(Map<String?, dynamic> json){
    id = json['id'] ?? "";
    slug = json['slug'] ?? "";
    title = json['title'];
    level = json['level'] ?? "";
    description = json['description'] ?? "";
    status = json['status'] ?? "";
    createdAt = json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? "";
  }

  QuizEntity toEntity() => QuizEntity(id: id, slug: slug, title: title, description: description, status: status, createdAt: createdAt, updatedAt: updatedAt);
  @override
  List<Object?> get props => [id, slug, title, description, status, createdAt, updatedAt];
}

class Task extends Equatable{
  Task({
    this.id,
    this.slug,
    this.title,
    this.description,
    this.note,
    this.content,
    this.deadline,
    this.status,
    this.createdAt,
    this.updatedAt,
  });
  int? id;
  String? slug;
  String? title;
  String? description;
  String? note;
  String? content;
  String? deadline;
  int? status;
  String? createdAt;
  String? updatedAt;

  Task.fromJson(Map<String?, dynamic> json){
    id = json['id'] ?? "";
    slug = json['slug'] ?? "";
    title = json['title'] ?? "";
    description = json['description'];
    note = json['note'] ?? "";
    content = json['content'] ?? "";
    deadline = json['deadline'] ?? "";
    status = json['status'] ?? "";
    createdAt = json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? "";
  }

  TaskEntity toEntity()=> TaskEntity(id: id, slug: slug, description: description, note: note, content: content, deadline: deadline, status: status, createdAt: createdAt, updatedAt: updatedAt);
  @override
  List<Object?> get props => [id, slug, title, description, note, content, deadline, status, createdAt, updatedAt];
}