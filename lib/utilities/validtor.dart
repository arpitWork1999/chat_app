String validateEmail(String value) {
  String _msg =" ";
  RegExp regex = new RegExp(
      (r"^(?!.*\s)[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+(?!.*\s)"));
  if(value.isEmpty){
    _msg  = "Your username is required";
  }else if (!regex.hasMatch(value)){
    _msg = "Please provide a valid email address";
  }
  return _msg;
}
