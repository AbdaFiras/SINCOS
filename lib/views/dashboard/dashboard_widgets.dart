import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class DashboardWidgets {
  /// Header Section dengan background hijau tua tema (#005944)
  static Widget buildHeaderSection({
    required String nama,
    required String tanggal,
    VoidCallback? onNotificationTap,
  }) {
    return Container(
      color: AppColors.primaryDarkGreen,
      padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 24.0),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Baris Atas: Logo SINCOS & Ikon Notifikasi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo & Nama Aplikasi
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.bolt,
                        color: Color(0xFF99F6E4),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'SINCOS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                ),

                // Lonceng Notifikasi dengan Indikator Dot
                InkWell(
                  onTap: onNotificationTap,
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.notifications_none_outlined,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                      Positioned(
                        right: 4,
                        top: 4,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: const Color(0xFF84CC16), // Hijau kekuningan / lime
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.primaryDarkGreen,
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Baris Profil: Avatar & Sapaan Pengguna
            Row(
              children: [
                // Avatar Lingkaran
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'NA',
                    style: TextStyle(
                      color: AppColors.primaryDarkGreen,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 14),

                // Tanggal & Nama
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tanggal,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.85),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Selamat pagi, $nama!',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Card Informasi Program Magang Aktif
  static Widget buildProgramMagangCard({
    required String programTitle,
    required String divisiLokasi,
    required String periode,
    required String mingguStatus,
    required double progres,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
        boxShadow: const [
          BoxShadow(
            color: Color(0x05000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Card: Tag PROGRAM MAGANGMU & Chip Aktif
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'PROGRAM MAGANGMU',
                style: TextStyle(
                  color: AppColors.textGrey,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.activeGreenBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 7,
                      color: AppColors.activeGreen,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Aktif',
                      style: TextStyle(
                        color: AppColors.activeGreen,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Judul Program
          Text(
            programTitle,
            style: const TextStyle(
              color: AppColors.textDark,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 4),

          // Subtitle Divisi & Kota
          Text(
            divisiLokasi,
            style: const TextStyle(
              color: AppColors.textGrey,
              fontSize: 13,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 16),

          // Periode & Status Minggu
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  periode,
                  style: const TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                mingguStatus,
                style: const TextStyle(
                  color: AppColors.primaryDarkGreen,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Linear Progress Indicator
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progres,
              minHeight: 6,
              backgroundColor: Colors.grey.shade200,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.primaryDarkGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Grid Statistik Ringkas (Hari hadir & Logbook disetujui)
  static Widget buildStatGrid({
    required int hariHadir,
    required int logbookDisetujui,
  }) {
    return Row(
      children: [
        // Kotak 1: Hari Hadir
        Expanded(
          child: _buildStatCard(
            icon: Icons.calendar_today_outlined,
            value: hariHadir.toString(),
            label: 'Hari hadir',
          ),
        ),
        const SizedBox(width: 12),
        // Kotak 2: Logbook Disetujui
        Expanded(
          child: _buildStatCard(
            icon: Icons.edit_note_outlined,
            value: logbookDisetujui.toString(),
            label: 'Logbook disetujui',
          ),
        ),
      ],
    );
  }

  static Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
        boxShadow: const [
          BoxShadow(
            color: Color(0x05000000),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: AppColors.primaryDarkGreen,
            size: 26,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    color: AppColors.textDark,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  style: const TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 11,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Menu Akses Cepat (Absensi, Logbook, Sertifikat, Aduan)
  static Widget buildAksesCepatMenu({
    VoidCallback? onAbsensiTap,
    VoidCallback? onLogbookTap,
    VoidCallback? onSertifikatTap,
    VoidCallback? onAduanTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Akses cepat',
          style: TextStyle(
            color: AppColors.textDark,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _buildAksesCepatItem(
                icon: Icons.location_on_outlined,
                label: 'Absensi',
                onTap: onAbsensiTap,
              ),
            ),
            Expanded(
              child: _buildAksesCepatItem(
                icon: Icons.edit_note_outlined,
                label: 'Logbook',
                onTap: onLogbookTap,
              ),
            ),
            Expanded(
              child: _buildAksesCepatItem(
                icon: Icons.workspace_premium_outlined,
                label: 'Sertifikat',
                onTap: onSertifikatTap,
              ),
            ),
            Expanded(
              child: _buildAksesCepatItem(
                icon: Icons.headset_mic_outlined,
                label: 'Aduan',
                onTap: onAduanTap,
              ),
            ),
          ],
        ),
      ],
    );
  }

  static Widget _buildAksesCepatItem({
    required IconData icon,
    required String label,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: const BoxDecoration(
                color: AppColors.mintLight,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: AppColors.primaryDarkGreen,
                size: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                color: AppColors.textDark,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  /// List Pengumuman & Banner Pengingat
  static Widget buildPengumumanList({
    VoidCallback? onLihatSemuaTap,
    VoidCallback? onBriefingTap,
    VoidCallback? onKeamananTap,
    VoidCallback? onBannerAbsenTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Judul Pengumuman & Link Lihat Semua
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Pengumuman',
              style: TextStyle(
                color: AppColors.textDark,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: onLihatSemuaTap,
              borderRadius: BorderRadius.circular(6),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                child: Text(
                  'Lihat semua',
                  style: TextStyle(
                    color: AppColors.primaryDarkGreen,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Kartu 1: Briefing Evaluasi Tengah Magang
        InkWell(
          onTap: onBriefingTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.cardBorder),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x05000000),
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.accentAmber,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.campaign_outlined,
                    color: AppColors.accentAmberText,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Briefing evaluasi tengah magang',
                        style: TextStyle(
                          color: AppColors.textDark,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Rabu, 21 Okt · 09.00 WIB · Ruang Rapat 2',
                        style: TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'SDM & Umum · 1 jam lalu',
                        style: TextStyle(
                          color: AppColors.primaryDarkGreen.withValues(alpha: 0.9),
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Kartu 2: Panduan Keamanan Informasi
        InkWell(
          onTap: onKeamananTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.cardBorder),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x05000000),
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.mintLight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.verified_user_outlined,
                    color: AppColors.primaryDarkGreen,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Panduan keamanan informasi',
                        style: TextStyle(
                          color: AppColors.textDark,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Pelajari panduan kerja aman · Tim TI',
                        style: TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade400,
                  size: 22,
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 14),

        // Banner Pengingat: Belum Absen Masuk Hari Ini
        InkWell(
          onTap: onBannerAbsenTap,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: AppColors.bannerGreen,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.bannerGreenBorder),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.access_time,
                  color: AppColors.primaryDarkGreen,
                  size: 20,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Belum absen masuk hari ini. Yuk, mulai harimu!',
                    style: TextStyle(
                      color: AppColors.primaryDarkGreen,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: AppColors.primaryDarkGreen,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Custom Bottom Navigation Bar yang presisi sesuai desain
  static Widget buildBottomNavigationBar({
    required int currentIndex,
    required ValueChanged<int> onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade200,
            width: 1.0,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                index: 0,
                currentIndex: currentIndex,
                icon: Icons.grid_view_rounded,
                label: 'Beranda',
                onTap: () => onTap(0),
              ),
              _buildNavItem(
                index: 1,
                currentIndex: currentIndex,
                icon: Icons.location_on_outlined,
                label: 'Absensi',
                onTap: () => onTap(1),
              ),
              _buildNavItem(
                index: 2,
                currentIndex: currentIndex,
                icon: Icons.edit_note_outlined,
                label: 'Logbook',
                onTap: () => onTap(2),
              ),
              _buildNavItem(
                index: 3,
                currentIndex: currentIndex,
                icon: Icons.person_outline_rounded,
                label: 'Profil',
                onTap: () => onTap(3),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildNavItem({
    required int index,
    required int currentIndex,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    final bool isSelected = index == currentIndex;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.mintLight : Colors.transparent,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                icon,
                color: isSelected ? AppColors.primaryDarkGreen : AppColors.textGrey,
                size: 22,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected ? AppColors.primaryDarkGreen : AppColors.textGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

