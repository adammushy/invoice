import 'package:invoice/imports.dart';
import 'package:invoice/imports.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class Invoice extends StatefulWidget {
  @override
  _InvoiceState createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  final invoice = InvoiceController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: invoiceView(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => CreateInvoiceTemplate()));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Stream<List<InvoicePaper>> readInvoices() => FirebaseFirestore.instance
      .collection('invoices')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => InvoicePaper.fromJson(doc.data()))
          .toList());

  Widget invoiceView() {
    return StreamBuilder<List<InvoicePaper>>(
        stream: readInvoices(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final invoices = snapshot.data!;
            return ListView(children: invoices.map(buildInvoice).toList());
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget buildInvoice(InvoicePaper invoicePaper) {
    return ListTile(
      // onTap: () {
      //   showDialog(
      //     context: context,
      //     useSafeArea: true,
      //     barrierDismissible: false,
      //     builder: (context) {
      //       return AlertDialog(
      //         actionsPadding: EdgeInsets.zero,
      //         buttonPadding: EdgeInsets.zero,
      //         contentPadding: EdgeInsets.all(8),
      //         title: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             TextBuilder(text: 'Invoice'),
      //             IconButton(
      //                 onPressed: () {
      //                   Navigator.pop(context);
      //                 },
      //                 icon: Icon(Icons.close))
      //           ],
      //         ),
      //         content: InteractiveViewer(
      //           minScale: 0.1,
      //           maxScale: 1.9,
      //           child: Image.asset(
      //             data.invoiceURL!,
      //             height: size.height * 0.5,
      //             width: size.width,
      //           ),
      //         ),
      //       );
      //     },
      //   );
      // },
      title: TextBuilder(
        text: '${invoicePaper.name.toUpperCase()}',
        fontSize: 18.0,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      subtitle: TextBuilder(
        text: 'Tshs. ${invoicePaper.total}',
        fontSize: 10,
      ),
      trailing: TextBuilder(
        fontSize: 8,
        text: '${invoicePaper.id}',
      ),
      // CircleAvatar(
      //   radius: 20,
      //   backgroundColor: Colors.white,
      //   backgroundImage: AssetImage(''),
      // ),

      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Invoice Details'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Receipt No: ${invoicePaper.id}'),
                  SizedBox(height: 10),
                  Text('Customer Name: ${invoicePaper.name}'),
                  SizedBox(height: 10),
                  Text('Phone: ${invoicePaper.phone}'),
                  SizedBox(height: 10),
                  Text('Product Name: ${invoicePaper.productName}'),
                  SizedBox(height: 10),
                  Text('Price: ${invoicePaper.price}'),
                  SizedBox(height: 10),
                  Text('Quantity: ${invoicePaper.quantity}'),
                  SizedBox(height: 10),
                  Text('Total: ${invoicePaper.total}'),
                  SizedBox(height: 10),
                  Text('Created By: ${invoicePaper.admin}'),
                ],
              ),
              actions: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () async {
                            print("I am pressed");
                            // await Text2Pdf.generatePdf();

                            final directory =
                                await getExternalStorageDirectory();
                            final String customPath =
                                '/storage/emulated/0/Documents/my_custom_directory';

                            final Directory customDirectory =
                                Directory(customPath);
                            if (!customDirectory.existsSync()) {
                              // Create the custom directory if it doesn't exist
                              customDirectory.createSync(recursive: true);
                            }

                            final String filePath =
                                '${customDirectory.path}/${invoicePaper.name}${invoicePaper.id}.pdf';

                            final pdf = pw.Document();
                            pdf.addPage(
                              pw.Page(
                                pageFormat: PdfPageFormat.a4,
                                build: (pw.Context context) {
                                  return pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    mainAxisSize: pw.MainAxisSize.min,
                                    children: [
                                      pw.Text('Receipt No: ${invoicePaper.id}'),
                                      pw.SizedBox(height: 10),
                                      pw.Text(
                                          'Customer Name: ${invoicePaper.name}'),
                                      pw.SizedBox(height: 10),
                                      pw.Text('Phone: ${invoicePaper.phone}'),
                                      pw.SizedBox(height: 10),
                                      pw.Text(
                                          'Product Name: ${invoicePaper.productName}'),
                                      pw.SizedBox(height: 10),
                                      pw.Text('Price: ${invoicePaper.price}'),
                                      pw.SizedBox(height: 10),
                                      pw.Text(
                                          'Quantity: ${invoicePaper.quantity}'),
                                      pw.SizedBox(height: 10),
                                      pw.Text('Total: ${invoicePaper.total}'),
                                      pw.SizedBox(height: 10),
                                      pw.Text(
                                          'Created By: ${invoicePaper.admin}'),
                                    ],
                                  );
                                },
                              ),
                            );

                            final file = File(filePath);
                            await file.writeAsBytes(await pdf.save());
                            print(filePath);

                            // final directory =
                            //     await getApplicationDocumentsDirectory();
                            // final filePath =
                            //     '${directory.path}/${invoicePaper.name}${invoicePaper.id}.pdf';

                            // final pdf = pw.Document();

                            // pdf.addPage(pw.Page(
                            //     pageFormat: PdfPageFormat.a4,
                            //     build: (pw.Context context) {
                            //       return pw.Column(
                            //         crossAxisAlignment:
                            //             pw.CrossAxisAlignment.start,
                            //         mainAxisSize: pw.MainAxisSize.min,
                            //         children: [
                            //           pw.Text('Receipt No: ${invoicePaper.id}'),
                            //           pw.SizedBox(height: 10),
                            //           pw.Text(
                            //               'Customer Name: ${invoicePaper.name}'),
                            //           pw.SizedBox(height: 10),
                            //           pw.Text('Phone: ${invoicePaper.phone}'),
                            //           pw.SizedBox(height: 10),
                            //           pw.Text(
                            //               'Product Name: ${invoicePaper.productName}'),
                            //           pw.SizedBox(height: 10),
                            //           pw.Text('Price: ${invoicePaper.price}'),
                            //           pw.SizedBox(height: 10),
                            //           pw.Text(
                            //               'Quantity: ${invoicePaper.quantity}'),
                            //           pw.SizedBox(height: 10),
                            //           pw.Text('Total: ${invoicePaper.total}'),
                            //           pw.SizedBox(height: 10),
                            //           pw.Text(
                            //               'Created By: ${invoicePaper.admin}'),
                            //         ],
                            //       ); // Center
                            //     }));
                            // // final file = File(
                            // //     '${invoicePaper.name}${invoicePaper.id} .pdf');
                            // final file = File(filePath);
                            // await file.writeAsBytes(await pdf.save());
                            // print(filePath); // Page

                            // final pdfFile =
                            //     await PdfInvoiceApi.generate(invoice);
                            // PdfApi.openFile(pdfFile);
                          },
                          icon: Icon(Icons.picture_as_pdf_sharp),
                          color: Colors.blue.shade900),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Close'),
                      ),
                    ])
              ],
            );
          },
        );
      },
    );
  }
}

class PdfInvoicePage extends StatefulWidget {
  const PdfInvoicePage({super.key});

  @override
  State<PdfInvoicePage> createState() => _PdfInvoicePageState();
}

class _PdfInvoicePageState extends State<PdfInvoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}



// ListView.builder(
//           padding: EdgeInsets.symmetric(horizontal: 5),
//           shrinkWrap: true,
//           itemCount: invoice.invoice.length,
//           itemBuilder: (BuildContext context, int i) {
//             return InvoiceCardTile(
//               data: invoice.invoice[i],
//             );
//           },
//         ),