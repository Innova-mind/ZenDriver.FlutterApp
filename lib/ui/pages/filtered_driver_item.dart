import 'package:flutter/material.dart';
import 'package:zendriver/models/driver_profile.dart';


class DriverItem extends StatefulWidget {
  const DriverItem({super.key, required this.driverProfile});
  final DriverProfile driverProfile;

  @override
  State<DriverItem> createState() => _DriverItemState();
}

class _DriverItemState extends State<DriverItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Container(
        color : Colors.grey,
        padding: const EdgeInsets.all(16.0),
        
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              
              height: 200,
              width: 200,
              child: Image(
                  image: NetworkImage('https://www.drakonball.com/wp-content/uploads/2023/02/los-mejores-memes-de-dragon-ball.jpg'),
                  // image: NetworkImage(widget.driverProfile.driver.user!.imageUrl),
                  width: 50,
                  height: 50),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget.driverProfile.driver.user!.firstName} ${widget.driverProfile.driver.user!.lastName}"),
                  const SizedBox(height: 16),
                  Text(widget.driverProfile.driver.user!.role),
                  const SizedBox(height: 16),
                  TextButton(onPressed: (){}, child: 
                    const Text("Ver perfil", style: TextStyle(color: Colors.white),),
                  )                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
