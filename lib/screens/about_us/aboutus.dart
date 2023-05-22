import 'package:flutter/material.dart';
import 'package:project_bloem/components/back_button_icon.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../components/color_components.dart';
import '../../components/size.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  final Uri url =
      Uri.parse("https://www.youtube.com/watch?v=zTTP8XBR6fI&t=33s");
  final Uri phno = Uri.parse("tel:+94764353978");
  final Uri msgno = Uri.parse("sms:+94764353978");
  final Uri fbpg =
      Uri.parse("https://www.facebook.com/manoj.lvijethunga?mibextid=ZbWKwL");
  final Uri instpg =
      Uri.parse("https://instagram.com/manoj_lakshan99?igshid=YmMyMTA2M2Y=");
  final Uri mailto = Uri.parse(
      "mailto:sherinfernando02@gmail.com?subject=This is Subject Title&body=This is Body of Email");
  final Uri whatsapp =
      Uri.parse("whatsapp://send?phone=+94764353978&text=hello");

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(width / 30),
        child: ListView(
          children: [
            const ButtonText(text: "About Us", icon: Icons.people_alt_rounded),
            SizedBox(height: getProportionateScreenWidth(20)),
            const Text(
              "We Are Bloem\nAn Ecommerce platform for buying and selling floricultural Items",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(20)),

            //Image.asset("images/im1.jpg", fit: BoxFit.cover),
            const Image(image: AssetImage('images/im1.jpg')),
            SizedBox(height: getProportionateScreenWidth(20)),

            Text(
              "Our story",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: HexColor.fromHex('#4CD964'),
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(10)),

            const Text(
              "Bloem was founded in 2023 by a group of students who were passionate about the floricultural industry. We saw a need for a user-friendly platform that could connect buyers and sellers, and we decided to build it ourselves.",
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: getProportionateScreenWidth(20)),

            ClipPath(
              clipper: OvalLeftBorderClipper(),
              child: Container(
                height: 25,
                width: 25,
                color: HexColor.fromHex('#4CD964'),
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(20)),

            Row(
              children: [
                const Expanded(flex: 1, child: Icon(Icons.rocket_launch_rounded)),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Our Mission",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: HexColor.fromHex('#4CD964'),
                        ),
                      ),
                      SizedBox(height: getProportionateScreenWidth(10)),

                      const Text(
                        "At Bloem, our mission is to make it easy and affordable for people to buy and sell high-quality floricultural items. We believe in promoting sustainability and supporting local growers",
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenWidth(20)),

            ClipPath(
              clipper: OvalRightBorderClipper(),
              child: Container(
                height: 25,
                width: 25,
                color: HexColor.fromHex('#4CD964'),
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(20)),

            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Our Vision",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: HexColor.fromHex('#4CD964'),
                        ),
                      ),
                      SizedBox(height: getProportionateScreenWidth(10)),

                      const Text(
                        "Our vision at Bloem is to become the go-to destination for floricultural enthusiasts, where they can easily discover, buy, and sell the highest-quality floral products from around the Sri Lanka. We are committed to fostering a sustainable and ethical marketplace that empowers local growers and connects people through the beauty and joy of flowers.",
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                const Expanded(flex: 1, child: Icon(Icons.remove_red_eye_rounded))
              ],
            ),
            SizedBox(height: getProportionateScreenWidth(20)),

            DottedLine(
              direction: Axis.horizontal,
              lineLength: double.infinity,
              lineThickness: 5.0,
              dashLength: 4.0,
              dashGradient: const [Colors.green, Colors.black],
              dashRadius: 10.0,
            ),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            const Text("If you have any questions or feedback, please don't hesitate to reach out to us! "),
            SizedBox(height: getProportionateScreenWidth(20)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 9, 88, 12),
                    ),
                    child: IconButton(
                        icon: const Icon(
                          Icons.call,
                          //size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () => _launchUrl(phno)),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.lightBlue),
                    child: IconButton(
                      icon: const FaIcon(FontAwesomeIcons.message),
                      color: Colors.white,
                      onPressed: () => _launchUrl(msgno),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.email),
                      color: Colors.white,
                      onPressed: () => _launchUrl(mailto),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.lightGreen,
                    ),
                    child: IconButton(
                      icon: const FaIcon(FontAwesomeIcons.whatsapp),
                      color: Colors.white,
                      onPressed: () => _launchUrl(whatsapp),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: IconButton(
                      icon: const FaIcon(FontAwesomeIcons.facebook),
                      color: Colors.white,
                      onPressed: () => _launchUrl(fbpg),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.redAccent,
                    ),
                    child: IconButton(
                      icon: const FaIcon(FontAwesomeIcons.youtube),
                      color: Colors.white,
                      onPressed: () => _launchUrl(url),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 246, 43, 192),
                    ),
                    child: IconButton(
                      icon: const FaIcon(FontAwesomeIcons.instagram),
                      color: Colors.white,
                      onPressed: () => _launchUrl(instpg),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
