import 'package:flutter/material.dart';

import '../services/model/product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel product;
  ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> with SingleTickerProviderStateMixin{
  late PageController _pageController;
   late TabController _tabController;

  int activePage = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
     _tabController = new TabController(length: 2, vsync: this);
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(5),
        width: 14,
        height: 14,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black38 : Colors.white,
            shape: BoxShape.circle),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "PRODUCT DETAIL ",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: 1000,
                margin: const EdgeInsets.only(top: 16, right: 16, left: 16),
                padding: const EdgeInsets.all(16),
               
                 decoration: const BoxDecoration(
                    color: Colors.white,
                   boxShadow: [
                   
                BoxShadow(
                      offset: Offset(2, 2),
                      blurRadius: 12,
                      color: Color.fromRGBO(0, 0, 0, 0.16),
                )
               ]),
                child:
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            height: 300,
                            width: MediaQuery.of(context).size.width,
                            child: Expanded(
                                child: PageView.builder(
                                    itemCount: 3,
                                    pageSnapping: true,
                                    controller: _pageController,
                                    onPageChanged: (page) {
                                      setState(() {
                                        activePage = page;
                                      });
                                    },
                                    itemBuilder: (context, pagePosition) {
                                      return Container(
                                          margin: const EdgeInsets.all(10),
                                          child: Image.network(
                                              widget.product.imageLink));
                                    })),
                          ),
                          Positioned(
                            top: 250,
                            right: MediaQuery.of(context).size.width / 2.7,
                            child: Container(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: indicators(3, activePage)),
                            ),
                          )
                        ],
                      ),
                      Text(widget.product.title, style: const TextStyle(fontSize: 18, ),),
                    ],
                  ),
                  const SizedBox(height: 16,),
                  Text('\$${widget.product.price.toString()}', style: const TextStyle(fontSize: 18, ),),
                  const Divider(
                    thickness: 2,
                  ),
                   const SizedBox(height: 5,),
                  GestureDetector(
                    onTap: () {
                      print("taped..");
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.tag_outlined),
                        SizedBox(width: 16,),
                        Text('Tap to get further info')
                      ],
                    ),
                  ),
                   const SizedBox(height: 5,),
                  const Divider(
                    thickness: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.scale),
                            SizedBox(width: 16,),
                            Text('Size')
                          ],
                        ),
                        TextButton(
                          onPressed: (){
                            print('Tapped....');
                          },
                          child: const Text('Size chart'),)
                      ],
                    ),

                     const SizedBox(height: 16,),
          
          
                      TabBar(
                    // unselectedLabelColor: Colors.black,
                    labelColor: Colors.black,
                    labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold ),
                    tabs: const [
                      Tab(
                      text: 'Details',
                      
                      ),
                      Tab(
                      text: 'Material & Care',
                      )
                    ],
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
          
                  Expanded(
                    child: TabBarView(
                      children: [
                        
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           const SizedBox(height: 5,),
                          Text(widget.product.description),
                           const SizedBox(height: 16,),
                          const Text('Style Note', style: const TextStyle(fontWeight: FontWeight.bold)),
                           const Divider(
                    thickness: 2,
                  ),
                           Text(widget.product.category),

                          const SizedBox(height: 16,),
                          const Text('More Info', style: TextStyle(fontWeight: FontWeight.bold),),
                           const Divider(
                    thickness: 2,
                  ),
                          const Text('Product code: 410'),
                          const Text("Tax info: Applicable GST will be charged at the time of chekout")
                        ]),
                        
                        
                         const Center(child: Text('Material & Care'))],
                      controller: _tabController,
                    ),
                  ),
                ]),
              ),
            ),
          ),

          Row(
            children: [
              GestureDetector(
                child: Container(
                  
                 decoration: const BoxDecoration(
                   color: Colors.grey
                  ),
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width*0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                    Icon(Icons.menu, color: Colors.white),
                    
                    Text('SAVE', style: TextStyle(color: Colors.white),)
                  ],)),
              ),

               GestureDetector(
            child: Container(
              
             decoration: const BoxDecoration(
               color: Colors.green
              ),
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width*0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                Icon(Icons.shopping_bag, color: Colors.white,),
                SizedBox(width: 5,),
                Text('ADD TO BAG', style: TextStyle(color: Colors.white),)
              ],)),
          )
            ],
          )
        ],
      ),
    );
  }
}
