import 'package:flutter/material.dart';

import '../constants/companets.dart';
import 'gpa_total.dart';

class GpaTotal extends StatelessWidget {
  GpaTotal({Key? key}) : super(key: key);
  var gpacontrooler =TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                defaultFormTextGpa(label: 'عدد موادك بالفصل', prefix: Icons.library_books, controller: gpacontrooler, type: TextInputType.numberWithOptions(decimal: true),
                    validate: (String? value){
                  if(value!.isEmpty  )
                  {return 'يرجى تعبئة الحقل';}}),
                SizedBox(height: 20),
                defaultButton(function: (){
                  if(formkey.currentState != null){
                    if(formkey.currentState!.validate()){
                      Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => GpaTotal2(rowCount: int.parse(gpacontrooler.text), ) ));
                    }
                  }
                }, text: 'أذهب للحساب ')
              ],

            ),
          ),
        ),
      ),
    );
  }
}
