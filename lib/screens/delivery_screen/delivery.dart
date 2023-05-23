// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../../components/back_button_icon.dart';
//import '../../components/size.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  List<bool> expanded = [false, false, false, false, false];
  final Uri pronto = Uri.parse('https://www.prontolanka.lk/');
  final Uri domex = Uri.parse('https://www.domex.lk/');
  final Uri certis = Uri.parse('https://www.certislankacourier.com/');
  final Uri fedex = Uri.parse('https://www.fedex.com/en-lk/home.html');
  final Uri parcel = Uri.parse('https://parcel.lk/');

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    //var height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      body: Container(
        margin: EdgeInsets.all(width / 30),
        //padding: const EdgeInsets.fromLTRB(10, 30, 0, 10),

        child: ListView(
          children: [
            const ButtonText(text: "Delivery", icon: Icons.delivery_dining),
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              "images/delivery.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.red,
                    width: 3,
                  )),
              child:
                  const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Icon(
                  Icons.warning,
                  color: Colors.red,
                  size: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    "Please note that the delivery companies introduced on this platform are solely for informational purposes. We do not take any responsibility for the delivery services.  Use of these delivery services is at your own risk ",
                    textAlign: TextAlign.justify,
                  ),
                )
              ]),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              child: ExpansionPanelList(
                expansionCallback: (panelIndex, isExpanded) {
                  setState(() {
                    expanded[panelIndex] = !isExpanded;
                  });
                },
                children: [
                  //pronto
                  ExpansionPanel(
                    headerBuilder: (context, isOpen) {
                      return const Padding(
                          padding: EdgeInsets.all(5),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage('images/prontoN.jpg'),
                            ),
                            title: Text(
                              'Pronto',
                              style: TextStyle(fontSize: 20),
                            ),
                          ));
                    },
                    body: Container(
                        padding: const EdgeInsets.all(2),
                        child: Column(
                          children: [
                            const Text(
                                "Pronto Lanka is the largest and most experienced Domestic Courier Service Company in the Island"),
                            const SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              child: const Text(
                                "visit prontolanka.lk",
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              onTap: () => _launchUrl(pronto),
                            ),
                          ],
                        )),
                    isExpanded: expanded[0],
                    canTapOnHeader: true,
                  ),

                  //domex
                  ExpansionPanel(
                    headerBuilder: (context, isOpen) {
                      return const Padding(
                          padding: EdgeInsets.all(5),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage('images/domex.png'),
                            ),
                            title: Text(
                              'Domex',
                              style: TextStyle(fontSize: 20),
                            ),
                          ));
                    },
                    body: Container(
                        padding: const EdgeInsets.all(2),
                        child: Column(
                          children: [
                            const Text(
                                "Domex provides express courier services in Sri Lanka. Largest Courier Delivery Service in Sri Lanka"),
                            const SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              child: const Text(
                                "Visit domex.lk",
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              onTap: () => _launchUrl(domex),
                            ),
                          ],
                        )),
                    isExpanded: expanded[1],
                    canTapOnHeader: true,
                  ),
                  //certis
                  ExpansionPanel(
                    headerBuilder: (context, isOpen) {
                      return const Padding(
                          padding: EdgeInsets.all(5),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage('images/certis.jpg'),
                            ),
                            title: Text(
                              'Certis',
                              style: TextStyle(fontSize: 20),
                            ),
                          ));
                    },
                    body: Container(
                        padding: const EdgeInsets.all(2),
                        child: Column(
                          children: [
                            const Text(
                                "Safe, Reliable and Express Courier & Transport Solutions that Saves Your Time"),
                            const SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              child: const Text(
                                "visit certislanka.com",
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              onTap: () => _launchUrl(certis),
                            ),
                          ],
                        )),
                    isExpanded: expanded[2],
                    canTapOnHeader: true,
                  ),
                  //fedex
                  ExpansionPanel(
                    headerBuilder: (context, isOpen) {
                      return const Padding(
                          padding: EdgeInsets.all(5),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage('images/fedex.jpg'),
                            ),
                            title: Text(
                              'FedEx',
                              style: TextStyle(fontSize: 20),
                            ),
                          ));
                    },
                    body: Container(
                        padding: const EdgeInsets.all(2),
                        child: Column(
                          children: [
                            const Text(
                                "Choose a shipping service that suit your needs with FedEx"),
                            const SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              child: const Text(
                                "visit fedex.com",
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              onTap: () => _launchUrl(fedex),
                            ),
                          ],
                        )),
                    isExpanded: expanded[3],
                    canTapOnHeader: true,
                  ),
                  //parcel.lk
                  ExpansionPanel(
                    headerBuilder: (context, isOpen) {
                      return const Padding(
                          padding: EdgeInsets.all(5),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage('images/parcel.png'),
                            ),
                            title: Text(
                              'Parcel.lk',
                              style: TextStyle(fontSize: 20),
                            ),
                          ));
                    },
                    body: Container(
                        padding: const EdgeInsets.all(2),
                        child: Column(
                          children: [
                            const Text(
                                "Parcel.LK Express is a quick and easy option if you are in a rush and do not have enough time to wait for longer transit times"),
                            const SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              child: const Text(
                                "visit parcel.lk",
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              onTap: () => _launchUrl(parcel),
                            ),
                          ],
                        )),
                    isExpanded: expanded[4],
                    canTapOnHeader: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
