import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit/controllers/community_controller_mobile.dart';
import 'package:reddit/controllers/community_controller_web.dart';
import 'package:reddit/methods/show_toast.dart';
import 'package:reddit/styles/custom_icons.dart';
import 'dart:math' as math;

import 'package:reddit/views/widgets/default_drop_down_button_widget.dart';
import 'package:reddit/views/widgets/web_app_bar.dart';

import '../../methods/default_bottom_sheet.dart';

class CommunityWebScreen extends StatelessWidget {
  final BoxConstraints constraints;
  final BuildContext context;
  const CommunityWebScreen(
      {super.key, required this.context, required this.constraints});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            titleSpacing: 0,
            // centerTitle: false,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: WebAppBarTitle(constraints: constraints, context: context)),
        body: Consumer<MobileCommunityProvider>(
          builder: (context, value, child) {
            return Column(
              children: [
                const SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://img.freepik.com/free-vector/hand-drawn-floral-wallpaper_52683-67169.jpg?w=1060&t=st=1666378342~exp=1666378942~hmac=17e16de142749acc0d7770d08abefff1c63cad6e6c3ce4320085d7c0ec1a17ad")),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                          "https://img.freepik.com/premium-photo/background-texture-red-blossom-roses-red-rose-is-meaning-love-romantic_10585-89.jpg?w=1060"),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Flexible(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "A subreddit for cute and cuddly pictures",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "r/aww",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )),
                    const SizedBox(
                      width: 30,
                    ),
                    value.joined
                        ? Consumer<WebCommunityProvider>(
                            builder: (context, value, child) => Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: MouseRegion(
                                  onHover: (val) {
                                    value.joinLeaveButtonOnHover();
                                  },
                                  onExit: (event) {
                                    value.joinLeaveButtonOnExit();
                                  },
                                  child: InkWell(
                                      borderRadius: BorderRadius.circular(20),
                                      onTap: () {
                                        showToast("Successfully left r/aww");
                                        Provider.of<MobileCommunityProvider>(
                                                context,
                                                listen: false)
                                            .unJoinCommunity();
                                        print(Provider.of<
                                                    MobileCommunityProvider>(
                                                context,
                                                listen: false)
                                            .joined);
                                      },
                                      child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Center(
                                            child: Text(
                                              "   ${value.joinLeaveButtonText}  ",
                                              style: const TextStyle(
                                                  color: Colors.blue),
                                            ),
                                          ))),
                                )),
                          )
                        : Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20)),
                            child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () {
                                  value.joinCommunity();
                                  showToast("Successfully joined r/aww");
                                },
                                child: const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Center(
                                      child: Text(
                                        "     Join     ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ))),
                          ),
                    const SizedBox(
                      width: 10,
                    ),
                    PopupMenuButton(
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 20,
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 19,
                            // child: InkWell(
                            //   onTap: () {
                            //     showDefaultBottomSheet(
                            //         context,
                            //         "COMMUNITY NOTIFICATIONS",
                            //         3,
                            //         value.bottomSheetNotificationsIcons,
                            //         ["Off", "Low", "Frequent"],
                            //         "notifications");
                            //   },
                            child: Icon(
                              value.notificationIcon,
                              size: 20,
                              //),
                            )),
                      ),
                      itemBuilder: (_) => <PopupMenuItem<String>>[
                        PopupMenuItem<String>(
                            value: 'Off',
                            child: Row(
                              children: [
                                Icon(value.bottomSheetNotificationsIcons[0]),
                                const Text("Off")
                              ],
                            )),
                        PopupMenuItem<String>(
                            value: 'Low',
                            child: Row(
                              children: [
                                Icon(value.bottomSheetNotificationsIcons[1]),
                                const Text("Low")
                              ],
                            )),
                        PopupMenuItem<String>(
                            value: 'Frequent',
                            child: Row(
                              children: [
                                Icon(value.bottomSheetNotificationsIcons[2]),
                                const Text("Frequent")
                              ],
                            )),
                      ],
                      onSelected: (String val) {
                        (val == "Off")
                            ? value.changeNotificationsType(val, 0)
                            : (val == "Low")
                                ? value.changeNotificationsType(val, 1)
                                : (val == "Frequent")
                                    ? value.changeNotificationsType(val, 2)
                                    : value.changeNotificationsType(val, 0);
                      },
                    )
                  ],
                ),
              ],
            );
          },
        ));
  }
}
