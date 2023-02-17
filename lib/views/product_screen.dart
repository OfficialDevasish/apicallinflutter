import 'package:apicallinflutter/controllers/main_controller.dart';
import 'package:apicallinflutter/views/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  final MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text("All Product List"),
        ),
        body: GetBuilder<MainController>(
          builder: (controller) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  child: GestureDetector(
                    onTap: (){
                      Get.to(ProductDetailScreen(),arguments: {"pid":controller.productData[index].id});
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Theme.of(context).primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 120,
                            width: double.infinity,
                            child: Image.network(
                              controller.productData[index].productImage,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.productData[index].productName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                IconButton(
                                  onPressed: () {
                                     controller.addTowishList(
                                      controller.productData[index].id);
                                  },
                                  icon: Icon(
                                    controller.productData[index].favourite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Price : ${controller.productData[index].price} ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: controller.productData.length,
            );
          },
        ));
  }
}
