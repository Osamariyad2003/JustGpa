import 'package:flutter/material.dart';

class Total extends StatelessWidget {
   Total({required this.total,Key? key}) : super(key: key);
   var total;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('معدلك الفصلي هو :',style: TextStyle(
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
