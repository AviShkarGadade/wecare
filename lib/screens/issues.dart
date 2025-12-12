import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:wecare_app/utils/colors.dart';

class IssueScreen extends StatelessWidget {
  const IssueScreen({super.key});

  static final List<Map<String, String>> sampleIssues = [
    {
      'title': 'Potholes on Main Street',
      'subtitle': 'Reported by Aditi',
      'details': '15 November 2025 • Churchgate',
      'image': 'assets/potholes.webp',
    },
    {
      'title': 'Broken Streetlights near Park',
      'subtitle': 'Reported by Rohit',
      'details': '17 November 2025 • Fort',
      'image': 'assets/broken_street_lights.jpg',
    },
    {
      'title': 'Overflowing Garbage Bin',
      'subtitle': 'Reported by Kavya ',
      'details': '20 November 2025 • Vashi',
      'image': 'assets/garbage.jpg',
    },
    {
      'title': 'Water Leakage on Road',
      'subtitle': 'Reported by Aman',
      'details': '22 November 2025 • Belapur',
      'image': 'assets/water_leakage.jpg',
    },
    {
      'title': 'Illegal Dumping Site',
      'subtitle': 'Reported by Priya',
      'details': '25 November 2025 • Kharghar',
      'image': 'assets/dumping_site.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          "Issues",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: darkGreen,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: sampleIssues.length,
        itemBuilder: (context, index) {
          final issue = sampleIssues[index];

          return SizedBox(
            height: 200,
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image(
                      image: issue['image']!.startsWith('http')
                          ? NetworkImage(issue['image']!)
                          : AssetImage(issue['image']!) as ImageProvider,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(
                            Icons.broken_image,
                            size: 50,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // dark overlay
                  Positioned.fill(child: Container(color: Colors.black45)),

                  // content
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // top-right icons
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                IconlyLight.notification,
                                color: Colors.white,
                                size: 18,
                              ),
                              SizedBox(width: 8),
                              Icon(
                                IconlyLight.more_square,
                                color: Colors.white,
                                size: 18,
                              ),
                            ],
                          ),

                          // title + details
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    issue['title']!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    issue['subtitle']!,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    issue['details']!,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),

                              // like, comment, save icons
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  _ActionButton(
                                    icon: IconlyLight.heart,
                                    label: 'Like',
                                  ),
                                  SizedBox(width: 8),
                                  _ActionButton(
                                    icon: IconlyLight.message,
                                    label: 'Comment',
                                  ),
                                  SizedBox(width: 8),
                                  _ActionButton(
                                    icon: IconlyLight.bookmark,
                                    label: 'Save',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ActionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('$label tapped')));
      },
      child: Icon(icon, color: primaryWhite, size: 16),
    );
  }
}
