import 'package:invoice/imports.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

// final pdf = pw.Document();

// pdf.addPage(
//   pw.Page(

// pw.Column(
//   mainAxisAlignment:pw.MainAxisAlignment
//   pw.children
// )

//   )
// )

class PdfFormat extends StatefulWidget {
  const PdfFormat({super.key});

  @override
  State<PdfFormat> createState() => _PdfFormatState();
}

class _PdfFormatState extends State<PdfFormat> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/logo.png"),
            ),
            Container(
              child: Column(
                children: [
                  Text("address1"),
                  Text("address1"),
                  Text("address1"),
                  Text("address1"),
                ],
              ),
            )
          ],
        ),
        Divider(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Description"),
          ],
        ),
      ],
    );
  }
}
