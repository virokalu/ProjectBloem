import 'package:flutter/material.dart';
import 'package:project_bloem/components/back_button_icon.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import 'package:lottie/lottie.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({super.key});

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  List reviews = [
    '\"I love how easy it is to find and purchase beautiful flowers on the Bloem app. The interface is so user-friendly!\"',
    '\"The variety of floricultural products on the Bloem app is impressive. I always find exactly what I\'m looking for, whether it\'s a unique bouquet or a specific type of plant.\"',
    '\"Listing and selling my own flower arrangements on the Bloem app has been a breeze. The app provides clear guidelines and helpful features that make the process seamless\"'
  ];
  List name = ['M.Sarah', 'D.N.Jacob', 'L.Emily'];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    //var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(width / 30),
          padding: EdgeInsets.all(width / 30),
          child: ListView(
            children: [
              ButtonText(text: 'App Feedback', icon: Icons.feedback),
              SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: CarouselSlider(
                    items: [
                      for (int i = 0; i < reviews.length; i++)
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 30),
                          child: Column(
                            children: [
                              Text(
                                reviews[i],
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 17),
                              ),
                              Text(
                                name[i],
                                style: TextStyle(
                                    fontSize: 15, color: Colors.purple),
                              ),
                            ],
                          ),
                        )
                    ],
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          print(reason.toString());
                          currentIndex = index;
                        });
                      },
                      autoPlay: true,
                      viewportFraction: 1,
                    ),
                  )),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                for (int i = 0; i < reviews.length; i++)
                  Container(
                    height: 13,
                    width: 13,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: currentIndex == i ? Colors.blue : Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(2, 2))
                        ]),
                  )
              ]),
              SizedBox(
                height: 15,
              ),
              // Lottie.asset(
              //   'animations/cusFB.json',
              //   height: 300,
              //   reverse: true,
              //   repeat: true,
              // ),
              Image.asset(
                "images/feedback.jpg",
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
