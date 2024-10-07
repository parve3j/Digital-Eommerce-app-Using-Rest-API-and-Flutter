class CreateProfileParams {
  final String customerName;
  final String customerAddress;
  final String customerCity;
  final String customerState;
  final String customerPostcode;
  final String customerContry;
  final String customerPhone;
  final String customerFax;
  final String shippintName;
  final String shippingAddress;
  final String shippingCity;
  final String shippingState;
  final String shippingPostcode;
  final String shippingCountry;
  final String shippingPhone;

  CreateProfileParams({
    required this.customerName,
    required this.customerAddress,
    required this.customerCity,
    required this.customerState,
    required this.customerPostcode,
    required this.customerContry,
    required this.customerPhone,
    required this.customerFax,
    required this.shippintName,
    required this.shippingAddress,
    required this.shippingCity,
    required this.shippingState,
    required this.shippingPostcode,
    required this.shippingCountry,
    required this.shippingPhone,
  });
  Map<String, String> toJson()=>{
    "cus_name": customerName,
    "cus_add": customerAddress,
    "cus_city": customerCity,
    "cus_state": customerState,
    "cus_postcode": customerPostcode,
    "cus_country": customerContry,
    "cus_phone": customerPhone ,
    "cus_fax": customerFax,
    "ship_name": shippintName,
    "ship_add": shippingAddress ,
    "ship_city": shippingCity,
    "ship_state": shippingState,
    "ship_postcode": shippingPostcode,
    "ship_country": shippingCountry,
    "ship_phone": shippingPhone,
  };
}
