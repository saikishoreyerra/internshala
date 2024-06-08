import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../models/demo_model.dart';
import '../models/zip_code_model.dart';
import '../res/widgets/app_urls.dart';

class RegistrationRepository{
  final BaseApiServices _apiServices = NetworkApiServices();
  
  Future<List<PostOffice>> getZipCodeInfo(String zipCodeNum) async {
    try {
      final response =
          await _apiServices.getGetApiResponse(AppUrls.zipcodesUrl + zipCodeNum,);
          print(response[0]['PostOffice']);
          List<dynamic> postOffices = response[0]['PostOffice'];
          print(postOffices);
  List<PostOffice> responses = postOffices.map((data) => PostOffice.fromJson(data)).toList();

      return responses;
    } catch (e) {
      rethrow; //Big Brain
    }
  }


  Future<DemoPost> fetchPost() async {
    try {
      print("Starting point");
      dynamic response = await _apiServices.getGetApiResponse(AppUrls.demoUrl);
      return response = DemoPost.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

}