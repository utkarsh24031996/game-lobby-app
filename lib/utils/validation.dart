

class Validations {

  
  String? validateMobile(String? value) {
    if (value!.isEmpty) {
      return '* Required';
    } else if (value.length < 10) {
      return '* Enter Valid Number';
    }
    return null;
  }

  String? name(String? value) {
    if (value!.isEmpty) {
      return '* Required';
    } else if (value.length < 3) {
      return '* minimum 3 character';
    }
    return null;
  }

  String? emailAddressValid(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

}
