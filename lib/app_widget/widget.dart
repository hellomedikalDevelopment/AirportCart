import 'package:airportcart/app_widget/app_data.dart';
import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget statusBar(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).padding.top,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(color: AppData.primary),
  );
}

void showMsg(BuildContext context, String msg, {IconData icon, Color color}) {
  Flushbar(
    margin: EdgeInsets.all(8),
    borderRadius: 8,
    message: msg,
    icon: Icon(icon ?? Icons.error_outline, color: color ?? AppData.white),
    backgroundColor: AppData.black,
    duration: Duration(seconds: 2),
  )..show(context);
}

save(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

Widget customMainAppBar({
  Function onTab,
  dynamic alignment,
  onPressed,
  IconData icon,
  trailing,
  String title,
  TextAlign titleAlign,
  image,
}) {
  return Container(
    color: AppData.primary,
    child: ListTile(
      title: Container(
        alignment: alignment ?? Alignment.bottomLeft,
        child: appText(
            title: title,
            fontSize: 18,
            maxLines: 1,
            fontWeight: FontWeight.w500,
            color: AppData.white),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 15),
      leading: Material(
        color: Colors.transparent,
        // color: AppData.white,
        child: InkWell(
            onTap: onTab, child: Icon(icon, color: AppData.white, size: 25)),
      ),
      trailing: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: image ?? Icon(trailing, color: AppData.white, size: 25)),
      ),
    ),
  );
}

Widget customAppBar(
    {Function onTab, onPressed, IconData icon, trailing, Widget profile}) {
  return Container(
    color: Colors.transparent,
    child: ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 15),
      leading: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onTab, child: Icon(icon, color: AppData.black, size: 25)),
      ),
      trailing: profile,
    ),
  );
}

Widget appText(
    {String title,
    FontWeight fontWeight,
    double fontSize,
    dynamic textDecoration,
    double letterSpacing,
    FontStyle fontStyle,
    Color color,
    TextAlign textAlign,
    int maxLines,
    double height}) {
  return Text(
    title,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: textAlign,
    style: TextStyle(
        height: height,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: textDecoration,
        color: color,
        fontFamily: themeFont,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing),
  );
}

Widget kTextField({
  String hint,
  String image,
  Color textFieldcolor,
  // String labelText,
  Widget icon,
  bool isIcon = true,
  bool isPassword,
  bool obscure,
  bool read,
  double radius,
  dynamic border,
  int line,
  TextInputType keyboardType,
  TextEditingController controller,
  Function showPassword,
  TextCapitalization textCapitalization,
  double margin,
  Widget sufixImage,
  Function onTap,
  Function(String) onChanged,
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: margin ?? 6),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            color: textFieldcolor ?? AppData.white,
            border: border,
            borderRadius: BorderRadius.circular(radius ?? 3),
          ),
          child: Row(
            children: [
              isIcon == true
                  ? Container(
                      child: image != null
                          ? Image.asset(
                              image,
                              height: 25,
                              width: 25,
                              filterQuality: FilterQuality.high,
                            )
                          : icon,
                    )
                  : SizedBox(),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  onTap: onTap,
                  cursorColor: AppData.primary,
                  controller: controller,
                  obscureText: obscure ?? false,
                  maxLines: line ?? 1,
                  readOnly: read == null ? false : read,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                    hintText: hint,
                    border: InputBorder.none,
                    isDense: true,
                  ),
                  textCapitalization: textCapitalization == null
                      ? TextCapitalization.none
                      : textCapitalization,
                  onChanged: onChanged,
                ),
              ),
              sufixImage ?? Container(),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget customButton(
    {String title,
    Function onTap,
    Color color,
    Color borderColor,
    Color textColor,
    double margin,
    double textSize,
    double padding,
    double width,
    double radius}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: width,
      alignment: Alignment.center,
      padding: EdgeInsets.all(padding ?? 12),
      margin: EdgeInsets.symmetric(horizontal: margin ?? 12),
      decoration: BoxDecoration(
        color: color ?? AppData.primary,
        borderRadius: BorderRadius.circular(radius ?? 8),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          style: BorderStyle.solid,
          width: 1,
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: textColor ?? AppData.white,
          fontWeight: FontWeight.w500,
          fontFamily: themeFont,
          fontSize: textSize ?? 18,
          letterSpacing: 0.5,
        ),
      ),
    ),
  );
}

Widget searchFood(
    {String title,
    TextEditingController controller,
    String hint,
    Color color,
    Widget prefixicon,
    dynamic border,
    bool read,
    Widget suffixicon,
    Function ontap}) {
  return InkWell(
    onTap: ontap,
    child: Container(
      height: 45,
      decoration: BoxDecoration(
        color: color ?? AppData.bgColor,
        border: border,
        boxShadow: [BoxShadow(color: AppData.grey, blurRadius: 2)],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: TextFormField(
          keyboardType: TextInputType.text,
          cursorColor: AppData.green,
          controller: controller,
          readOnly: read ?? false,
          maxLines: 1,
// onTap: onTap,
          autofocus: false,
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 16, letterSpacing: 0.2),
          decoration: InputDecoration(
            prefixIcon: prefixicon,
            suffixIcon: suffixicon ?? SizedBox(),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 16),
            border: InputBorder.none,
          ),
        ),
      ),
    ),
  );
}

