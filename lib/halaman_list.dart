import 'package:flutter/material.dart';
import 'package:kuispraktpm/halaman_detail.dart';
import 'package:kuispraktpm/rental_car.dart';

class ListMobil extends StatefulWidget {
  const ListMobil({Key? key}) : super(key: key);

  @override
  State<ListMobil> createState() => _ListMobilState();
}

class _ListMobilState extends State<ListMobil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Rental Mobil',),
      ),
      body: ListView.builder(
        itemBuilder: (context, index){
          final RentalCar rental = rentalCar[index];
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => DetailMobil(rental:rental)
              )
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Card(
                      child: Image.network(rental.images[0],
                        width: 200,
                        height: 200,
                      ),
                    ),
                    Column(

                      children: <Widget>[
                        Row(

                          children: [
                            Text(rental.brand, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                            Text('  '),
                            Text(rental.model, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                          ],

                        ),

                        Row(
                          children: [
                            Text(rental.rentalPricePerDay),
                            Text('/hari'),
                          ],
                        ),
                      ]
                    ),

                  ],
                ),
              ),
            ),
          );
        },
        itemCount: rentalCar.length,

      ),
    );
  }
}
