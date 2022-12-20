import 'package:flutter/material.dart';
import 'package:search_project/models/community_model.dart';
import 'package:search_project/models/user_model.dart';


import '../config/constants.dart';
import '../models/post_model.dart';
import '../services/community_services.dart';


class CommunityModelProvider with ChangeNotifier {
  bool mockData = iSMOCK;

  Future getCommunityPosts(String communityName, String sortType,
      List<dynamic> posts, int page, int limit) async {
    if (mockData) {
      communityPostsList = communityPostsListMock;
      votersCommunity=votersCommunityMock;
      notifyListeners();
    } else {
      await getAPICommunityPosts(communityName, sortType, posts, page, limit);
      communityPostsList = communityPostsListAPI;
      votersCommunity=votersCommunityAPI;
      notifyListeners();
    }
  }

  Future getCommunityAbout(String communityName) async {
    if (mockData) {
      moderators = moderatorsMock1;
      communityRules = communityRulesMock1;
    } else {
      await getAPICommunityAbout(communityName);
      moderators = moderatorsAPI;
      communityRules = communityRulesAPI;
    }
    notifyListeners();
  }

  Future getCommunityInfo(String communityName) async {
    if (mockData) {
      communityInfo = communityInfoMock;
    } else {
      await getAPICommunityInfo(communityName);
      communityInfo = communityInfoAPI;
      notifyListeners();
    }
  }

  Future getCommunityFlairs(String communityName) async {
    if (mockData) {
      communityFlairs = communityFlairsMock;
    } else {
      await getAPICommunityFlairs(communityName);
      communityFlairs = communityFlairsAPI;
    }
    notifyListeners();
  }


}