Widget customMainAppBarSearch(
    {Function onTab,
    Function onPress,
    dynamic controller,
    IconData icon,
    IconData iconEnd}) {
  return Container(
      color: AppData.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
              onTap: onTab, child: Icon(icon, color: AppData.white, size: 25)),
          Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),

            width: 250,
            // height: 40,
            decoration: BoxDecoration(
                color: AppData.white, borderRadius: BorderRadius.circular(5)),

            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                fillColor: AppData.white,
                border: InputBorder.none,
                hintText: 'Search...',
                isDense: true,
              ),
            ),
          ),
          InkWell(
              onTap: onPress,
              child: Icon(iconEnd, color: AppData.white, size: 25)),
        ],
      ));
}

Widget searchbar({
  context,
  String hint,
  TextEditingController controller,
  Function onTap,
  Widget icon,
  Widget prefix,
  Widget suffiximage,
  Color color,
  bool read,
  dynamic border,
}) {
  return Container(
    height: 50,
    width: MediaQuery.of(context).size.width,
    color: color ?? AppData.primary,
    child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            searchFood(
              controller: controller,
              hint: hint,
              color: color,
              read: read,
              border: border,
              prefixicon: prefix ??
                  Icon(
                    Icons.search_outlined,
                    color: AppData.grey,
                  ),
              suffixicon: suffiximage ??
                  IconButton(
                    icon: icon ??
                        Icon(
                          Icons.mic,
                          color: AppData.grey,
                        ),
                    onPressed: onTap,
                  ),
            ),
          ],
        )),
  );
}

Widget rowline({String title, subtitle, Function onTap}) {
  return Padding(
    padding: const EdgeInsets.all(14),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        appText(
          title: title,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
        GestureDetector(
          child: appText(
            title: subtitle,
            color: Colors.black87,
            fontSize: 16,
            letterSpacing: 0.5,
          ),
          onTap: onTap,
        ),
      ],
    ),
  );
}

Widget loginField({
  String lable,
  TextEditingController controller,
  Widget suffix,
  TextInputType keyboardType,
  bool isPassword,
  List<TextInputFormatter> inputFormate,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
        color: AppData.white,
        // border: Border(),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          )
        ]),
    child: TextField(
      obscureText: isPassword ?? false,
      cursorColor: AppData.black,
      keyboardType: keyboardType,
      controller: controller,
      inputFormatters: inputFormate,
      style: TextStyle(
        color: Color(0xFF2D2D2D),
        fontFamily: themeFont,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        labelText: lable,
        border: InputBorder.none,
        labelStyle: TextStyle(
          fontSize: 16,
          height: 0.8,
          color: AppData.grey,
          fontFamily: themeFont,
        ),
        suffix: suffix,
      ),
    ),
  );
}

Widget loginWith({String image, Function onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        shape: BoxShape.circle,
        color: AppData.white,
      ),
      child: Image.asset(
        image,
        height: 35,
      ),
    ),
  );
}

Widget walletTextField({
  String label,
  String hintText,
  String suffix,
  Widget suffixIcon,
  Widget prefixIcon,
  Function onTap,
  TextInputType keybord,
  TextEditingController controller,
  Function(String) onChanged,
  bool readOnly,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5, bottom: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 15,
              letterSpacing: 0.5,
              color: AppData.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          // height: 45,
          child: TextField(
            onChanged: onChanged ?? (val) {},
            readOnly: readOnly ?? false,
            style: TextStyle(
              fontSize: 16,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w400,
            ),
            controller: controller,
            keyboardType: keybord ?? TextInputType.text,
            decoration: InputDecoration(
              hintText: hintText,
              isDense: true,
              suffixText: suffix ?? '',
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintStyle: TextStyle(color: Colors.grey[400]),
              fillColor: Colors.grey.shade200,
              filled: true,
              // border: InputBorder.none,
              border: new OutlineInputBorder(
                borderSide: BorderSide(width: 0, style: BorderStyle.none),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(6),
                ),
              ),
            ),
            onTap: onTap,
          ),
        ),
      ],
    ),
  );
}

Widget timepicker({
  String hintText,
  Widget suffixIcon,
  Widget prefixIcon,
  Function onTap,
  TextInputType keybord,
  TextEditingController controller,
  Function(String) onChanged,
  bool readOnly,
}) {
  return Container(
    height: 48,
    child: TextField(
      onChanged: onChanged ?? (val) {},
      readOnly: readOnly ?? false,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      controller: controller,
      keyboardType: keybord ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        isDense: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(color: AppData.greyLight),
        fillColor: Colors.grey.shade100,
        filled: true,
        contentPadding: EdgeInsets.all(2),
        // border: InputBorder.none,
        border: new OutlineInputBorder(
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6),
          ),
        ),
      ),
      onTap: onTap,
    ),
  );
}

Widget buttonSearchList({String name, Function onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: AppData.primary,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          appText(title: name, color: AppData.white, fontSize: 16),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: AppData.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Icon(Icons.arrow_forward_ios, color: AppData.primary),
          )
        ],
      ),
    ),
  );
}

Widget infoDetails(BuildContext context,
    {dynamic icon, dynamic width, double size, String detail, Color color}) {
  return Container(
    padding: EdgeInsets.all(5),
    child: Row(
      children: [
        Icon(icon, size: size, color: color ?? AppData.primary),
        SizedBox(width: 8),
        Container(
          width: width ?? MediaQuery.of(context).size.width * 0.84,
          child: appText(
              maxLines: 5,
              height: 1.5,
              title: detail,
              color: AppData.greyDark,
              fontSize: 12),
        ),
      ],
    ),
  );
}
