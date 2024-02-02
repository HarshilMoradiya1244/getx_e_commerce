import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getx_ecommerce/screen/home/model/home_model.dart';
import 'package:getx_ecommerce/utils/api_helper.dart';

class ProductController extends GetxController{
  RxList<ProductModel> productList = <ProductModel>[].obs;
  RxList<ProductModel> cartList = <ProductModel>[].obs;

  Future<void> getData() async {
    ApiHelper apiHelper = ApiHelper();
    List<ProductModel>? datalist = await apiHelper.productApi();
    if (datalist != null) {
      productList.value = datalist;
    }
  }

}