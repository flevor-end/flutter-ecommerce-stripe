class User {
  String uid;
  String name;
  String image;
  String document;
  String documenttype;
  String pwd;

  // bool presence;
  //int lastSeenInEpoch;

  User(this.uid, {this.name, this.image, this.document,this.documenttype,this.pwd});
  User.fromJson(Map<String, dynamic> json) {
    
    uid = json['uid'];
    name = json['name'];
    image = json['image'];
    document= json['document'];
    documenttype= json['documenttype'];
    pwd = json['presence'];
    //lastSeenInEpoch = json['last_seen'];
  }

  Map<String, dynamic> toJson() {

  final Map<String, dynamic> data = new Map<String, dynamic>();

    data['uid'] = this.uid;
    data['name'] = this.name;
    data['image'] = this.image;
    data['document']=this.document;
    data['documenttype']=this.documenttype;
    data['pwd']=this.pwd;
    //data['presence'] = this.presence;
    //data['last_seen'] = this.lastSeenInEpoch;

    return data;
  }
}

// Demo List of Top Travelersd
List<User> topUsers = [user1, user2, user3, user4];

// demo user
User user1 = User("01", name:"James", image: "assets/users/james.png",document:"107834234",documenttype:"cc");
User user2 = User("011", name:"John", image: "assets/users/John.png",document:"107834234",documenttype:"cc",);
User user3 = User("20", name:"Marry", image: "assets/users/marry.png",document:"107834234",documenttype:"cc" );
User user4 = User("10", name:"Rosy", image: "assets/users/rosy.png",document:"107834234",documenttype:"cc" );
