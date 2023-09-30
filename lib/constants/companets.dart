import 'package:flutter/material.dart';


Map<String,double> gpaMap = {'A+': 4.2,'A':4.0,'A-':3.75,'B+':3.5,'B':3.25,'B-':3.0,'C+':2.75,'C':2.5,'C-':2.25,'D+':2,'D':1.75,'D-':1.5,'F':0.5};
String? selectedgpa;
Widget defaultFormTextGpa({required String label
  ,required  IconData prefix,
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged<String>? onchange,onsumbit,IconData? suffix, suffixPressed,bool isPassword = false,
  bool isClickable = true,
   required   validate,
  onTap
}){

  return TextFormField(
    controller: controller,
    keyboardType: type,
    obscureText:isPassword ,
    enabled: isClickable,
    onChanged: onchange,
    validator: validate,
    onTap: onTap,
    onFieldSubmitted: onsumbit,
    decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        ) : null,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0)
        )

    ),

  );
}

Widget defaultButton({
  double width = double.infinity,
  Color background =  Colors.indigo,
  bool isUpperCase = true,
  double radius = 8.0,
  required  function,
  required String text,
}) =>
    Container(
      width: width,
      height: 40.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );


Widget gparow({required gpa,required gpaMaps,required hours,onsumbit,onchange,onTap,onsumbit2,onchange2,required onchange3,onTap2,required selectedgpa}) => Container(
  height: 150,
   width: double.infinity,
  child:   Center(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Container(
          height: 80,
          width: 150,
          child: DropdownButtonFormField<String>(
            value: gpaMap.keys.first,
            onChanged: onchange3,

            decoration: InputDecoration(
              labelText: 'معدلك بالمادة',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8)
              ),
            ),
            items: gpaMap.keys
          .map<DropdownMenuItem<String>>(( value) {

              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 20),



         SizedBox( width: 30,),
      Container(
        height: 80,
        width: 100,
        child: TextFormField(
          controller: hours,
     keyboardType: TextInputType.numberWithOptions(decimal: true),
     onChanged: onchange2,
     onTap: onTap2,
    decoration: InputDecoration(
       labelText: 'عدد ساعات المادة',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8)
          )
    ),
    ),),
      ],),
  ),
);

