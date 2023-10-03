mixin AddClientValidationMixin{
  String isNameValid(String password){
    if(password.isEmpty){
      return "Full name is required";
    }
    return "";
  }
  String isNumberValid(String number){
    if(number.length < 10){
      return "Mobile number must be a 10 digit number";
    }
    if(double.parse(number) == 0.00){
      return "Invalid mobile number";
    }
    return "";
  }
  bool isEmailValidate(String value){
    if(!RegExp(r"^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$")
        .hasMatch(value!)){
      return false;
    }
    return true;
  }
  String isAgeValid(String age){
    if(double.parse(age) == 0.00){
      return "Invalid age";
    }
    return "";
  }
}
