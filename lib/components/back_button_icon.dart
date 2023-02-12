import "package:flutter/material.dart";

class button_text extends StatelessWidget {
  var height,width,size;

  final String text;
  final IconData icon;

  button_text({required this.text, required this.icon});


  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Container(
     // height: height/5,
      //color: Color(0xFF4cd964),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back),
                color: Color(0xFF4cd964),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.home),
                color: Color(0xFF4cd964),
              ),
            ],
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon,size: 50,),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          //SizedBox(height: height*75),
          Container(

          ),
        ],
      ),

    );
  }
}