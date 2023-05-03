import 'dart:collection';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifematch/main.dart';
import 'package:lifematch/screens/Registration/preference.dart';
import 'package:lifematch/screens/mainpage.dart';

const activeColor = Color.fromARGB(255, 237, 69, 69);
const inactiveColor = Color.fromARGB(255, 173, 173, 173);

class Interests extends StatefulWidget {
  const Interests({super.key});

  @override
  State<Interests> createState() => _InterestsState();
}

class _InterestsState extends State<Interests> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List<String> listofhobbies = [];
  }

  Color maincolor = inactiveColor;
  Color coding = inactiveColor;
  Color musiccolor = inactiveColor;
  Color singingcolor = inactiveColor;
  Color travellingcolor = inactiveColor;
  Color volleycolor = inactiveColor;
  Color footballcolor = inactiveColor;
  Color basketballcolor = inactiveColor;
  Color marketingcolor = inactiveColor;
  Color readingcolor = inactiveColor;
  Color paintingcolor = inactiveColor;
  Color photocolor = inactiveColor;
  Color drawingcolor = inactiveColor;
  Color cookingcolor = inactiveColor;
  Color bakingcolor = inactiveColor;
  Color swimcolor = inactiveColor;
  Color gymcolor = inactiveColor;
  Color martialcolor = inactiveColor;
  Color boxingcolor = inactiveColor;
  Color filmscolor = inactiveColor;
  Color comedycolor = inactiveColor;
  Color origamicolor = inactiveColor;
  Color astronomycolor = inactiveColor;
  Color videogamescolor = inactiveColor;
  Color artcolor = inactiveColor;

  List listofhobbies = [];
  void hobbies({String? value}) {
    if (!listofhobbies.contains(value)) {
      listofhobbies.add(value);
    }
  }

  void update(int index) {
    if (index == 1) {
      if (coding == inactiveColor) {
        coding = activeColor;

        hobbies(value: 'Coding');
      } else {
        coding = inactiveColor;
        listofhobbies.remove('Coding');
      }
    } else if (index == 2) {
      if (musiccolor == inactiveColor) {
        musiccolor = activeColor;
        hobbies(value: 'Music');
      } else {
        musiccolor = inactiveColor;
        listofhobbies.remove('Music');
      }
    } else if (index == 3) {
      if (singingcolor == inactiveColor) {
        singingcolor = activeColor;
        hobbies(value: 'Singing');
      } else {
        singingcolor = inactiveColor;
        listofhobbies.remove('Singing');
      }
    } else if (index == 4) {
      if (travellingcolor == inactiveColor) {
        travellingcolor = activeColor;
        hobbies(value: 'Travelling');
      } else {
        travellingcolor = inactiveColor;
        listofhobbies.remove('Travelling');
      }
    } else if (index == 5) {
      if (volleycolor == inactiveColor) {
        volleycolor = activeColor;
        hobbies(value: 'Volleyball');
      } else {
        volleycolor = inactiveColor;
        listofhobbies.remove('Volleyball');
      }
    } else if (index == 6) {
      if (footballcolor == inactiveColor) {
        footballcolor = activeColor;
        hobbies(value: 'Football');
      } else {
        footballcolor = inactiveColor;
        listofhobbies.remove('Football');
      }
    } else if (index == 7) {
      if (basketballcolor == inactiveColor) {
        basketballcolor = activeColor;
        hobbies(value: 'Basketball');
      } else {
        basketballcolor = inactiveColor;
        listofhobbies.remove('Basketball');
      }
    } else if (index == 8) {
      if (marketingcolor == inactiveColor) {
        marketingcolor = activeColor;
        hobbies(value: 'Marketing');
      } else {
        marketingcolor = inactiveColor;
        listofhobbies.remove('Marketing');
      }
    } else if (index == 9) {
      if (readingcolor == inactiveColor) {
        readingcolor = activeColor;
        hobbies(value: 'Reading');
      } else {
        readingcolor = inactiveColor;
        listofhobbies.remove('Reading');
      }
    } else if (index == 10) {
      if (paintingcolor == inactiveColor) {
        paintingcolor = activeColor;
        hobbies(value: 'Painting');
      } else {
        paintingcolor = inactiveColor;
        listofhobbies.remove('Painting');
      }
    } else if (index == 11) {
      if (photocolor == inactiveColor) {
        photocolor = activeColor;
        hobbies(value: 'Photography');
      } else {
        photocolor = inactiveColor;
        listofhobbies.remove('Photography');
      }
    } else if (index == 12) {
      if (drawingcolor == inactiveColor) {
        drawingcolor = activeColor;
        hobbies(value: 'Drawing');
      } else {
        drawingcolor = inactiveColor;
        listofhobbies.remove('Drawing');
      }
    } else if (index == 13) {
      if (cookingcolor == inactiveColor) {
        cookingcolor = activeColor;
        hobbies(value: 'Cooking');
      } else {
        cookingcolor = inactiveColor;
        listofhobbies.remove('Cooking');
      }
    } else if (index == 14) {
      if (bakingcolor == inactiveColor) {
        bakingcolor = activeColor;
        hobbies(value: 'Baking');
      } else {
        bakingcolor = inactiveColor;
        listofhobbies.remove('Baking');
      }
    } else if (index == 15) {
      if (swimcolor == inactiveColor) {
        swimcolor = activeColor;
        hobbies(value: 'Swimming');
      } else {
        swimcolor = inactiveColor;
        listofhobbies.remove('Swimming');
      }
    } else if (index == 16) {
      if (gymcolor == inactiveColor) {
        gymcolor = activeColor;
        hobbies(value: 'Gym');
      } else {
        gymcolor = inactiveColor;
        listofhobbies.remove('Gym');
      }
    } else if (index == 17) {
      if (martialcolor == inactiveColor) {
        martialcolor = activeColor;
        hobbies(value: 'Martial Arts');
      } else {
        martialcolor = inactiveColor;
        listofhobbies.remove('Martial Arts');
      }
    } else if (index == 18) {
      if (boxingcolor == inactiveColor) {
        boxingcolor = activeColor;
        hobbies(value: 'Boxing');
      } else {
        boxingcolor = inactiveColor;
        listofhobbies.remove('Boxing');
      }
    } else if (index == 19) {
      if (filmscolor == inactiveColor) {
        filmscolor = activeColor;
        hobbies(value: 'Films');
      } else {
        filmscolor = inactiveColor;
        listofhobbies.remove('Films');
      }
    } else if (index == 20) {
      if (comedycolor == inactiveColor) {
        comedycolor = activeColor;
        hobbies(value: 'Comedy');
      } else {
        comedycolor = inactiveColor;
        listofhobbies.remove('Comedy');
      }
    } else if (index == 21) {
      if (origamicolor == inactiveColor) {
        origamicolor = activeColor;
        hobbies(value: 'Origami');
      } else {
        origamicolor = inactiveColor;
        listofhobbies.remove('Origami');
      }
    } else if (index == 22) {
      if (astronomycolor == inactiveColor) {
        astronomycolor = activeColor;
        hobbies(value: 'Astronomy');
      } else {
        astronomycolor = inactiveColor;
        listofhobbies.remove('Astronomy');
      }
    } else if (index == 23) {
      if (videogamescolor == inactiveColor) {
        videogamescolor = activeColor;
        hobbies(value: 'Video Games');
      } else {
        videogamescolor = inactiveColor;
        listofhobbies.remove('Video Games');
      }
    } else if (index == 24) {
      if (artcolor == inactiveColor) {
        artcolor = activeColor;
        hobbies(value: 'Art');
      } else {
        artcolor = inactiveColor;
        listofhobbies.remove('Art');
      }
    }
  }

  Map data = {};

  @override
  Widget build(BuildContext context) {
    final Screenwidth = MediaQuery.of(context).size.width;
    final Screenheight = MediaQuery.of(context).size.height;
    data = ModalRoute.of(context)?.settings.arguments as Map;
    String location = data['location'];
    String gender = data['gender'];
    String dateofbirth = data['dob'];
    String interest = data['interest'];
    String bio = data['bio'];
    String minimumage = data['minimumage'];
    String maximumage = data['maximumage'];
    File? img1 = data['img1'];
    File? img2 = data['img2'];
    File? img3 = data['img3'];
    File? img4 = data['img4'];
    File? img5 = data['img5'];
    File? img6 = data['img6'];

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  child: Padding(
                    padding: EdgeInsets.all(Screenwidth * 0.02),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
                SizedBox(
                  width: Screenwidth * 0.3,
                ),
                Text(
                  'Step 4 of 5',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: Screenheight * 0.07,
            ),
            Padding(
              padding: EdgeInsets.only(left: Screenwidth * 0.045),
              child: Text(
                'Select Topics your are Interested in',
                style: GoogleFonts.aBeeZee(
                    fontSize: Screenheight * 0.025, fontWeight: FontWeight.w900),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(Screenwidth * 0.02),
                child: GridView.count(
                  crossAxisCount: 4,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          update(1);
                        });
                      },
                      child: interestcontainer(
                        text: Text('Coding'),
                        color: coding,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          update(2);
                        });
                      },
                      child: interestcontainer(
                        text: Text('Music'),
                        color: musiccolor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          update(3);
                        });
                      },
                      child: interestcontainer(
                        text: Text('Singing'),
                        color: singingcolor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          update(4);
                        });
                      },
                      child: interestcontainer(
                        text: Text('Travelling'),
                        color: travellingcolor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          update(5);
                        });
                      },
                      child: interestcontainer(
                        text: Text('Volleyball'),
                        color: volleycolor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          update(6);
                        });
                      },
                      child: interestcontainer(
                        text: Text('Football'),
                        color: footballcolor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          update(7);
                        });
                      },
                      child: interestcontainer(
                        text: Text('Basketball'),
                        color: basketballcolor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          update(8);
                        });
                      },
                      child: interestcontainer(
                        text: Text('Marketing'),
                        color: marketingcolor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          update(9);
                        });
                      },
                      child: interestcontainer(
                        text: Text('Reading'),
                        color: readingcolor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          update(10);
                        });
                      },
                      child: interestcontainer(
                        text: Text('Painting'),
                        color: paintingcolor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          update(11);
                        });
                      },
                      child: interestcontainer(
                        text: Text('Photography'),
                        color: photocolor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          update(12);
                        });
                      },
                      child: interestcontainer(
                        text: Text('Drawing'),
                        color: drawingcolor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          update(13);
                        });
                      },
                      child: interestcontainer(
                        text: Text('Cooking'),
                        color: cookingcolor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          update(14);
                        });
                      },
                      child: interestcontainer(
                        text: Text('Baking'),
                        color: bakingcolor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          update(15);
                        });
                      },
                      child: interestcontainer(
                        text: Text('Swimming'),
                        color: swimcolor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          update(16);
                        });
                      },
                      child: interestcontainer(
                        text: Text('Gym'),
                        color: gymcolor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          update(17);
                        });
                      },
                      child: interestcontainer(
                        text: Text('Martial arts'),
                        color: martialcolor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          update(18);
                        });
                      },
                      child: interestcontainer(
                        text: Text('Boxing'),
                        color: boxingcolor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          update(19);
                        });
                      },
                      child: interestcontainer(
                        text: Text('Films'),
                        color: filmscolor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          update(20);
                        });
                      },
                      child: interestcontainer(
                        text: Text('Comedy'),
                        color: comedycolor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          update(21);
                        });
                      },
                      child: interestcontainer(
                        text: Text('Origami'),
                        color: origamicolor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          update(22);
                        });
                      },
                      child: interestcontainer(
                        text: Text('Astronomy'),
                        color: astronomycolor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          update(23);
                        });
                      },
                      child: interestcontainer(
                        text: Text('Video\nGames'),
                        color: videogamescolor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          update(24);
                        });
                      },
                      child: interestcontainer(
                        text: Text('Art'),
                        color: artcolor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            newbutton(
                text: Text('Next'),
                onpress: () {
                  Navigator.pushNamed(context, Routes.completed.name,
                      arguments: {
                        'listofhobbies': listofhobbies,
                        'gender': gender,
                        'bio': bio,
                        'dob': dateofbirth,
                        'interest': interest,
                        'location': location,
                        'minimumage': minimumage,
                        'maximumage': maximumage,
                        'img1': img1,
                        'img2': img2,
                        'img3': img3,
                        'img4': img4,
                        'img5': img5,
                        'img6': img6,
                      });
                  print(listofhobbies);
                })
          ],
        ),
      ),
    );
  }
}

class interestcontainer extends StatefulWidget {
  Widget? text;

  Color? color;
  interestcontainer({this.text, required this.color});

  @override
  State<interestcontainer> createState() => _interestcontainerState();
}

class _interestcontainerState extends State<interestcontainer> {
  @override
  Widget build(BuildContext context) {
    final Screenwidth = MediaQuery.of(context).size.width;
    final Screenheight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: Screenheight * 0.05, right: Screenwidth * 0.02, left: Screenwidth * 0.02, bottom: Screenheight * 0.013),
      child: Container(
        height: Screenheight * 0.05,
        width: Screenwidth * 0.05,
        decoration: BoxDecoration(
            color: widget.color, borderRadius: BorderRadius.circular(20)),
        child: Center(child: widget.text),
      ),
    );
  }
}
