import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/feature/presentation/resources/imageassets.dart';
import 'package:task/feature/presentation/resources/routes.dart';
import 'package:task/feature/presentation/resources/strings_manager.dart';
import 'package:task/feature/presentation/resources/value_manager.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({Key? key}) : super(key: key);

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  Timer? _timer;
  _start()
  {
    _timer = Timer(const Duration(seconds: 3), ()
    {
      Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
    });
  }
  @override
  void initState() {
   _start();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(top:AppPadding.p40,right: AppPadding.p20,left: AppPadding.p20),
          child: SizedBox(
            height: 90,
            child: Row(
              children: [
                Image.asset(ImageAssets.icUniversity,height: AppSize.s80,),
                Spacer(),
                Image.asset(ImageAssets.icCollege,height: AppSize.s80,),
              ],
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageAssets.logo),
               SizedBox(height: AppSize.s20,),
              Center(child: Text(AppString.alBasedCacd,
                style:  GoogleFonts.inter(fontSize:  AppSize.s27,fontWeight: FontWeight.bold,color: Colors.white))),
              Center(child: Text(AppString.breastCancerDetiction,
                style: GoogleFonts.inter(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
            ],
          ),
        ),
      ],
    );
  }
  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
}
