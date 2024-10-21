class ApiList {
  static String userLogin = '/api/users/sign_in/sign_up'; //post method
  static String userLoginGmail = '/api/users/google'; //get method
  static String userOtpVerification = '/api/users/signup/phone_email/verified'; //put method
  static String getAllBookingsByUid = "/api/bookings/get/unique/user/booking/:userID"; //get method, userId must be given
  static String userReview = "/api/reviews/create/review/:bookingId"; //put method, bookingId must be given
  static String userOrderCreate = "/api/payments/ammerpay/create"; //post method
  static String getAllServiceData = "/api/services/get/all"; //get method
  static String getAllServicesCategories = "/api/services/categories/get/all"; //get method
  static String getOneCategoryServices = "/api/services/categories/services/:id"; //get method, catId must be given
  static String activeAppBanners = "/api/banners/get/active"; //get method,
  static String searchServices = "/api/services/get/all?keyword='keywordText' "; //get method, keywordText is Dynamic came from textField
  static String getAllWorkers = "/api/workers/get/all"; //get method
  static String searchWorkers = "/api/workers/get/all?keyword='keyword text'"; //get method, keywordText is Dynamic came from textField
  static String getUserInformation = "/api/clients/get/unique/client/profile/:userId"; //get method, userId required
  static String updateUserEmail = "/api/users/update/user/phone_or_email"; //put method,
  static String updateUserProfileField = "/api/clients/update/client/profile/:userId"; //put method, userId required
  static String updateOtpVerification = "/api/users/update/user/phone_email/verified"; //put method

}