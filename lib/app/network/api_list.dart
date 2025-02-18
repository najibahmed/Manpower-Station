class ApiList {
   /// Base Url
   // static const String baseUrl = 'http://172.16.154.2:8000';
   static const String baseUrl = 'https://manpower-update-test.onrender.com';


   static String userLoginUrl = '/api/users/user/sign-in'; //post method
   static String userRegistrationUrl = '/api/users/user/sign-up'; //post method
   static String userLoginGmailUrl = '/api/users/google'; //get method
   static String userOtpVerificationUrl = "/api/users/signup/phone_email/verified"; //put method
   static String userOrderCreateUrl = "/api/payments/ammerpay/create"; //post method
   static String getAllServiceUrl = "/api/services/get/all"; //get method
   static String getAllServicesCategoriesUrl = "/api/services/categories/get/all/parent"; //get method
   static String activeAppBannersUrl = "/api/banners/get/active"; //get method,
   static String getAllWorkersUrl = "/api/workers/get/all"; //get
   static String updateUserEmailUrl = "/api/users/update/user/phone_or_email"; //put method,
   static String updateOtpVerificationUrl = "/api/users/update/user/phone_email/verified"; //put method
   static String refreshTokenUrl = "/api/users/refresh/token"; //post method,'Authorization': refreshToken in header

   // String getAllBookingsByUid = "/api/bookings/get/unique/user/booking/:userID"; //get method, userId must be given
   // String userReview = "/api/reviews/create/review/:bookingId"; //put method, bookingId must be given
   // String getOneCategoryServices = "/api/services/categories/services/:id"; //get method, catId must be given
   // String getUserInformation = "/api/clients/get/unique/client/profile/:userId"; //get method, userId required
   // String updateUserProfileField = "/api/clients/update/client/profile/:userId"; //put method, userId required
   // String searchServices = "/api/services/get/all?keyword='keywordText' "; //get method, keywordText is Dynamic came from textField

   static String getPaymentSuccessUrl(String tranId,String appStatus) => "/api/payments/ammerpay/success/$tranId/$appStatus";
   static String getPaymentFailsUrl(String tranId,String appStatus) => "/api/payments/ammerpay/cancel/$tranId/$appStatus";


   static String getBookingsByUidUrl(String userId) =>
       "/api/bookings/get/unique/user/booking/$userId";

   static String deleteUserBooking(String bookingId) =>
       "/api/bookings/delete/user/personal/booking/$bookingId";

   static String userReviewUrl(String bookingId) =>
       '/api/reviews/create/review/$bookingId';

   static String changeBookingStatus(String bookingId) =>
       '/api/bookings/update/payment_status/$bookingId';

   static String userReportUrl(String userId) =>
       '/api/contracts/client/send/$userId';

   static String singleCategoryServiceUrl(String catId) =>
       '/api/services/categories/services/$catId';

   static String singleWorkerInfoUrl(String workerId) =>
       '/api/workers/get/unique/worker/profile/$workerId';

   static String userProfileInfoUrl(String userId) =>
       '/api/clients/get/unique/client/profile/$userId';

   static String updateProfileInfoUrl(String userId) =>
       '/api/clients/update/client/profile/$userId';
}