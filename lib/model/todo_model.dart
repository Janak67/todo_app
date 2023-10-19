class TodoModel{
  String? title,descripation;

  TodoModel({this.title,this.descripation});

  factory TodoModel.fromMap(Map m1){
    TodoModel t1 = TodoModel(
      title: m1['title'],
      descripation: m1['descripation'],
    );
    return t1;
  }
}