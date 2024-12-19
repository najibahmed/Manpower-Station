class ApiList {
   static const String baseUrl = 'https://manpower-update-deploy.onrender.com';
   static String userLogin = '/api/users/sign_in/sign_up'; //post method
   static String userLoginGmail = '/api/users/google'; //get method
   static String userOtpVerification = '/api/users/signup/phone_email/verified'; //put method
   static String userOrderCreate = "/api/payments/ammerpay/create"; //post method
   static String getAllServiceData = "/api/services/get/all"; //get method
   static String getAllServicesCategories = "/api/services/categories/get/all"; //get method
   static String activeAppBanners = "/api/banners/get/active"; //get method,
   static String getAllWorkers = "/api/workers/get/all"; //get methodString searchWorkers = "/api/workers/get/all?keyword='keyword text'"; //get method, keywordText is Dynamic came from textField
   static String updateUserEmail = "/api/users/update/user/phone_or_email"; //put method,
   static String updateOtpVerification = "/api/users/update/user/phone_email/verified"; //put method
   static String refreshToken = "/api/users/refresh/token"; //post method,'Authorization': refreshToken in header

   // String getAllBookingsByUid = "/api/bookings/get/unique/user/booking/:userID"; //get method, userId must be given
   // String userReview = "/api/reviews/create/review/:bookingId"; //put method, bookingId must be given
   // String getOneCategoryServices = "/api/services/categories/services/:id"; //get method, catId must be given
   // String getUserInformation = "/api/clients/get/unique/client/profile/:userId"; //get method, userId required
   // String updateUserProfileField = "/api/clients/update/client/profile/:userId"; //put method, userId required
   // String searchServices = "/api/services/get/all?keyword='keywordText' "; //get method, keywordText is Dynamic came from textField

   static String getBookingsByUidUrl(String userId) =>
       '$baseUrl/api/bookings/get/unique/user/booking/$userId';

   static String userReviewUrl(String bookingId) =>
       '$baseUrl/api/reviews/create/review/$bookingId';

   static String singleCategoryServiceUrl(String catId) =>
       '$baseUrl/api/services/categories/services/$catId';

   static String userProfileInfoUrl(String userId) =>
       '$baseUrl/api/clients/get/unique/client/profile/$userId';

   static String updateProfileInfoUrl(String userId) =>
       '$baseUrl/api/clients/update/client/profile/$userId';
}