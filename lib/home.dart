import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:loginuicolors/view_page.dart';

class SearchBarDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Search Bar Demo',
        theme: new ThemeData(primarySwatch: Colors.blue),
        home: new HomePage());
  }
}
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

var programeList = [
  {
    "name": "Product 1",
    "image": "assets/flutter.png",
    "price": 6.99,
    "description": "30% off",
  },
  {
    "name": "Product 2",
    "image": "assets/javascript.png",
    "price": 6.99,
    "description": "30% off",
  },
  {
    "name": "Product 3",
    "image": "assets/dotnet.png",
    "price": 6.99,
    "description": "30% off",
  },
  {
    "name": "Product 4",
    "image": "assets/clanguage.png",
    "price": 6.99,
    "description": "30% off",
  },
  {
    "name": "Product 5",
    "image": "assets/python.png",
    "price": 6.99,
    "description": "30% off",
  },
  {
    "name": "Product 6",
    "image": "assets/java.png",
    "price": 6.99,
    "description": "30% off",
  }, {
    "name": "Product 7",
    "image": "assets/ruby.png",
    "price": 6.99,
    "description": "30% off",
  },
  {
    "name": "Product 8",
    "image": "assets/perl.png",
    "price": 6.99,
    "description": "30% off",
  },
  {
    "name": "Product 9",
    "image": "assets/vb.png",
    "price": 6.99,
    "description": "30% off",
  },
  {
    "name": "Product 8",
    "image": "assets/perl.png",
    "price": 6.99,
    "description": "30% off",
  },
];

class _HomePageState extends State<HomePage> {
  late SearchBar searchBar;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        backgroundColor: Colors.black87,
        title: new Text('Find your Programme'),
        actions: [searchBar.getSearchAction(context)]);
  }

  void onSubmitted(String value) {
    setState(() => _scaffoldKey.currentState!
        .showSnackBar(new SnackBar(content: new Text('You wrote $value!'))));
  }

  _HomePageState() {
    searchBar = new SearchBar(
        inBar: false,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        onSubmitted: onSubmitted,
        onCleared: () {
          print("cleared");
        },
        onClosed: () {
          print("closed");
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: searchBar.build(context),
      key: _scaffoldKey,
      body: GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,

        scrollDirection: Axis.vertical,
        itemCount: programeList.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return FeatureProduct(
            productName: programeList[index]['name']?.toString() ?? '',
            productImage: programeList[index]['image']?.toString() ?? '',
            //productPrice: productList[index]['price']?.toString() ?? '',
            productDescription: programeList[index]['description']?.toString() ?? '',
            index: index,
          );
        },
      ),
    );
  }
}

class FeatureProduct extends StatelessWidget {
  final String productImage;
  final String productName;
  final String productDescription;
  // final double productPrice;
  final int index;

  FeatureProduct(
      {required this.productImage,
        required this.productName,
        //  required this.productPrice,
        required this.index,
        required this.productDescription});

  @override
  Widget build(BuildContext context) {

    return Card(
      color: Colors.lightBlue.withOpacity(.8),
      elevation: 0.2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0)),
      child: Hero(
        tag: index,
        child: Material(
          child: InkWell(
            onTap: () {
              // print(productName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => new ProductDetail(
                    product: FeatureProduct(
                      productName: productName,
                      productImage: productImage,
                      productDescription: productDescription, index: index,
                      // productPrice: productPrice,
                    ),
                  ),
                ),
              );
            },
            child: GridTile(
                footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(
                      productName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: Text(
                      "RM $productDescription",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    subtitle: Text(
                      productDescription,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Image.asset(
                    productImage,
                    fit: BoxFit.cover,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

