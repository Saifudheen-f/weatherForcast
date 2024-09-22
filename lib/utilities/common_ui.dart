import 'dart:ui';
import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  const BackGround({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return 
         SingleChildScrollView(
           child: SizedBox(
                 child: Stack(
                   children: [
            Positioned(
              top: 10,
              left: 0,
              child: Container(
                height: 300,
                width: 600,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle),
              ),
            ),
            Positioned(
              top: 10,
              right: 0,
              child: Container(
                height: 300,
                width: 600,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle),
              ),
            ),
            Positioned(
              bottom: 250,
              right: 0,
              child: Container(
                height: 300,
                width: 600,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle),
              ),
            ),
            Positioned(
              bottom: 250,
              left: 0,
              child: Container(
                height: 300,
                width: 600,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              child: Container(
                height: 300,
                width: 600,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              child: Container(
                height: 300,
                width: 600,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
              child: Container(
                color: const Color.fromARGB(0, 12, 23, 78),
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child:  Center(child:child))
                   ],
                 ),
               ),
         );
  }
}
