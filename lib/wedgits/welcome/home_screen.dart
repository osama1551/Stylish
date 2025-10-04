import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


// Data models for simplicity
class Brand {
  final String name;
  final String? logoPath;

  const Brand(this.name, {this.logoPath});
}

class Product {
  final String name;
  final String description;
  final String price;
  final String imagePath;

  const Product(this.name, this.description, this.price, this.imagePath);
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Brand> brands = const [
    // Using SVG assets for all logos
    Brand('Adidas', logoPath: 'assets/images/adidas_logo.png'), // Keep PNG for Adidas
    Brand('Nike', logoPath: 'assets/images/nike_logo.png'),     // Use SVG for Nike
    Brand('Fila', logoPath: 'assets/images/fila_logo.svg'),     // Use SVG
    Brand('Puma', logoPath: 'assets/images/puma_logo.svg'),       // Use SVG
  ];

  final List<Product> products = const [
    Product(
      'Nike Sportswear Club Fleece',
      '\$99',
      '99',
      'assets/product1.png', // Placeholder image
    ),
    Product(
      'Trail Running Jacket Nike Windrunner',
      '\$99',
      '99',
      'assets/product2.png', // Placeholder image
    ),
    // ... more products
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Scrollable content area
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 50),
                  // Header (Menu and Cart Icon)
                  const TopHeader(),
                  const SizedBox(height: 20),

                  // Greeting Text
                  const Text(
                    'Hello',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Welcome to Stylish.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 25),

                  // Search Bar
                  const SearchBarWidget(),
                  const SizedBox(height: 25),

                  // Choose Brand Header
                  const SectionHeader(title: 'Choose Brand'),
                  const SizedBox(height: 15),

                  // Brand List (Horizontal Scroll)
                  BrandList(brands: brands),
                  const SizedBox(height: 30),

                  // New Arrival Header
                  const SectionHeader(title: 'New Arraival'),
                  const SizedBox(height: 15),

                  // Product Grid
                  ProductGrid(products: products),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar (Fixed at the bottom)
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}

// --- Custom Widgets ---

class TopHeader extends StatelessWidget {
  const TopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.menu, size: 30, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.shopping_bag_outlined, size: 30, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Search Input
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: const Color(0xFF27273A), // Darker background for search
              borderRadius: BorderRadius.circular(10),
            ),
            child: const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: Colors.white54),
                prefixIconConstraints: BoxConstraints(minWidth: 40),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        // Voice Search Button
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFF6A1B9A), // Purple color
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon: const Icon(Icons.mic, color: Colors.white),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const Text(
          'View All',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}

class BrandList extends StatelessWidget {
  final List<Brand> brands;

  const BrandList({required this.brands, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: brands.length + 1, // +1 for the initial 'All' button
        itemBuilder: (context, index) {
          if (index == 0) {
            // "All" button style
            return const Padding(
              padding: EdgeInsets.only(right: 10),
              child: BrandChip(
                name: 'All',
                logoPath: null,
                isPrimary: true,
              ),
            );
          }
          final brand = brands[index - 1];
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: BrandChip(
              name: brand.name,
              logoPath: brand.logoPath,
              isPrimary: false,
            ),
          );
        },
      ),
    );
  }
}

class BrandChip extends StatelessWidget {
  final String name;
  final String? logoPath;
  final bool isPrimary;

  const BrandChip({
    required this.name,
    required this.logoPath,
    required this.isPrimary,
    super.key,
  });

  Widget _buildLogo(String logoPath) {
    // Check if it's an SVG file
    if (logoPath.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(
        logoPath,
        width: 18,
        height: 18,
        fit: BoxFit.contain,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        placeholderBuilder: (context) => const Icon(Icons.star, size: 18, color: Colors.white),
      );
    }
    
    // For PNG files, use Image.asset
    return Image.asset(
      logoPath,
      width: 18,
      height: 18,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        // Fallback to icon if image fails to load
        return const Icon(Icons.star, size: 18, color: Colors.white);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: isPrimary ? const Color(0xFF6A1B9A) : const Color(0xFF27273A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Display actual logos (PNG and SVG support)
          if (logoPath != null)
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: _buildLogo(logoPath!),
            ),
          Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  final List<Product> products;

  const ProductGrid({required this.products, super.key});

  @override
  Widget build(BuildContext context) {
    // Generate a 2-column grid. The list is hardcoded to show 4 items for layout demo.
    return GridView.builder(
      shrinkWrap: true, // Important for nested scroll views
      physics: const NeverScrollableScrollPhysics(), // Disable grid scrolling
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 15.0,
        childAspectRatio: 0.65, // Adjust item aspect ratio to match the image
      ),
      itemCount: 4, // Display 4 cards for the layout visual
      itemBuilder: (context, index) {
        // Use the same product data repeatedly for layout demo
        final product = products[index % products.length];
        return ProductCard(
          product: product,
          // Assign different placeholder images based on index
          imagePath: index == 0 ? 'assets/product1.png' :
          index == 1 ? 'assets/product2.png' :
          index == 2 ? 'assets/product3.png' : 'assets/product4.png',
        );
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final String imagePath; // Used for unique image display in the demo

  const ProductCard({required this.product, required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product Image Container
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF33334A), // Slightly lighter background for the card area
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Placeholder for actual product image
                Center(
                  child: Icon(
                    Icons.image,
                    size: 80,
                    color: Colors.white12,
                  ),
                ),
                // Like Button (Heart Icon)
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Product Name
        Text(
          product.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        // Price
        Text(
          '\$${product.price}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Color(0xFF1E1E2D), // Same dark background
        border: Border(
          top: BorderSide(color: Colors.white12, width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Home - Active
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.home, color: Color(0xFF6A1B9A), size: 24),
              Text('Home', style: TextStyle(color: Color(0xFF6A1B9A), fontSize: 12)),
            ],
          ),
          // Favorite
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.white54, size: 24),
            onPressed: () {},
          ),
          // Bag
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white54, size: 24),
            onPressed: () {},
          ),
          // Wallet
          IconButton(
            icon: const Icon(Icons.account_balance_wallet_outlined, color: Colors.white54, size: 24),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}