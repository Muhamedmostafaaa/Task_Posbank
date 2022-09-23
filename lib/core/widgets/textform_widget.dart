import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget{
  final TextEditingController controller;
  final String labelText;
  final int maxLines;
  final Widget? suffixIcon;
  String? Function(String?)? validate;


  TextFormWidget({required this.controller,required  this.labelText,required this.maxLines,this.suffixIcon,this.validate});

  @override
  Widget build(BuildContext context) {
   return TextFormField(
     controller: controller,
     validator: validate,
     decoration:  InputDecoration(suffixIcon:suffixIcon ,

       labelText: labelText,
       labelStyle: const TextStyle(color: Colors.grey),
       enabledBorder:const OutlineInputBorder(
           borderSide: BorderSide(color: Colors.grey)),
       focusedBorder:const OutlineInputBorder(
           borderSide: BorderSide(color: Colors.grey)),
       border:const OutlineInputBorder(
           borderSide: BorderSide(color: Colors.grey)),
     ),maxLines: maxLines,
   );
  }



}