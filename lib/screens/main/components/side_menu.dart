import '../../../utility/extensions.dart';
import '../../../utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../provider/main_screen_provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenProvider>(
      builder: (context, mainProvider, _) {
        return Drawer(
          backgroundColor: bgColor,
          child: Column(
            children: [
              // Logo Header
              Container(
                height: 120,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      primaryColor.withOpacity(0.2),
                      bgColor,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/logo.png", height: 50),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Admin Panel',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Menu Items
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: [
                    _buildSectionHeader('MAIN'),
                    DrawerListTile(
                      title: "Dashboard",
                      svgSrc: "assets/icons/menu_dashboard.svg",
                      isSelected: mainProvider.currentScreenName == 'Dashboard',
                      press: () => context.mainScreenProvider.navigateToScreen('Dashboard'),
                    ),
                    
                    const SizedBox(height: 16),
                    _buildSectionHeader('CATALOG'),
                    DrawerListTile(
                      title: "Category",
                      svgSrc: "assets/icons/menu_tran.svg",
                      isSelected: mainProvider.currentScreenName == 'Category',
                      press: () => context.mainScreenProvider.navigateToScreen('Category'),
                    ),
                    DrawerListTile(
                      title: "Sub Category",
                      svgSrc: "assets/icons/menu_task.svg",
                      isSelected: mainProvider.currentScreenName == 'SubCategory',
                      press: () => context.mainScreenProvider.navigateToScreen('SubCategory'),
                    ),
                    DrawerListTile(
                      title: "Brands",
                      svgSrc: "assets/icons/menu_doc.svg",
                      isSelected: mainProvider.currentScreenName == 'Brands',
                      press: () => context.mainScreenProvider.navigateToScreen('Brands'),
                    ),
                    DrawerListTile(
                      title: "Variant Type",
                      svgSrc: "assets/icons/menu_store.svg",
                      isSelected: mainProvider.currentScreenName == 'VariantType',
                      press: () => context.mainScreenProvider.navigateToScreen('VariantType'),
                    ),
                    DrawerListTile(
                      title: "Variants",
                      svgSrc: "assets/icons/menu_notification.svg",
                      isSelected: mainProvider.currentScreenName == 'Variants',
                      press: () => context.mainScreenProvider.navigateToScreen('Variants'),
                    ),
                    
                    const SizedBox(height: 16),
                    _buildSectionHeader('SALES'),
                    DrawerListTile(
                      title: "Orders",
                      svgSrc: "assets/icons/menu_profile.svg",
                      isSelected: mainProvider.currentScreenName == 'Order',
                      press: () => context.mainScreenProvider.navigateToScreen('Order'),
                    ),
                    DrawerListTile(
                      title: "Coupons",
                      svgSrc: "assets/icons/menu_setting.svg",
                      isSelected: mainProvider.currentScreenName == 'Coupon',
                      press: () => context.mainScreenProvider.navigateToScreen('Coupon'),
                    ),
                    
                    const SizedBox(height: 16),
                    _buildSectionHeader('MARKETING'),
                    DrawerListTile(
                      title: "Posters",
                      svgSrc: "assets/icons/menu_doc.svg",
                      isSelected: mainProvider.currentScreenName == 'Poster',
                      press: () => context.mainScreenProvider.navigateToScreen('Poster'),
                    ),
                    DrawerListTile(
                      title: "Notifications",
                      svgSrc: "assets/icons/menu_notification.svg",
                      isSelected: mainProvider.currentScreenName == 'Notifications',
                      press: () => context.mainScreenProvider.navigateToScreen('Notifications'),
                    ),
                    
                    const SizedBox(height: 16),
                    _buildSectionHeader('BNPL & USERS'),
                    DrawerListTile(
                      title: "EMI Plans",
                      svgSrc: "assets/icons/menu_setting.svg",
                      isSelected: mainProvider.currentScreenName == 'EmiPlans',
                      press: () => context.mainScreenProvider.navigateToScreen('EmiPlans'),
                      badge: 'NEW',
                    ),
                    DrawerListTile(
                      title: "KYC Management",
                      svgSrc: "assets/icons/menu_doc.svg",
                      isSelected: mainProvider.currentScreenName == 'Kyc',
                      press: () => context.mainScreenProvider.navigateToScreen('Kyc'),
                    ),
                    DrawerListTile(
                      title: "Users",
                      svgSrc: "assets/icons/menu_profile.svg",
                      isSelected: mainProvider.currentScreenName == 'Users',
                      press: () => context.mainScreenProvider.navigateToScreen('Users'),
                    ),
                  ],
                ),
              ),
              
              // Footer
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.white.withOpacity(0.1))),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [primaryColor, Color(0xFF4687FF)],
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.person, color: Colors.white, size: 20),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Admin', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
                          Text('admin@asbrand.com', style: TextStyle(color: Colors.white38, fontSize: 11)),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.logout, color: Colors.white38, size: 18),
                      onPressed: () {},
                      tooltip: 'Logout',
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 2,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(1),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.4),
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatefulWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
    this.isSelected = false,
    this.badge,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final bool isSelected;
  final String? badge;

  @override
  State<DrawerListTile> createState() => _DrawerListTileState();
}

class _DrawerListTileState extends State<DrawerListTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isActive = widget.isSelected || _isHovered;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          decoration: BoxDecoration(
            color: widget.isSelected 
              ? primaryColor.withOpacity(0.15) 
              : _isHovered 
                ? Colors.white.withOpacity(0.05) 
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: widget.isSelected 
              ? Border.all(color: primaryColor.withOpacity(0.3), width: 1) 
              : null,
          ),
          child: ListTile(
            onTap: widget.press,
            dense: true,
            horizontalTitleGap: 12,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            leading: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: isActive ? primaryColor.withOpacity(0.15) : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
              ),
              child: SvgPicture.asset(
                widget.svgSrc,
                colorFilter: ColorFilter.mode(
                  isActive ? primaryColor : Colors.white54,
                  BlendMode.srcIn,
                ),
                height: 16,
              ),
            ),
            title: Text(
              widget.title,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.white60,
                fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
                fontSize: 13,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.badge != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      widget.badge!,
                      style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                    ),
                  ),
                if (widget.isSelected)
                  Container(
                    width: 4,
                    height: 20,
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
