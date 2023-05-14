import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class final_result extends StatefulWidget {
   final_result({Key? key,required this.corrct_answer,required this.wrong_answer,required this.not_attempted}) : super(key: key);
  
  final int corrct_answer;
  final int wrong_answer;
  final int not_attempted;

  @override
  State<final_result> createState() => _final_resultState();
}

class _final_resultState extends State<final_result> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        appBar: AppBar(
          title: Text("your score"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: Column(
          children: [
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: LineChart(
                  LineChartData(
                      minX: 0,
                      maxX: 11,
                      minY: 0,
                      maxY: 6,
                      titlesData: Linetitles.gettitledata(),
                      gridData: FlGridData(
                          getDrawingVerticalLine: (values){
                            return FlLine(
                                color: Colors.black,
                                strokeWidth: 1
                            );
                          }
                      ),
                      lineBarsData: [
                        LineChartBarData(
                            color: Colors.yellowAccent,
                            isCurved: true,
                            barWidth: 8,
                            belowBarData: BarAreaData(
                                show: true,
                                color: Colors.yellow.withOpacity(0.5)
                            ),
                            spots: [
                              FlSpot(2, widget.corrct_answer.toDouble()),
                              FlSpot(5, widget.wrong_answer.toDouble()),
                              FlSpot(8, widget.not_attempted.toDouble()),
                              // FlSpot(2.6, 2),
                              // FlSpot(4.9, 5),
                              // FlSpot(6.8, 2.5),
                              // FlSpot(8, 4),
                              // FlSpot(9.5, 3),

                            ]
                        )
                      ]
                  )
              ) ,
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text.rich(
                        TextSpan(
                          children:[
                            TextSpan(text: "correct : ",style: TextStyle(color: Colors.white)),
                            TextSpan(text: widget.corrct_answer.toString(),style: TextStyle(color: Colors.yellow)),
                          ]
                        )
                      ),
                      SizedBox(
                        width: 26,
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: "wrong : ",style :TextStyle(color: Colors.white)),
                              TextSpan(text: widget.wrong_answer.toString(),style: TextStyle(color: Colors.yellow))
                            ]
                          )),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        color: Colors.white.withOpacity(0.4),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text.rich(TextSpan(
                        children: [
                          TextSpan(
                            text: "Not-Attempted : ",style: TextStyle(color: Colors.white)
                          ),
                          TextSpan(text: widget.not_attempted.toString(),style: TextStyle(color: Colors.yellow))
                        ]
                      ))
                    ],
                  ),
                )
              ],
            )
          ],
        )

       )
      );
  }
}

class Linetitles{
  static gettitledata() {
    return FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
            sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value,TitleMeta meta) {
                  Widget text = Text('');
                  const style = TextStyle(
                      color: Colors.grey
                  );
                  switch (value.toInt()){
                    case 2 :
                      text = const Text('Correct',style: style,);
                      break;
                    case 5:
                      text = const Text('Wrong',style: style,);
                      break;
                    case 8:
                      text = const Text('NoteAttemp',style: style,);
                      break;

                  }

                  return SideTitleWidget(child: text, axisSide: meta.axisSide);
                }

            )
        )
    );
  }
  }
