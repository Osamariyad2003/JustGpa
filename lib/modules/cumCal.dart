import 'package:flutter/material.dart';
import 'package:gpa/constants/companets.dart';
import 'package:gpa/modules/CumTotal.dart';
import 'package:gpa/modules/total.dart';

class CumCal extends StatefulWidget {
  final int rowCount;


  CumCal({
    required this.rowCount,
    Key? key,
  }) : super(key: key);

  @override
  _CumCalState createState() => _CumCalState();
}

class _CumCalState extends State<CumCal> {
  late String selectedvalue =gpaMap.keys.first;
  double gpaintial = 0;
  double gpafinal = 0;
  int resultintial = 0;
  double resultfinal = 0;
  List<TextEditingController> gpaControllers = [];
  List<TextEditingController> hoursControllers = [];
  var totalgpacontroller =TextEditingController();
  var totalhourscontroller =TextEditingController();
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
      appBar: AppBar(
        title: Text('حساب المعدل التراكمي'),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              defaultFormTextGpa(label: 'معدلك التراكمي الماضي', prefix:Icons.calendar_month , controller: totalgpacontroller, type: TextInputType.text, validate: (String? value){
                if(value!.isEmpty)
                {return 'يرجى تعبئة الحقل';}}),
              SizedBox(height: 20,),
              defaultFormTextGpa(label: 'عدد الساعات الي قطعها', prefix:Icons.watch_later_outlined , controller: totalhourscontroller, type: TextInputType.text, validate: (String? value){
                if(value!.isEmpty)
                {return 'يرجى تعبئة الحقل';}}),
              SizedBox(height: 10,),
              ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => gparow(
                  gpa: gpaControllers[index],
                  hours: hoursControllers[index],
                  selectedgpa: selectedvalue,
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CumTotal(total: total,)));
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
    var gpat =  double.tryParse(totalgpacontroller.text) ?? 0.0;
    var hourst = int.tryParse(totalhourscontroller.text)?? 0 ;
    gpaintial = gpat * hourst;
    gpafinal = totalGPA + gpaintial;
    resultintial = totalHours + hourst;
    resultfinal = gpafinal/resultintial;



    return resultfinal;
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


