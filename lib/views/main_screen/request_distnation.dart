import 'package:flutter/material.dart';
import 'package:forall_driver/views/captain_view/indriver_wrapper.dart';
import 'package:forall_driver/views/requests/delivering_order/delivering_order_screen.dart';
import 'package:forall_driver/views/requests/requests_landing.dart';

class RequestDistination extends StatelessWidget {
  const RequestDistination({Key? key, required this.type}) : super(key: key);
  final String type;
  @override
  Widget build(BuildContext context) {
    switch (type) {
      case 'outsource_vendor':
        return const DeliveringOrderScreen();
      case 'delivery':
        return const RequestsLanding();
      case 'take_tour':
        return const RequestsLanding();
      default:
        return const InDriverWrapper();
    }
  }
}
