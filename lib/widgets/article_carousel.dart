import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ArticleCarousel extends StatefulWidget {
  const ArticleCarousel({Key? key}) : super(key: key);

  @override
  State<ArticleCarousel> createState() => _ArticleCarouselState();
}

class _ArticleCarouselState extends State<ArticleCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int _totalPages = 3; // We have 3 pages in our carousel

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _nextPage() {
    if (_currentPage < _totalPages - 1) {
      _goToPage(_currentPage + 1);
    } else {
      _goToPage(0); // Loop back to first page
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _goToPage(_currentPage - 1);
    } else {
      _goToPage(_totalPages - 1); // Loop to last page
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive design
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Stack(
        children: [
          // Carousel Container
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: SizedBox(
              height: screenWidth <= 640 ? 350 : 300, // Adjust height based on screen size
              child: PageView(
                controller: _pageController,
                children: [
                  // Page 1
                  _buildCarouselPage([
                    _buildArticleCard(
                      'Judul Artikel 1',
                      'https://cdn.builder.io/api/v1/image/assets/TEMP/95b50ac3847b6e6a77e5410d5e97c1a1ff84648c?placeholderIfAbsent=true',
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas quis mollis metus. Quisque quis dapibus lacus, ege',
                      screenWidth,
                    ),
                  ]),

                  // Page 2
                  _buildCarouselPage([
                    _buildArticleCard(
                      'Judul Artikel 1',
                      'https://cdn.builder.io/api/v1/image/assets/TEMP/95b50ac3847b6e6a77e5410d5e97c1a1ff84648c?placeholderIfAbsent=true',
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas quis mollis metus. Quisque quis dapibus lacus, ege',
                      screenWidth,
                    ),
                  ]),

                  // Page 3
                  _buildCarouselPage([
                    _buildArticleCardWithTwoImages(
                      'Judul Artikel 1',
                      'https://cdn.builder.io/api/v1/image/assets/TEMP/ad33659c33381eac40061641b81f19d65a13ad9f?placeholderIfAbsent=true',
                      'https://cdn.builder.io/api/v1/image/assets/TEMP/95b50ac3847b6e6a77e5410d5e97c1a1ff84648c?placeholderIfAbsent=true',
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas quis mollis metus. Quisque quis dapibus lacus, ege',
                      screenWidth,
                    ),
                  ]),
                ],
              ),
            ),
          ),

          // Left Navigation Button
          Positioned(
            top: 200,
            left: 3,
            child: _buildNavigationButton(
              icon: Icons.chevron_left,
              onPressed: _previousPage,
              isLeft: true,
            ),
          ),

          // Right Navigation Button
          Positioned(
            top: 200,
            right: 3,
            child: _buildNavigationButton(
              icon: Icons.chevron_right,
              onPressed: _nextPage,
              isLeft: false,
            ),
          ),

          // Pagination Indicators
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _totalPages,
                (index) => _buildPaginationIndicator(index == _currentPage, index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselPage(List<Widget> children) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  Widget _buildNavigationButton({
    required IconData icon,
    required VoidCallback onPressed,
    required bool isLeft,
  }) {
    return Transform.translate(
      offset: const Offset(0, -20), // Adjust vertical position
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(20),
          hoverColor: AppColors.hoverColor,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.buttonColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 2),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Icon(
              icon,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPaginationIndicator(bool isActive, int index) {
    return GestureDetector(
      onTap: () => _goToPage(index),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: isActive ? AppColors.buttonColor : AppColors.cardBackgroundColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black, width: 1),
        ),
      ),
    );
  }

  Widget _buildArticleCard(
    String title,
    String imageUrl,
    String description,
    double screenWidth,
  ) {
    // Determine font sizes based on screen width
    final titleFontSize = screenWidth <= 640
        ? 14.0
        : (screenWidth <= 991 ? 15.0 : 16.0);

    final descriptionFontSize = screenWidth <= 640
        ? 10.0
        : (screenWidth <= 991 ? 11.0 : 12.0);

    final cardWidth = screenWidth <= 640
        ? screenWidth * 0.8
        : (screenWidth <= 991 ? 250.0 : 300.0);

    return Container(
      width: cardWidth,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBackgroundColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.black, width: 2),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(14, 14),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: titleFontSize,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                semanticLabel: 'Article image',
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.image_not_supported),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: descriptionFontSize,
                color: Colors.black,
                height: 1.4,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {},
                child: HoverableText(
                  text: 'Selengkapnya',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: descriptionFontSize,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                  hoverColor: AppColors.buttonColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleCardWithTwoImages(
    String title,
    String imageUrl1,
    String imageUrl2,
    String description,
    double screenWidth,
  ) {
    // Determine font sizes based on screen width
    final titleFontSize = screenWidth <= 640
        ? 14.0
        : (screenWidth <= 991 ? 15.0 : 16.0);

    final descriptionFontSize = screenWidth <= 640
        ? 10.0
        : (screenWidth <= 991 ? 11.0 : 12.0);

    final cardWidth = screenWidth <= 640
        ? screenWidth * 0.8
        : (screenWidth <= 991 ? 250.0 : 300.0);

    return Container(
      width: cardWidth,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBackgroundColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.black, width: 2),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(14, 14),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: titleFontSize,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            // First image (hidden on mobile)
            if (screenWidth > 640)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl1,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  semanticLabel: 'Article image',
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.image_not_supported),
                      ),
                    );
                  },
                ),
              ),
            if (screenWidth > 640) const SizedBox(height: 10),
            // Second image (always visible)
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl2,
                width: screenWidth <= 640 ? double.infinity : 106,
                height: screenWidth <= 640 ? 200 : 51,
                fit: BoxFit.cover,
                semanticLabel: 'Article image',
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: screenWidth <= 640 ? double.infinity : 106,
                    height: screenWidth <= 640 ? 200 : 51,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.image_not_supported),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: descriptionFontSize,
                color: Colors.black,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {},
                child: HoverableText(
                  text: 'Selengkapnya',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: descriptionFontSize,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                  hoverColor: AppColors.buttonColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// A custom widget for text that changes color on hover
class HoverableText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Color hoverColor;

  const HoverableText({
    Key? key,
    required this.text,
    required this.style,
    required this.hoverColor,
  }) : super(key: key);

  @override
  State<HoverableText> createState() => _HoverableTextState();
}

class _HoverableTextState extends State<HoverableText> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Text(
        widget.text,
        style: widget.style.copyWith(
          color: _isHovered ? widget.hoverColor : widget.style.color,
        ),
      ),
    );
  }
}