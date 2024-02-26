import 'package:flutter/material.dart';
import 'package:gpa/constants/companets.dart';
import 'package:gpa/modules/cumNumber.dart';

import 'modules/semeterNumber.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            defaultButton(function: (){

              Navigator.push(context, MaterialPageRoute(builder: (context) => CumNumber()));
            }, text: 'اذهب للحساب المعدل التراكمي'),
            SizedBox(height: 20),
            defaultButton(function:  (){

              Navigator.push(context, MaterialPageRoute(builder: (context) => SemeterNumber()));
            } , text: ' اذهب للحساب المعدل الفصلي')
          ],
        ),
      ) ,
    );
  }
}
