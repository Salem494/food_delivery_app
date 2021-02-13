
import 'package:flutter/material.dart';
import 'package:food_delivery/constant.dart';
import 'package:food_delivery/models/product.dart';

class DetailsScreen extends StatelessWidget {
  final FoodModel data;

  List<FoodModel> foodList = FoodModel.list;

   DetailsScreen({Key key, this.data});


  @override
  Widget build(BuildContext context) {

//    print('salem : ${data.name[0]}');


    return Scaffold(
      backgroundColor: AppColors.greenColor,
      body:Column(
        children: [
          _buildAppBar(context),
          Container(
            width: double.infinity,
            height: 300,
            child: Stack(
              children: [
                Image(
                  image: AssetImage('assets/bg.png'),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage('assets/${foodList[0].imgPath}'),
                  ),
                ),
              ],
            ),
          ),
          Text('Food Display Here',style: TextStyle(
            fontWeight:FontWeight.bold,
            fontSize: 20
          ),),
          SizedBox(height: 5,),
          Expanded(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height ,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                  children:<Widget> [
                    SizedBox(height: 15,),
                    Text('${foodList[0].name}',style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 10,),
                    Text('\$${foodList[0].price.toString()}',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.redColor,
                      fontSize: 20
                    ),),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _Info('Weight', '${foodList[0].weight.toDouble()}Weight' ),
                        _Info('Calory' , '${foodList[0].calory.toString()}cal' ),
                        _Info('Protein' , '${foodList[0].protein.toString()}pr' ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      width: 300,
                      height: 50,
                      child: RaisedButton(
                        child: Text('Add To Cart'),
                          onPressed: (){},
                          color: AppColors.greenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 3,
                      ),
                    ),
                    SizedBox(height: 15,)
                  ],
              ),
            ),
          ),
//          SizedBox(height: 15,)
        ],
      ),

    );
  }

  Widget _Info(String title,String val){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
              Text(title,style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),),

              Text(val.toString(),style: TextStyle(
                color: AppColors.redColor
              ),),
            ],
      ),
    );
  }

  Widget _buildAppBar(context){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 15
      ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white
                ),
                child: FlatButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child:Icon(Icons.arrow_back_ios))),
            Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white
                ),
                child: Icon(Icons.store)),

          ],
        ),
    );
  }
}
