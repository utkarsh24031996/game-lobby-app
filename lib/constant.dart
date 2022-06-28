import 'package:flutter/material.dart';

const darkblue = Color(0XFF02457A);
const lightblue = Color(0XFF018ABE);
const bellBadgeColor = Color(0xFFd92124);
const backgroundColor = Color(0xFFF3F3FB);
const drawercolor = Color(0xFF343f4b);



///media Query Screen height
double scHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

///media Query Screen Width
double scWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

OutlineInputBorder outlineEnabledBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.black.withOpacity(0.4)),
  );
}


///fontsize 18 & fontweight 400
TextStyle bodytext1({Color color = Colors.black}) {
  return TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: color);
}

///fontsize 16 & fontweight 400
TextStyle bodytext2({Color color = Colors.black}) {
  return TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: color);
}

TextStyle xlboldtitle() {
  return const TextStyle(
      color: darkblue, fontWeight: FontWeight.bold, fontSize: 22);
}
TextStyle titleTextStyle() {
    return const TextStyle(color: Colors.grey, fontWeight: FontWeight.w300);
  }

  TextStyle valuTextStyle() {
    return const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  }


final List bannerlists = [
  'assets/images/bgmi_tournment.png',
  'assets/images/bgmi_tournment.png',
  'assets/images/bgmi_tournment.png',
  'assets/images/bgmi_tournment.png',
];



///custom Alert dilogue
showCustomAlertBox(
    {required BuildContext context,
    required String title,
    VoidCallback? ontap,
    String buttonText = 'Yes',
    VoidCallback? ontapClose,
    bool isOntapClos = false,

    ///islogout true to show yes button
    bool islogOut = false,
    required String body}) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: darkblue,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              decoration: const BoxDecoration(
                  color: darkblue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: bodytext1(color: Colors.white),
                    ),
                    IconButton(
                        onPressed: isOntapClos == false
                            ? () {
                                Navigator.pop(context);
                              }
                            : ontapClose,
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ))
                  ]),
            ),

            //show description text
            Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              // height: 40,
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    '$body \n',
                    // 'Gentle reminder that you fee for this month is due. Kindly clear it to continue with the classes.',
                    style: bodytext1(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  islogOut == true
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: darkblue),
                          onPressed: ontap,
                          child: Text(
                            buttonText,
                            style: bodytext2(color: Colors.white),
                          ))
                      : const SizedBox(),
                ],
              ),
            ),
          ]),
        );
      });
}
