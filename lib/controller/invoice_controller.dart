import 'package:invoice/model/invoice_model.dart';

class InvoiceController {
  final invoice = [
    InvoiceModel(
      userName: 'Winnie Mwash',
      amount: '11',
      invoiceURL: 'assets/images/invoice-template.png',
    ),
    InvoiceModel(
      userName: 'Sanel ',
      amount: '545',
      invoiceURL: 'assets/images/invoice-template.png',
    ),
    InvoiceModel(
      userName: 'Mike Cyril',
      amount: '86',
      invoiceURL: 'assets/images/invoice-template.png',
    )
  ];
}
