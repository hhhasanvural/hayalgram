import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hayalgram/utils/bubble_stories.dart';
import 'package:hayalgram/utils/profile_tab1.dart';
import 'package:hayalgram/utils/profile_tab2.dart';
import 'package:hayalgram/utils/profile_tab3.dart';
import 'package:hayalgram/utils/profile_tab4.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //profile picture
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey[400], shape: BoxShape.circle),
                    ),

                    //number of posts, followers, etc
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                '123',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              Text('Posts')
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '3930',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              Text('Followers'),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '40',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              Text('Following')
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //Name and bio

              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ahmet',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text('Trying to be a better muslim'),
                    ),
                    Text(
                      'https://www.youtube.com/@hayalhanem',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Center(child: Text('Edit Profile')),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Center(child: Text('Ad Tools')),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Center(child: Text('Insıghts')),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //stories
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    BubbleStories(text: 'Story 1'),
                    BubbleStories(text: 'Story 2'),
                    BubbleStories(text: 'Story 3'),
                    BubbleStories(text: 'Story 4'),
                  ],
                ),
              ),
              TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.grid_4x4_outlined),
                  ),
                  Tab(
                    icon: Icon(Icons.video_call),
                  ),
                  Tab(
                    icon: Icon(Icons.shop),
                  ),
                  Tab(
                    icon: Icon(Icons.person),
                  ),
                ],
              ),

              Expanded(
                child: TabBarView(
                  children: [
                    ProfileTab1(),
                    ProfileTab2(),
                    ProfileTab3(),
                    ProfileTab4(),
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
