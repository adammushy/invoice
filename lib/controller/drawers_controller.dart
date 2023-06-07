import 'package:invoice/imports.dart';
import 'package:invoice/model/drawers_model.dart';

class DrawersController {
  final drawer = [
    DrawerModel('Home', Icons.home),
    DrawerModel('Invoice', Icons.receipt_long),
    // DrawerModel('Payment', Icons.account_balance),
    DrawerModel('Profile', Icons.person),
    DrawerModel('Contact', Icons.contacts),
    DrawerModel('About', Icons.info),

    // DrawerModel('Settings', Icons.settings),
    // DrawerModel('About', Icons.info),


    // DrawerModel('Share App', Icons.share),
  ];
}
