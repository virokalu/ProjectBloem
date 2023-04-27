import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_bloem/components/back_button_icon.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../components/color_components.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
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
            SizedBox(
              height: 10,
            ),
            const Text(
              "We Are Bloem\nAn Ecommerce platform for buying and selling floricultural Items",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Image(image: AssetImage('images/abus.png')),
            SizedBox(
              height: 10,
            ),
            Text(
              "Our story",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: HexColor.fromHex('#4CD964'),
              ),
            ),
            Text(
                "Bloem was founded in 2023 by a group of students who were passionate about the floricultural industry. We saw a need for a user-friendly platform that could connect buyers and sellers, and we decided to build it ourselves."),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(flex: 1, child: Icon(Icons.rocket_launch_rounded)),
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
                      Text(
                          "At Bloem, our mission is to make it easy and affordable for people to buy and sell high-quality floricultural items. We believe in promoting sustainability and supporting local growers"),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
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
                      Text(
                          "Our vision at Bloem is to become the go-to destination for floricultural enthusiasts, where they can easily discover, buy, and sell the highest-quality floral products from around the Sri Lanka. We are committed to fostering a sustainable and ethical marketplace that empowers local growers and connects people through the beauty and joy of flowers."),
                    ],
                  ),
                ),
                Expanded(flex: 1, child: Icon(Icons.remove_red_eye_rounded))
              ],
            ),
            Text(
                "If you have any questions or feedback, please don't hesitate to reach out to us! "),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.call,
                      size: 30,
                    ),
                    onPressed: () => _launchUrl(phno)),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.message),
                  onPressed: () => _launchUrl(msgno),
                ),
                IconButton(
                  icon: Icon(Icons.email),
                  onPressed: () => _launchUrl(mailto),
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.whatsapp),
                  onPressed: () => _launchUrl(whatsapp),
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.facebook),
                  onPressed: () => _launchUrl(fbpg),
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.youtube),
                  onPressed: () => _launchUrl(url),
                ),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.instagram),
                  onPressed: () => _launchUrl(instpg),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
