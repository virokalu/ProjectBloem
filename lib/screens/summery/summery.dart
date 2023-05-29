import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../config.dart';
import 'barchartmodel.dart';
import 'dart:convert';


class SummeryPage extends StatefulWidget {
  const SummeryPage({super.key});

  @override
  State<SummeryPage> createState() => _SummeryPageState();
}

class _SummeryPageState extends State<SummeryPage> {

  late List<BarChartModel> data = [];
  bool _isLoading = true;
  late SharedPreferences preference;
  late String? loginuser;

  @override
  void initState() {
    super.initState();
    init();
    
  }

  Future init() async{
    preference = await SharedPreferences.getInstance();
    
    loginuser = preference.getString('username');

    //print(loginuser!);

    fetchData();
  }

  Future<void> fetchData() async {

    setState(() {
      _isLoading = true;
    });

    try{

        final response = await http.get(Uri.parse(barchartdata+"/"+loginuser!));
        final List<dynamic> responseData = jsonDecode(response.body);
        data = responseData
            .map((json) => BarChartModel(
                  category: json['category'],
                  itemprice: json['price'],
                  color: charts.ColorUtil.fromDartColor(getColorFromName(json['color'])),
            ))
            .toList();

    }

    catch(e) {

        print(e);
        setState(() {
          _isLoading = true;
        });
    }

    setState(() {
        _isLoading = false;
    });
    //print(data);
  }

  Color getColorFromName(String colorName) {

      switch (colorName) {

          case 'blue':
            return Colors.blue;
          case 'yellow':
            return Colors.yellow;
          case 'red' : 
            return Colors.red;
          case 'pink' : 
            return Colors.pink;
          case 'green' :
            return Colors.green;
          case 'orange' :
            return Colors.orange;
          default:
            return Colors.blueGrey;

    }
  }

  @override
  Widget build(BuildContext context) {

    List<charts.Series<BarChartModel, String>> series = [

        charts.Series(
          id: 'itemprice',
          data: data,
          domainFn: (BarChartModel series, _)=> series.category,
          measureFn: (BarChartModel series, _)=> series.itemprice,
          colorFn: (BarChartModel series, _)=> series.color,
        ),

    ];

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.green,
        leading: IconButton(icon: const Icon(Icons.arrow_back),onPressed: () {Navigator.pop(context);},),
        title: const Text("Sales Summery"),

      ),
      body: _isLoading
      ? const Center(child: CircularProgressIndicator())
      :SafeArea(
        child:ListView(
          children: [
            Column(
              children: [
                    Container(

                      margin: const EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height/2,

                      child: charts.BarChart(
                        animate: true, 
                        series,
                        domainAxis: const charts.OrdinalAxisSpec(
                            renderSpec: charts.SmallTickRendererSpec(
                              labelStyle: charts.TextStyleSpec(
                                fontSize: 12,
                                color: charts.MaterialPalette.black,
                              ),
                            ),
                        ),
                      ),

                    ),
                ],
            ),
            const Column(
              children: [
                
                SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("The Bloem app features a transaction summary graph that displays the sales for each category. The graph provides a visual representation of how much has been sold in each category. This allows you to quickly assess the performance of different product categories and identify trends or areas of focus.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                // const Text('Selling Cost'),
                // Row(
                //   children: [
                //     const Expanded(
                //       child: Text("Total Sales")),
                //       Expanded(child: 
                //         SizedBox(
                //           height: 30,
                //           width: 40,
                //           child: 
                //             TextFormField(
                //               readOnly: true,
                //               initialValue: '',
                //               decoration: InputDecoration(
                //                 contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                //                 border: OutlineInputBorder(
                //                     borderRadius: BorderRadius.circular(20),
                //                 ),
                //               ),
                //             ),
                //         ),
                //       ),
                      
                //   ],
                // ),

                // const SizedBox(height: 20,),

                // Row(
                //   children: [
                //     const Expanded(
                //       child: Text("Boem's fee")),
                //       Expanded(child: 
                //         SizedBox(
                //           height: 30,
                //           width: 40,
                //           child: 
                //             TextFormField(
                //               readOnly: true,
                //               initialValue: '',
                //               decoration: InputDecoration(
                //                 contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                //                 border: OutlineInputBorder(
                //                     borderRadius: BorderRadius.circular(20),
                //                 ),
                //               ),
                //             ),
                //         ),
                //       ),
                      
                //   ],
                // ),

                // const SizedBox(height: 20,),

                // Row(
                //   children: [
                //     const Expanded(
                //       child: Text("Net sales")),
                //       Expanded(child: 
                //         SizedBox(
                //           height: 30,
                //           width: 40,
                //           child: 
                //             TextFormField(
                //               readOnly: true,
                //               initialValue: '',
                //               decoration: InputDecoration(
                //                 contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                //                 border: OutlineInputBorder(
                //                     borderRadius: BorderRadius.circular(20),
                //                 ),
                //               ),
                //             ),
                //         ),
                //       ),
                //       ],
                // ),
                // const SizedBox(height: 20,),
                // const Text("Buyer feedback summery"),

                // Row(
                //   children: [
                //     const Expanded(
                //       child: Text("possitive feedback")),
                //       Expanded(child: 
                //         SizedBox(
                //           height: 30,
                //           width: 40,
                //           child: 
                //             TextFormField(
                //               readOnly: true,
                //               initialValue: '',
                //               decoration: InputDecoration(
                //                 contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                //                 border: OutlineInputBorder(
                //                     borderRadius: BorderRadius.circular(20),
                //                 ),
                //               ),
                //             ),
                //         ),
                //       ),

                //       const SizedBox(width:40.0),

                //       TextButton(
                //           //style: greenButtonStyle,
                //           style: ButtonStyle(
                //             foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                //             backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                //           ),
                //           onPressed: () {},
                //           child: const Text(
                //             "view",
                //             style: TextStyle(color: Colors.white, fontSize: 16.0,
                //               fontFamily: 'Poppins',),
                //           ),
                //       ),    
                //   ],
                // ),

                // const SizedBox(height: 20.0,),

                // Row(
                //   children: [
                //     const Expanded(
                //       child: Text("Negetive feedback")),
                //       Expanded(child: 
                //         SizedBox(
                //           height: 30,
                //           width: 40,
                //           child: 
                //             TextFormField(
                //               readOnly: true,
                //               initialValue: '',
                //               decoration: InputDecoration(
                //                 contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                //                 border: OutlineInputBorder(
                //                     borderRadius: BorderRadius.circular(20),
                //                 ),
                //               ),
                //             ),
                //         ),
                //       ),

                //       const SizedBox(width:40.0),

                //       TextButton(
                //           //style: greenButtonStyle,
                //           style: ButtonStyle(
                //             foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                //             backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                //           ),
                //           onPressed: () {},
                //           child: const Text(
                //             "view",
                //             style: TextStyle(color: Colors.white, fontSize: 16.0,
                //               fontFamily: 'Poppins',),
                //           ),
                //       ),
                //       ],
                // ),
                
              ],
            ),
          ],
        )
        ),
    );
  }
}
