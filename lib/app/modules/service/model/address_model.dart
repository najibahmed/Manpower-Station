const String addressFieldFirstName= 'name';
const String addressFieldPhoneNumber = 'phoneNumber';
const String addressFieldEmail = 'email';
const String addressFieldAddressLine1 = 'addressLine1';
const String addressFieldState = 'state';
const String addressFieldCity = 'city';
const String addressFieldZipcode = 'zipcode';

class AddressModel {
  String? name;
  String? phoneNumber;
  String? email;
  String? addressLine1;
  String? state;
  String? city;
  String? zipcode;

  AddressModel({this.name,this.phoneNumber, this.email,this.addressLine1, this.state, this.city, this.zipcode});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      addressFieldFirstName: name,

      addressFieldPhoneNumber: phoneNumber,
      addressFieldEmail: email,
      addressFieldAddressLine1: addressLine1,
      addressFieldState: state,
      addressFieldCity: city,
      addressFieldZipcode: zipcode,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) => AddressModel(
    name: map[addressFieldFirstName],
    phoneNumber: map[addressFieldPhoneNumber],
    email: map[addressFieldEmail],
    addressLine1: map[addressFieldAddressLine1],
    state: map[addressFieldState],
    city: map[addressFieldCity],
    zipcode: map[addressFieldZipcode],
  );
}