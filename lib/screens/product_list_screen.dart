import 'package:flutter/material.dart';
import 'package:ideaworxz/screens/product_detail_screen.dart';
import 'package:ideaworxz/services/model/product_model.dart';

class ProductListScreen extends StatefulWidget {
  final List<ProductModel> productList;
  ProductListScreen({Key? key, required this.productList}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: GridView.count(
        childAspectRatio: (MediaQuery.of(context).size.width * 0.5 / 300),
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        children: List.generate(widget.productList.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductDetailScreen(product: widget.productList[index],)),
              );
            },
            child: Container(
            padding: EdgeInsets.all(5),
        
              margin: EdgeInsets.all(5),

               decoration: const BoxDecoration(
                    color: Colors.white,
                   boxShadow: [
                   
                BoxShadow(
                      offset: Offset(2, 2),
                      blurRadius: 12,
                      color: Color.fromRGBO(0, 0, 0, 0.16),
                )
               ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Image.network(
                    widget.productList[index].imageLink,
                    fit: BoxFit.contain,
                  )),
                   SizedBox(height: 10,),
                  Text("${widget.productList[index].title}", style: const TextStyle(fontSize: 14, )),
                  SizedBox(height: 5,),
                  Text("\$${widget.productList[index].price.toString()}", style: const TextStyle(fontSize: 16, ))
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
