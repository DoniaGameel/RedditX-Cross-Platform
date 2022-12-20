// ignore_for_file: depend_on_referenced_packages
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../config/constants.dart';
import '../models/community_model.dart';
import '../models/post_model.dart';
import '../models/user_model.dart';

/// Get posts of a specific community with a sort type
getAPICommunityPosts(String communityName) async {
  String apiRoute = "/api/listing/posts/r/$communityName/hot?page=1&limit=6";
  Uri url = Uri.parse(urlApi + apiRoute);
  await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader:
          ('Bearer ${"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbFR5cGUiOiJiYXJlIGVtYWlsIiwidXNlcm5hbWUiOiJ0Ml9sb3RmeTIiLCJpYXQiOjE2NzE1NTE5NTIsImV4cCI6MTY3MTk4Mzk1Mn0._0z3MfL07P4tHEn108xR255dkQ2Va2MKJnOeb8vcdNg"}')
    },
  ).then((value) {
    if (value.statusCode == 200) {
      var responseData = json.decode(value.body) as Map<String, dynamic>;
      communityPostsListAPI = responseData['posts'];
      for (int i = 0; i < communityPostsListAPI.length; i++) {
        votersCommunityAPI.add(communityPostsListAPI[i]['voters']);
      }
    } else {

      print(value.statusCode);
      communityPostsListAPI = [];
      votersProfileAPI = [];
    }
  });
}


getAPICommunityAbout(String communityName) async {
  String apiRoute = "/api/r/$communityName";
  Uri url = Uri.parse(urlApi + apiRoute);
  await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader:
          ('Bearer ${"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbFR5cGUiOiJiYXJlIGVtYWlsIiwidXNlcm5hbWUiOiJ0Ml9sb3RmeTIiLCJpYXQiOjE2NzE1NTE5NTIsImV4cCI6MTY3MTk4Mzk1Mn0._0z3MfL07P4tHEn108xR255dkQ2Va2MKJnOeb8vcdNg"}')
    },
  ).then((value) {
    if (value.statusCode == 200) {
      var responseData = json.decode(value.body) as Map<String, dynamic>;

      moderatorsAPI = responseData['moderators'];
      communityRulesAPI = responseData['communityRules'];
    } else {
      moderatorsAPI = [];
      communityRules = [];
      print("___________________________________");
      print(value.statusCode);
    }
  });
}

/// Get community name, date of creation, description and members count
getAPICommunityInfo(String communityName) async {
  String apiRoute = "/api/r/info?id=$communityName";
  Uri url = Uri.parse(urlApi + apiRoute);
  await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader:
          ('Bearer ${"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbFR5cGUiOiJiYXJlIGVtYWlsIiwidXNlcm5hbWUiOiJ0Ml9sb3RmeTIiLCJpYXQiOjE2NzE1NTE5NTIsImV4cCI6MTY3MTk4Mzk1Mn0._0z3MfL07P4tHEn108xR255dkQ2Va2MKJnOeb8vcdNg"}')
    },
  ).then((value) {
    if (value.statusCode == 200) {
      var responseData = json.decode(value.body) as Map<String, dynamic>;
               print("___________________________________");
      print(responseData);
      communityInfoAPI = responseData['things'][0];
    } else {
      communityInfoAPI = {};

      print(value.statusCode);
    }
  });
}

getAPICommunityFlairs(String communityName) async {
  String apiRoute = "/api/r/$communityName/api/flair-list";
  Uri url = Uri.parse(urlApi + apiRoute);
  await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader:
          ('Bearer ${"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbFR5cGUiOiJiYXJlIGVtYWlsIiwidXNlcm5hbWUiOiJ0Ml9sb3RmeTIiLCJpYXQiOjE2NzE1NTE5NTIsImV4cCI6MTY3MTk4Mzk1Mn0._0z3MfL07P4tHEn108xR255dkQ2Va2MKJnOeb8vcdNg"}')
    },
  ).then((value) {
    if (value.statusCode == 200) {
      var responseData = json.decode(value.body) as Map<String, dynamic>;
      communityFlairsAPI = responseData['flairs'];
    } else {communityFlairsAPI=[];}
  });
}


