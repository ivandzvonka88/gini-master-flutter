class PersonalInfoModel {
  String firstName;
  String lastName;
  String phoneNo;
  String email;
  bool isFormEdited;

  PersonalInfoModel(
      {this.firstName,
      this.lastName,
      this.email,
      this.phoneNo,
      this.isFormEdited = false});
}
