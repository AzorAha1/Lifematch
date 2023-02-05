import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icon.dart';

class Accountinfo extends StatefulWidget {
  const Accountinfo({super.key});

  @override
  State<Accountinfo> createState() => _AccountinfoState();
}

class _AccountinfoState extends State<Accountinfo> {
  final double tophalfheight = 200;
  double imagecontainerheight = 100;
  double imagecontainerwidth = 200;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F3DA),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
        tophalf(),
        Positioned(
          top: 150,
          width: 400,
          child: profilepicture(),
        ),
      ]),
    );
  }

  Widget tophalf() {
    return Container(
      height: tophalfheight,
      color: Color(0xffCCEF2B),
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          boxbutton(
            color: Colors.white,
            icon: Icon(Icons.arrow_back_ios),
            onpress: () {},
          ),
          Text(
            'My Profile',
            style:
                GoogleFonts.aclonica(fontWeight: FontWeight.w900, fontSize: 20),
          ),
          boxbutton(
            color: Color(0xffF8E006),
            onpress: () {},
            icon: LineIcon.userEdit(),
          ),
        ],
      ),
    );
  }

  


  Widget profilepicture() {
    return Container(
      width: imagecontainerwidth,
      height: imagecontainerheight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
            image: AssetImage(''),
        ),
      ),
    );
  }
}

class boxbutton extends StatelessWidget {
  Function()? onpress;
  Icon? icon;
  Color? color;
  boxbutton({required this.onpress, this.icon, this.color});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: MaterialButton(
          color: color,
          elevation: 2,
          onPressed: onpress,
          child: icon,
        ),
      ),
    );
  }
}
