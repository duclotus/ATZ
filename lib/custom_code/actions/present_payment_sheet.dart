// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_stripe/flutter_stripe.dart';

Future<String> presentPaymentSheet(BuildContext context) async {
  // Add your function code here!
  try {
    await Stripe.instance.presentPaymentSheet();
    return 'success';
  } catch (e) {
    // Hoặc bạn có thể sử dụng ScaffoldMessenger để hiển thị thông báo lỗi
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error initializing PaymentSheet: $e')),
    );
    return 'Error initializing PaymentSheet: $e';
  }
}
