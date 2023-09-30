import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result({required this.total,Key? key}) : super(key: key);
  var total;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('معدلك التراكمي هو :',style: TextStyle(
                fontSize: 18
            ),),
            SizedBox(height: 8,),
            Text('${total.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
