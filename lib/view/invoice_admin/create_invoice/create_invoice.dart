import 'package:invoice/imports.dart';

class CreateInvoiceTemplate extends StatefulWidget {
  const CreateInvoiceTemplate({Key? key}) : super(key: key);

  @override
  State<CreateInvoiceTemplate> createState() => _CreateInvoiceTemplateState();
}

class _CreateInvoiceTemplateState extends State<CreateInvoiceTemplate> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController customerController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController productNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: TextBuilder(
          text: 'Create Invoice',
          color: Colors.black,
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: TextBuilder(
                // text: '001',
                text: InvoicePaper.randomId(),
                fontSize: 15.0,
                color: Colors.black38,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Form(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15),
            children: [
              TextBuilder(text: '# Customer Details', fontSize: 18.0),
              const SizedBox(height: 20.0),
              AddInvoiceTextfield(
                label: 'Phone Number',
                controller: phoneController,
                height: 45,
                prefixIcon: Icon(
                  Icons.phone,
                  size: 25,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 15.0),
              AddInvoiceTextfield(
                label: 'Customer Name',
                controller: customerController,
                height: 45,
                prefixIcon: Icon(
                  Icons.person,
                  size: 25,
                  color: Colors.black,
                ),

              ),
               const SizedBox(height: 15.0),
              AddInvoiceTextfield(
                label: 'Product Name',
                controller: productNameController,
                height: 45,
                prefixIcon: Icon(
                  Icons.numbers,
                  size: 25,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 15.0),
              AddInvoiceTextfield(
                label: 'price',
                controller: priceController,
                height: 45,
                prefixIcon: Icon(
                  Icons.numbers,
                  size: 25,
                  color: Colors.black,
                ),
              ),
             
              const SizedBox(height: 15.0),
              AddInvoiceTextfield(
                label: 'quantity',
                controller: quantityController,
                height: 45,
                prefixIcon: Icon(
                  Icons.numbers,
                  size: 25,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20.0),
              // TextBuilder(text: 'Product Details', fontSize: 20.0),
              // const SizedBox(height: 5.0),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Expanded(
              //       child: TextBuilder(
              //         text: 'Product Name',
              //         fontSize: 12.0,
              //       ),
              //     ),
              //     const SizedBox(width: 30.0),
              //     Expanded(
              //       child: TextBuilder(
              //         text: 'Computer Parts',
              //         fontSize: 12.0,
              //         textAlign: TextAlign.end,
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 5.0),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Expanded(
              //       child: TextBuilder(
              //         text: 'Product Price',
              //         fontSize: 12.0,
              //       ),
              //     ),
              //     const SizedBox(width: 30.0),
              //     Expanded(
              //       child: TextBuilder(
              //         text: '20 X 30',
              //         fontSize: 12.0,
              //         textAlign: TextAlign.end,
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 5.0),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Expanded(
              //       child: TextBuilder(
              //         text: 'Product Quantity',
              //         fontSize: 12.0,
              //       ),
              //     ),
              //     const SizedBox(width: 30.0),
              //     Expanded(
              //       child: TextBuilder(
              //         text: phoneController.text,
              //         fontSize: 12.0,
              //         textAlign: TextAlign.end,
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 20.0),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     TextBuilder(text: 'Total', fontSize: 20.0),
              //     TextBuilder(text: InvoicePaper.to , fontSize: 20.0),
              //   ],
              // ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // FabCTA(
                  //   title: 'Add Items',
                  //   icon: Icons.add,
                  //   onTap: () {},
                  // ),
                  FabCTA(
                    title: 'Preview',
                    icon: Icons.visibility,
                    onTap: () {},
                  ),
                  FabCTA(
                    title: 'Create Invoice',
                    icon: Icons.add,
                    // onTap: () {
                    //   // final invoicePaper = InvoicePaper(
                    //   //     name: customerController.text,
                    //   //     phone: phoneController.text,
                    //   //     // price: priceController.text,
                    //   //     price: double.parse(priceController.text),
                    //   //     // quantity: quantityController.text
                    //   //     quantity: int.parse(quantityController.text),
                    //   //     total: priceController  quantityController);

                    //   // createInvoicePaper();
                    //   final String id = InvoicePaper.randomId();
                    //   final String name = customerController.text;
                    //   final String phone = phoneController.text;
                    //   final double price = double.parse(priceController.text);
                    //   final int quantity = int.parse(quantityController.text);
                    //   final double total =
                    //       price * quantity; // Calculate the total
                    //   final invoicePaper = InvoicePaper(

                    //     id: id,
                    //     name: name,
                    //     phone: phone,
                    //     price: price,
                    //     quantity: quantity,
                    //     total: total,
                    //   );
                    //   createInvoicePaper(invoicePaper);
                    //   Navigator.pop(context);
                    // },
                    onTap: () async {
                      // Get the current user
                      User? user = FirebaseAuth.instance.currentUser;

                      if (user != null) {
                        // Retrieve the user's display name
                        String? email = user.email;

                        if (email != null) {
                          final String id = InvoicePaper.randomId();
                          final String name = customerController.text;
                          final String phone = phoneController.text;
                          final String productName = productNameController.text;
                          final double price =
                              double.parse(priceController.text);
                          final int quantity =
                              int.parse(quantityController.text);
                          final double total = price * quantity;

                          final invoicePaper = InvoicePaper(
                            id: id,
                            name: name,
                            phone: phone,
                            productName: productName,
                            price: price,
                            quantity: quantity,
                            total: total,
                            // productName: 'Computer Parts',
                            admin:
                                email, // Set the current user's name as createdBy
                          );

                          createInvoicePaper(invoicePaper);
      //                     return showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title: Text("Sign In Error"),
      //       // content: Text("No network connection! please allow internet means"),
      //       content: Text(e.toString()),
      //       actions: [
      //         MaterialButton(
      //           child: Text("OK"),
      //           onPressed: () {
      //             Navigator.of(context).pop();
      //           },
      //         ),
      //       ],
      //     );
      //   },
      // );
                          Navigator.pop(context);
                        }
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future createInvoicePaper(InvoicePaper invoicePaper) async {
    try {
      final docInvoice =
          FirebaseFirestore.instance.collection('invoices').doc();
      // final invoice = Invoice(
      //   // id: docInvoice.id,
      //   // name: name,
      //   // phone: phone,
      //   // gts: gts,
      // );
      // invoice.id = docInvoice.id;
      final json = invoicePaper.toJson();

      await docInvoice.set(json);
    } catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Sign In Error"),
            // content: Text("No network connection! please allow internet means"),
            content: Text(e.toString()),
            actions: [
              MaterialButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
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
        text: '${invoicePaper.name}',
        fontSize: 18.0,
        color: Colors.black,
      ),
      subtitle: TextBuilder(
        text: ' ${invoicePaper.phone}',
        fontSize: 12,
      ),
      trailing: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(''),
      ),
    );
  }
}

class InvoicePaper {
  final String id;

  final String name;
  final String phone;
  final String productName;
  final double price;
  final int quantity;
  final double total;

  final String admin;

  // final double total = price * quantity;

  InvoicePaper(
      {required this.id,
      required this.name,
      required this.phone,
      required this.productName,
      required this.price,
      required this.quantity,
      required this.total,
      required this.admin});

  static String randomId({int min = 1000, int max = 99999}) {
    final random = Random();
    final randomNumber = min + random.nextInt(max - min + 1);
    return randomNumber.toString();
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
        'productName': productName,
        'price': price,
        'quantity': quantity,
        'total': total,
        'admin': admin
      };
  static InvoicePaper fromJson(Map<String, dynamic> json) => InvoicePaper(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      productName: json['productName'],
      price: json['price'],
      quantity: json['quantity'],
      total: json['total'],
      admin: json['admin']);
}
