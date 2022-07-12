import 'dart:async';

import 'package:project2/domain/models/slider_object_model.dart';
import 'package:project2/presentation/base/base_view_model.dart';

import '../../helper/app_strings.dart';
import '../../helper/assets_strings.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInputs,OnBoardingViewModelOutputs{
  final StreamController _streamController = StreamController<SliderViewObject>();
  late final List<SliderObject> _list ;

  int _currentIndex = 0;
  @override
  void dispose() {
   _streamController.close();
  }

  @override
  void start() {
   _list = _getSliderItems();
   _addDataToTheView();
  }

  @override
  int goBack() {
    int previousIndex = _currentIndex--;
    if(previousIndex == -1){
      _currentIndex == _list.length-1;
    }
    return _currentIndex;
  }

  @override
  int goForward() {
    int nextIndex = _currentIndex++;
    if(nextIndex >= _list.length){
      _currentIndex =0 ;
    }
   return _currentIndex;
  }

  @override
  void onPageChange(int index) {
    _currentIndex = index;
    _addDataToTheView();
  }

  @override
  // TODO: implement inputsSliderViewObject
  Sink get inputsSliderViewObject => _streamController.sink;

  @override
  // TODO: implement outputsSliderViewObject
  Stream<SliderViewObject> get outputsSliderViewObject => _streamController.stream.map((sliderViewObject) => sliderViewObject);
  List<SliderObject> _getSliderItems ()=> [
    SliderObject(AppStrings.onBoardingTitle1, AppStrings.onBoardingSubtitle1, AssetsString.onBoarding1),
    SliderObject(AppStrings.onBoardingTitle2, AppStrings.onBoardingSubtitle2, AssetsString.onBoarding2),
    SliderObject(AppStrings.onBoardingTitle3, AppStrings.onBoardingSubtitle3, AssetsString.onBoarding3),

  ];
  _addDataToTheView(){
    inputsSliderViewObject.add(SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }
}
// class for receiving orders from the view to view model
abstract class OnBoardingViewModelInputs {
void goForward();
void goBack();
void onPageChange(int index);
Sink get inputsSliderViewObject; //add data  to the stream
}
// class for sending response from the view model to view

abstract class OnBoardingViewModelOutputs {
Stream<SliderViewObject> get outputsSliderViewObject;
}

class SliderViewObject{
  SliderObject sliderObject ;
  int sliderObjectNumber;
  int currentIndex;
  SliderViewObject(
    this.sliderObject,
     this.sliderObjectNumber,
     this.currentIndex);
}