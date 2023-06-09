import 'package:codelytic/common/text_app.dart';
import 'package:form_validator/form_validator.dart';

class FormValidator{
  static final emailValidate = ValidationBuilder().email(TextApp.tfInvalidFormatEmail).maxLength(50).build();
  static final passwordValidate = ValidationBuilder().minLength(8, TextApp.tfInvalidFormatPassword).build();
  static final fullnameValidate = ValidationBuilder().minLength(1, TextApp.tfInvalidFormatEmail).build();
  static final usernameValidate = ValidationBuilder().username().build();

  static confirmPasswordValidate(cPassword, password){
    if (cPassword.isEmpty){
      return 'The is field required';
    }
    else if(cPassword != password){
      return 'Tidak sama dengan Password';
    }
    return null;
  }
}

extension CustomValidationBuilder on ValidationBuilder {
  username() => add((value) {
    if (value!.contains(' ')) {
      return 'Username tidak boleh terdapat spasi';
    }
    return null;
  });

  confirmPassword(String cPassword, String password) {
    if(cPassword != password){
      return add((_)=>'Konfirmasi Password tidak sama dengan Password');
    }
    else {
      return add((_)=>null);
    }
  }

}
