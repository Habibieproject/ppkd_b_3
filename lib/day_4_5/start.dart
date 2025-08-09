import 'package:flutter/material.dart';

class StartWidget extends StatelessWidget {
  const StartWidget({super.key, this.appBar});
  final bool? appBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar == false
          ? null
          : AppBar(
              title: Text("PPKD Batch 3"),
              backgroundColor: Colors.amber,
              actions: [Icon(Icons.favorite), Icon(Icons.message)],
              centerTitle: true,
            ),
      drawer: appBar == false
          ? null
          : Drawer(
              child: Column(
                //MainAxis center untuk posisi ketengah
                // mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Saya"),
                  Text("Andrea"),
                  Text("Surya"),
                  Text("Habibie"),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text("Nama :"), Text("Andrea")],
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),

      // backgroundColor: Colors.black,
      body: Column(
        //MainAxis center untuk posisi ketengah
        // mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.end,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,

        // spacing: 20,
        children: [
          //Warna Standar Flutter (MEJIKUHIBINIU)
          Text("Saya", style: TextStyle(fontSize: 80, color: Colors.blue)),
          SizedBox(height: 8),
          //Warna RGB
          Text(
            "Andrea",
            style: TextStyle(
              fontSize: 80,
              color: const Color.fromARGB(255, 154, 180, 155),
            ),
          ),

          //Warna HEX
          Text(
            "Surya",
            style: TextStyle(
              fontSize: 80,
              color: const Color(0xff7A7A73),
              fontFamily: "PlaywriteHU",
            ),
          ),

          Text(
            "Habibie",
            style: TextStyle(
              fontSize: 80,
              color: const Color(0xff7A7A73),
              decoration: TextDecoration.underline,
              decorationColor: Colors.amber,
              fontFamily: "PlaywriteHU",
            ),
          ),
          Text(
            "Habibie",
            style: TextStyle(
              fontSize: 80,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text("Nama :"), SizedBox(width: 40), Text("Andrea")],
          ),
        ],
      ),
    );
  }
}
