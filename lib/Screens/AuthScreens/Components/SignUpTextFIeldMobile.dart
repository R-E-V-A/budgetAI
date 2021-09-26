import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpTextFieldMobile extends StatelessWidget {
  const SignUpTextFieldMobile({Key key,this.width,this.height,this.title,this.controller}) : super(key: key);
  final double width;
  final double height;
  final String title;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 10,
      height: height*0.055,
      width: 0.8*width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xffD2D8CF)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0,bottom: 3),
        child: TextFormField(
            controller: controller,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusColor: Colors.white,
            fillColor: Colors.white,
            hoverColor: Colors.white,
            hintText: title,
            hintStyle: TextStyle(color: Color(0xff979797),fontSize: 14),
            border: InputBorder.none,
          ),
          validator: (text) {
            if (text == null || text.isEmpty) {
              return '$title  is empty';
            }
            return null;
          },
        ),
      ),
    );
  }
}
class DateTimeBox extends StatelessWidget {
  const DateTimeBox({Key key,this.width,this.height,this.title,this.controller}) : super(key: key);
  final double width;
  final double height;
  final String title;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height*0.055,
      width: 0.8*width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xffD2D8CF)),
      ),
      child: Row(
        children: [
          Expanded(
            child: DateTimePicker(
              onChanged: (currDate){
                controller.text = currDate;
              },
              autovalidate: true,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                border: InputBorder.none
              ),
              type: DateTimePickerType.date,
              firstDate: DateTime(1970,1,1,1),
              lastDate: DateTime.now(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.calendar_today_rounded),
          )
        ],
      ),
    );
  }
}
