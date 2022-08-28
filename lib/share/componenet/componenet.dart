import 'package:flutter/material.dart';

Widget defultButton({
  double width=double.infinity,
  Color background=Colors.blue,
  bool isupperCase=true,
  double raduis=0.0,
  required Function() function,
  required String text,
})
{
  return Container(
    width: width,
    height: 40,
    child: MaterialButton(
      onPressed: function,
      child: Text(
        isupperCase?text.toUpperCase():text,
        style: TextStyle(color: Colors.white),
      ),
    ),
    decoration: BoxDecoration(
      color: background,
    borderRadius: BorderRadius.circular(raduis)),
  );
}


Widget defultFromFiled(
{
  required TextEditingController controller,
  required TextInputType type,
ValueChanged<String>? onSubmit,
ValueChanged<String>? onChanged,
GestureTapCallback? ontap,
bool ispassword=false,
required FormFieldValidator<String> validate,
required String label,
required IconData prefix,
IconData? sufix,
VoidCallback? suffixpressed,
bool isClickable=true,
int? lines,
})
{
  return TextFormField(
    controller: controller,
    keyboardType: type,
    obscureText:ispassword,
    enabled: isClickable,
    onFieldSubmitted: onSubmit,
    onChanged: onChanged,
    onTap: ontap,
    maxLines: lines,
    validator: validate,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(prefix),
      suffixIcon: sufix!=null?
      IconButton(
        onPressed: suffixpressed,
        icon: Icon(sufix)
        )
          :
      null,
      border: OutlineInputBorder(),

    ),
  );
}


void NavigatTO(context,widget) =>Navigator.push(context, MaterialPageRoute(builder: (context) => widget,));

void NavigatAndFinish(context,widget)
=>Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget,), (route) => false);
