import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shopping_app/feature/discover/model/product.dart';
import 'package:shopping_app/resources/app_theme.dart';
import 'package:shopping_app/resources/colors.dart';
import 'package:shopping_app/widget/appbar.dart';
import 'package:shopping_app/widget/quater_circle.dart';
import 'package:intl/intl.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final formatCurrency = new NumberFormat.simpleCurrency();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0,
        title: Text(
          widget.product.category,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () {},
              color: Colors.redAccent,
              shape: CircleBorder(),
              elevation: 6,
              child: Icon(
                Ionicons.ios_heart,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(
                                  MediaQuery.of(context).size.width / 2))),
                      child: Center(
                          child: Container(
                        margin: EdgeInsets.only(right: 40),
                        child: Image.asset(
                          widget.product.images[0],
                          width: 300,
                          fit: BoxFit.fill,
                        ),
                      ))),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                  height: 100, child: listImageDetails(widget.product.images)),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                child: Container(
                  height: 2,
                  color: Colors.grey[300],
                ),
              ),
              bodyContentDetails()
            ],
          ),
          _buttonAddToBag()
        ],
      ),
    );
  }

  Widget bodyContentDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.product.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                formatCurrency.format(widget.product.price),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.product.description,
            style: TextStyle(color: Colors.black54),
            maxLines: 5,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'MORE DETAILS',
            style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 26,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Size',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Row(
                children: [
                  Text(
                    'UK',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'USA',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          SizedBox(height: 60, child: listSize(widget.product.remainingSizeUS)),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  Widget listImageDetails(List<String> images) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: images.length,
      itemBuilder: (context, index) {
        String image = images[index];
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 6.0),
          width: 100,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Image.asset(
              image,
            ),
          ),
        );
      },
    );
  }

  Widget listSize(List<double> sizes) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: sizes.length,
      itemBuilder: (context, index) {
        double size = sizes[index];
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 6.0),
          width: 100,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey[300]),
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Center(
                child: Text(
                  "$size",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
        );
      },
    );
  }

  Widget _buttonAddToBag() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        width: double.infinity,
        child: RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            onPressed: () {},
            color: AppColors.indianRed,
            child: Text(
              'ADD TO BAG',
              style: whiteText,
            )),
      ),
    );
  }
}
