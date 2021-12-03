/*
Widget dropDown(
    {List<DropdownMenuItem<String>> items, String title, Function onChanged}) {
  return DropdownButtonFormField(
    decoration: InputDecoration(
      labelText: title,
      labelStyle: TextStyle(color: AppData.grey),
      border: new OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.black,
          width: 1.5,
        ),
      ),
      focusedBorder: new OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.black,
          width: 1.5,
        ),
      ),
    ),
    items: items,
    onChanged: onChanged,
  );
}

//!
Widget searchFood(
    {String title,
    TextEditingController controller,
    String hint,
    Function ontap}) {
  return InkWell(
    onTap: ontap,
    child: Container(
      height: 45,
      decoration: BoxDecoration(
        color: AppData.white,
        boxShadow: [BoxShadow(color: AppData.grey, blurRadius: 2)],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: TextFormField(
          keyboardType: TextInputType.text,
          cursorColor: Colors.green,
          controller: controller,
          maxLines: 1,
// onTap: onTap,
          autofocus: false,
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 16, letterSpacing: 0.2),
          decoration: InputDecoration(
            suffixIcon: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: AppData.mainBlue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                'assets/therapy/searchicon.png',
                color: AppData.white,
                width: 16,
                height: 16,
              ),
            ),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 16),
            border: InputBorder.none,
// isDense: true,
          ),
// textCapitalization: TextCapitalization.sentences,
        ),
      ),
    ),
  );
}
//!



*/