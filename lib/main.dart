import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'THOUNG Ratha - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // GlobalKeys for scrolling
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey educationKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  // Scroll to a specific section of the screen
  void scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!, // Get the context of the key
      duration: const Duration(
        milliseconds: 700,
      ), // Increased duration for better effect
      curve: Curves.easeInOut, // Adjusted for smoother scrolling
    );
  }

  @override
  Widget build(BuildContext context) {
    // Determine screen width for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 800;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          "THOUNG Ratha",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),

        actions: isMobile
            ? null // Hide text buttons on mobile for a cleaner look, or use a Drawer
            : [
                navButton("About", aboutKey),
                navButton("Experience", experienceKey),
                navButton("Skills", skillsKey),
                navButton("Education", educationKey),
                navButton("Projects", projectsKey),
                navButton("Contact", contactKey),
              ],
      ),
      drawer: isMobile
          ? Drawer(
              child: ListView(
                children: [
                  drawerItem("About", aboutKey),
                  drawerItem("Experience", experienceKey),
                  drawerItem("Skills", skillsKey),
                  drawerItem("Education", educationKey),
                  drawerItem("Projects", projectsKey),
                  drawerItem("Contact", contactKey),
                ],
              ),
            )
          : null,
      body: SingleChildScrollView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 1100,
            ), // Limits width on ultra-wide screens
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 40),
                buildHeroSection(isMobile),
                const SizedBox(height: 60),
                buildAboutSection(isMobile),
                const SizedBox(height: 60),
                buildExperienceSection(),
                const SizedBox(height: 60),
                buildSkillsSection(isMobile),
                const SizedBox(height: 60),
                buildEducationSection(isMobile),
                const SizedBox(height: 60),
                buildProjectsSection(isMobile),
                const SizedBox(height: 60),
                buildContactSection(isMobile),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ), // Limits width on ultra-wide screens
      ),
    );
  }

  // Navigation button for desktop/tablet navigation
  Widget navButton(String text, GlobalKey key) {
    return TextButton(
      onPressed: () => scrollTo(key),
      child: Text(text, style: const TextStyle(color: Colors.black54)),
    );
  }

  // Drawer item for mobile navigation
  Widget drawerItem(String text, GlobalKey key) {
    return ListTile(
      title: Text(text),
      onTap: () {
        Navigator.pop(context);
        scrollTo(key);
      },
    );
  }

  // ---------------------------------------------  Section Widgets -------------------------------------------------
  // Hero Section Widget
  Widget buildHeroSection(bool isMobile) {
    return Container(
      key: aboutKey,
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        children: [
          CircleAvatar(
            radius: isMobile ? 80 : 120,
            backgroundImage: const AssetImage('assets/profile.jpg'),
          ),
          SizedBox(width: isMobile ? 0 : 50, height: isMobile ? 30 : 0),
          Expanded(
            flex: isMobile ? 0 : 1,
            child: Column(
              crossAxisAlignment: isMobile
                  ? CrossAxisAlignment
                        .center // Center text on mobile
                  : CrossAxisAlignment
                        .start, // Align text to the start on larger screens
              children: [
                const Text(
                  'THOUNG Ratha',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Telecommunication & Network Engineer',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Phnom Penh, Cambodia | (+855) 978 523 293',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                const Text(
                  'I am a motivated four-year Telecommunication Network Engineeringstudent at the Institute of Technology of Cambodia, seeking aninternship opportunity to apply academic knowledge in a practicalenvironment. Eager to learn and contribute to real-world networkingprojects while gaining hands-on experience.',
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: isMobile
                      ? WrapAlignment
                            .center // Center buttons on mobile
                      : WrapAlignment
                            .start, // Align buttons to the start on larger screens
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => launchUrl(
                        Uri.parse('mailto:thoungratha19@gmail.com'),
                      ),
                      icon: const Icon(Icons.email),
                      label: const Text("Email"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () => launchUrl(
                        Uri.parse('https://github.com/thoungratha'),
                      ),
                      icon: const Icon(Icons.code),
                      label: const Text("GitHub"),
                    ),
                    OutlinedButton.icon(
                      onPressed: () => launchUrl(
                        Uri.parse('https://www.linkedin.com/in/thoungratha/'),
                      ),
                      icon: const Icon(Icons.link),
                      label: const Text("LinkedIn"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // About Section Widget
  Widget buildAboutSection(bool isMobile) {
    return Column(
      children: [
        const Text(
          "About Me",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 30),
        Flex(
          direction: isMobile ? Axis.vertical : Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: isMobile ? 0 : 1,
              child: infoBlock(
                "Who I am",
                "I am a dedicated Telecommunication and Network Engineering student at the Institute of Technology of Cambodia. With a strong foundation in network systems and a passion for technology, I am eager to apply my academic knowledge in real-world scenarios through internships and projects.",
              ),
            ),
            SizedBox(width: isMobile ? 0 : 40, height: isMobile ? 30 : 0),
            Expanded(
              flex: isMobile ? 0 : 1,
              child: infoBlock(
                "What I Do",
                "I specialize in network design, implementation, and troubleshooting. My skills include IP networking, wireless communication, and network security. I am proficient in tools such as MATLAB, Cisco Packet Tracer, and Linux. I am committed to continuous learning and staying updated with the latest industry trends.",
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Info Block Widget for About Section
  Widget infoBlock(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          content,
          style: const TextStyle(fontSize: 16, height: 1.6),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }

  // Experience Section Widget
  Widget buildExperienceSection() {
    return Column(
      key: experienceKey,
      children: [
        const Text(
          "Work Experience",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 20),
        card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "System Engineer Internship",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Trust Global Services Co., Ltd. | 07 July 2025 - 07 October 2025",
                style: TextStyle(color: Colors.grey),
              ),

              const Divider(height: 30),
              const Text(
                "• Installed and maintained Windows and Linux servers.\n• Managed Synology NAS systems and data backups.\n• Troubleshot hardware and software issues. \n• Assisted in network configuration and security protocols. \n• Collaborated with the IT team to optimize system performance.",
                style: TextStyle(height: 1.8),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Laboratory Assistant",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Institute of Technology of Cambodia | 01 November 2023 - Present",
                style: TextStyle(color: Colors.grey),
              ),
              const Divider(height: 30),

              const Text(
                "• Assisted professors in setting up and maintaining lab equipment for networking courses.\n• Guided students through practical exercises and experiments.\n• Ensured safety protocols were followed in the laboratory environment.\n• Managed inventory of lab supplies and equipment.",
                style: TextStyle(height: 1.8),
              ),
              const SizedBox(height: 20),

              const Text(
                "• Supported the development of lab manuals and instructional materials for students.\n• Coordinated with faculty to schedule lab sessions and manage student attendance.\n• Provided technical support during lab sessions to ensure smooth operation of equipment.",
                style: TextStyle(height: 1.8),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Skills Section Widget
  Widget buildSkillsSection(bool isMobile) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Define the list of skill columns to keep the code clean
    List<Widget> skillColumns = [
      Expanded(
        flex: isMobile
            ? 0
            : 1, // Don't use Expanded inside Wrap/Column on mobile
        child: skillBox("Core Telecom", [
          skillItem("Network Fundamentals", 85),
          skillItem("Wireless Communication", 80),
          skillItem("Signal Processing", 75),
          skillItem("Telecommunication Systems", 70),
          skillItem("Digital Communications", 65),
        ], screenWidth: screenWidth),
      ),
      if (!isMobile) const SizedBox(width: 20),
      Expanded(
        flex: isMobile ? 0 : 1,
        child: skillBox("Networking & Systems", [
          skillItem("IP Networking", 80),
          skillItem("Network Security", 75),
          skillItem("Linux Administration", 70),
          skillItem("Cisco Packet Tracer", 65),
          skillItem("MATLAB", 60),
        ], screenWidth: screenWidth),
      ),
      if (!isMobile) const SizedBox(width: 20),
      Expanded(
        flex: isMobile ? 0 : 1,
        child: skillBox("Programming & Tools", [
          skillItem("Python", 70),
          skillItem("MATLAB", 75),
          skillItem("C/C++", 65),
          skillItem("Git & GitHub", 80),
          skillItem("Firebase", 60),
        ], screenWidth: screenWidth),
      ),
      if (!isMobile) const SizedBox(width: 20),
      Expanded(
        flex: isMobile ? 0 : 1,
        child: skillBox("Soft Skills", [
          skillItem("Problem Solving", 85),
          skillItem("Team Collaboration", 80),
          skillItem("Communication", 75),
          skillItem("Adaptability", 70),
          skillItem("Critical Thinking", 65),
        ], screenWidth: screenWidth),
      ),
    ];

    return Column(
      key: skillsKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Skills & Technologies",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 30),
        // Switch between Row for Desktop and Column for Mobile
        isMobile
            ? Column(
                children: skillColumns
                    .map((e) => e is Expanded ? e.child : e)
                    .toList(),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: skillColumns,
              ),
      ],
    );
  }

  // Project Section Widget
  Widget buildProjectsSection(bool isMobile) {
    return Column(
      key: projectsKey,
      children: [
        const Text(
          "Featured Projects",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: [
            projectCard(
              "Inventory System",
              "Flutter, Firebase",
              "assets/logo.jpg",
              isMobile,
            ),
            projectCard(
              "Mobile Alarm",
              "React Native, Firebase",
              "assets/alarm.jpg",
              isMobile,
            ),
            projectCard(
              "Student Management",
              "C++, OOP",
              "assets/studentproject.jpg",
              isMobile,
            ),
          ],
        ),
      ],
    );
  }

  // Contact Section Widget
  Widget buildContactSection(bool isMobile) {
    return Column(
      key: contactKey,
      children: [
        const Text(
          "Contact Me",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 20),
        card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const ListTile(
                leading: Icon(Icons.email, color: Colors.blue),
                title: Text("thoungratha19@gmail.com"),
              ),
              const ListTile(
                leading: Icon(Icons.phone, color: Colors.blue),
                title: Text("(+855) 978 523 293"),
              ),
              const ListTile(
                leading: Icon(Icons.location_on, color: Colors.blue),
                title: Text("Phnom Penh, Cambodia"),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // --- Reusable Components ---
  Widget card({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),

        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: child,
    );
  }

  // Skill Box Widget
  Widget skillBox(
    String title,
    List<Widget> skills, {
    required double screenWidth,
  }) {
    return Container(
      // This logic prevents the "overflow" on small screens
      width: screenWidth > 800 ? (screenWidth / 3.5) : double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          ...skills,
        ],
      ),
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

  // project card widget
  Widget projectCard(String title, String tech, String asset, bool isMobile) {
    return Container(
      width: isMobile ? double.infinity : 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: Center(
              child: Image.asset(
                asset,
                errorBuilder: (c, e, s) => const Icon(Icons.image, size: 50),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  tech,
                  style: const TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Education Section Widget
  Widget buildEducationSection(bool isMobile) {
    return Column(
      key: educationKey,
      children: [
        const Text(
          "Education",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 20),
        card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "High School Diploma",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "Hun Sen Taing Kork High School",
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                "2019 - 2022 | Grade: C",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        const SizedBox(height: 20),

        card(
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bachelor of Telecommunication and Network Engineering",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "Institute of Technology of Cambodia",
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                "2022 - 2026 | GPA: 3.0",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
