class CheckoutFormModel {
  String nameOnCard;
  String cardNumber;
  String expiry;
  String cvv;
  String streetAddress;
  String city;
  String state;
  String zipCode;
  CheckoutFormModel(
      {this.streetAddress,
      this.state,
      this.cardNumber,
      this.city,
      this.cvv,
      this.expiry,
      this.nameOnCard,
      this.zipCode});
}
