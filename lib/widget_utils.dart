import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UtilsWidgets {
  static textFormField(String? labelText, String hintText,
      String? Function(String?)? validator, TextEditingController? controller,
      {bool isReadOnly = false,
      TextInputType textInputType = TextInputType.text,
      bool obscure = false,
      int maxLine = 1,
      Widget? icon,
      Widget? suffixIcon,
      Widget? prefixIcon,
      Key? key,
      String? Function(String)? onChanged,
      List<TextInputFormatter>? inputFormatter,
      TextInputAction textInputAction = TextInputAction.next}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
      child: Container(
        child: TextFormField(
          onChanged: onChanged,
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 14,
              letterSpacing: 1),
          key: key,
          textInputAction: textInputAction,
          autofocus: false,
          keyboardType: textInputType,
          inputFormatters: inputFormatter,
          controller: controller,
          validator: validator,
          obscureText: obscure,
          maxLines: maxLine,
          readOnly: isReadOnly,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: Colors.black, width: 0.0),
            ),
            // contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            icon: icon,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hintText,
            labelText: labelText,
          ),
        ),
      ),
    );
  }

  static buildRoundBtn(String? btnsend, Function()? onPressed) {
    return SizedBox(
      height: 50,
      width: 180,
      child: ElevatedButton(
          child: Text(
            "$btnsend",
            textAlign: TextAlign.center,
          ),
          style: ElevatedButton.styleFrom(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: const BorderSide(color: Colors.white),
            ),
            primary: Colors.white,
          ),
          onPressed: onPressed),
    );
  }

  static showGetDialog(BuildContext context, message, Color? color) {
    return Get.defaultDialog(
        middleText: message,
        contentPadding: EdgeInsets.all(15),
        backgroundColor: Color.fromARGB(255, 227, 235, 239),
        titleStyle: TextStyle(color: color),
        middleTextStyle: TextStyle(color: Colors.black),
        textConfirm: "Ok",
        onConfirm: () {
          Navigator.of(context).pop();
        },
        radius: 20);
  }
}
