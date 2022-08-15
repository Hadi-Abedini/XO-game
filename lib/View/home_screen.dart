import 'package:flutter/material.dart';
import 'package:xo/View/selected_page.dart';
import 'package:xo/gen/assets.gen.dart';
import 'package:xo/my_color.dart';
import 'package:xo/my_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: SolidColors.primaryColor,
      body: Padding(
        padding: EdgeInsets.all(size.width / 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  Assets.images.x.path,
                  color: SolidColors.secondaryColor,
                  scale: 0.8,
                ),
                Image.asset(
                  Assets.images.o.path,
                  color: SolidColors.secondaryColor,
                  scale: 0.8,
                ),
              ],
            ),
            SizedBox(height: size.height / 3),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SelectedSide(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: size.height / 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: SolidColors.secondaryColor),
                child: Center(
                  child: Text(
                    MyString.start,
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
