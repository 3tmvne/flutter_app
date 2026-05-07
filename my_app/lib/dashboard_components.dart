import 'package:flutter/material.dart';

class HeroBannerCard extends StatelessWidget {
  const HeroBannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2E8B57), Color(0xFF6FCF97)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2E8B57).withOpacity(0.18),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.favorite_border_rounded, color: Colors.white, size: 30),
          SizedBox(height: 20),
          Text(
            'Bonjour, votre santé vous appartient',
            style: TextStyle(
              fontSize: 24,
              height: 1.15,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Prenez le contrôle de votre bien-être numérique et physique avec sérénité.',
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Color(0xFFF2FFF5),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class InfoAlertCard extends StatelessWidget {
  const InfoAlertCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3E4),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFF3D5AD)),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Color(0xFFFFE0B8),
            child: Icon(Icons.campaign_outlined, size: 18, color: Color(0xFFB5651D)),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Journée mondiale de lutte contre le SIDA : Informez-vous et participez aux événements locaux.',
              style: TextStyle(
                fontSize: 14,
                height: 1.45,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6D4B1E),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: Color(0xFF173222),
      ),
    );
  }
}

class DashboardMenuCard extends StatelessWidget {
  const DashboardMenuCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.accentColor,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color accentColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF9FAF7),
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: const Color(0xFFE5E7DF)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.14),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: accentColor, size: 24),
              ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.2,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF173222),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF718072),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F3EA),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFFE8DAC0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Prendre rendez-vous',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Color(0xFF2A2A25),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Consultez des professionnels de santé agréés en toute confidentialité.',
            style: TextStyle(
              fontSize: 14,
              height: 1.45,
              color: Color(0xFF6F665C),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF0B3A23),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(999),
              ),
            ),
            child: const Text(
              'Explorer les créneaux',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 18),
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: const LinearGradient(
                colors: [Color(0xFF233E2F), Color(0xFFAFC8B1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 18,
                  top: 18,
                  child: Container(
                    width: 92,
                    height: 92,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Colors.white.withOpacity(0.18)),
                    ),
                    child: const Icon(
                      Icons.local_hospital_outlined,
                      color: Colors.white,
                      size: 42,
                    ),
                  ),
                ),
                Positioned(
                  right: 18,
                  top: 16,
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.calendar_month_outlined,
                      size: 34,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  left: 18,
                  bottom: 16,
                  child: Container(
                    width: 132,
                    height: 14,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.45),
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
