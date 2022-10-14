import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:instagram/models/post_comment.dart';
import 'package:instagram/models/post_model.dart';
import 'package:instagram/screens/commets_page.dart';
import 'package:instagram/screens/story_page.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/utils/images.dart';
import 'package:instagram/widgets/post_comment_widget.dart';
import 'package:instagram/widgets/post_title_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  bool isExpanded=false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        actions: [
          InkWell(child: SvgPicture.asset(myImages.add_icon)),
          SizedBox(
            width: 12,
          ),
          InkWell(child: SvgPicture.asset(myImages.favorite_icon)),
          SizedBox(
            width: 12,
          ),
          InkWell(child: SvgPicture.asset(myImages.messenger_icon)),
          SizedBox(
            width: 12,
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          myImages.instagram_logotip,
          width: 104,
        ),
      ),
      body: Container(
        // height: MediaQuery.of(context).size.height * 0.88,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              historyList(),
              const Divider(
                thickness: 0.4,
                color: Colors.grey,
              ),
              posts(),
            ],
          ),
        ),
      ),
    );
  }

  Widget historyList() {  
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>MoreStories()));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    height: 60,
                    width: 60,
                    decoration:
                        BoxDecoration(
                          image: DecorationImage(image: NetworkImage(postModel.posts[index].userLogo)),
                          shape: BoxShape.circle, color: Colors.teal),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  child: Text(postModel.posts[index].userName),
                )
              ],
            );
          }),
    );
  }

  Widget posts() {
    return  ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            constraints: BoxConstraints(minHeight: 160),
            child: postItem(postModel.posts[index]),
          );
        },
        itemCount: postModel.posts.length,
      );
  }

  Widget postItem(postModel post){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 9),
                  height: 30,
                  width: 30,
                  decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                    image: NetworkImage(post.userLogo),
                  fit: BoxFit.cover)),
                ),
                 const SizedBox(width: 4,),
                 Text(post.userName, style: TextStyle(fontWeight: FontWeight.w500),)
              ],
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz_rounded)),
          ],
        ),
        ExpandablePageView.builder(
          onPageChanged: (index){
            setState(() {
              post.imageIndecator=index;
            });
          },
          scrollDirection: Axis.horizontal,
          itemCount: post.images.length,
          itemBuilder: (BuildContext context, int index){
            return postImage(post.images[index]);
          },
        ),
        postActions(post), 
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text("${post.likeCount} Likes", style: TextStyle(fontWeight: FontWeight.w700),),
        ),
        SizedBox(height: 8,),
        PostTitle(post: post, moreTap: (){
          setState(() {
            post.isExpandedTitle=!post.isExpandedTitle;
          });
        }),
        postCommentsAndAddComment(post),
      ],
    );
  }

  Widget postImage(String imageUrl){
    return CachedNetworkImage(
      fit: BoxFit.fitWidth,
      imageUrl: imageUrl,placeholder: (context, url)=>SizedBox(
      width: double.infinity,
      height: 300,
      child: Center(child: CircularProgressIndicator()),
      ),
    errorWidget: (context,url,error)=>SizedBox(
      width: double.infinity,
      height: 300,
      child: Icon(Icons.error, size: 120,),
      ),
    );
  }

  Widget postActions(postModel post){
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 9, bottom: 2,right: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            InkWell(
              onTap: (){
                setState(() {
                  post.isLiked=!post.isLiked;
                });
              },
              child: !post.isLiked? Icon(Icons.favorite_border_outlined):Icon(Icons.favorite_outlined,color: Colors.red,)
            ),
            SizedBox(width: 8,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=> CommentsPage(post: post)));
              },
              child: SvgPicture.asset(myImages.comment_icon)),
            SizedBox(width: 8,),
            SvgPicture.asset(myImages.share_icon),
          ],),
          postIndecator(post.imageIndecator),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: (){}, icon: Icon(Icons.bookmark_outline))
        ],
      ),
    );
  }

  Widget postIndecator(int currentIndex){
    return Container(
      margin: EdgeInsets.only(right: 24),
      height: 42,
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index){
          return Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentIndex==index?myColors.C_32B5FF:myColors.C_C4C4C4,
              ),
            );
      },
      separatorBuilder: (BuildContext context,int index){
        return SizedBox(width: 4,);
      },),
    );
  }

  String newComment="";
  var controller=TextEditingController();
  
  Widget postCommentsAndAddComment(postModel post){
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 4),
      child: Column(
        children: [
          const SizedBox(height: 4,),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            primary: false,
            shrinkWrap: true,
            itemCount: post.comments.length,
            itemBuilder: (BuildContext context, int index){
              return PostCommentWidget(comment: post.comments[index]);
            },
          ),
          Row(
            children: [
               Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 9),
                  height: 25,
                  width: 25,
                  decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                    image: NetworkImage("${postModel.baseUrl}30.jpg"),
                  fit: BoxFit.cover)),
                ),
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: (value){
                    setState(() {
                         newComment=value;
                    });
                 
                  },
                  decoration: InputDecoration(
                    hintText: "Add comment...",
                    border: InputBorder.none,
                  ),
                ),
              ),
              TextButton(onPressed: newComment.isNotEmpty?(){
                setState(() {
                  if(newComment.isNotEmpty){
                  post.comments.add(
                    PostComment("User  ", "", "$newComment")
                  );
                  newComment='';
                  controller.text="";}
                });
              }:null,
              child: Text(
                "Post", 
                style: TextStyle(color:controller.text.isNotEmpty
                ? Colors.blue
                : Colors.blue.withOpacity(0.5)
                ),))
            ],
          )
        ],
      ),
    );
  }
  Widget postTitle(postModel post){
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
            ..onTap=(){
              setState(() {
                post.isExpandedTitle=!post.isExpandedTitle;
              });
          }
        )
          ],
          ),
          )
    );
  }
}