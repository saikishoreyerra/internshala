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


