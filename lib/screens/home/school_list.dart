import 'package:carousel_slider/carousel_slider.dart';
import 'package:find_my_school_updated/models/school.dart';
import 'package:find_my_school_updated/screens/home/school_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SchoolList extends StatefulWidget {
  @override
  _SchoolListState createState() => _SchoolListState();
}

class _SchoolListState extends State<SchoolList> {
  List imgList = [
    'https://talib.pk/wp-content/uploads/2017/10/The-Punjab-School-Township-Campus.jpg',
    'https://i.pinimg.com/736x/ce/46/46/ce46467905f4eb73f0d057a0892b800d.jpg',
    'https://www.lgsdefence.edu.pk/img/new/building.png',
    'https://www.theonlinepoint.com/wp-content/uploads/2019/08/Multan-Public-School-and-College-for-Girlsfront.jpg',
    'https://cdn.shortpixel.ai/client/q_lossy,ret_img,w_1024/https://www.americanlycetuffschool.edu.pk/wp-content/uploads/2020/04/1-1024x576.png',
    'https://i1.wp.com/pakistanijournal.com/wp-content/uploads/2020/05/Top-10-Best-Schools-of-Pakistan-2020-2021.jpg?fit=900%2C500&ssl=1',
    'https://blog.graana.com/wp-content/uploads/2019/09/roots-internatonal-school.jpg',
    'https://i.pinimg.com/originals/8d/37/28/8d372839ed92ce204b036eded4f2aecd.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final schools = Provider.of<List<School>>(context) ?? [];
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
            color: Colors.transparent,
            height: size.height * 0.3,
            width: size.width,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 16 / 9,
                        enlargeStrategy: CenterPageEnlargeStrategy.scale,
                        autoPlayCurve: Curves.linearToEaseOut,
                        height: size.height * 0.25,
                        initialPage: 0,
                        autoPlay: true,
                        enableInfiniteScroll: true,
                        enlargeCenterPage: true,
                        autoPlayInterval: Duration(seconds: 10),
                        //autoPlayInterval: Duration(minutes: 10),
                        autoPlayAnimationDuration: Duration(milliseconds: 2000),
                      ),
                      items: imgList.map((imgUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: size.width,
                              //margin: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.5),
                                    BlendMode.darken),
                                fit: BoxFit.fill,
                                image: NetworkImage(imgUrl),
                              )),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.02),
                        Padding(
                          padding: const EdgeInsets.only(left: 60.0),
                          child: Text(
                            "Find the",
                            style: TextStyle(
                              fontFamily: 'ss',
                              color: Colors.white,
                              fontSize: size.width * 0.1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.015),
                        Padding(
                          padding: const EdgeInsets.only(left: 60.0),
                          child: Text(
                            "Best Schools",
                            style: TextStyle(
                              fontFamily: 'ss',
                              color: Colors.white,
                              fontSize: size.width * 0.1,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )),
        Expanded(
          child: Scrollbar(
            isAlwaysShown: false,
            child: ListView.builder(
                itemCount: schools.length,
                itemBuilder: (context, index) {
                  return SchoolTile(school: schools[index]);
                }),
          ),
        ),
      ],
    );
  }
}
