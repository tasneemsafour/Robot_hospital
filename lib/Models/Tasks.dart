 class Tasks {
  String _id;
  String _taskname;
  String _paint;
  String _arg1;
  String _arg2;
  String _taskName;

  Tasks(
      {String id,
        String taskname,
        String paint,
        String arg1,
        String arg2,
        String taskName}) {
    this._id = id;
    this._taskname = taskname;
    this._paint = paint;
    this._arg1 = arg1;
    this._arg2 = arg2;
    this._taskName = taskName;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get taskname => _taskname;
  set taskname(String taskname) => _taskname = taskname;
  String get paint => _paint;
  set paint(String paint) => _paint = paint;
  String get arg1 => _arg1;
  set arg1(String arg1) => _arg1 = arg1;
  String get arg2 => _arg2;
  set arg2(String arg2) => _arg2 = arg2;
  String get taskName => _taskName;
  set taskName(String taskName) => _taskName = taskName;

  Tasks.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _taskname = json['taskname'];
    _paint = json['paint'];
    _arg1 = json['arg1'];
    _arg2 = json['arg2'];
    _taskName = json['task_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['taskname'] = this._taskname;
    data['paint'] = this._paint;
    data['arg1'] = this._arg1;
    data['arg2'] = this._arg2;
    data['task_name'] = this._taskName;
    return data;
  }
}