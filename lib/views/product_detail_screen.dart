import 'package:apicallinflutter/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  final MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    var productId = Get.arguments;
    print(productId);

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.getDetails(productId['pid']);
    });

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Details Of Product'),
      ),
      body: GetBuilder<MainController>(
        builder: (controller) {
        return  controller.productDetails.isEmpty
              ? Text('')
              : Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Theme.of(context).primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)),
                          child: Image.network(
                            controller.productDetails['productImage'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Product Name:   :${controller.productDetails['productName']}  ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Description  :  ${controller.productDetails['productDescription']}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Price : ${controller.productDetails['price']} ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }
}
