import 'package:abdalla_mansour_course1/modules/shop_app/shop_login_screen/shop_login_screen.dart';
import 'package:abdalla_mansour_course1/shared/components/components.dart';
import 'package:abdalla_mansour_course1/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class BoardingModel{
  final String title;
  final String image;
  final String body;

  BoardingModel({
    @required this.title,
    @required this.image,
    @required this.body,
  });
}
class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pageController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: "assets/images/img.png",
      title: "title 1 ",
      body: "body 1 ",
    ),
    BoardingModel(
      image: "assets/images/img2.jpg",
      title: "title 2 ",
      body: "body 2 ",
    ),
    BoardingModel(
      image: "assets/images/img3.jpg",
      title: "title 3 ",
      body: "body 3 ",
    ),
  ];
bool isLast=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed:submit,
              child: Text("SKIP"),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index){
                  if(index==boarding.length-1)
                  {
                    setState(() {
                      isLast=true;
                    });
                  }
                  else
                  {
                    setState(() {
                      isLast=false;
                    });
                  }
                },
                controller: pageController,
                physics:BouncingScrollPhysics() ,
                itemCount: boarding.length,
                itemBuilder: (context,index)=>buildBoardingItem(boarding[index]),
              ),
            ),
            SizedBox(height: 40,),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: pageController,
                    count: boarding.length,
                effect: ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: Colors.deepOrange,
                  dotWidth: 10,
                  dotHeight: 10,
                  expansionFactor: 4,
                  spacing: 5,
                ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: (){
                    setState(() {
                      if(isLast){
                        submit();
                      }
                      else
                      {
                        pageController.nextPage(
                          duration: Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.easeInOutCubicEmphasized,
                        );
                      }
                    });

                  },
                child: Icon(Icons.arrow_forward_ios,
                ),),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image: AssetImage(model.image),
        ),
      ),
      SizedBox(height: 30,),
      Text(model.title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
      SizedBox(height: 15,),
      Text(model.body,
        style: TextStyle(
          fontSize: 14,

        ),),
    ],
  );

  void submit(){
    CacheHelper.saveData(
      key: "onBoarding",
        value: true,
    ).then((value)
    {
      if(value)
      {
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(
          builder: (context)=>ShopLoginScreen(),
        ), (route) => false);
      }
    });
  }
}
