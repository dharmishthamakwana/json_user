class Usermodal
{
  int? id;
  String? phone,name,username,email;

  Usermodal({this.id, this.phone, this.name, this.username, this.email});
  Usermodal jsonFromUserModel(Map m1)
  {
    id = m1['id'];
   email  = m1['email'];
    phone = m1['phone'];
    username = m1['username'];
    Usermodal pm1 = Usermodal();
    return pm1;

  }

}