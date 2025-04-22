// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_stripe/flutter_stripe.dart';

Future<String> initPaymentSheet(BuildContext context) async {
  try {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        customFlow: false,
        merchantDisplayName: 'Flutter Stripe Store Demo',
        paymentIntentClientSecret:
            'pi_3QuRabP5d9slwmpc0zystZCe_secret_oDk9AkqQJJyWW9XaBRhvzLGIB',
        style: ThemeMode.dark,
      ),
    );
    return 'success';
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error initializing PaymentSheet: $e')),
    );
    return 'Error initializing PaymentSheet: $e';
  }
}
