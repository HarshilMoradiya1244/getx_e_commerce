import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/screen/home/controller/home_controller.dart';

class ProductCartScreen extends StatefulWidget {
  const ProductCartScreen({super.key});

  @override
  State<ProductCartScreen> createState() => _ProductCartScreenState();
}

class _ProductCartScreenState extends State<ProductCartScreen> {
  ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Your Cart"),
      ),
      body: Obx(
            () => ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding:const EdgeInsets.all(10),
              leading: Image.network(
                "${controller.cartList[index].image}",
                height: MediaQuery.sizeOf(context).height*0.1,
                width: MediaQuery.sizeOf(context).width*0.1,
              ),
              title: Text("${controller.cartList[index].tittle}"),
              subtitle: Text("₹ ${controller.cartList[index].price}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              trailing: IconButton(onPressed: (){
                controller.cartList.removeAt(index);
                Get.snackbar("Delete Successfully", "Add product In Cart");
              },icon: const Icon(Icons.delete),),
            );
          },
          itemCount: controller.cartList.length,
        ),
      ),
    );
  }
}
