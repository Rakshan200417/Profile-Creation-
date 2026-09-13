import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Creation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Modern Material 3 theme configuration
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFAFAFA),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          primary: Colors.black,
        ),
      ),
      home: const ProfileScreen(),
    );
  }
}

/// The ProfileScreen widget displays user details according to the assignment specification.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Light gray / off-white background as required by the specification
      backgroundColor: const Color(0xFFF9F9F9),

      // APP BAR: Dark/black background, centered title with white text
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),

      // BODY: Scrollable to avoid overflow on smaller screens
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),

            // 1. CENTERED CIRCULAR AVATAR WITH VERIFIED BADGE
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Outer container providing the white ring / border around the avatar
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 3.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/avatar.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // Fallback placeholder if asset is loading or missing
                          return Container(
                            color: Colors.grey[200],
                            child: const Icon(
                              Icons.person,
                              size: 70,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  // Small green circular badge with white checkmark overlapping bottom-right edge
                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4CAF50), // Vibrant green
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // 2. THIN HORIZONTAL DIVIDER LINE
            // Spans most of the width with indent and endIndent
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(
                color: Color(0xFF333333), // Dark thin line matching reference
                thickness: 1.2,
                height: 1,
              ),
            ),

            const SizedBox(height: 28),

            // 3. VERTICAL LIST OF LABELED FIELDS (Left-aligned, generous spacing)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Field 1: Name
                  _buildProfileField(
                    label: 'Name',
                    content: const Text(
                      'Diluka',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  const SizedBox(height: 28), // Generous spacing between groups

                  // Field 2: Email (with envelope icon)
                  _buildProfileField(
                    label: 'Email',
                    content: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.mail,
                          size: 18,
                          color: Colors.black,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'diluka.w@nsbm.ac.lk',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28), // Generous spacing between groups

                  // Field 3: Points (with star icon)
                  _buildProfileField(
                    label: 'Points',
                    content: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.black,
                        ),
                        SizedBox(width: 8),
                        Text(
                          '0',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 80), // Padding to prevent FAB overlap
          ],
        ),
      ),

      // 4. FLOATING ACTION BUTTON: Circular black FAB with white "+" icon
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for FAB - can be extended if needed
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Action button tapped'),
              duration: Duration(seconds: 1),
            ),
          );
        },
        backgroundColor: Colors.black,
        elevation: 4,
        shape: const CircleBorder(), // Explicit circular shape
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 26,
        ),
      ),
    );
  }

  /// Helper widget to build a labeled field with a bold title and a content widget below it.
  Widget _buildProfileField({
    required String label,
    required Widget content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(height: 6),
        content,
      ],
    );
  }
}
