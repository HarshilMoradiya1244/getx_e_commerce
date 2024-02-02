import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/screen/home/controller/home_controller.dart';
import 'package:getx_ecommerce/screen/home/model/home_model.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ProductController controller = Get.put(ProductController());
  ProductModel model = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(" Product Detail"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.network(
                  "${model.image}",
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  width: MediaQuery.sizeOf(context).width * 0.3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(child: Text("${model.category}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                    const SizedBox(height: 15,),
                    Text("${model.tittle}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                    const SizedBox(height: 15,),
                    Text("${model.description}",style: const TextStyle(fontSize: 16),),
                    const SizedBox(height: 15,),
                    Text("₹ ${model.price}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 15,),
                    Text("⭐⭐⭐⭐⭐ ${model.ratingModel!.rate}",style: const TextStyle(fontSize: 15),),
                    const SizedBox(height: 20,),
                    Center(
                      child: ElevatedButton(onPressed: (){
                        controller.cartList.add(model);
                        Get.back();
                      }, child: const Text("Add Cart"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
