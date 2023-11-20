class ApiLinks{

  /*static const String BASE_URL = 'http://peaceworc.com/api/agency/';
  static const String PUBLIC_URL = 'http://peaceworc.com/';*/

  //Dev
  static const String BASE_URL = 'http://143.110.244.161/api/agency/';
  static const String PUBLIC_URL = 'http://143.110.244.161/';

  //Live
  /*const val BASE_URL = "http://134.122.119.7/api/agency/";
    const val PUBLIC_URL = "http://134.122.119.7/";*/

  //Node
  static const String NODE_URL = 'http://134.209.119.88';

  //Payment
  static const String PAYMENT_URL = 'https://api.stripe.com/v1/';

  //Api routes
  static const String login = 'login';
  static const String signup = 'signup';
  static const String logout = 'logout';
  static const String getPostJob = 'job/get-job';
  static const String searchClient = 'client/search';
  static const String createClient = 'client/create-profile';
  static const String getClient = 'client/get-profile';
  static const String createJob = 'job/create';
  static const String getUpcomming = 'job/accepted-job/upcoming';
  static const String getOngoingJob = 'job/accepted-job/ongoing';
  static const String updatePayment = 'payment/update-status';
}