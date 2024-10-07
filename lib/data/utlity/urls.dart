class Urls{
  static const String _baseUrl='https://ecommerce-api.codesilicon.com/api';

  static String sendEmailOtp(String email)=>'$_baseUrl/UserLogin/$email';
  static String verifyOtp(String email, String otp)=>
      '$_baseUrl/VerifyLogin/$email/$otp';
  static String readProfile = '$_baseUrl/ReadProfile';
  static String createProfile = '$_baseUrl/CreateProfile';
  static String homeBanner = '$_baseUrl/ListProductSlider';
  static String categoryList = '$_baseUrl/CategoryList';
  static String popularProduct = '$_baseUrl/ListProductByRemark/popular';
  static String specialProduct = '$_baseUrl/ListProductByRemark/special';
  static String newProduct = '$_baseUrl/ListProductByRemark/new';
  static String productByCategory(int catId) => '$_baseUrl/ListProductByCategory/${catId}';
  static String productDetails(int productID) => '$_baseUrl/ProductDetailsById/${productID}';
  static String addToCart= '$_baseUrl/CreateCartList';
  static String cartList= '$_baseUrl/CartList';
  static String deleteCart(int id)=> '$_baseUrl/DeleteCartList/${id}';
}