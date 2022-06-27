import 'package:sporty_app/Home/SportProducts/checkout/model/CreditCardModel.dart';
import 'package:sporty_app/Home/SportProducts/checkout/model/address_model.dart';
//
// class UserPaymentDataModel {
//   AddressModel address;
//   List<CreditCardModel> creditCard;
//
//   UserPaymentDataModel({this.address, this.creditCard});
//
//   factory UserPaymentDataModel.fromJson(Map<String, dynamic> json) => UserPaymentDataModel(
//       address : json['address'] != null ? new AddressModel.fromJson(json['address']) : null,
//       creditCard: json['creditCard'] != null ? CreditCardModel.getCards(json['creditCard']) : []
//   );
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.address != null) {
//       data['address'] = this.address.toJson();
//     }
//     if (this.creditCard != null) {
//       data['creditCard'] = this.creditCard.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class UserPaymentDataModel {
  AddressModel address;
  List<CreditCardModel> creditCards;

  UserPaymentDataModel({this.address, this.creditCards});

  UserPaymentDataModel.fromJson(Map<String, dynamic> json) {
    address =
    json['address'] != null ? new AddressModel.fromJson(json['address']) : null;
    if (json['creditCards'] != null) {
      creditCards = <CreditCardModel>[];
      json['creditCards'].forEach((v) {
        creditCards.add(new CreditCardModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    if (this.creditCards != null) {
      data['creditCards'] = this.creditCards.map((v) => v.toJson()).toList();
    }
    return data;
  }
}