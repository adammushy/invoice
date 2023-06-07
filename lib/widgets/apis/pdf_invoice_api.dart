// // import 'dart:html';

// // import 'dart:js';

// // import 'package:flutter/widgets.dart' as Widget;
// import 'dart:io';

// import 'package:invoice/widgets/apis/pdf_api.dart';
// import 'package:pdf/src/widgets';

// // import 'package:invoice/imports.dart';
// import 'package:flutter/src/widgets/framework.dart' hide Widget;
// import 'package:flutter/material.dart' hide Widget;
// import 'package:pdf/widgets.dart' hide Widget;

// import '../../view/invoice_admin/create_invoice/create_invoice.dart';

// class PdfInvoiceApi {
//   static Future<File> generate(InvoicePaper invoicePaper) async {
//     final pdf = Document();
//     pdf.addPage(MultiPage(
//         build: (context) => [
//               buildTitle(invoicePaper),
//             ]));

//     return PdfApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);
//   }

//   static Widget buildTitle(InvoicePaper invoicePaper) => Column(
//     crossAxisAlignment:CrossAxisAlignment.start,
//   );
// }
