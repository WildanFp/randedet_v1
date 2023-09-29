import 'package:flutter/material.dart';
import 'package:randedet_v1/screens/home_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 240,
                  decoration: const BoxDecoration(
                      color: Color(0xff368963),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      )),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 35,
                        left: 340,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 35, left: 110),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rangkuman Bulan Ini',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                            Text(
                              '\$ 2,967',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 162, 242, 140)),
                            ),
                            Text(
                              '\$ 2,967',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 250, 120, 120)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 140, left: 36),
              child: InkWell(
                child: Container(
                  height: 170,
                  width: 320,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 47, 125, 121),
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 400),
                  child: InkWell(
                    child: Container(
                      height: 170,
                      width: 170,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 47, 125, 121),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) {
                            return const Screen();
                          }),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 400),
                  child: InkWell(
                    child: Container(
                      height: 170,
                      width: 170,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 47, 125, 121),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) {
                            return const Screen();
                          }),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 600),
                  child: InkWell(
                    child: Container(
                      height: 170,
                      width: 170,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 47, 125, 121),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) {
                            return const Screen();
                          }),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 600),
                  child: InkWell(
                    child: Container(
                      height: 170,
                      width: 170,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 47, 125, 121),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) {
                            return const Screen();
                          }),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
