import 'package:flutter/material.dart';
import 'package:kuispraktpm/rental_car.dart';

class DetailMobil extends StatefulWidget {
  final RentalCar rental;
  const DetailMobil({Key? key, required this.rental}) : super(key: key);


  @override
  State<DetailMobil> createState() => _DetailMobilState();
}

class _DetailMobilState extends State<DetailMobil> {
  bool _hasBeenPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.rental.brand),
            Text(' '),
            Text(widget.rental.model)
          ],
        ),

      ),
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
              child: Image.network(widget.rental.images[0],
              width: 400,
              height: 400,),
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.rental.brand, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  Text(' '),
                  Text(widget.rental.model, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
                ],
              ),

              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.only(left:30, right: 30),
                child: Column(

                  children: [
                    Row(
                      children: [
                        Text('Brand            : '),
                        Text(widget.rental.brand),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Model           : '),
                        Text(widget.rental.model),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Tahun           : '),
                        // Text(widget.rental.year),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Biaya Sewa  : '),
                        Text(widget.rental.rentalPricePerDay),
                        Text(' per Hari'),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Status           : '),
                        if (widget.rental.available == true) ...[
                          Text('Tersedia', style: TextStyle(color: Colors.green),),
                        ] else ...[
                          Text('Tidak Tersedia', style: TextStyle(color: Colors.red)),
                        ],
                        
                      ],
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.grey;
                              }
                              return Colors.blue;
                            },
                          ),
                        ),
                        onPressed: () {

                        },
                        child: const Text('Pesan'),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20,),

              Container(
                alignment: Alignment.topLeft,
                child: Text('Deskripsi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
              ),
              Container(
                child: Text(widget.rental.description),
              ),
          ]
          ),

      ),
    );
  }
}
