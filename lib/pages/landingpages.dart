import 'package:flutter/material.dart';
import '../widgets/article_carousel.dart';
import '../utils/constants.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive design
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine font sizes based on screen width
    final welcomeFontSize = screenWidth <= 640
        ? 26.0
        : (screenWidth <= 991 ? 30.0 : 34.0);

    final schoolNameFontSize = screenWidth <= 640
        ? 45.0
        : (screenWidth <= 991 ? 50.0 : 55.0);

    final descriptionFontSize = screenWidth <= 640
        ? 15.0
        : (screenWidth <= 991 ? 17.0 : 19.0);

    final aboutUsTitleFontSize = screenWidth <= 640
        ? 30.0
        : (screenWidth <= 991 ? 35.0 : 40.0);

    final buttonFontSize = screenWidth <= 640
        ? 11.0
        : (screenWidth <= 991 ? 12.0 : 13.0);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: screenWidth <= 640
                      ? 640
                      : (screenWidth <= 991 ? 991 : 440),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.all(
                  screenWidth <= 640
                      ? 10
                      : (screenWidth <= 991 ? 15 : 20),
                ),
                color: AppColors.backgroundColor,
                child: Column(
                  children: [
                    // Welcome Section
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          Text(
                            'Selamat Datang di',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: welcomeFontSize,
                              fontWeight: FontWeight.w700,
                              color: AppColors.welcomeTextColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'TK Dharma Wanita Lamong',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: schoolNameFontSize,
                              fontWeight: FontWeight.w700,
                              color: AppColors.schoolNameColor,
                              shadows: [
                                const Shadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: descriptionFontSize,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),

                    // Articles Carousel
                    const ArticleCarousel(),

                    // View All Button
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      alignment: Alignment.center,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(28),
                          hoverColor: AppColors.hoverColor,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: AppColors.buttonColor,
                              borderRadius: BorderRadius.circular(28),
                              border: Border.all(color: Colors.black, width: 2),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(3, 4),
                                ),
                              ],
                            ),
                            child: Text(
                              'Lihat Semua Kegiatan',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: buttonFontSize,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // About Us Section
                    LayoutBuilder(
                      builder: (context, constraints) {
                        if (screenWidth <= 640) {
                          // Mobile layout
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  'Tentang Kami',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: aboutUsTitleFontSize,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Image.network(
                                  'https://cdn.builder.io/api/v1/image/assets/TEMP/1b9406ab6d6b725f13fc694555e238810aaeff00?placeholderIfAbsent=true',
                                  width: 158,
                                  height: 158,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Biro Organisasi Sekretariat Daerah Provinsi Jawa Timur didukung oleh tiga bagian yaitu Bagian Kelembagaan dan Analisis Jabatan, Bagian Reformasi Birokrasi dan Akuntablitas Kinerja, serta Bagian Tata Laksana. Masing-masing bagian terdapat sub bagian dan kelompok jabatan fungsional yang',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: descriptionFontSize,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          );
                        } else {
                          // Tablet and desktop layout
                          return Column(
                            children: [
                              Text(
                                'Tentang Kami',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: aboutUsTitleFontSize,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Image.network(
                                'https://cdn.builder.io/api/v1/image/assets/TEMP/1b9406ab6d6b725f13fc694555e238810aaeff00?placeholderIfAbsent=true',
                                width: 158,
                                height: 158,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Biro Organisasi Sekretariat Daerah Provinsi Jawa Timur didukung oleh tiga bagian yaitu Bagian Kelembagaan dan Analisis Jabatan, Bagian Reformasi Birokrasi dan Akuntablitas Kinerja, serta Bagian Tata Laksana. Masing-masing bagian terdapat sub bagian dan kelompok jabatan fungsional yang',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: descriptionFontSize,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}