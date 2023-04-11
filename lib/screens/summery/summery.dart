import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'barchartmodel.dart';
import 'dart:convert';


class SummeryPage extends StatefulWidget {
  const SummeryPage({super.key});

  @override
  State<SummeryPage> createState() => _SummeryPageState();
}

class _SummeryPageState extends State<SummeryPage> {

  // final List<BarChartModel> data = [
  //   BarChartModel(day: '1', sum: 2, color: charts.ColorUtil.fromDartColor(Colors.blueGrey)),
  //   BarChartModel(day: '2', sum: 20, color: charts.ColorUtil.fromDartColor(Colors.blueGrey)),
  //   BarChartModel(day: '3', sum: 4, color: charts.ColorUtil.fromDartColor(Colors.blueGrey)),
  //   BarChartModel(day: '4', sum: 10, color: charts.ColorUtil.fromDartColor(Colors.blueGrey)),
  //   BarChartModel(day: '5', sum: 21, color: charts.ColorUtil.fromDartColor(Colors.blueGrey)),
  //   BarChartModel(day: '6', sum: 200, color: charts.ColorUtil.fromDartColor(Colors.blueGrey)),
  //   BarChartModel(day: '7', sum: 2, color: charts.ColorUtil.fromDartColor(Colors.blueGrey)),
    
  // ];

  late List<BarChartModel> data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://localhost:3000/barchartdata'));
    final List<dynamic> responseData = jsonDecode(response.body);
    data = responseData
        .map((json) => BarChartModel(
              day: json['day'],
              sum: int.parse(json['sum']),
              color: charts.ColorUtil.fromDartColor(getColorFromName(json['color'])),
            ))
        .toList();
    setState(() {});
    //print(data);
  }

  Color getColorFromName(String colorName) {
    switch (colorName) {
      case 'blueGrey':
        return Colors.blueGrey;
      case 'yellow':
        return Colors.yellow;
      // add more cases for other colors if needed
      default:
        return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {

    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: 'sum',
        data: data,
        domainFn: (BarChartModel series, _)=> series.day,
        measureFn: (BarChartModel series, _)=> series.sum,
        colorFn: (BarChartModel series, _)=> series.color,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            //back button with text,
            Text("Sales in a Last Week",style: TextStyle(
              backgroundColor: Colors.greenAccent[700],
              fontSize: 17.00,
              letterSpacing: 5.00,
            ),),
            Container(
              margin: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height/2,
              //color: Colors.red,
              child: charts.BarChart(animate: true, series,),
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text("Today")),
                      Expanded(child: 
                        SizedBox(
                          height: 30,
                          width: 40,
                          child: 
                            TextFormField(
                              readOnly: true,
                              initialValue: '',
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                        ),
                      ),
                      
                  ],
                ),

                const SizedBox(height: 20,),

                Row(
                  children: [
                    const Expanded(
                      child: Text("Last 7 days")),
                      Expanded(child: 
                        SizedBox(
                          height: 30,
                          width: 40,
                          child: 
                            TextFormField(
                              readOnly: true,
                              initialValue: '',
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                        ),
                      ),
                      
                  ],
                ),

                const SizedBox(height: 20,),

                Row(
                  children: [
                    const Expanded(
                      child: Text("Last 14 days")),
                      Expanded(child: 
                        SizedBox(
                          height: 30,
                          width: 40,
                          child: 
                            TextFormField(
                              readOnly: true,
                              initialValue: '',
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                        ),
                      ),
                      
                  ],
                ),

                const SizedBox(height: 20,),

                Row(
                  children: [
                    const Expanded(
                      child: Text("Last 30 days")),
                      Expanded(child: 
                        SizedBox(
                          height: 30,
                          width: 40,
                          child: 
                            TextFormField(
                              readOnly: true,
                              initialValue: '',
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                        ),
                      ),
                      
                  ],
                ),
                const SizedBox(height: 20,),
                const Text('Selling Cost'),

                Row(
                  children: [
                    const Expanded(
                      child: Text("Total Sales")),
                      Expanded(child: 
                        SizedBox(
                          height: 30,
                          width: 40,
                          child: 
                            TextFormField(
                              readOnly: true,
                              initialValue: '',
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                        ),
                      ),
                      
                  ],
                ),

                const SizedBox(height: 20,),

                Row(
                  children: [
                    const Expanded(
                      child: Text("Boem's fee")),
                      Expanded(child: 
                        SizedBox(
                          height: 30,
                          width: 40,
                          child: 
                            TextFormField(
                              readOnly: true,
                              initialValue: '',
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                        ),
                      ),
                      
                  ],
                ),

                const SizedBox(height: 20,),

                Row(
                  children: [
                    const Expanded(
                      child: Text("Net sales")),
                      Expanded(child: 
                        SizedBox(
                          height: 30,
                          width: 40,
                          child: 
                            TextFormField(
                              readOnly: true,
                              initialValue: '',
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                        ),
                      ),
                      ],
                ),
                const SizedBox(height: 20,),
                const Text("Buyer feedback summery"),

                Row(
                  children: [
                    const Expanded(
                      child: Text("possitive feedback")),
                      Expanded(child: 
                        SizedBox(
                          height: 30,
                          width: 40,
                          child: 
                            TextFormField(
                              readOnly: true,
                              initialValue: '',
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                        ),
                      ),

                      const SizedBox(width:40.0),

                      TextButton(
                          //style: greenButtonStyle,
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "view",
                            style: TextStyle(color: Colors.white, fontSize: 16.0,
                              fontFamily: 'Poppins',),
                          ),
                      ),    
                  ],
                ),

                const SizedBox(height: 20.0,),

                Row(
                  children: [
                    const Expanded(
                      child: Text("Negetive feedback")),
                      Expanded(child: 
                        SizedBox(
                          height: 30,
                          width: 40,
                          child: 
                            TextFormField(
                              readOnly: true,
                              initialValue: '',
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                        ),
                      ),

                      const SizedBox(width:40.0),

                      TextButton(
                          //style: greenButtonStyle,
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "view",
                            style: TextStyle(color: Colors.white, fontSize: 16.0,
                              fontFamily: 'Poppins',),
                          ),
                      ),
                      ],
                ),
                
              ],
            ),
          ],
        )
        ),
    );
  }
}
