// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_braintree/flutter_braintree.dart';

Future<String> startPayment(BuildContext context) async {
  // Add your function code here!
  var request = BraintreeDropInRequest(
    tokenizationKey:
        'sandbox_7bdqjtbh_bxmnzkkhnc94649v', // Replace with your tokenization key
    collectDeviceData: true,
    googlePaymentRequest: BraintreeGooglePaymentRequest(
      totalPrice: '4.20',
      currencyCode: 'USD',
      billingAddressRequired: false,
    ),
    paypalRequest: BraintreePayPalRequest(
      amount: '4.20',
      displayName: 'Example company',
    ),
    cardEnabled: true,
  );

  BraintreeDropInResult? result = await BraintreeDropIn.start(request);
  if (result != null) {
    return 'Payment method nonce: ${result.paymentMethodNonce.nonce}';
    // You can also add more logic to handle the nonce, such as sending it to your server
  } else {
    return 'User canceled the payment';
  }
}
