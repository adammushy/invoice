// import 'package:flutter/material.dart';
import 'package:invoice/imports.dart';

class ContactScreen extends StatefulWidget {
  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text('Contact Us'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CustomListTile2(
                  "Email", Icons.mail, Icons.keyboard_arrow_right_outlined,
                  onTap: () {
                launch('mailto:adamprosper99@gmail.com');
              }),
              CustomListTile2("0719401594", Icons.phone,
                  Icons.keyboard_arrow_right_outlined, onTap: () {
                launch('tel:0719401594');
              }),

              CustomListTile2(
                "Facebook",
                Icons.facebook,
                Icons.keyboard_arrow_right_outlined,
                onTap: () {
                  launch('https://www.facebook.com');
                },
              ),
              CustomListTile2(
                "Twitter",
                FontAwesomeIcons.twitter,
                Icons.keyboard_arrow_right_outlined,
                onTap: () {
                  launch('https://www.twitter.com');
                },
              ),
              CustomListTile2(
                "Instagram",
                FontAwesomeIcons.instagram,
                Icons.keyboard_arrow_right_outlined,
                onTap: () {
                  launch('https://www.instagram.com');
                },
              ),
              // SwitchListTile(
              //   value: _darkMode,
              //   title: Text(
              //     ' Night Mode',
              //     style: TextStyle(
              //       fontSize: 16,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              //   secondary: Padding(
              //     padding: const EdgeInsets.all(9.0),
              //     child: Icon(Icons.dark_mode),
              //   ),
              //   onChanged: (newValue) {
              //     setState(() {
              //       _darkMode = newValue;
              //     });
              //   },
              //   // visualDensity: VisualDensity.adaptivePlatformDensity,
              //   // switchType: SwitchType.material,
              //   activeColor: Colors.indigo,
              // ),

              // Padding(
              //   padding: EdgeInsets.only(left: 20, top: 15, bottom: 14),
              //   child: Text(
              //     "Support",
              //     style:
              //         TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //   ),
              // ),
              // CustomListTile(
              //   "Help",
              //   Icons.space_bar_rounded,
              //   Icons.keyboard_arrow_right_outlined,
              // ),
              // CustomListTile(
              //   "About us",
              //   Icons.person_outline,
              //   Icons.keyboard_arrow_right_outlined,
              // ),
              // CustomListTile(
              //   "Contact us",
              //   Icons.message,
              //   Icons.keyboard_arrow_right_outlined,
              // ),
              const SizedBox(height: 20),

              // SizedBox(height: 30.0),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     ElevatedButton(
              //       onPressed: () {},
              //       child: Text(
              //         "Follow",
              //         style: TextStyle(fontSize: 18.0),
              //       ),
              //       style: ElevatedButton.styleFrom(
              //         fixedSize: Size(140.0, 55.0),
              //         primary: Colors.green,
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(15.0),
              //         ),
              //       ),
              //     ),
              //     SizedBox(width: 15.0),
              //     OutlinedButton(
              //       onPressed: () {},
              //       child: Icon(Icons.mail_outline_outlined),
              //       style: OutlinedButton.styleFrom(
              //           primary: Colors.black,
              //           backgroundColor: Colors.black12,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(50.0),
              //           ),
              //           fixedSize: Size(50.0, 60.0)),
              //     )
              //   ],
              // ),
              // SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListTile2 extends StatelessWidget {
  String title;
  IconData icon;
  IconData traling;
  Function()? onTap;

  CustomListTile2(
    this.title,
    this.icon,
    this.traling, {
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ListTile(
        tileColor: Colors.grey.shade50,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: (Icon(
            icon,
            size: 25,
          )),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(
          traling,
          size: 22,
        ),
        onTap: onTap,
      ),
    );
  }
}





// import 'package:ionicons/ionicons.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';
// import 'package:maps_launcher/maps_launcher.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter_icons/flutter_icons.dart';

// class ContactUsPage extends StatelessWidget {
//   // Contact options
//   final List<ContactOption> contactOptions = [
//     ContactOption(
//       label: 'Phone',
//       value: '+255719401594',
//       icon: Icons.phone,
//       launchMethod: launchPhone,
//     ),
//     ContactOption(
//       label: 'Email',
//       value: 'georgemushi2000@gmail.com',
//       icon: Icons.email,
//       launchMethod: launchEmail,
//     ),
//     ContactOption(
//       label: 'Website',
//       value: 'https://www.google.com',
//       icon: Icons.web,
//       launchMethod: launchURL,
//     ),
//     ContactOption(
//       label: 'Location',
//       value: 'Dar es salaam, Tanzania',
//       icon: Icons.location_on,
//       launchMethod: launchMaps,
//     ),
//     ContactOption(
//       label: 'Instagram',
//       value: 'instagram_username',
//       icon: Ionicons.logo_instagram,
//       launchMethod: launchInstagram,
//     ),
//     ContactOption(
//       label: 'Twitter',
//       value: 'mastra2000',
//       icon:Ionicons.logo_twitter,
//       launchMethod: launchTwitter,
//     ),
//     ContactOption(
//       label: 'Telegram',
//       value: 'adammushy',
//       icon: Ionicons.send,
//       launchMethod: launchTelegram,
//     ),
//   ];

//   // Method to launch phone dialer
//   static Future<void> launchPhone(String phoneNumber) async {
//     final url = 'tel:$phoneNumber';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   // Method to launch email client
//   static Future<void> launchEmail(String emailAddress) async {
//     final Email email = Email(
//       recipients: [emailAddress],
//     );
//     await FlutterEmailSender.send(email);
//   }

//   // Method to launch URL in browser
//   static Future<void> launchURL(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   // Method to launch maps app
//   static Future<void> launchMaps(String address) async {
//     MapsLauncher.launchQuery(address);
//   }

//   static launchInstagram(String username) async {
//     final url = 'https://www.instagram.com/$username';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   static launchTwitter(String username) async {
//     final url = 'https://twitter.com/$username';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   static launchTelegram(String username) async {
//     final url = 'https://t.me/$username';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Contact Us'),
//       ),
//       body: ListView.builder(
//         itemCount: contactOptions.length,
//         itemBuilder: (context, index) {
//           final contactOption = contactOptions[index];
//           return ListTile(
//             leading: Icon(contactOption.icon),
//             title: Text(contactOption.label),
//             subtitle: Text(contactOption.value),
//             onTap: () {
//               contactOption.launchMethod(contactOption.value);
//             },
//           );
//         },
        
//       ),
//     );
//   }
// }

// class ContactOption {
//   final String label;
//   final String value;
//   final IconData icon;
//   final Function(String) launchMethod;

//   ContactOption({
//     required this.label,
//     required this.value,
//     required this.icon,
//     required this.launchMethod,
// });
// }