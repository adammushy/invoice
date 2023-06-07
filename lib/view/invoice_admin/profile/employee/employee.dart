import 'package:invoice/imports.dart';

class Employee extends StatefulWidget {
  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  final employee = EmployeeListController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: TextBuilder(text: 'Employee List', color: Colors.black),
      ),
      body: SafeArea(
        child: invoiceView(),

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          employeeBottomSheet(context);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
   Future createCustomerList(CustomerList customerList) async {
    try {
      final docCustomer =
          FirebaseFirestore.instance.collection('customers').doc();
      // final invoice = Invoice(
      //   // id: docInvoice.id,
      //   // name: name,
      //   // phone: phone,
      //   // gts: gts,
      // );
      // invoice.id = docInvoice.id;
      final json = customerList.toJson();

      await docCustomer.set(json);
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
  Stream<List<CustomerList>> readCustomers() => FirebaseFirestore.instance
      .collection('customers')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => CustomerList.fromJson(doc.data()))
          .toList());

  Widget invoiceView() {
    return StreamBuilder<List<CustomerList>>(
        stream: readCustomers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final customers = snapshot.data!;
            return ListView(children: customers.map(buildInvoice).toList());
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget buildInvoice(CustomerList customerList) {
    return ListTile(

       title: TextBuilder(
                    text: customerList.name,
                    fontSize: 18.0,
                  ),
                  subtitle: TextBuilder(
                    text: 'Phone: ${customerList.phone}',
                    fontSize: 12,
                  ),
                  trailing: CircleAvatar(
                    maxRadius: 40.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/user.jpg'),
                  ),
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
     
      // CircleAvatar(
      //   radius: 20,
      //   backgroundColor: Colors.white,
      //   backgroundImage: AssetImage(''),
      // ),

      onTap: () {},
    );
  }
}

void employeeBottomSheet(BuildContext context) {
  showModalBottomSheet<dynamic>(
    isScrollControlled: true,
    enableDrag: true,
    isDismissible: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
    ),
    context: context,
    builder: (ctx) {
      return Container(
        padding: MediaQuery.of(context).viewInsets,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextBuilder(
                  text: 'Add Employee',
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              const SizedBox(height: 20.0),
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                backgroundImage:
                    AssetImage('assets/images/image-placeholder.png'),
              ),
              const SizedBox(height: 20.0),
              AddInvoiceTextfield(
                label: 'Full Name',
                height: 45,
                prefixIcon: Icon(
                  Icons.person,
                  size: 25,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 15.0),
              AddInvoiceTextfield(
                label: 'Phone Number',
                height: 45,
                prefixIcon: Icon(
                  Icons.phone,
                  size: 25,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30.0),
              MaterialButton(
                textColor: Colors.white,
                height: 45,
                color: Colors.black,
                minWidth: 200,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: TextBuilder(
                  text: 'Add',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class CustomerList {
  final String name;
  final String phone;

  // final double total = price * quantity;

  CustomerList({
    required this.name,
    required this.phone,
  });

  static String randomId({int min = 1000, int max = 99999}) {
    final random = Random();
    final randomNumber = min + random.nextInt(max - min + 1);
    return randomNumber.toString();
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
      };
  static CustomerList fromJson(Map<String, dynamic> json) => CustomerList(
        name: json['name'],
        phone: json['phone'],
      );
}


// child: ListView.builder(
//           shrinkWrap: true,
//           itemCount: employee.list.length,
//           itemBuilder: (BuildContext context, int i) {
//             return Padding(
//               padding: EdgeInsets.all(5.0),
//               child: Container(
//                 decoration: BoxDecoration(color: Colors.white),
//                 child: ListTile(
//                   title: TextBuilder(
//                     text: employee.list[i].title,
//                     fontSize: 18.0,
//                   ),
//                   subtitle: TextBuilder(
//                     text: 'Phone: ${employee.list[i].subTitle}',
//                     fontSize: 12,
//                   ),
//                   trailing: CircleAvatar(
//                     maxRadius: 40.0,
//                     backgroundColor: Colors.white,
//                     backgroundImage: AssetImage(employee.list[i].trailing!),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),