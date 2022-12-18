import 'package:flutter/material.dart';
import 'package:reddit/styles/custom_icons.dart';
import 'package:reddit/views/widgets/post/popup_menu.dart';

/// Mobile comment widget used in mobile post page
class commentReply extends StatefulWidget {
  // String username;
  // String createdAt;
  // String text;
  // var userPhoto;
  // int votesCount;
  String commentReplyText;

  commentReply(
      {Key? key,
      // required this.userPhoto,
      // required this.username,
      // required this.createdAt,
      // required this.text,
      // required this.votesCount,
      required this.commentReplyText})
      : super(key: key);

  @override
  State<commentReply> createState() => _commentReplyState();
}

class _commentReplyState extends State<commentReply> {
  double container_height = 230;
  TextOverflow commentReply_text = TextOverflow.clip;
  bool is_visible = true;

  @override
  Widget build(BuildContext context) {
    var screen_size = MediaQuery.of(context).size;

    /// controlling the size of the comment when clicked
    return InkWell(
      onTap: () => setState(() {
        container_height = container_height == 50 ? 230 : 50;
        commentReply_text =
            container_height == 50 ? TextOverflow.ellipsis : TextOverflow.clip;
        is_visible = container_height == 50 ? false : true;
      }),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 250),
          height: container_height,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 7,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 10.0,
                        child: ClipRRect(
                          child: Image.asset('assets/kareem.jpg'),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text("Kareem Ashraf"),
                    ),
                    Text(" . 21h")
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${widget.commentReplyText}",
                    overflow: commentReply_text,
                    style: TextStyle(),
                  ),
                ),
              ),
              Visibility(
                visible: is_visible,
                child: Row(
                  children: [
                    Spacer(
                      flex: 10,
                    ),
                    PopupMen(MenuList: [
                      PopupMenuItem(
                          child: ListTile(
                        leading: Icon(Icons.share_outlined),
                        title: Text("Share"),
                      )),
                      PopupMenuItem(
                          child: ListTile(
                        leading: Icon(Icons.bookmark_border_rounded),
                        title: Text("Save"),
                      )),
                      PopupMenuItem(
                          child: ListTile(
                        leading: Icon(Icons.notifications_none_rounded),
                        title: Text("Get reply notifications"),
                      )),
                      PopupMenuItem(
                          child: ListTile(
                        leading: Icon(Icons.content_copy_rounded),
                        title: Text("Copy text"),
                      )),
                      PopupMenuItem(
                          child: ListTile(
                        leading: Icon(Icons.close_fullscreen),
                        title: Text("Collapse thread"),
                      )),
                      PopupMenuItem(
                          child: ListTile(
                        leading: Icon(Icons.edit),
                        title: Text("Edit"),
                      )),
                      PopupMenuItem(
                          child: ListTile(
                        leading: Icon(Icons.delete),
                        title: Text("Delete"),
                      )),
                    ], icon: Icon(Icons.more_vert_rounded)),
                    InkWell(
                      onTap: () {},
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.reply_sharp),
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                        onPressed: () {}, icon: Icon(CustomIcons.up_outline)),
                    Text("458"),
                    IconButton(
                        onPressed: () {}, icon: Icon(CustomIcons.down_outline)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}