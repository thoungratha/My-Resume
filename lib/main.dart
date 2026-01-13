import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'THOUNG Ratha',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final profile = Image.asset('assets/profile.jpg');
  final alarm = Image.asset('assets/alarm.jpg');
  final inventory = Image.asset('assets/logo.jpg');
  final student = Image.asset('assets/studentproject.jpg');

  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey educationKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // --------------------------------------------- App Bar ------------------------------------------------------
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,

        title: Text(
          "THOUNG Ratha",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              Scrollable.ensureVisible(
                aboutKey.currentContext!,
                duration: Duration(milliseconds: 700),
                curve: Curves.easeInOut,
              );
            },
            child: Text('About', style: TextStyle(color: Colors.black54)),
          ),
          TextButton(
            onPressed: () async {
              Scrollable.ensureVisible(
                experienceKey.currentContext!,
                duration: Duration(milliseconds: 700),
                curve: Curves.easeInOut,
              );
            },
            child: Text('Experience', style: TextStyle(color: Colors.black54)),
          ),
          TextButton(
            onPressed: () async {
              Scrollable.ensureVisible(
                skillsKey.currentContext!,
                duration: Duration(milliseconds: 700),
                curve: Curves.easeInOut,
              );
            },
            child: Text('Skills', style: TextStyle(color: Colors.black54)),
          ),
          TextButton(
            onPressed: () async {
              Scrollable.ensureVisible(
                educationKey.currentContext!,
                duration: Duration(milliseconds: 700),
                curve: Curves.easeInOut,
              );
            },
            child: Text('Education', style: TextStyle(color: Colors.black54)),
          ),
          TextButton(
            onPressed: () async {
              Scrollable.ensureVisible(
                projectsKey.currentContext!,
                duration: Duration(milliseconds: 700),
                curve: Curves.easeInOut,
              );
            },
            child: Text('Projects', style: TextStyle(color: Colors.black54)),
          ),
          TextButton(
            onPressed: () async {
              Scrollable.ensureVisible(
                contactKey.currentContext!,
                duration: Duration(milliseconds: 700),
                curve: Curves.easeInOut,
              );
            },
            child: Text('Contact', style: TextStyle(color: Colors.black54)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: .start,

          // Main Size
          children: [
            // ---------------------------------------------- My Profile --------------------------------------------------
            Container(
              key: aboutKey,
              padding: EdgeInsets.all(16),

              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
              ),

              child: Row(
                children: [
                  CircleAvatar(radius: 150, backgroundImage: profile.image),
                  SizedBox(width: 50),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'THOUNG Ratha',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Telecommunication & Network Engineer',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(Icons.location_city, color: Colors.blue),
                            SizedBox(width: 4),
                            Text(
                              "Phnom Penh, Cambodia",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),

                        Text(
                          'Motivated Telecommunication and Network Engineering graduate from the Institute of Technology of Cambodia, with a strong interest in software development and networking technologies. Passionate about building efficient, scalable solutions and solving complex technical problems. Experienced with modern web technologies and eager to apply engineering fundamentals, programming skills, and cloud knowledge in real-world projects. Committed to continuous learning and professional growth.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 16),

                        // ElevatedButton
                        Row(
                          children: [
                            // Get in Touch Button (Filled)
                            ElevatedButton(
                              onPressed: () async {
                                await launchUrl(
                                  Uri.parse('mailto:thoungratha19@gmail.com'),
                                );
                              },

                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,

                                padding: EdgeInsets.symmetric(
                                  // Increased horizontal padding
                                  horizontal: 50,
                                  vertical: 16, // Increased vertical padding
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.email),
                                  SizedBox(width: 8),
                                  Text('Email', style: TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                            SizedBox(width: 16),
                            OutlinedButton(
                              onPressed: () async {
                                await launchUrl(
                                  Uri.parse('https://github.com/thoungratha'),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,

                                padding: EdgeInsets.symmetric(
                                  // Increased horizontal padding
                                  horizontal: 32,
                                  vertical: 16, // Increased vertical padding
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.code),
                                  SizedBox(width: 8),
                                  Text(
                                    'Github',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 16),
                            OutlinedButton(
                              onPressed: () async {
                                await launchUrl(
                                  Uri.parse(
                                    'https://www.linkedin.com/in/thoungratha/',
                                  ),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                padding: EdgeInsets.symmetric(
                                  // Increased horizontal padding
                                  horizontal: 32,
                                  vertical: 16, // Increased vertical padding
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.link),
                                  SizedBox(width: 8),
                                  Text(
                                    'LinkIn',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //------------------------------------------------ About Me -------------------------------------------------
            SizedBox(height: 20),
            SizedBox(
              child: Text(
                "About Me",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),

              width: 1500,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Who I am',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "I’m a Telecommunication Engineer with a strong foundation in communication systems, networking, and signal transmission. I’m passionate about understanding how complex telecom infrastructures work and applying that knowledge to design, configure, and optimize reliable network solutions. \n\n"
                          "My background combines telecom engineering principles with hands-on experience in networking and system integration. I enjoy problem-solving, learning new technologies, and adapting to the fast-evolving telecom industry. As a graduate of the Telecommunication and Network Engineering department at the Institute of Technology of Cambodia, I’m motivated to contribute to innovative and efficient communication systems.\n\n",
                          style: TextStyle(fontSize: 16, height: 1.5),

                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 150),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'What I Do',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "-  Design and maintain telecommunication and network systems \n"
                          "-  Configure and troubleshoot LAN/WAN infrastructures \n"
                          "-  Work with IP networking (TCP/IP, DNS, DHCP, VPN) \n"
                          "-  Analyze network performance and improve reliability \n"
                          "-  Support system integration and technical operations \n"
                          "-  Continuously learn modern telecom technologies\n"
                          "-  Design and analyze digital and electronic systems using VHDL and MATLAB\n"
                          "-  Develop mobile applications using Flutter and Firebase\n"
                          "-  Implement embedded system logic and hardware interfacing\n"
                          "-  Analyze signals and systems, including discretized and time-domain responses\n\n\n",
                          style: TextStyle(fontSize: 16, height: 1.5),
                          textAlign: TextAlign.justify,

                          // Add line space between text 1.15
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            //------------------------------------------- Experience Section -------------------------------------------
            Container(
              key: experienceKey,
              padding: EdgeInsets.all(16),
              width: 1500,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
              ),
              child: Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      child: Text(
                        "Work Experience",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: boxDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Row(
                            children: [
                              Icon(Icons.work, color: Colors.blue),
                              SizedBox(width: 12),
                              Text(
                                "System Engineer Internship",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Text(
                                " (07 July 2025 - 07 October 2025)",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 8),
                              Text(
                                "         Trust Global Services Co., Ltd.",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                ),
                              ),

                              Text(
                                "         Phnom Penh, Cambodia",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "         -    Installed, configured, and maintained Windows and Linux servers to support enterprise operations.\n"
                                "         -    Managed and administered Synology NAS systems, including setup, shared folder configuration, user access control, and data backup management.\n"
                                "         -    Troubleshot and resolved hardware and software issues for workstations, printers, and network devices\n",
                                style: TextStyle(fontSize: 16, height: 2),
                                textAlign: TextAlign.justify,
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ----------------------------------------------- Skills & Technology -------------------------------------
            SizedBox(height: 30),
            Container(
              key: skillsKey,
              padding: EdgeInsets.all(16),
              width: 1500,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    child: Text(
                      "Skills & Technologies",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      // Column 1
                      Expanded(
                        child: skillColumn("Core Telecom", [
                          skillItem("Telecommunication Basics", 90),
                          skillItem("Signal Processing", 85),
                          skillItem("Wireless Communication", 88),
                          skillItem("Optical Fiber", 80),
                          skillItem("Antenna Theory", 75),
                        ]),
                      ),

                      const SizedBox(width: 20),

                      // Column 2
                      Expanded(
                        child: skillColumn("Networking & Systems", [
                          skillItem("IP Networking", 85),
                          skillItem("VoIP", 80),
                          skillItem("LTE / 5G", 82),
                          skillItem("Network Security", 78),
                          skillItem("Switching Systems", 75),
                        ]),
                      ),

                      const SizedBox(width: 20),

                      // Column 3
                      Expanded(
                        child: skillColumn("Tools & Technologies", [
                          skillItem("MATLAB", 90),
                          skillItem("Cisco Packet Tracer", 85),
                          skillItem("Wireshark", 88),
                          skillItem("Linux", 80),
                          skillItem("Git", 75),
                        ]),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            // ---------------------------------------------- Educations & Certificates ---------------------------------
            Container(key: educationKey),
            SizedBox(
              child: Text(
                "Educations & Certificates",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              width: 1500,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
              ),
              child: Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Education Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Education",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: boxDecoration(),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Icon(Icons.school, color: Colors.blue),
                                SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Bachelor of Telecommunication and Network Engineering",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Institute of Technology of Cambodia",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Phnom Penh, Cambodia",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "2022 - 2026",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "GPA: 3.0",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 50),
                    // Certificates Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Certificates",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: boxDecoration(),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Icon(Icons.celebration, color: Colors.blue),
                                SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Internship Certificate",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Trust Global Services Co., Ltd.",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Phnom Penh, Cambodia",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "07 July 2025 - 07 October 2025",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ---------------------------------- Project Featured ---------------------------------------------
            SizedBox(height: 30),
            Container(key: projectsKey),
            SizedBox(
              child: Text(
                "Featured Projects",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              child: Text(
                "Here are some of my recent projects that showcase my skills and experience in building modern web applications.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueGrey[600],
                  height: 1.5,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              width: 1500,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
              ),
              child: Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Project Column
                    Expanded(
                      child: Container(
                        width: 200,
                        height: 750,
                        padding: EdgeInsets.all(16),
                        decoration: boxDecoration(),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //
                            SizedBox(child: inventory),

                            Text(
                              "Inventory Management System",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Cross-platform inventory management application designed to track, manage, and organize products efficiently. The system supports stock monitoring, item categorization, and real-time updates. It helps users manage inventory levels, reduce errors, and improve operational efficiency. Additional features include transaction history, low-stock alerts, and multi-user access for teams or organizations.",
                              style: TextStyle(fontSize: 16, height: 1.5),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(height: 16),
                            Text(
                              "Technology Stack:\n"
                              "   -   Flutter\n"
                              "   -   Firebase\n"
                              "   -   REST API\n",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 50),
                    Expanded(
                      child: Container(
                        width: 200,
                        height: 750,
                        padding: EdgeInsets.all(16),
                        decoration: boxDecoration(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //
                            SizedBox(child: alarm),
                            SizedBox(height: 16),
                            Text(
                              "Mobile Alarm System",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Cross-platform alarm and alert management application with customizable alarms, schedules, and notification rules. Supports offline operation, real-time synchronization, and multi-device alerts. Includes features such as alarm history, priority levels, and shared alerts for teams or households.",
                              style: TextStyle(fontSize: 16, height: 1.5),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(height: 16),
                            Text(
                              "Technology Stack:\n"
                              "   -   React Native\n"
                              "   -   Firebase\n"
                              "   -   Redux\n",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 50),
                    Expanded(
                      child: Container(
                        width: 200,
                        height: 750,
                        padding: EdgeInsets.all(16),
                        decoration: boxDecoration(),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //
                            SizedBox(child: student),
                            SizedBox(height: 16),
                            Text(
                              "Student Management System",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "A student management system developed using C++ programming language to manage and organize student records efficiently. The system supports core operations such as adding, updating, deleting, and searching student information through a console-based application. It is designed for academic use and helps students practice object-oriented programming concepts, data structures, and file handling in C++.",
                              style: TextStyle(fontSize: 16, height: 1.5),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(height: 16),
                            Text(
                              "Technology Stack:\n"
                              "   -   C++ Programming Language\n"
                              "   -   Object-Oriented Programming (Classes & Objects)\n"
                              "   -   File Handling (Text or Binary Files)\n"
                              "   -   Command Line Interface (CLI)\n",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 50),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // ---------------------------------- Contact Me ---------------------------------------------
            Container(key: contactKey),
            SizedBox(
              child: Text(
                "Contact Me",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 20),

            SizedBox(
              child: Text(
                "I'm always open to discussing new projects, creative ideas, or opportunities to be part of your vision.",
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              width: 1500,

              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Information",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.email, color: Colors.blue),
                      SizedBox(width: 8),
                      Text("Email:    ", style: TextStyle(fontSize: 16)),
                      SizedBox(width: 8),
                      TextButton(
                        onPressed: () async {
                          await launchUrl(
                            Uri.parse('mailto:thoungratha19@gmail.com'),
                          );
                        },
                        child: Text(
                          "thoungratha19@gmail.com",
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.phone, color: Colors.blue),
                      SizedBox(width: 8),
                      Text("Phone:    ", style: TextStyle(fontSize: 16)),
                      SizedBox(width: 8),
                      Text(
                        "(+855) 978 523 293",
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.location_city, color: Colors.blue),
                      SizedBox(width: 8),
                      Text("Address:    ", style: TextStyle(fontSize: 16)),
                      SizedBox(width: 8),
                      Text(
                        "Phnom Penh, Cambodia",
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                  Text(
                    "Connect with Me",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: () async {
                          await launchUrl(
                            Uri.parse('https://github.com/thoungratha'),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,

                          padding: EdgeInsets.symmetric(
                            // Increased horizontal padding
                            horizontal: 32,
                            vertical: 16, // Increased vertical padding
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.code),
                            SizedBox(width: 8),
                            Text('Github', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      OutlinedButton(
                        onPressed: () async {
                          await launchUrl(
                            Uri.parse(
                              'https://www.linkedin.com/in/thoungratha/',
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            // Increased horizontal padding
                            horizontal: 32,
                            vertical: 16, // Increased vertical padding
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.link),
                            SizedBox(width: 8),
                            Text('LinkIn', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*
    We use BoxDecoration to make containers look beautiful.
    It controls the shape, color, border, shadow, and background.
  */
  // Decorations
  BoxDecoration boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
    );
  }

  // Skill Column Widget
  Widget skillColumn(String title, List<Widget> skills) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        ...skills,
      ],
    );
  }

  // Skill Item Widget
  Widget skillItem(String name, int percent) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(name), Text("$percent%")],
          ),
          SizedBox(height: 6),
          LinearProgressIndicator(
            value: percent / 100,
            minHeight: 6,
            backgroundColor: Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ],
      ),
    );
  }
}
