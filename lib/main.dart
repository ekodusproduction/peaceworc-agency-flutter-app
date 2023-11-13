import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:peaceworc_agency/bloc/job_bloc.dart';
import 'package:peaceworc_agency/ui/SplashScreen.dart';
import 'package:peaceworc_agency/ui/payment_details_screen/payment_details_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Assign publishable key to flutter_stripe
  Stripe.publishableKey = "pk_test_51MQJHfL8ZKWD5NB0rS94Ml3S51XA88c2Aw9GSkFmayOQM3P4ycRFE1NTKwZrhjNi9qodQCoPGe1UwQ1TpnzidFUz009qJ6u5Fj";
  Stripe.merchantIdentifier = 'any string works';
  await Stripe.instance.applySettings();
//Load our .env file that contains our Stripe Secret key
  //await dotenv.load(fileName: ".env");
  runApp(
      
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => JobBloc())
      ],
      child: MaterialApp(
        title: 'Peaceworc Agency',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
          debugShowCheckedModeBanner: false,
          home: PaymentDetailsScreen()
      ),
    );
  }
}
