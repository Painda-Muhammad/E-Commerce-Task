import 'package:e_commerce_task/core/commom_widgets/buttonContainer.dart';
import 'package:e_commerce_task/feature/bag/view/bag_page.dart';
import 'package:flutter/material.dart';

class SucessPage extends StatelessWidget {
  const SucessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/success_image.png',
                  fit: BoxFit.cover,
                )),
            Positioned(
              top: MediaQuery.of(context).size.height * .15,
              left: mediaQuery.width * .17,
              child: SizedBox(
                width: mediaQuery.width * .60,
                height: mediaQuery.width * .48,
                child: Column(
                  children: [
                    Text(
                      'Success!',
                      style: theme.titleMedium,
                    ),
                    SizedBox(
                      height: mediaQuery.width * .02,
                    ),
                    Text(
                      'Your order will be delivered soon.Thank you for choosing our app!',
                      textAlign: TextAlign.center,
                      style: theme.titleSmall,
                    ),
                    SizedBox(
                      height: mediaQuery.width * .05,
                    ),
                    ButtonContainer(
                        ontap: () {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) {
                            return BagPage();
                          }), (context) => false);
                        },
                        title: 'Continous Shopping!')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
