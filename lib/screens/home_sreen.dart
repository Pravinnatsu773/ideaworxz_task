import 'package:flutter/material.dart';
import 'package:ideaworxz/screens/product_list_screen.dart';
import 'package:ideaworxz/services/api_services/product_list_api.dart';
import 'package:ideaworxz/services/model/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<ProductModel>? productList;

  bool isLoading = true;

  @override
  void initState() {
    getAllProductList();
    
    super.initState();
  }

  getAllProductList()async{
    productList = await ProductListApi().getProductList();
   setState(() {
      isLoading = false;
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title:const Text("PRODUCT LIST ", style: TextStyle(
          color: Colors.black
        ),),
        
      ),


      body: (isLoading == true)?CircularProgressIndicator():SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 16,),
            Container(
              
              margin: EdgeInsets.all(10),

               decoration: const BoxDecoration(
                    // color: Colors.white,
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                   boxShadow: [
                   
                BoxShadow(
                      offset: Offset(2, 2),
                      blurRadius: 12,
                      color: Color.fromRGBO(0, 0, 0, 0.16),
                )
               ]),
              height: 70,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_drop_down),
                        SizedBox(width: 5,),
                    Text("SORT", style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(width: 5,),
                VerticalDivider(
  color: Colors.black,
  thickness: 2,
),

  Row(
    children: [
      Icon(Icons.arrow_drop_down),
      SizedBox(width: 5,),
                    Text("REFINE", style: const TextStyle(fontWeight: FontWeight.bold)),
    ],
  ),

              ],),

            ),

            SizedBox(height: 16,),
            ProductListScreen(
              productList: productList!,
            )
      
          ]
          
          ),
      ),
    );
  }
}