import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/screens/grindView.dart';
import 'package:instagram/screens/home_page.dart';
import 'package:instagram/utils/images.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 14),
                child: SvgPicture.asset(myImages.nuqta_icon),
              )
            ],
            title: Center(
                child: Text(
              "username",
              style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
            )),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                            width: 100,
                            height: 100,
                            child: Image.asset(myImages.instagram_profile)),
                        SizedBox(
                          width: 36,
                        ),
                        Column(
                          children: [
                            Text(
                              "0,000",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                            Text(
                              "Posts",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Column(
                          children: [
                            Text(
                              "0,000",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                            Text(
                              "Followers",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 26,
                        ),
                        Column(
                          children: [
                            Text(
                              "0,000",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                            Text(
                              "Following",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
      padding: const EdgeInsets.only(left:12 ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: "Username",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)
              ),
              TextSpan(
                text: "\nLorem ipsum dolor sit  ament, consectetur adipiscing elit, sed do eiusmod tempor inciddidunt ",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400)
          ),
          TextSpan(
            text: "#hashtag",
            style: TextStyle(color: Colors.blue),
          ),
          TextSpan(
            text: "\nLink goes here\n",
            style: TextStyle(color: Colors.blue),
          ),
          TextSpan(
            text: "Followed by",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400)
          ),

          TextSpan(
            text: "username",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)
          ),
           TextSpan(
            text: "and",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400)
          ),
           TextSpan(
            text: "username",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)
          ),
            ],
            ),
            ),
      )
           ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Container(
                            width: 100,
                            height: 34,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(Radius.circular(3)),
                              border: Border.all(color: Colors.grey, width: 0.5),
                            ),
                            child: Center(
                                child: Text(
                              "Follow",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, color: Colors.white),
                            )),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Container(
                            width: 104,
                            height: 34,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(3)),
                              border: Border.all(color: Colors.grey, width: 0.5),
                            ),
                            child: Center(
                                child: Text(
                              "Message",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Container(
                            width: 104,
                            height: 34,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(3)),
                              border: Border.all(color: Colors.grey, width: 0.5),
                            ),
                            child: Center(
                                child: Text(
                              "Email",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Container(
                            child: Container(
                              width: 34,
                              height: 34,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(3)),
                                border: Border.all(color: Colors.grey, width: 0.5),
                              ),
                              child: SvgPicture.asset(
                                myImages.backPas,
                                width: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 90,
                    child: ListView.builder(
                        primary: true,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 6),
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://i.pravatar.cc/300?img=$index"),
                                  ),
                                  shape: BoxShape.circle,
                                  color: Colors.teal,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                child: Text("Story $index"),
                              )
                            ],
                          );
                        }),
                  )
                  ,
                  Column(
                    children: [
                      Container(
                        child: TabBar(
                          // indicator: Colors.black,
                          tabs: [
                          Tab(
                             icon: SvgPicture.asset(myImages.tort_icon, color: Colors.black,width: 20,),
                          ),
                          Tab(
                             icon: SvgPicture.asset(myImages.contact_icon, color: Colors.black,width: 20,),
                          ),
                        ],),
                      ),
                      Container(
                height: MediaQuery.of(context).size.height * 0.836,
                child:  TabBarView(children: [
                  grindViewPage(),
                  Container(),
            ])),
                    ],
                  )

                
                ],
              ),
            ),
          )),
    );
  }
}
