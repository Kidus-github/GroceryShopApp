import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'HomePage/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 80.0, right: 80, bottom: 40, top: 160),
            child: Image.asset('assets/images/Avocado.png'),
          ),
          Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              "We deliver groceries at your doorstep",
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "Fresh items everyday",
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return HomePage();
              },
            )),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12)),
              padding: EdgeInsets.all(24),
              child: Text(
                "Get Started",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
