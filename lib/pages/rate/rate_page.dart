import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:getx_app/pages/home/home_controller.dart';
import 'package:getx_app/pages/photos/loading_overlay.dart';
import 'package:getx_app/services/backend_service.dart';
import 'package:getx_app/themes/color_theme.dart';
import 'package:getx_app/widget/photo_widget/photohero.dart';
import 'rate_controller.dart';

class RatePage extends GetView<RateController> {
  CarouselController carouselController = new CarouselController();
  final _nativeAdController = NativeAdmobController();
  List<String> imageList = [];
  var currentPos=0;
  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = new CarouselController();
    return Scaffold(
      body:
      /*Center(
        child:FutureBuilder(
            future: Dataservices.fetchProductx(),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              var data = snapshot.data;
              if (snapshot.data != null){
                data=data.reversed.toList()..shuffle();
              }
              return data != null
                  ?
              CarouselSlider.builder(
                itemCount: data.length,
                carouselController: carouselController,
                options: CarouselOptions(
                    height: 800,
                    scrollDirection: Axis.vertical,
                    initialPage: 0,
                    viewportFraction: 1,
                    aspectRatio: 16 / 9,
                    enableInfiniteScroll: false,
                    autoPlay: false),
                itemBuilder: (BuildContext context, int itemIndex,
                    int pageViewIndex) =>
                    Stack(
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadiusDirectional.circular(
                                  20)),
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            padding: const EdgeInsets.all(0.0),
                            height: double.infinity,
                            color: Color(0xFFF70759),
                            child: PhotoHero(
                              photo: data.reversed.toList()[itemIndex]["url"],
                              width: double.infinity,
                              height: double.infinity,
                              onTap: () {
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          left: 80,
                          top: 400,
                          child: Container(
                            child: Column(
                              children: [
                                Text("Glissez pour noter", style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: 'Raleway',
                                )),
                                RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    carouselController.nextPage();
                                  },
                                ),
                              ],
                            ),
                            decoration: new BoxDecoration(
                                color: Colors.white24,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(12))),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child:
                              Container(
                                  margin: EdgeInsets.all(8),
                                  height: 90,
                                  color: Colors.white24,
                                  child: NativeAdmob(
                                    adUnitID: banniereUnitID,
                                    controller: _nativeAdController,
                                    type: NativeAdmobType.full,
                                    loading: Center(child: CircularProgressIndicator()),
                                    error: Text('failed to load'),
                                  ))
                          ),
                        ),
                      ],
                    ),
              )
                  : const CircularProgressIndicator();
            }),
      )*/
      Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: GetBuilder<HomeController>(
                  builder: (controller) {
                    return  LoadingOverlay(
                        isLoading: controller.isLoading,
                        child:
                        CarouselSlider.builder(
                          itemCount: controller.productsList.length,
                          carouselController: carouselController,
                          options: CarouselOptions(
                              height: 800,
                              scrollDirection: Axis.vertical,
                              initialPage: 0,
                              viewportFraction: 1,
                              aspectRatio: 16 / 9,
                              enableInfiniteScroll: false,
                              autoPlay: false),
                          itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                              Stack(
                                children: <Widget>[
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadiusDirectional.circular(
                                            20)),
                                    clipBehavior: Clip.antiAlias,
                                    child: Container(
                                      padding: const EdgeInsets.all(0.0),
                                      height: double.infinity,
                                      color: Color(0xFFF70759),
                                      child: PhotoHero(
                                        photo: controller.productsList.reversed.toList()[itemIndex].url,
                                        width: double.infinity,
                                        height: double.infinity,
                                        onTap: () {
                                        },
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 80,
                                    top: 400,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Text("Glissez pour noter", style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontFamily: 'Raleway',
                                          )),
                                          RatingBar.builder(
                                            initialRating: 3,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 4.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              carouselController.nextPage();
                                            },
                                          ),
                                        ],
                                      ),
                                      decoration: new BoxDecoration(
                                          color: Colors.white24,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child:
                                        Container(
                                            margin: EdgeInsets.all(8),
                                            height: 90,
                                            color: Colors.white24,
                                            child: NativeAdmob(
                                              adUnitID: banniereUnitID,
                                              controller: _nativeAdController,
                                              type: NativeAdmobType.full,
                                              loading: Center(child: CircularProgressIndicator()),
                                              error: Text('failed to load'),
                                            ))
                                    ),
                                  ),
                                ],
                              ),
                        )
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
