import 'package:flutter/material.dart';

class drewer extends StatelessWidget {
  //const drewer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.lightGreen[700],
        child: ListView(
          children: <Widget>[
            ListTile(
              trailing: IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: () {},
              ),
              title: Text("Profile",
                  style: TextStyle(color: Colors.white, fontSize: 25)),
            ),
            //listDrewer(icon: Icons.phone, text: "+91 98765432210"),
            Divider(
              color: Colors.white,
            ),
            //listDrewer(icon: Icons.account_balance_wallet, text: "My Wallet"),
            //listDrewer(icon: Icons.view_list, text: "My Orders"),
            //listDrewer(icon: Icons.local_offer, text: "Offers"),
            //listDrewer(icon: Icons.cached, text: "Refer"),
            //listDrewer(icon: Icons.exit_to_app, text: "LogOut"),
            //listDrewer(icon: Icons.wb_auto, text: "About Us"),
            //listDrewer(icon: Icons.star_border, text: "Rate Us"),
            //listDrewer(icon: Icons.share, text: "Share"),
            Divider(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
