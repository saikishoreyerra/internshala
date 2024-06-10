import 'package:flutter/material.dart';
import 'package:internshala/models/demo_model.dart';
import 'package:internshala/repository/registration_repository.dart';

import '../data/response/api_response.dart';
import '../data/response/status.dart';
import '../models/zip_code_model.dart';

class RegisterationViewModel with ChangeNotifier{

  final _registration = RegistrationRepository();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _isFullNameValid = false;
  bool get isFullNameValid => _isFullNameValid;

  void validateFullName({required String  fullName}){
    if(fullName.length > 3){
       _isFullNameValid = true;
    }else{
      _isFullNameValid = false;
    }
   continueBtnEnable();
    notifyListeners();
  }


  bool _isEmailValid = false;
  bool get isEmailValid => _isEmailValid;

  void isValidEmail(String email) {
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
  );
  _isEmailValid = emailRegex.hasMatch(email);
   continueBtnEnable();
    notifyListeners();
}

  bool _isPhoneValid = false;
  bool get isPhoneValid => _isPhoneValid;

void validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    _isPhoneValid = value.length != 10 ? false : true;
      continueBtnEnable();
    notifyListeners();
  }


  bool _isPasswordValid = false;
  bool get isPasswordValid => _isPasswordValid;

void validatePassword(String value) {
    _isPasswordValid = value.length > 4 ? true : false;
continueBtnEnable();
    notifyListeners();
  }

  bool _isConfirmPasswordValid = false;
  bool get isConfirmPasswordValid => _isConfirmPasswordValid;

void validateConfirmPassword(String value,String passTxt) {
    _isConfirmPasswordValid = (value.length > 4 && value == passTxt) ? true : false;
continueBtnEnable();
    notifyListeners();
  }


  bool _isContinueEnable = false;
  bool get isContinueEnable => _isContinueEnable;

void continueBtnEnable() {
    _isContinueEnable = isConfirmPasswordValid && isPasswordValid && isPhoneValid && isEmailValid && isFullNameValid;
  }


  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }


bool _isFetchZipCode = false;
   bool get isFetchZipCode => _isFetchZipCode;

  
  ApiResponse<List<PostOffice>> zipCodesList = ApiResponse.loading();


  setZipCodesList(ApiResponse<List<PostOffice>> response) {
    zipCodesList = response;
    print(response.data?.first);
    print("===============");
    _isFetchZipCode = response.status == Status.error;
    if(response.status == Status.completed || response.status == Status.error){
      _isLoading=false;
      
    }else if(response.status == Status.loading){
      _isLoading=true;
    }
    notifyListeners();
  }



  ApiResponse<DemoPost> postsList = ApiResponse.loading();

  setPostsList(ApiResponse<DemoPost> response) {
    postsList = response;
    print(response.data);
    print("===============");
    // _isFetchZipCode = response.status == Status.error;
    if(response.status == Status.completed || response.status == Status.error){
      // _isLoading=false;
      
    }else if(response.status == Status.loading){
      // _isLoading=true;
    }
    notifyListeners();
  }

  Future<void> getZipInfoByCode({required String zipCodeNum,required BuildContext context}) async {
    setZipCodesList(ApiResponse.loading());
    _registration.getZipCodeInfo(zipCodeNum).then((value) {

      print(value);
      setZipCodesList(ApiResponse.completed(value));
     
    }).onError((error, stackTrace) {
      setZipCodesList(ApiResponse.error(error.toString()));
    });
  }
  
  
  Future<void> fetchPostsApi() async {
    setPostsList(ApiResponse.loading());
    _registration.fetchPost().then((value) {

      print(value);
      setPostsList(ApiResponse.completed(value));
     
    }).onError((error, stackTrace) {
      setPostsList(ApiResponse.error(error.toString()));
    });
  }
  
  
  
} 


