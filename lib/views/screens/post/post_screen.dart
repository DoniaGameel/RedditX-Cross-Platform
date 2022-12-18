import 'package:flutter/material.dart';
import 'package:reddit/models/post/comment_model.dart';
import 'package:reddit/views/widgets/post/show_bottom_sheet.dart';
import 'package:reddit/views/screens/post/post_page_web.dart';
import 'package:reddit/views/widgets/post/comment_reply.dart';
import 'package:reddit/views/widgets/post/comments.dart';
import 'package:provider/provider.dart';
import 'package:reddit/controllers/post/post_mobile_provider.dart';
import 'package:reddit/styles/custom_icons.dart';
import 'package:reddit/views/widgets/post/popup_menu.dart';

/// Mobile post Screen
class post_screen extends StatefulWidget {
  String type;
  int votesCount;
  String username;
  String communityName;
  var createdAt;
  String text;
  String title;
  int commentsNumber;
  var attachments;

  // PostModel postsList;

  post_screen({
    Key? key,
    required this.attachments,
    required this.type,
    required this.commentsNumber,
    required this.communityName,
    required this.createdAt,
    required this.text,
    required this.title,
    required this.username,
    required this.votesCount,
  }) : super(key: key);

  @override
  State<post_screen> createState() => _post_screenState();
}

class _post_screenState extends State<post_screen> {
  /// List of strings for comments
  List commentsText = [
    'What you are doing right now is that there will be a padding of 10 pixels from top and 10 pixels from left side of the screen. So that the Container might have bigger or smaller shapes on different screen sizes. You can do it dynamically by using the screenSize values and media query so that you set the padding according to the screen size:',
    'The result of the code above will be a padding of 10% of the height of the screen from top and 10% of the width of the screen from left. That’s how you can set your padding dynamically. ( Also be aware that you cannot use const keyword if you’re using mediaQuery values as the value is not available at the compile time.',
    'What you are doing right now is that there will be a padding of 10 pixels from top and 10 pixels from left side of the screen. So that the Container might have bigger or smaller shapes on different screen sizes. You can do it dynamically by using the screenSize values and media query so that you set the padding according to the screen size:',
    'The result of the code above will be a padding of 10% of the height of the screen from top and 10% of the width of the screen from left. That’s how you can set your padding dynamically. ( Also be aware that you cannot use const keyword if you’re using mediaQuery values as the value is not available at the compile time.',
    'What you are doing right now is that there will be a padding of 10 pixels from top and 10 pixels from left side of the screen. So that the Container might have bigger or smaller shapes on different screen sizes. You can do it dynamically by using the screenSize values and media query so that you set the padding according to the screen size:',
  ];

