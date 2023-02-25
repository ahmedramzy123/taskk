import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/core/constant.dart';
import 'package:task/feature/presentation/resources/color_manager.dart';
import 'package:task/feature/presentation/resources/imageassets.dart';
import 'package:task/feature/presentation/resources/strings_manager.dart';
import 'package:task/feature/presentation/resources/styles_manager.dart';
import 'package:task/feature/presentation/resources/value_manager.dart';

class OnBoardingViewBody extends StatefulWidget {
   OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> with TickerProviderStateMixin {


@override
  void initState() {
  controllerGif =FlutterGifController(vsync: this);
  controllerGif!.addListener(()
  {
    if(controllerGif!.isCompleted)
      {

        Navigator.pop(dialogContext!);
        animationControllerBengin =AnimationController(vsync: this,duration: Duration(milliseconds: 800));
        animationControllerBengin!.addListener(() =>setState(() {}));
        animationBengin= Tween<Offset>(begin: Offset(0,2),end: Offset.zero).animate(animationControllerBengin!);
        animationControllerBengin!.forward();
        animationControllerLinear =AnimationController(vsync: this,duration: Duration(milliseconds: 800));
        animationControllerLinear!.addListener(() =>setState(() {}));
        animationLinear= Tween<Offset>(begin: Offset(-1,0) ,end:Offset.zero).animate(animationControllerLinear!);
        animationControllerLinear!.forward();
        buildShowDialog(context);

      }
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         SizedBox(height: AppSize.s60,),
        Center(child: Image.asset(ImageAssets.uploadPageImage)),
         SizedBox(height: AppSize.s20),
        Text(AppString.uploadHistopatHoLogicalImage,textAlign: TextAlign.center,style: GoogleFonts.inter(fontSize: 22,
        fontWeight: FontWeight.w500),),
        Padding(
          padding:  EdgeInsets.only(
              right: AppPadding.p60,left: AppPadding.p60,top: AppPadding.p16),
          child: Text(
              AppString.youCanUploadTheHistopathologicalImageOnThisPageToSeeIfThereIsABreastCancerOrNot
                  ,textAlign: TextAlign.center,
            style: getRegularStyle(color: Colors.black,fontSize: AppSize.s16),
          ),
        ),
         SizedBox(height: AppSize.s80,),
        ElevatedButton(onPressed: ()
        {
          buildShowGifImg(context);
        },style:ElevatedButton.styleFrom(
          backgroundColor: ColorManager.backGroundSplash,
           fixedSize:  Size(AppSize.s250,AppSize.s50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(25)
          )
        ) , child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset(ImageAssets.icUpload),
           SizedBox(width: AppSize.s10,),
          const Text(AppString.upload)
        ],),)
      ],
    );
  }

}
Future buildShowDialog(BuildContext context)=>showDialog(context: context, builder: (context)=>Padding(
  padding: const EdgeInsets.symmetric(horizontal: 40),
  child: Center(
    child: Container(
      height: AppSize.s380,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(AppSize.s20)
      ),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: AppSize.s50),
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [

                Image.asset(ImageAssets.rectangle,width: AppSize.s180,),
                SlideTransition(
                  position: animationLinear!,
                  child: Container(
                    width: AppSize.s180,
                    height: AppSize.s3,
                    color: ColorManager.onBoardingColorItem,
                  ),
                ),
              ],
            ),
          ),
           SizedBox(height: AppSize.s50,),
          Text(AppString.result,style: getRegularStyle(color: Colors.black,fontSize: AppSize.s14),),
           SizedBox(height: AppSize.s10,),
          SlideTransition(
              position: animationBengin!,
              child: Text(AppString.bengin,style: getSemiBoldStyle(color: ColorManager.onBoardingColorItem,fontSize: 32),)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:  EdgeInsets.only(top: AppSize.s30,right: AppSize.s20, ),
                child: TextButton(onPressed: ()
                {
                  Navigator.pop(context);
                }, child: Text(AppString.cancel,style: GoogleFonts.roboto(
                    fontSize: AppSize.s14,color: ColorManager.cancel,fontWeight: FontWeight.bold
                ),)),
              )
            ],
          )



        ],
      ),
    ),
  ),
));
void buildShowGifImg(BuildContext context)=>  showDialog(context: context, builder: (context)
{
  controllerGif!.value=0;
  controllerGif!.animateTo(80,  duration: const Duration(milliseconds: 1500));
  dialogContext =context;
  return Center(

      child: GifImage(
        controller: controllerGif!,
        image: AssetImage(ImageAssets.imgGif,),

      ));
});

