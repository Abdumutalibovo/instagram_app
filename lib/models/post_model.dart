import 'dart:math';

import 'package:instagram/models/post_comment.dart';

class postModel{
  String userName;
  String userTitle;
  String userLogo;
  List<String> images=[];
  bool isLiked;
  bool isbookMarked;
  int? likeCount = 0;
  List<PostComment> comments=[];
  int imageIndecator=0;
  bool isExpandedTitle=false;


  postModel({
    required this.userName, 
    required this.userLogo,
    required this.images,
    required this.isLiked,
    required this.isbookMarked,
    this.likeCount=0,
    required this.userTitle,
    required this.comments,
    });

    static String baseUrl="https://xsgames.co/randomusers/assets/avatars/male/";
    static final posts=[
      postModel(
        userName: "Odilbek",
        userLogo: "https://xsgames.co/randomusers/assets/avatars/male/${Random().nextInt(70)}.jpg",
        images: [
        "https://xsgames.co/randomusers/assets/avatars/male/${Random().nextInt(70)}.jpg",
        "https://xsgames.co/randomusers/assets/avatars/male/${Random().nextInt(70)}.jpg",
        "https://xsgames.co/randomusers/assets/avatars/male/${Random().nextInt(70)}.jpg",
        "https://xsgames.co/randomusers/assets/avatars/male/${Random().nextInt(70)}.jpg"],
        isLiked: false,
        userTitle: "Lorem ipsum dolor sit ament, consectetur adipiscing elit, sed do eiusmod tempor incidicunt",
        likeCount: 10, 
        comments: [],
        isbookMarked: false),

       postModel(
        userName: "Soliha",
        userLogo: "https://xsgames.co/randomusers/assets/avatars/female/${Random().nextInt(70)}.jpg",
        images: [
        "https://xsgames.co/randomusers/assets/avatars/female/${Random().nextInt(70)}.jpg",
        "https://xsgames.co/randomusers/assets/avatars/female/${Random().nextInt(70)}.jpg",
        "https://xsgames.co/randomusers/assets/avatars/female/${Random().nextInt(70)}.jpg",
        "https://xsgames.co/randomusers/assets/avatars/female/${Random().nextInt(70)}.jpg"],
        isLiked: false, 
        comments: [],
        userTitle: "Lorem ipsum dolor sit ament, consectetur adipiscing elit, sed do eiusmod tempor incidicunt",
        isbookMarked: false),

      postModel(
        userName: "Asrorbek",
        userLogo: "https://xsgames.co/randomusers/assets/avatars/male/${Random().nextInt(70)}.jpg",
        images: [
        "https://xsgames.co/randomusers/assets/avatars/male/${Random().nextInt(70)}.jpg",
        "https://xsgames.co/randomusers/assets/avatars/male/${Random().nextInt(70)}.jpg",
        "https://xsgames.co/randomusers/assets/avatars/male/${Random().nextInt(70)}.jpg",
        "https://xsgames.co/randomusers/assets/avatars/male/${Random().nextInt(70)}.jpg"],
        isLiked: false,
        comments: [], 
        userTitle: "Lorem ipsum dolor sit ament, consectetur adipiscing elit, sed do eiusmod tempor incidicunt",
        isbookMarked: false),

        
      postModel(
        userName: "SolihDev",
        userLogo: "https://xsgames.co/randomusers/assets/avatars/male/${Random().nextInt(70)}.jpg",
        images: [
        "https://xsgames.co/randomusers/assets/avatars/male/${Random().nextInt(70)}.jpg",
        "https://xsgames.co/randomusers/assets/avatars/male/${Random().nextInt(70)}.jpg",
        "https://xsgames.co/randomusers/assets/avatars/male/${Random().nextInt(70)}.jpg",
        "https://xsgames.co/randomusers/assets/avatars/male/${Random().nextInt(70)}.jpg"],
        isLiked: false,
        comments: [], 
        userTitle: "Lorem ipsum dolor sit ament, consectetur adipiscing elit, sed do eiusmod tempor incidicunt. The also best uzbekistan gold yes.",
        isbookMarked: false),
        
        postModel(
        userName: "Oisha",
        userLogo: "https://xsgames.co/randomusers/assets/avatars/female/${Random().nextInt(70)}.jpg",
        images: [
        "https://xsgames.co/randomusers/assets/avatars/female/${Random().nextInt(70)}.jpg",
        "https://xsgames.co/randomusers/assets/avatars/female/${Random().nextInt(70)}.jpg",
        "https://xsgames.co/randomusers/assets/avatars/female/${Random().nextInt(70)}.jpg",
        "https://xsgames.co/randomusers/assets/avatars/female/${Random().nextInt(70)}.jpg"],
        isLiked: false, 
        comments: [
          PostComment("Mansur  ", "${baseUrl}${Random().nextInt(70)}.jpg", "Gap yo'q juda zo'r"),
          PostComment("Mansur  ", "${baseUrl}${Random().nextInt(70)}.jpg", "Men birinchi")
          ],
        userTitle: "Lorem ipsum dolor sit ament, consectetur adipiscing elit, sed do eiusmod tempor incidicunt",
        isbookMarked: false),

        
        postModel(
        userName: "Madina",
        userLogo: "https://xsgames.co/randomusers/assets/avatars/female/${Random().nextInt(70)}.jpg",
        images: [
        "https://xsgames.co/randomusers/assets/avatars/female/${Random().nextInt(70)}.jpg",
        "https://xsgames.co/randomusers/assets/avatars/female/${Random().nextInt(70)}.jpg",
        "https://xsgames.co/randomusers/assets/avatars/female/${Random().nextInt(70)}.jpg",
        "https://xsgames.co/randomusers/assets/avatars/female/${Random().nextInt(70)}.jpg"],
        isLiked: false,
        comments: [PostComment("Abbos  ", "${baseUrl}${Random().nextInt(70)}.jpg", "Istoriyami ko'rmelar")],
        userTitle: "Lorem ipsum dolor sit ament, consectetur adipiscing elit, sed do eiusmod tempor incidicunt. The also best uzbekistan gold yes.", 
        isbookMarked: false),
    ];
}