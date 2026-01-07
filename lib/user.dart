class User{
  String? _name;
  String ? _password;
  int? _id;

  User(this._name, this._password);

  User.map(dynamic obj){
    _name=obj['username'];
    _password=obj['password'];
    _id=obj['id'];
  }

  int? get id => _id;

  String? get password => _password;

  String? get name => _name;

  Map<String,dynamic> toMap(){
    var map= Map<String, dynamic>();
    map["username"]=_name;
    map["password"]=_password;
    if(id!=null){
      map["id"]=_id;
    }
    return map;

  }
  User.fromMap(Map<String,dynamic>map){
    this._name=map["username"];
    this._password=map["password"];
    this._id=map['id'];
  }

}