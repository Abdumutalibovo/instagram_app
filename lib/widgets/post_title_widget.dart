import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram/models/post_model.dart';

class PostTitle extends StatelessWidget {
  postModel post;
  VoidCallback moreTap;

  PostTitle({Key? key, required this.post, required this.moreTap}): super(key: key); 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:12 ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "${post.userName}  ",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)
            ),
            TextSpan(
              text: post.userTitle.substring(0,
              ! post.isExpandedTitle? (post.userTitle.length>90 ? 90: post.userTitle.length):post.userTitle.length),
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400)
        ),
        TextSpan(
          text: !post.isExpandedTitle ? (post.userTitle.length>90 ? "... more":""):"\nshow less",
          style: TextStyle(color: Colors.grey),
          recognizer: TapGestureRecognizer()
            ..onTap=moreTap,
        )
          ],
          ),
          )
    );
  }
}