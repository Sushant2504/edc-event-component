import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:event/constants/string_constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EventScreen(),
    );
  }
}

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen>
    with SingleTickerProviderStateMixin {
  final PageController _horizontalController = PageController();
  final PageController _verticalController = PageController();

  final videoURL = "https://www.youtube.com/watch?v=ZBqbC8Kdg60&t=135s";

  late YoutubePlayerController _controller;
  late AnimationController _opacity;
  bool animate = false;

  final List<String> assetsimage1 = [
    'assets/images/asset1.png',
    'assets/images/asset2.png',
    'assets/images/asset3.png',
    'assets/images/asset4.png',
    'assets/images/asset5.png',
  ];

  final List<String> assetimage2 = [
    'assets/images/cop1.png',
    'assets/images/cop2.png',
    'assets/images/cop3.png',
    'assets/images/cop4.png',
    'assets/images/cop5.png',
  ];

  void initState() {
    final videoID = "ZBqbC8Kdg";

    _controller = YoutubePlayerController(
      initialVideoId: videoID,
    );

    super.initState();
    _opacity = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this);
      StartAnimation();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _horizontalController,
              children: [
                CustomScrollView(
                  slivers: [
                    //sliver app bar
                    SliverAppBar(
                      expandedHeight: height,
                      flexibleSpace: FlexibleSpaceBar(
                        title: AnimatedOpacity(
                          opacity: animate ? 1.0 : 0,
                          duration: const Duration(milliseconds: 1600),
                          child: Text(
                            'V I S H W A P R E N E U R',
                            style: TextStyle(
                                color: Colors.purple[800],
                                fontSize: 25,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        background: Image.asset(
                          'assets/images/Vishw.png',
                          fit: BoxFit.fitHeight,
                          height: height,
                          width: width,
                        ),
                      ),
                    ),

                    //sliver items
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            height: 1300,
                            color: const Color.fromARGB(255, 145, 112, 201),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'About',
                                  style: const TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Icon(
                                  Icons.business,
                                  size: 30,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                 AnimatedOpacity(
                                  opacity: animate ? 1.0 : 0,
                                  duration: Duration(milliseconds: 1600),
                                  child: const Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Text(
                                        vishwaprenwur,
                                        style: TextStyle(
                                            fontFamily: "PlayfairDisplay",
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal),
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                                const SizedBox(
                                  height: 60,
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: YoutubePlayer(
                                    controller: _controller,
                                    showVideoProgressIndicator: true,
                                    onReady: () => print('ready to play'),
                                    bottomActions: [
                                      CurrentPosition(),
                                       
                                      
                                    ],
                                  ),
                                ),

                                const SizedBox(
                                  height: 30,
                                ),

                                const Text(
                                  'One sunny morning, Pip was playing in the garden when he saw something glint in the bushes. He crept closer and closer, until he saw a beautiful, golden apple. Pip had never seen anything like it before! He carefully picked up the apple and took a bite.The apple was the most delicious thing Pip had ever tasted. It was sweet and juicy, with a hint of cinnamon and spice. Pip gobbled up the whole apple in a few seconds, then licked his lips and looked around for more.',
                                  style: const TextStyle(
                                    fontFamily: "PlayfairDisplay",
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 60,
                                ),
                                CarouselSlider(
                                  options: CarouselOptions(
                                    height:
                                        250.0, // Set the height of the carousel
                                    autoPlay:
                                        true, // Set to true for automatic sliding
                                    enlargeCenterPage:
                                        true, // Set to true to make the center item larger
                                    aspectRatio: 16 /
                                        9, // Set the aspect ratio of the images
                                    autoPlayCurve:
                                        Curves.fastOutSlowIn, // Animation curve
                                    autoPlayInterval: Duration(
                                        seconds: 2), // Time between slides
                                    autoPlayAnimationDuration: Duration(
                                        milliseconds:
                                            800), // Animation duration
                                  ),
                                  items: assetsimage1.map((path) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                          ),
                                          child: Image.asset(
                                            path,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(
                                  height: 60,
                                ),

                                AnimatedOpacity(
                                  opacity: animate ? 1.0 : 0,
                                  duration: const  Duration(seconds: 1),
                                  child: const Text(
                                    'One sunny morning, Pip was playing in the garden when he saw something glint in the bushes. He crept closer and closer, until he saw a beautiful, golden apple. Pip had never seen anything like it before! He carefully picked up the apple and took a bite.The apple was the most delicious thing Pip had ever tasted. It was sweet and juicy, with a hint of cinnamon and spice. Pip gobbled up the whole apple in a few seconds, then licked his lips and looked around for more.',
                                    style: const TextStyle(
                                      fontFamily: "Playfair Display",
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                CustomScrollView(
                  slivers: [
                    //sliver app bar
                    SliverAppBar(
                      expandedHeight: height,
                      flexibleSpace: FlexibleSpaceBar(
                        title: AnimatedOpacity(
                          opacity: animate ? 1.0 : 0,
                          duration: const Duration(seconds: 1),
                          child: const Text(
                            'C O R P S T R A T A',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        background: Image.network(
                          'assets/images/corpstrata.png',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),

                    //sliver items
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            height: 1300,
                            color: Color.fromARGB(255, 113, 189, 239),
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  'About',
                                  style: const TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Icon(
                                  Icons.handshake,
                                  size: 30,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  corpstrata,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 60,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: YoutubePlayer(
                                    controller: YoutubePlayerController(
                                      initialVideoId: 'ZBqbC8Kdg60',
                                      flags: YoutubePlayerFlags(
                                        autoPlay: true,
                                        mute: false,
                                      ),
                                    ),
                                    showVideoProgressIndicator: true,
                                  ),
                                ),

                                const SizedBox(
                                  height: 30,
                                ),

                                Text(
                                  "Pip walked back through the forest, his heart full of joy. He had had a wonderful adventure, and he had made some new friends along the way. He couldn't wait to tell his family all about it.",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 60,
                                ),
                                CarouselSlider(
                                  options: CarouselOptions(
                                    height:
                                        200.0, // Set the height of the carousel
                                    autoPlay:
                                        true, // Set to true for automatic sliding
                                    enlargeCenterPage:
                                        true, // Set to true to make the center item larger
                                    aspectRatio: 16 /
                                        9, // Set the aspect ratio of the images
                                    autoPlayCurve:
                                        Curves.fastOutSlowIn, // Animation curve
                                    autoPlayInterval: Duration(
                                        seconds: 2), // Time between slides
                                    autoPlayAnimationDuration: Duration(
                                        milliseconds:
                                            800), // Animation duration
                                  ),
                                  items: assetimage2.map((path) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                          ),
                                          child: Image.asset(
                                            path,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                                
                                const SizedBox(
                                  height: 60,
                                ),

                                const Text(
                                    'One sunny morning, Pip was playing in the garden when he saw something glint in the bushes. He crept closer and closer, until he saw a beautiful, golden apple. Pip had never seen anything like it before! He carefully picked up the apple and took a bite.The apple was the most delicious thing Pip had ever tasted. It was sweet and juicy, with a hint of cinnamon and spice. Pip gobbled up the whole apple in a few seconds, then licked his lips and looked around for more.',
                                    style: const TextStyle(
                                      fontFamily: "Playfair Display",
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    
                  ],
                ),

                CustomScrollView(
                  slivers: [
                    //sliver app bar
                    SliverAppBar(
                      expandedHeight: height,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text(
                          'A G N I T I O',
                          style: TextStyle(
                              color: Colors.purple[800],
                              fontSize: 25,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold
                              ),
                          textAlign: TextAlign.center,
                        ),
                        background: Image.asset(
                          'assets/images/agnito.png',
                          fit: BoxFit.fill,
                          height: height,
                          width: width,
                        ),
                      ),
                    ),

                    //sliver items
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            height:1300,
                            color: Color.fromARGB(255, 68, 176, 153),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'About',
                                  style: const TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Icon(
                                  Icons.home_repair_service_rounded,
                                  size: 30,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Text(
                                      agnito,
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal),
                                      textAlign: TextAlign.center,
                                    )),
                                const SizedBox(
                                  height: 60,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: YoutubePlayer(
                                    controller: _controller,
                                    showVideoProgressIndicator: true,
                                    onReady: () => print('ready to play'),
                                    bottomActions: [
                                      CurrentPosition(),
                                        // ProgessBar(
                                        //   isExpanded: true,
                                        //   colors: const ProgressBarColors(
                                        //      PlayerColor: Colors.amber,
                                        //      handleColor: Colors.amberAccent,
                                        //   ),
                                        // ),
                                      
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 60,
                                ),
                                CarouselSlider(
                                  options: CarouselOptions(
                                    height:
                                        250.0, // Set the height of the carousel
                                    autoPlay:
                                        true, // Set to true for automatic sliding
                                    enlargeCenterPage:
                                        true, // Set to true to make the center item larger
                                    aspectRatio: 16 /
                                        9, // Set the aspect ratio of the images
                                    autoPlayCurve:
                                        Curves.fastOutSlowIn, // Animation curve
                                    autoPlayInterval: Duration(
                                        seconds: 2), // Time between slides
                                    autoPlayAnimationDuration: Duration(
                                        milliseconds:
                                            800), // Animation duration
                                  ),
                                  items: assetsimage1.map((path) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                          ),
                                          child: Image.asset(
                                            path,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                                

                                const SizedBox(
                                  height: 60,
                                ),

                                const Text(
                                    'One sunny morning, Pip was playing in the garden when he saw something glint in the bushes. He crept closer and closer, until he saw a beautiful, golden apple. Pip had never seen anything like it before! He carefully picked up the apple and took a bite.The apple was the most delicious thing Pip had ever tasted. It was sweet and juicy, with a hint of cinnamon and spice. Pip gobbled up the whole apple in a few seconds, then licked his lips and looked around for more.',
                                    style: const TextStyle(
                                      fontFamily: "Playfair Display",
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                CustomScrollView(
                  slivers: [
                    //sliver app bar
                    SliverAppBar(
                      expandedHeight: height,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text(
                          'E N C E P T A',
                          style: TextStyle(
                              color: Colors.purple[800],
                              fontSize: 25,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold
                              ),
                          textAlign: TextAlign.center,
                        ),
                        background: Image.asset(
                          'assets/images/incepta.png',
                          fit: BoxFit.fitWidth,
                          height: height,
                          width: width,
                        ),
                      ),
                    ),

                    //sliver items
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            height: 1300,
                            color: const Color.fromARGB(255, 145, 112, 201),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'About',
                                  style: const TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Icon(
                                  Icons.business,
                                  size: 30,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Text(
                                      vishwaprenwur,
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal),
                                      textAlign: TextAlign.center,
                                    )),
                                const SizedBox(
                                  height: 60,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: YoutubePlayer(
                                    controller: _controller,
                                    showVideoProgressIndicator: true,
                                    onReady: () => print('ready to play'),
                                    bottomActions: [
                                      CurrentPosition(),
                                        // ProgessBar(
                                        //   isExpanded: true,
                                        //   colors: const ProgressBarColors(
                                        //      PlayerColor: Colors.amber,
                                        //      handleColor: Colors.amberAccent,
                                        //   ),
                                        // ),
                                      
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 60,
                                ),
                                CarouselSlider(
                                  options: CarouselOptions(
                                    height:
                                        250.0, // Set the height of the carousel
                                    autoPlay:
                                        true, // Set to true for automatic sliding
                                    enlargeCenterPage:
                                        true, // Set to true to make the center item larger
                                    aspectRatio: 16 /
                                        9, // Set the aspect ratio of the images
                                    autoPlayCurve:
                                        Curves.fastOutSlowIn, // Animation curve
                                    autoPlayInterval: Duration(
                                        seconds: 2), // Time between slides
                                    autoPlayAnimationDuration: Duration(
                                        milliseconds:
                                            800), // Animation duration
                                  ),
                                  items: assetsimage1.map((path) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                          ),
                                          child: Image.asset(
                                            path,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                                

                                const SizedBox(
                                  height: 60,
                                ),

                                const Text(
                                    'One sunny morning, Pip was playing in the garden when he saw something glint in the bushes. He crept closer and closer, until he saw a beautiful, golden apple. Pip had never seen anything like it before! He carefully picked up the apple and took a bite.The apple was the most delicious thing Pip had ever tasted. It was sweet and juicy, with a hint of cinnamon and spice. Pip gobbled up the whole apple in a few seconds, then licked his lips and looked around for more.',
                                    style: const TextStyle(
                                      fontFamily: "Playfair Display",
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                
                CustomScrollView(
                  slivers: [
                    //sliver app bar
                    SliverAppBar(
                      expandedHeight: height,
                      flexibleSpace: FlexibleSpaceBar(
                        title: const Text(
                          'A C T I V I T I E S',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        background: Image.network(
                          'assets/images/Activities.png',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),

                    //sliver items
                   

                  ],
                ),
              ],
            ),
          ),
          // SmoothPageIndicator(
          //   controller: _horizontalController, // Use the horizontal controller
          //   count: 2,
          //   effect: ExpandingDotsEffect(
          //     activeDotColor: Color.fromARGB(255, 14, 11, 5),
          //     dotColor: Color.fromARGB(255, 241, 232, 241),
          //   ), // Number of horizontal pages
          // ),
        ],
      ),
    );
  }

  // Widget Reusablecard({double height, double width, String text, String img, String text1, String icon, Color color1, Color color2, String id}){
  //     return CustomScrollView(
  //               slivers: [
  //                 //sliver app bar
  //                 SliverAppBar(
  //                   expandedHeight: height,
  //                   flexibleSpace: FlexibleSpaceBar(
  //                     title: Text(
  //                       text,
  //                       style: TextStyle(
  //                           color: color1,
  //                           fontSize: 25,
  //                           fontFamily: "Poppins",
  //                           fontWeight: FontWeight.bold),
  //                       textAlign: TextAlign.center,
  //                     ),
  //                     background: Image.asset(
  //                       'assets/images/$img.png',
  //                       fit: BoxFit.fitHeight,
  //                       height: height,
  //                       width: width,
  //                     ),
  //                   ),
  //                 ),

  //                 //sliver items
  //                 SliverToBoxAdapter(
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(0),
  //                     child: ClipRRect(
  //                       borderRadius: BorderRadius.circular(20.0),
  //                       child: Container(
  //                         height: 900,
  //                         color: color2,
  //                         child: Column(
  //                           children: [
  //                             const SizedBox(
  //                               height: 10,
  //                             ),
  //                             const Text(
  //                               'About',
  //                               style: TextStyle(
  //                                 fontFamily: "Poppins",
  //                                 fontSize: 20,
  //                                 fontWeight: FontWeight.bold,
  //                               ),
  //                               textAlign: TextAlign.center,
  //                             ),
  //                             const SizedBox(
  //                               height: 20,
  //                             ),

  //                             const SizedBox(
  //                               height: 20,
  //                             ),
  //                             const Padding(
  //                                 padding: EdgeInsets.all(0),
  //                                 child: Text(
  //                                       text1,
  //                                   style: const TextStyle(
  //                                       fontFamily: "Poppins",
  //                                       fontSize: 15,
  //                                       fontWeight: FontWeight.normal),
  //                                   textAlign: TextAlign.center,
  //                                 )),
  //                             SizedBox(
  //                               height: 60,
  //                             ),
  //                             YoutubePlayer(
  //                               controller: YoutubePlayerController(
  //                                 initialVideoId: id,
  //                                 flags: const YoutubePlayerFlags(
  //                                   autoPlay: true,
  //                                   mute: false,
  //                                 ),
  //                               ),
  //                               showVideoProgressIndicator: true,
  //                             ),
  //                             const SizedBox(
  //                               height: 60,
  //                             ),
  //                             CarouselSlider(
  //                               options: CarouselOptions(
  //                                 height:
  //                                     200.0, // Set the height of the carousel
  //                                 autoPlay:
  //                                     true, // Set to true for automatic sliding
  //                                 enlargeCenterPage:
  //                                     true, // Set to true to make the center item larger
  //                                 aspectRatio: 16 /
  //                                     9, // Set the aspect ratio of the images
  //                                 autoPlayCurve:
  //                                     Curves.fastOutSlowIn, // Animation curve
  //                                 autoPlayInterval: Duration(
  //                                     seconds: 2), // Time between slides
  //                                 autoPlayAnimationDuration: Duration(
  //                                     milliseconds:
  //                                         800), // Animation duration
  //                               ),
  //                               items: assetsimage1.map((path) {
  //                                 return Builder(
  //                                   builder: (BuildContext context) {
  //                                     return Container(
  //                                       width:
  //                                           MediaQuery.of(context).size.width,
  //                                       margin: EdgeInsets.symmetric(
  //                                           horizontal: 5.0),
  //                                       decoration: BoxDecoration(
  //                                         color: Colors.blue,
  //                                       ),
  //                                       child: Image.asset(
  //                                         path,
  //                                         fit: BoxFit.cover,
  //                                       ),
  //                                     );
  //                                   },
  //                                 );
  //                               }).toList(),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ),

  //               ],
  //             ),
  //  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> StartAnimation() async {
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {
      animate = true;
    });
  }
}
