
import 'package:flutter/material.dart';
import 'package:gpa/constants/companets.dart';
import 'package:gpa/modules/total.dart';

class Go_Cal extends StatefulWidget {
  final int rowCount;
  Go_Cal({
    required this.rowCount,
    Key? key,
  }) : super(key: key);

  @override
  _Go_CalState createState() => _Go_CalState();
}

class _Go_CalState extends State<Go_Cal> {
 late String selectedvalue = gpaMap.keys.first;
  List<TextEditingController> gpaControllers = [];
  List<TextEditingController> hoursControllers = [];
  List<String> options = ['A+','A','A-','B+','B','B-','C+','C','C-','D+','D','D-','F'];
  Map<String,double> option = {'A+': 4.2,'A':4.0,'A-':3.75,'B+':3.5,'B':3.25,'B-':3.0,'C+':2.75,'C':2.5,'C-':2.25,'D+':2,'D':1.75,'D-':1.5,'F':0.5};
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.rowCount; i++) {
      gpaControllers.add(TextEditingController());
      hoursControllers.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('حساب المعدل الفصلي'),),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
              child: Column(
               children: [


                    ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                     itemBuilder: (context, index) => gparow(
                       selectedgpa: gpaMap.keys.first,
                       gpa: gpaControllers[index],
                       hours: hoursControllers[index],
                         gpaMaps: gpaMap.keys,
                         onchange3: ( newvalue){
                           setState(() {
                             selectedvalue = newvalue;
                             double selectedGPAValue = gpaMap[newvalue] ?? 0.0;
                             gpaControllers[index].text =selectedGPAValue.toStringAsFixed(2);
                           });
                         }
                     ),
                     separatorBuilder: (context, index) => Container(
                       width: double.infinity,
                       height: 1,
                       color: Colors.white,
                     ),
                     itemCount: widget.rowCount,
                   ),
                 SizedBox(height: 20,),
                 SingleChildScrollView(
                   child: defaultButton(function: (){
                        var total= calculateGPA();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Total(total: total,)));
                     }, text: 'حساب '),
                 ),


               ],
              ),

          ),
      ),

    );
  }
  double calculateGPA() {
    double totalGPA = 0.0;
    int totalHours = 0;
    for (int i = 0; i < gpaControllers.length; i++) {
      double gpa = double.tryParse(gpaControllers[i].text) ?? 0.0;
      int hours = int.tryParse(hoursControllers[i].text) ?? 0;
      totalGPA += gpa * hours;
      totalHours += hours;
    }
    return totalGPA / totalHours;
  }
  @override
  void dispose() {
    for (var controller in gpaControllers) {
      controller.dispose();
    }
    for (var controller in hoursControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}


