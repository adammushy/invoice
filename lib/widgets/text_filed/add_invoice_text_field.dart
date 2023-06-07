import 'package:invoice/imports.dart';

class AddInvoiceTextfield extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final double? height;
  final Widget? prefixIcon;
  const AddInvoiceTextfield(
      {Key? key,
      this.controller,
      this.label,
      this.height = 40,
      this.prefixIcon})
      : super(key: key);

  @override
  State<AddInvoiceTextfield> createState() => _AddInvoiceTextfieldState();
}

class _AddInvoiceTextfieldState extends State<AddInvoiceTextfield> {
  var productname;

  void updates(value) {
    setState(() {
      productname = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: TextFormField(
        onChanged: (value) {
          print(widget.controller.toString());
        },
        controller: widget.controller,
        style: GoogleFonts.lato(color: Colors.black),
        decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            labelText: widget.label,
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 0.5))),
      ),
    );
  }
}
