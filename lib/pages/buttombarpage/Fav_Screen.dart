// ignore_for_file: prefer_const_constructors

import 'package:Trailblazer_Flutter/util/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<SelectedCoffeeDetail> favorites =
        Provider.of<CoffeeNewProvider>(context).selectedFavorite;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Favorites'),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      body: favorites.length > 0
          ? Container(
              margin: EdgeInsets.only(top: 30, right: 30, left: 30),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 20,
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.67),
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 0),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 130,
                          child: Container(
                            alignment: Alignment.topRight,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      favorites[index].detail.image),
                                ),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        //coffee name
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(left: 5, top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                favorites[index].coffeeTypeName,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                favorites[index].detail.nameDetail,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 174, 174, 174),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    favorites[index].detail.price,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontFamily: "Sora",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      CoffeeNewProvider coffeeProvider =
                                          Provider.of<CoffeeNewProvider>(
                                              context,
                                              listen: false);

                                      // Find the correct index in the coffeeType's detail list
                                      var coffeeType = coffeeProvider.coffee
                                          .firstWhere((coffeeType) =>
                                              coffeeType.name ==
                                              favorites[index].coffeeTypeName);
                                      var detailIndex = coffeeType.detail
                                          .indexWhere((detail) =>
                                              detail.nameDetail ==
                                              favorites[index]
                                                  .detail
                                                  .nameDetail);

                                      if (detailIndex != -1) {
                                        coffeeProvider.addItemToSelected(
                                            coffeeType, detailIndex);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    'Item successfully added'),
                                                duration:
                                                    Duration(seconds: 2)));
                                      }
                                    },
                                    icon: Icon(Icons.add_shopping_cart),
                                    iconSize: 20,
                                  )
                                ],
                              )
                            ],
                          ),
                        )),
                      ],
                    ),
                  );
                },
              ),
            )
          : Center(
              child: Text(
                "Belum ada Item Favorit",
                style: TextStyle(fontFamily: 'Sora'),
              ),
            ),
    );
  }
}
