import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:game_room/modal/get_game_list.dart';
import 'package:game_room/modal/send_otp_modal.dart';
import 'package:game_room/modal/sign_in_modal.dart';
import 'package:game_room/modal/update_profile.dart';
import 'package:game_room/modal/user_modal.dart';
import 'package:game_room/modal/verify_otp_modal.dart';
import 'package:http/http.dart' as http;

import '../modal/get_banner_list.dart';

late SignInModal signInModal;
late SendOtp resendOtp;
late VerifyOtp verifyOtp;
late UserModal userModal;
late GetBannerList getBannerList;
List<Banner> bannerList = [];
late GetGameList gameList;
List<Game> getGameList = [];
late UpdateProfile updateProfile;

class ApiCalls {
  String urlHeader = 'http://aakhribazi.appmate.in/api';

  ///sign in Api call
  Future<SignInModal> singIn({required String mobileNo}) async {
    String url = "$urlHeader/signin";
    try {
      var response =
          await http.post(Uri.parse(url), body: {'mobile': mobileNo});
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        log("$json");
        signInModal = SignInModal.fromJson(json);
        return signInModal;
      } else {
        throw "Error Occured";
      }
    } catch (e) {
      rethrow;
    }
  }

  ///resend otp api call
  Future<SendOtp> resendOtpApi({required String mobileNo}) async {
    String url = "$urlHeader/sendOtp";
    try {
      var response =
          await http.post(Uri.parse(url), body: {'mobile': mobileNo});
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        log("$json");
        resendOtp = SendOtp.fromJson(json);
        return resendOtp;
      } else {
        throw "Error Occured";
      }
    } catch (e) {
      rethrow;
    }
  }

  ///verify otp api call to verify mobilenumber
  Future<VerifyOtp> verifyOtpApi(
      {required String mobileNo, required String otp}) async {
    String url = "$urlHeader/verifyOtp";
    try {
      var response = await http
          .post(Uri.parse(url), body: {'mobile': mobileNo, 'otp': otp});
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        log(json.toString());
        verifyOtp = VerifyOtp.fromJson(json);

        return verifyOtp;
      } else {
        throw "Error Occured";
      }
    } catch (e) {
      rethrow;
    }
  }

  ///user api call
  Future<UserModal> getUser({required String token}) async {
    String url = "$urlHeader/user";
    try {
      var response = await http.get(Uri.parse(url),
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        log("$json");
        userModal = UserModal.fromJson(json);
        return userModal;
      } else {
        throw "Error Occured";
      }
    } catch (e) {
      rethrow;
    }
  }

  ///user api call
  Future<UpdateProfile> patchUpdateProfile(
      {required String token,
      required String name,
      required String email,
      required String gender}) async {
    String url = "$urlHeader/updateProfile";
    try {
      var response = await http.patch(Uri.parse(url),
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
          body: {'name': name, 'email': email, 'gender': gender});
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        log("$json");
        updateProfile = UpdateProfile.fromJson(json);
        return updateProfile;
      } else {
        throw "Error Occured";
      }
    } catch (e) {
      rethrow;
    }
  }

  ///get banner images
  Future<GetBannerList> getbannerimages() async {
    String apigetBannerlist = "$urlHeader/getBannerList";

    var response = await http.get(Uri.parse(apigetBannerlist));
    try {
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          getBannerList = getBannerListFromJson(response.body);
          bannerList = getBannerList.data.banners;

          return getBannerList;
        } else {
          throw "Empty json";
        }
      } else {
        throw "error";
      }
    } catch (e) {
      rethrow;
    }
  }

  ///get game list
  Future<GetGameList> getGameLists() async {
    String gamelistUrl = "$urlHeader/getGameList";

    var response = await http.get(Uri.parse(gamelistUrl));
    try {
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          gameList = getGameListFromJson(response.body);
          getGameList = gameList.data.games;

          return gameList;
        } else {
          throw "Empty json";
        }
      } else {
        throw "error";
      }
    } catch (e) {
      rethrow;
    }
  }
}
