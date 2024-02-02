import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/screen/home/controller/home_controller.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductController controller = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Shopping App",
          ),
          actions:  [
            IconButton(onPressed: (){
              Get.toNamed("cart");
            }, icon: const Icon(Icons.add_shopping_cart))
          ],
        ),
        body: Obx(
          () => GridView.builder(
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 310),
            itemCount: controller.productList.length,
            itemBuilder: (context, index) => InkWell(
              onTap: (){
                Get.toNamed("detail",
                    arguments: controller.productList[index]);
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all()
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(child: Image.network("${controller.productList[index].image}",height: 80,width: 80,)),
                      Text("${controller.productList[index].tittle}",style: const TextStyle(fontWeight: FontWeight.bold),),
                      Text("₹ ${controller.productList[index].price}",style: const TextStyle(fontWeight: FontWeight.bold),),
                      Text("⭐⭐⭐⭐⭐ ${controller.productList[index].ratingModel!.rate}",style: const TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