  @override
  Widget build(BuildContext context) {
    var screen_width = MediaQuery.of(context).size.width;
    // Icon postSubscribe = Icon(Icons.notifications_none_rounded);
    return Scaffold(
      appBar: AppBar(
        elevation: 1.5,
        leadingWidth: 100,
        title: const Text(''),
        backgroundColor: Colors.black26,
        actions: [
          IconButton(
              onPressed: () => sort_comments(context),
              icon: Icon(Icons.format_line_spacing_rounded)),
          // IconButton(
          //   onPressed: () {
          //     setState(() {
          //       postSubscribe =
          //           (postSubscribe == Icon(Icons.notifications_none_rounded))
          //               ? Icon(Icons.notifications)
          //               : Icon(Icons.notifications_none_rounded);
          //     });
          //   },
          //   icon: postSubscribe,
          //   color: Colors.white,
          // ),
          const PopupMen(MenuList: [
            PopupMenuItem(
                child: ListTile(
              leading: Icon(Icons.share_outlined),
              title: Text("Share"),
            )),
            PopupMenuItem(
                child: ListTile(
              leading: Icon(Icons.notifications_none_rounded),
              title: Text("Subscribe"),
            )),
            PopupMenuItem(
                child: ListTile(
              leading: Icon(Icons.bookmark_border_rounded),
              title: Text("Save"),
            )),
            PopupMenuItem(
                child: ListTile(
              leading: Icon(Icons.content_copy_rounded),
              title: Text("Copy text"),
            )),
            PopupMenuItem(
                child: ListTile(
              leading: Icon(Icons.remove_red_eye),
              title: Text("Hide"),
            )),
            PopupMenuItem(
                child: ListTile(
              leading: Icon(Icons.block_outlined),
              title: Text("Block account"),
            )),
            PopupMenuItem(
                child: ListTile(
              leading: Icon(Icons.flag),
              title: Text("Report"),
            )),
          ], icon: Icon(Icons.more_vert_rounded)),
          CircleAvatar(
            radius: 16.0,
            child: ClipRRect(
              child: Image.asset('assets/kareem.jpg'),
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),

      /// view mobile or web depending on width of the device
      body: (screen_width < 600)
          ? Stack(alignment: AlignmentDirectional.bottomCenter, children: [
              /// Main screen for mobile post
              SingleChildScrollView(
                child: Container(
                  child: Column(children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        CircleAvatar(
                          radius: 16.0,
                          child: ClipRRect(
                            child: Image.asset('assets/kareem.jpg'),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Text("r/${widget.communityName}"),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "u/${widget.username} . ",
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                ),
                                Text(
                                  "${widget.createdAt}",
                                  style: TextStyle(color: Colors.black45),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        child: Column(
                          children: [
                            // title
                            Row(
                              children: [
                                SizedBox(
                                  width: screen_width * 0.9,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${widget.title}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (widget.type == "image")
                              Container(
                                child: Image.asset(
                                  "${widget.attachments[0]}",
                                  fit: BoxFit.cover,
                                ),
                              )
                            else
                              Text(
                                "${widget.text}",
                                style: TextStyle(fontSize: 14),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Spacer(
                          flex: 2,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  Provider.of<MobilePostProvider>(context)
                                      .likePost();
                                });
                              },
                              icon: Icon(
                                CustomIcons.up_outline,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ),
                            Text(
                              '${widget.votesCount}',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    Provider.of<MobilePostProvider>(context)
                                        .disLikePost();
                                  });
                                },
                                icon: Icon(
                                  CustomIcons.down_outline,
                                  color: Colors.grey,
                                  size: 20,
                                )),
                          ],
                        ),
                        Spacer(
                          flex: 10,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    CustomIcons.comment,
                                    color: Colors.grey,
                                    size: 20,
                                  )),
                              Text(
                                "${widget.commentsNumber}",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 10,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.share_outlined,
                                    color: Colors.grey,
                                    size: 20,
                                  )),
                              Text(
                                "Share",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 10,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CustomIcons.gift,
                              color: Colors.grey,
                              size: 20,
                            )),
                        // Spacer(flex: 2,),
                      ],
                    ),

                    Container(
                        width: double.infinity,
                        height: 5,
                        color: Color.fromRGBO(242, 243, 244, 1),
                        child: Text("")),

                    /// Comments area
                    Column(
                      children: <Widget>[
                        for (var item in commentsText)
                          comments(
                            text: item,
                            //   username: widget.CommentsList[0].username,
                            //   userPhoto:widget.CommentsList[0].userPhoto,
                            //   votesCount:widget.CommentsList[0].votesCount,
                            //   text:widget.CommentsList[0].text,
                            //   createdAt:widget.CommentsList[0].createdAt,
                          ),
                        // commentReply(
                        //   commentReplyText: "Hello",
                        // )
                      ],
                    ),

                    SizedBox(
                      height: 40,
                      width: double.infinity,
                    )
                  ]),
                ),
              ),

              /// Add new comment area
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(242, 243, 244, 1),
                              borderRadius: BorderRadius.circular(6)),
                          width: screen_width * 0.82,
                          height: 40,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '  Add a comment',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.expand_circle_down_rounded,
                            color: Colors.blue,
                            size: 32,
                          )),
                    ],
                  ),
                ),
              ),
            ])

          /// Web post view
          : WebPostPage(),
    );
  }
}