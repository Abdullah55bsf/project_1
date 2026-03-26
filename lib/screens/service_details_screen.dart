import 'package:flutter/material.dart';

class ServiceDetailsScreen extends StatefulWidget {
  final Map<String, dynamic>? expert;

  const ServiceDetailsScreen({super.key, this.expert});

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  bool _isFavorite = false;

  final List<Map<String, dynamic>> _recentProjects = [
    {'color': Color(0xFFBFDBFE), 'icon': Icons.water_damage_rounded},
    {'color': Color(0xFFD1FAE5), 'icon': Icons.electrical_services_rounded},
    {'color': Color(0xFFE0E7FF), 'icon': Icons.ac_unit_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    final expert = widget.expert ?? {
      'name': 'Ahmed Hassan',
      'category': 'PLUMBING',
      'categoryColor': Color(0xFF3B82F6),
      'experience': '8+ Years Exp.',
      'price': 20,
      'rating': 4.9,
    };

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F0),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // Hero Image / Header
              SliverAppBar(
                expandedHeight: 260,
                pinned: true,
                backgroundColor: const Color(0xFF1D4ED8),
                leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.arrow_back_ios_new_rounded,
                        color: Colors.white, size: 18),
                  ),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isFavorite = !_isFavorite;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        _isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                        color: _isFavorite ? Colors.red : Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Background gradient
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),

                      // Expert placeholder image
                      Positioned(
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: Container(
                          width: 160,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                          ),
                          child: const Icon(
                            Icons.engineering_rounded,
                            color: Colors.white,
                            size: 90,
                          ),
                        ),
                      ),

                      // Decorative bubbles
                      Positioned(
                        left: -30,
                        top: -30,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.05),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),

                      // Expert info overlay at bottom
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.5),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Badges
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  _buildBadge('VERIFIED PRO', const Color(0xFF2563EB)),
                                  _buildRatingBadge(expert['rating'] as double),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                expert['name'] as String,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  letterSpacing: -0.5,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.location_on_rounded,
                                      color: Color(0xFFF59E0B), size: 14),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      'Expert ${expert['category']} • ${expert['experience']}',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
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
              ),

              // Content
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // About Service
                      _buildSectionCard(
                        title: 'About Service',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Professional plumbing services for all your household needs. '
                              'Specializing in leak repairs, pipe installations, bathroom fittings, '
                              'and emergency fixes. Guaranteed satisfaction with premium materials '
                              'and high precision.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF6B7280),
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 14),
                            Row(
                              children: [
                                _buildFeatureTag(
                                  Icons.verified_rounded,
                                  'Insured Service',
                                  const Color(0xFF2563EB),
                                ),
                                const SizedBox(width: 10),
                                _buildFeatureTag(
                                  Icons.flash_on_rounded,
                                  'Emergency Repair',
                                  const Color(0xFF10B981),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Pricing Card
                      _buildSectionCard(
                        title: null,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'ESTIMATED COST',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF9CA3AF),
                                      letterSpacing: 0.8,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '\$${expert['price']}',
                                        style: const TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xFF111827),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 4, left: 2),
                                        child: Text(
                                          '/hour',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF9CA3AF),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    'Base service charge',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF9CA3AF),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Divider
                            Container(
                              width: 1,
                              height: 70,
                              color: const Color(0xFFF3F4F6),
                            ),

                            const SizedBox(width: 16),

                            // Instant Quote
                            Column(
                              children: [
                                const Icon(
                                  Icons.bolt_rounded,
                                  color: Color(0xFF10B981),
                                  size: 28,
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'INSTANT QUOTE',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF10B981),
                                    letterSpacing: 0.3,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  'Get quote now',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF9CA3AF),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Recent Projects
                      _buildSectionCard(
                        title: 'Recent Projects',
                        trailing: GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'View Portfolio',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2563EB),
                            ),
                          ),
                        ),
                        child: Row(
                          children: _recentProjects
                              .map((project) => Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Container(
                                        height: 80,
                                        decoration: BoxDecoration(
                                          color: project['color'] as Color,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Icon(
                                          project['icon'] as IconData,
                                          color: Colors.white,
                                          size: 32,
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Reviews Section
                      _buildSectionCard(
                        title: 'Customer Reviews',
                        child: Column(
                          children: [
                            _buildReview(
                              name: 'Fatima N.',
                              rating: 5,
                              text: 'Excellent work! Fixed our pipe leak within an hour. Very professional.',
                              time: '2 days ago',
                            ),
                            const Divider(height: 20, color: Color(0xFFF3F4F6)),
                            _buildReview(
                              name: 'Bilal M.',
                              rating: 5,
                              text: 'Great service at a fair price. Would highly recommend!',
                              time: '1 week ago',
                            ),
                          ],
                        ),
                      ),

                      // Space for the floating Book Now button
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Floating Book Now Button + Chat
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Chat Button
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF6FF),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.chat_bubble_outline_rounded,
                      color: Color(0xFF2563EB),
                      size: 22,
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Book Now Button
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          _showBookingConfirmation(context, expert);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2563EB),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          'BOOK NOW',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildRatingBadge(double rating) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF59E0B),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          const Icon(Icons.star_rounded, color: Colors.white, size: 12),
          const SizedBox(width: 3),
          Text(
            '$rating',
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureTag(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 14),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({
    required String? title,
    required Widget child,
    Widget? trailing,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111827),
                  ),
                ),
                if (trailing != null) trailing,
              ],
            ),
            const SizedBox(height: 14),
          ],
          child,
        ],
      ),
    );
  }

  Widget _buildReview({
    required String name,
    required int rating,
    required String text,
    required String time,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: const Color(0xFF2563EB).withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.person_rounded, color: Color(0xFF2563EB), size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF111827),
                    ),
                  ),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF9CA3AF),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 3),
              Row(
                children: List.generate(
                  rating,
                  (i) => const Icon(Icons.star_rounded,
                      color: Color(0xFFF59E0B), size: 13),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF6B7280),
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showBookingConfirmation(BuildContext context, Map<String, dynamic> expert) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFE5E7EB),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Confirm Booking',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF111827),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Book ${expert['name']} for \$${expert['price']}/hr',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF6B7280),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: const BorderSide(color: Color(0xFFE5E7EB)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF374151),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Booking confirmed with ${expert['name']}!'),
                          backgroundColor: const Color(0xFF10B981),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2563EB),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Confirm',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
