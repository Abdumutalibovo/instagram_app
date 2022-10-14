import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram/models/post_model.dart';
import 'package:instagram/widgets/post_comment_widget.dart';
import 'package:instagram/widgets/post_title_widget.dart';

class CommentsPage extends StatefulWidget {
  postModel post;

  CommentsPage({Key? key, required this.post}):super(key: key);

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Comments", style: TextStyle(color: Colors.black),),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.share))],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 12,),
            PostTitle(post: widget.post, moreTap: (){}),
            SizedBox(height: 12,),
            Divider(thickness: 0.5, color: Colors.grey,),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: ListView.builder(
                itemCount: widget.post.comments.length,
                primary: true,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
                return PostCommentWidget(comment: widget.post.comments[index],);
              }),
            )
            ]
            )),
      ),
    );
  }
}