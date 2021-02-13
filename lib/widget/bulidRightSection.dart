import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/screens/details_screen.dart';

import '../constant.dart';
import 'custom_app.dart';

class BulidRightSection extends StatelessWidget {

  List<FoodModel> foodList =FoodModel.list;

  PageController pageController =PageController(viewportFraction: 0.7);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        children: <Widget>[
          CustomApp(),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  height: 350,
                  child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: foodList.length,
                    controller: pageController,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => DetailsScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Stack(
                            children: <Widget>[
                              _buildBackGround(index),
                              Align(
                                alignment: Alignment.topRight,
                                child: Transform.rotate(
                                  angle: pi / 3,
                                  child: Hero(
                                    tag: "image${foodList[index].imgPath}",
                                    child: Image(
                                      width: 180,
                                      image: AssetImage(
                                          "assets/${foodList[index].imgPath}"),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 30,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.redColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 16,
                                  ),
                                  child: Text(
                                    "\$${foodList[index].price.toInt()}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    "Popular",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
                _buildPopularList(),
              ],
            ),
          )
        ],
      ),
    );
  }
    Container _buildBackGround(int index) {
      return Container(
        margin: EdgeInsets.only(
          top: 50,
          bottom: 20,
          right: 50,
        ),
        padding: EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: AppColors.greenColor,
          borderRadius: BorderRadius.all(
            Radius.circular(32),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: SizedBox()),
            Row(
              children: <Widget>[
                RatingBar(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 12,
                  unratedColor: Colors.black12,
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
//                  itemBuilder: (context, _) => Icon(
//                    Icons.star,
//                    color: Colors.black,
//                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                SizedBox(width: 10),
                Text(
                  "(120 Reviews)",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Text(
              "${foodList[index].name}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      );
    }

  Widget _buildPopularList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: foodList.length,
      padding: EdgeInsets.only(
        left: 40,
        bottom: 16,
        top: 20,
      ),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
          child: Row(
            children: <Widget>[
              Image(
                width: 100,
                image: AssetImage("assets/${foodList[index].imgPath}"),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${foodList[index].name}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: <Widget>[
                      Text(
                        "\$${foodList[index].price.toInt()}",
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.redColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        "(${foodList[index].weight.toInt()}gm Weight)",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
  }

