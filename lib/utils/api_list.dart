class ApiList {
   String userLogin = '/api/users/sign_in/sign_up'; //post method
   String userLoginGmail = '/api/users/google'; //get method
   String userOtpVerification = '/api/users/signup/phone_email/verified'; //put method
   String getAllBookingsByUid = "/api/bookings/get/unique/user/booking/:userID"; //get method, userId must be given
   String userReview = "/api/reviews/create/review/:bookingId"; //put method, bookingId must be given
   String userOrderCreate = "/api/payments/ammerpay/create"; //post method
   String getAllServiceData = "/api/services/get/all"; //get method
   String getAllServicesCategories = "/api/services/categories/get/all"; //get method
   String getOneCategoryServices = "/api/services/categories/services/:id"; //get method, catId must be given
   String activeAppBanners = "/api/banners/get/active"; //get method,
   String searchServices = "/api/services/get/all?keyword='keywordText' "; //get method, keywordText is Dynamic came from textField
   String getAllWorkers = "/api/workers/get/all"; //get methodString searchWorkers = "/api/workers/get/all?keyword='keyword text'"; //get method, keywordText is Dynamic came from textField
   String getUserInformation = "/api/clients/get/unique/client/profile/:userId"; //get method, userId required
   String updateUserEmail = "/api/users/update/user/phone_or_email"; //put method,
   String updateUserProfileField = "/api/clients/update/client/profile/:userId"; //put method, userId required
   String updateOtpVerification = "/api/users/update/user/phone_email/verified"; //put method
   String refreshToken = "/api/users/refresh/token"; //post method,'Authorization': refreshToken in header

}