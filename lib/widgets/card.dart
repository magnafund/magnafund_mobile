
import 'package:crowdfunding_mobile/data/app_colors.dart';
import 'package:flutter/material.dart';


class CardFb1 extends StatelessWidget {
  final String text;
 
  final Function() onPressed;

  const CardFb1({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 170,
          height: 120,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(12.5),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(10, 20),
                  blurRadius: 30,
                  spreadRadius: 5,
                  color: Colors.grey.withOpacity(.05)),
            ],
          ),
          child: Column(
            children: [
            
              
              Padding(
                padding: const EdgeInsets.only(top : 25.0),
                child: Text(text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
              ),
              const SizedBox(
                height: 5,
              ),
             
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
    );
  }
}
