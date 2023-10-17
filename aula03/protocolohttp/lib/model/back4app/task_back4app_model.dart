class TaskBack4AppModel {
  List<Task> tasks = [];

  TaskBack4AppModel(this.tasks);

  TaskBack4AppModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      tasks = <Task>[];
      json['results'].forEach((v) {
        tasks.add(Task.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = tasks.map((v) => v.toJson()).toList();
    return data;
  }
}

class Task {
  String objectId = '';
  String description = '';
  bool concluded = false;
  String createdAt = '';
  String updatedAt = '';

  Task(this.objectId, this.description, this.concluded, this.createdAt,
      this.updatedAt);
  Task.post(this.description, this.concluded);
  Task.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    description = json['description'];
    concluded = json['concluded'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['description'] = description;
    data['concluded'] = concluded;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

  Map<String, dynamic> toCreateJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['concluded'] = concluded;
    return data;
  }

  Map<String, dynamic> toUpdateJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['concluded'] = concluded;
    return data;
  }
}
