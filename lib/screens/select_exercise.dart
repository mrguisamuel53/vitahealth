import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitahealth/colors.dart';
import 'package:vitahealth/widgets/my_appbar.dart';
import 'package:vitahealth/screens/home.dart' show Home;

class ExerciseButton extends StatelessWidget {
  final IconData whichIcon;
  final String title;
  final double width;
  final double height;
  final Color color;
  final VoidCallback? action;

  ExerciseButton({
    Key? key,
    required this.whichIcon,
    required this.title,
    required this.width,
    required this.height,
    required this.color,
    this.action = null
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      color: this.color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(this.whichIcon),
            onPressed: this.action,
            iconSize: 50.sp,
            color: ProjectColors().title
          ),
          Text(
            this.title,
            style: GoogleFonts.poppins(
              fontSize: 20.sp,
              color: ProjectColors().title
            ),
            textAlign: TextAlign.center
          )
        ]
      )
    );
  }
}

class SelectExercise extends StatelessWidget {
  SelectExercise({
    Key? key
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    AppBar myAppBar = MyAppBar.logoAppBar(
      action: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home()
          )
        );
      }
    );

    var screenHeight = (size.height - myAppBar.preferredSize.height) - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: myAppBar,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              ExerciseButton(
                whichIcon: Icons.directions_run_rounded,
                title: 'Corrida',
                width: size.width,
                height: screenHeight / 3,
                color: ProjectColors().appGreen,
              ),
              ExerciseButton(
                whichIcon: Icons.directions_walk_rounded,
                title: 'Caminhada',
                width: size.width,
                height: screenHeight / 3,
                color: ProjectColors().backgroundV2
              ),
              ExerciseButton(
                whichIcon: Icons.vertical_align_top_rounded,
                title: 'Pular Corda',
                width: size.width,
                height: screenHeight / 3,
                color: ProjectColors().appGreen
              ),
            ]
          )
        )
      )
    );
  }
}