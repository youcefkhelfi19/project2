import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project2/presentation/helper/app_colors.dart';
import 'package:project2/presentation/helper/app_text_styles.dart';
import 'package:project2/presentation/helper/app_values.dart';
import 'package:project2/presentation/screens/onboarding/onboarding_view_model.dart';

import '../../../domain/models/modeles.dart';


class OnBoardingScreen extends StatefulWidget {
   const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
   final OnBoardingViewModel _boardingViewModel = OnBoardingViewModel();
   final PageController _pageController = PageController(initialPage: 0);
   _bind(){
     _boardingViewModel.start();
   }
   @override
  void initState() {
    _bind();
    super.initState();
  }
  @override
  void dispose() {
    _boardingViewModel.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _boardingViewModel.outputsSliderViewObject,
      builder: (context,snapshot) {
         if(snapshot.data == null){
            return Container();
         }else {
           return buildScaffoldView(snapshot.data);
         }
      }
    );
  }

  Scaffold buildScaffoldView(SliderViewObject? sliderViewObject) {
    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:  Colors.white,
        actions: [TextButton(onPressed: (){},
            child:Text('Skip',style: regularStyle(color: AppColors.primary),) )],
      ),
        bottomSheet:buildCustomBtmSheet(sliderViewObject!)
        ,
        body: PageView.builder(
            itemCount: sliderViewObject.sliderObjectNumber,
            controller: _pageController,
            onPageChanged: (index)=> _boardingViewModel.onPageChange(index),
            itemBuilder: (context,index){
          return PageViewItem(sliderObject:sliderViewObject.sliderObject);
        }),
      );
  }

  Container buildCustomBtmSheet(SliderViewObject sliderViewObject) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s12),
      color: AppColors.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        IconButton(onPressed: (){
          sliderViewObject.currentIndex != 0? _pageController.animateToPage(_boardingViewModel.goBack(), duration: const Duration(milliseconds: 300), curve: Curves.linear):null;
          },
              icon: Icon(Ionicons.chevron_back_circle,color: sliderViewObject.currentIndex != 0? Colors.white :Colors.white54,size: AppSize.s30,)
          ),
          Row(
            children: [
              for(int i =0 ; i<sliderViewObject.sliderObjectNumber;i++)
                  Padding(padding: const EdgeInsets.symmetric(horizontal: AppSize.s8),
                 child: i == sliderViewObject.currentIndex? const Icon(Ionicons.ellipse,size: AppSize.s16,color: Colors.white,): const Icon(Ionicons.ellipse_outline,size: AppSize.s16,color: Colors.white,),
                 )
            ],
          ),
          sliderViewObject.currentIndex == 2? IconButton(onPressed: (){

          },
              icon:const Icon(Ionicons.checkmark_circle,color: Colors.white,size: AppSize.s30,)
          ):IconButton(onPressed: (){
           _pageController.animateToPage(_boardingViewModel.goForward(), duration: const Duration(milliseconds: 300), curve: Curves.linear);

         },
             icon:const Icon(Ionicons.chevron_forward_circle,color: Colors.white,size: AppSize.s30,)
         )
        ],
      ),
    );
  }

}
class PageViewItem extends StatelessWidget {
  const PageViewItem({Key? key, required this.sliderObject}) : super(key: key);
 final SliderObject sliderObject ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s30),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: SvgPicture.asset(sliderObject.image),
          ),
          Expanded(child: Center(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Text(sliderObject.title,style: Theme.of(context).textTheme.headline1,),
                Text(sliderObject.subtitle,style: Theme.of(context).textTheme.subtitle1,)
              ],
            ),
          ))
        ],
      ),
    );
  }

}

