

import 'package:flutter/material.dart';

void main() {
runApp(const SmartInventoryApp());
}

// ============================================================
// THEME
// ============================================================

final ValueNotifier<bool> darkModeNotifier = ValueNotifier<bool>(false);

Color get ink => darkModeNotifier.value ? const Color(0xFFF4F0FF) : const Color(0xFF29233D);
Color get muted => darkModeNotifier.value ? const Color(0xFFBEB5D2) : const Color(0xFF756D86);
Color get pageBg => darkModeNotifier.value ? const Color(0xFF171427) : const Color(0xFFE4D5B4);

const Color primary = Color(0xFF7C4DFF);
const Color secondary = Color(0xFFFF6F91);
const Color accent = Color(0xFFFFB74D);
const Color danger = Color(0xFFEF5350);

Color surfaceColor(BuildContext context) => Theme.of(context).colorScheme.surface;
Color inputColor(BuildContext context) => Theme.of(context).inputDecorationTheme.fillColor ?? Theme.of(context).colorScheme.surfaceContainerHighest;
Color borderColor(BuildContext context) => Theme.of(context).dividerColor;

class SmartInventoryApp extends StatelessWidget {
const SmartInventoryApp({super.key});

@override
Widget build(BuildContext context) {
return ValueListenableBuilder<bool>(
valueListenable: darkModeNotifier,
builder: (context, isDark, _) {
final lightScheme = ColorScheme.fromSeed(
seedColor: primary,
brightness: Brightness.light,
);
final darkScheme = ColorScheme.fromSeed(
seedColor: primary,
brightness: Brightness.dark,
);

final lightTheme = ThemeData(
useMaterial3: true,
colorScheme: lightScheme,
scaffoldBackgroundColor: const Color(0xFFE4D5B4),
fontFamily: 'Inter',
brightness: Brightness.light,
dividerColor: const Color(0xFFDED6F5),
textTheme: const TextTheme(
headlineSmall: TextStyle(color: Color(0xFF29233D), fontWeight: FontWeight.w800, letterSpacing: -0.6),
titleLarge: TextStyle(color: Color(0xFF29233D), fontWeight: FontWeight.w800),
titleMedium: TextStyle(color: Color(0xFF29233D), fontWeight: FontWeight.w700),
bodyMedium: TextStyle(color: Color(0xFF756D86)),
),
appBarTheme: const AppBarTheme(
backgroundColor: Color(0xFFF8F6FF),
foregroundColor: Color(0xFF29233D),
elevation: 0,
centerTitle: false,
),
cardTheme: CardThemeData(
elevation: 0,
color: Colors.white,
margin: EdgeInsets.zero,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
),
inputDecorationTheme: InputDecorationTheme(
filled: true,
fillColor: Color(0xFFF2EEFF),
contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(14)), borderSide: BorderSide.none),
enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(14)), borderSide: BorderSide(color: Color(0xFFDED6F5))),
focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(14)), borderSide: BorderSide(color: primary, width: 1.5)),
),
);

final darkTheme = ThemeData(
useMaterial3: true,
colorScheme: darkScheme,
scaffoldBackgroundColor: const Color(0xFF171427),
fontFamily: 'Inter',
brightness: Brightness.dark,
dividerColor: const Color(0xFF453D64),
textTheme: const TextTheme(
headlineSmall: TextStyle(color: Color(0xFFF4F0FF), fontWeight: FontWeight.w800, letterSpacing: -0.6),
titleLarge: TextStyle(color: Color(0xFFF4F0FF), fontWeight: FontWeight.w800),
titleMedium: TextStyle(color: Color(0xFFF4F0FF), fontWeight: FontWeight.w700),
bodyMedium: TextStyle(color: Color(0xFFBEB5D2)),
),
appBarTheme: const AppBarTheme(
backgroundColor: Color(0xFF171427),
foregroundColor: Color(0xFFF4F0FF),
elevation: 0,
centerTitle: false,
),
cardTheme: CardThemeData(
elevation: 0,
color: Color(0xFF241F3A),
margin: EdgeInsets.zero,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
),
inputDecorationTheme: InputDecorationTheme(
filled: true,
fillColor: Color(0xFF2D2747),
contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(14)), borderSide: BorderSide.none),
enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(14)), borderSide: BorderSide(color: Color(0xFF453D64))),
focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(14)), borderSide: BorderSide(color: primary, width: 1.5)),
),
);

return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'Smart Inventory',
theme: lightTheme,
darkTheme: darkTheme,
themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
home: const LoginPage(),
);
},
);
}
}

// ============================================================
// MODEL
// ============================================================

class Product {
String name;
String category;
double price;
int quantity;
int minimumStock;

Product({
required this.name,
required this.category,
required this.price,
required this.quantity,
required this.minimumStock,
});
}

// ============================================================
// LOGIN
// ============================================================

class LoginPage extends StatefulWidget {
const LoginPage({super.key});

@override
State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
final emailController = TextEditingController();
final passwordController = TextEditingController();
bool hidePassword = true;

void login() {
Navigator.pushReplacement(
context,
MaterialPageRoute(builder: (_) => const MainPage()),
);
}

@override
void dispose() {
emailController.dispose();
passwordController.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
return Scaffold(
body: Container(
decoration: const BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: [
Color(0xFFEFF1FF),
Color(0xFFF8FBFF),
Color(0xFFE9FAF7),
],
),
),
child: Center(
child: SingleChildScrollView(
padding: const EdgeInsets.all(24),
child: ConstrainedBox(
constraints: const BoxConstraints(maxWidth: 430),
child: Card(
child: Padding(
padding: const EdgeInsets.all(30),
child: Column(
children: [
Container(
height: 74,
width: 74,
decoration: BoxDecoration(
gradient: const LinearGradient(
colors: [primary, Color(0xFF35C7A0)],
),
borderRadius: BorderRadius.circular(22),
boxShadow: [
BoxShadow(
color: primary.withOpacity(.22),
blurRadius: 22,
offset: const Offset(0, 10),
),
],
),
child: const Icon(
Icons.inventory_2_rounded,
color: Colors.white,
size: 38,
),
),
const SizedBox(height: 22),
Text(
'Smart Inventory',
style: TextStyle(
fontSize: 30,
fontWeight: FontWeight.w900,
color: ink,
),
),
const SizedBox(height: 7),
Text(
'A smarter way to manage stock and sales',
textAlign: TextAlign.center,
style: TextStyle(color: muted),
),
const SizedBox(height: 30),
TextField(
controller: emailController,
keyboardType: TextInputType.emailAddress,
decoration: const InputDecoration(
labelText: 'Email',
prefixIcon: Icon(Icons.email_outlined),
),
),
const SizedBox(height: 14),
TextField(
controller: passwordController,
obscureText: hidePassword,
decoration: InputDecoration(
labelText: 'Password',
prefixIcon: const Icon(Icons.lock_outline),
suffixIcon: IconButton(
onPressed: () {
setState(() => hidePassword = !hidePassword);
},
icon: Icon(
hidePassword
? Icons.visibility_off_outlined
    : Icons.visibility_outlined,
),
),
),
),
const SizedBox(height: 20),
SizedBox(
width: double.infinity,
height: 54,
child: FilledButton(
onPressed: login,
style: FilledButton.styleFrom(
backgroundColor: primary,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(15),
),
),
child: const Text(
'Sign in',
style: TextStyle(
fontSize: 16,
fontWeight: FontWeight.w800,
),
),
),
),
const SizedBox(height: 8),
TextButton(
onPressed: () {
Navigator.push(
context,
MaterialPageRoute(builder: (_) => const CreateAccountPage()),
);
},
child: const Text(
'Create Account',
style: TextStyle(fontWeight: FontWeight.w800),
),
),
const SizedBox(height: 4),
Text(
'Demo mode • any email and password',
style: TextStyle(fontSize: 12, color: muted),
),
],
),
),
),
),
),
),
),
);
}
}

// ============================================================
// CREATE ACCOUNT
// ============================================================

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool hidePassword = true;
  bool hideConfirmPassword = true;

  void createAccount() {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    if (!email.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address')),
      );
      return;
    }

    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password must be at least 6 characters')),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Account created successfully. Please sign in.')),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFEFF1FF),
              Color(0xFFF8FBFF),
              Color(0xFFE9FAF7),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Icon(Icons.person_add_alt_1_rounded, size: 52, color: primary),
                      const SizedBox(height: 16),
                      Text(
                        'Create your account',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900, color: ink),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        'Set up your Smart Inventory account',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: muted),
                      ),
                      const SizedBox(height: 26),
                      TextField(
                        controller: nameController,
                        textCapitalization: TextCapitalization.words,
                        decoration: const InputDecoration(
                          labelText: 'Full Name',
                          prefixIcon: Icon(Icons.person_outline_rounded),
                        ),
                      ),
                      const SizedBox(height: 14),
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      const SizedBox(height: 14),
                      TextField(
                        controller: passwordController,
                        obscureText: hidePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            onPressed: () => setState(() => hidePassword = !hidePassword),
                            icon: Icon(hidePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      TextField(
                        controller: confirmPasswordController,
                        obscureText: hideConfirmPassword,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          prefixIcon: const Icon(Icons.lock_reset_outlined),
                          suffixIcon: IconButton(
                            onPressed: () => setState(() => hideConfirmPassword = !hideConfirmPassword),
                            icon: Icon(hideConfirmPassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined),
                          ),
                        ),
                      ),
                      const SizedBox(height: 22),
                      SizedBox(
                        height: 54,
                        child: FilledButton(
                          onPressed: createAccount,
                          style: FilledButton.styleFrom(
                            backgroundColor: primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            'Create Account',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Already have an account? Sign in'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// MAIN SHELL
// ============================================================

class MainPage extends StatefulWidget {
const MainPage({super.key});

@override
State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
int selectedIndex = 0;

final List<Product> products = [
Product(
name: 'Laptop',
category: 'Electronics',
price: 55000,
quantity: 12,
minimumStock: 5,
),
Product(
name: 'Keyboard',
category: 'Accessories',
price: 1200,
quantity: 4,
minimumStock: 5,
),
Product(
name: 'Mouse',
category: 'Accessories',
price: 700,
quantity: 20,
minimumStock: 5,
),
Product(
name: 'Headphones',
category: 'Electronics',
price: 2500,
quantity: 3,
minimumStock: 5,
),
Product(
name: 'Monitor',
category: 'Electronics',
price: 15000,
quantity: 8,
minimumStock: 3,
),
];

void addProduct(Product product) => setState(() => products.add(product));

void updateProduct(int index, Product product) {
setState(() => products[index] = product);
}

void deleteProduct(int index) {
setState(() => products.removeAt(index));
}

void stockIn(int index, int amount) {
setState(() => products[index].quantity += amount);
}

void stockOut(int index, int amount) {
setState(() {
final remaining = products[index].quantity - amount;
products[index].quantity = remaining < 0 ? 0 : remaining;
});
}

void showProductDialog({int? editIndex}) {
final editing = editIndex != null;
final old = editing ? products[editIndex!] : null;

final name = TextEditingController(text: old?.name ?? '');
final category = TextEditingController(text: old?.category ?? '');
final price = TextEditingController(text: old?.price.toString() ?? '');
final quantity = TextEditingController(text: old?.quantity.toString() ?? '');
final minimum =
TextEditingController(text: old?.minimumStock.toString() ?? '');

showDialog(
context: context,
builder: (dialogContext) {
return AlertDialog(
backgroundColor: surfaceColor(context),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(24),
),
title: Text(
editing ? 'Edit product' : 'Add product',
style: TextStyle(
fontWeight: FontWeight.w800,
color: ink,
),
),
content: SizedBox(
width: 460,
child: SingleChildScrollView(
child: Column(
children: [
TextField(
controller: name,
decoration: const InputDecoration(
labelText: 'Product name',
prefixIcon: Icon(Icons.inventory_2_outlined),
),
),
const SizedBox(height: 12),
TextField(
controller: category,
decoration: const InputDecoration(
labelText: 'Category',
prefixIcon: Icon(Icons.category_outlined),
),
),
const SizedBox(height: 12),
TextField(
controller: price,
keyboardType: TextInputType.number,
decoration: const InputDecoration(
labelText: 'Price',
prefixIcon: Icon(Icons.currency_rupee),
),
),
const SizedBox(height: 12),
TextField(
controller: quantity,
keyboardType: TextInputType.number,
decoration: const InputDecoration(
labelText: 'Quantity',
prefixIcon: Icon(Icons.numbers),
),
),
const SizedBox(height: 12),
TextField(
controller: minimum,
keyboardType: TextInputType.number,
decoration: const InputDecoration(
labelText: 'Minimum stock',
prefixIcon: Icon(Icons.warning_amber_outlined),
),
),
],
),
),
),
actionsPadding: const EdgeInsets.fromLTRB(20, 0, 20, 18),
actions: [
TextButton(
onPressed: () => Navigator.pop(dialogContext),
child: const Text('Cancel'),
),
FilledButton(
onPressed: () {
final p = double.tryParse(price.text);
final q = int.tryParse(quantity.text);
final m = int.tryParse(minimum.text);

if (name.text.trim().isEmpty ||
category.text.trim().isEmpty ||
p == null ||
q == null ||
m == null ||
q < 0 ||
m < 0) {
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(content: Text('Please enter valid details')),
);
return;
}

final product = Product(
name: name.text.trim(),
category: category.text.trim(),
price: p,
quantity: q,
minimumStock: m,
);

if (editing) {
updateProduct(editIndex!, product);
} else {
addProduct(product);
}

Navigator.pop(dialogContext);
_message(
editing
? 'Product updated successfully'
    : 'Product added successfully',
);
},
child: Text(editing ? 'Update' : 'Add product'),
),
],
);
},
);
}

void showStockDialog({
required int index,
required bool stockInMode,
}) {
final controller = TextEditingController();

showDialog(
context: context,
builder: (dialogContext) {
return AlertDialog(
backgroundColor: surfaceColor(context),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(22),
),
title: Text(
stockInMode ? 'Add stock' : 'Remove stock',
style: TextStyle(fontWeight: FontWeight.w800, color: ink),
),
content: TextField(
controller: controller,
autofocus: true,
keyboardType: TextInputType.number,
decoration: InputDecoration(
labelText: 'Quantity',
prefixIcon: Icon(
stockInMode ? Icons.add_circle_outline : Icons.remove_circle_outline,
),
),
),
actions: [
TextButton(
onPressed: () => Navigator.pop(dialogContext),
child: const Text('Cancel'),
),
FilledButton(
onPressed: () {
final amount = int.tryParse(controller.text);
if (amount == null || amount <= 0) return;

if (stockInMode) {
stockIn(index, amount);
} else {
stockOut(index, amount);
}

Navigator.pop(dialogContext);
_message(
stockInMode
? 'Stock added successfully'
    : 'Stock updated successfully',
);
},
child: const Text('Confirm'),
),
],
);
},
);
}

void confirmDelete(int index) {
showDialog(
context: context,
builder: (dialogContext) {
return AlertDialog(
backgroundColor: surfaceColor(context),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(22),
),
title: Text(
'Delete product?',
style: TextStyle(fontWeight: FontWeight.w800, color: ink),
),
content: Text(
'Remove "${products[index].name}" from inventory?',
style: TextStyle(color: muted),
),
actions: [
TextButton(
onPressed: () => Navigator.pop(dialogContext),
child: const Text('Cancel'),
),
FilledButton(
style: FilledButton.styleFrom(backgroundColor: danger),
onPressed: () {
deleteProduct(index);
Navigator.pop(dialogContext);
_message('Product deleted');
},
child: const Text('Delete'),
),
],
);
},
);
}

void _message(String text) {
ScaffoldMessenger.of(context)
..hideCurrentSnackBar()
..showSnackBar(
SnackBar(
behavior: SnackBarBehavior.floating,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(14),
),
content: Text(text),
),
);
}

String get title {
const titles = [
'Overview',
'Inventory',
'Sales',
'Categories',
'Purchases',
'Suppliers',
'Customers',
'Reports & Analytics',
'Stock Alerts',
'Settings',
];
return titles[selectedIndex];
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Row(
children: [
Container(
width: 38,
height: 38,
decoration: BoxDecoration(
gradient: const LinearGradient(
colors: [primary, Color(0xFF35C7A0)],
),
borderRadius: BorderRadius.circular(12),
),
child: const Icon(
Icons.inventory_2_rounded,
color: Colors.white,
size: 21,
),
),
const SizedBox(width: 11),
Text(title),
],
),
actions: [
IconButton(
tooltip: darkModeNotifier.value ? 'Switch to Light Mode' : 'Switch to Dark Mode',
onPressed: () => darkModeNotifier.value = !darkModeNotifier.value,
icon: Icon(darkModeNotifier.value ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
),
const SizedBox(width: 2),
IconButton(
tooltip: 'Notifications',
onPressed: () {
final low = products
    .where((p) => p.quantity <= p.minimumStock)
    .length;
showDialog(
context: context,
builder: (_) => AlertDialog(
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(22),
),
title: const Text(
'Notifications',
style: TextStyle(fontWeight: FontWeight.w800),
),
content: Text(
low == 0
? 'Everything looks good. No low-stock alerts.'
    : '$low product(s) need attention because stock is low.',
),
actions: [
TextButton(
onPressed: () => Navigator.pop(context),
child: const Text('Close'),
),
],
),
);
},
icon: const Icon(Icons.notifications_none_rounded),
),
const SizedBox(width: 8),
],
),
drawer: _buildDrawer(),
body: IndexedStack(
index: selectedIndex,
children: [
DashboardPage(products: products),
InventoryPage(
products: products,
onAdd: () => showProductDialog(),
onEdit: (i) => showProductDialog(editIndex: i),
onDelete: confirmDelete,
onStockIn: (i) => showStockDialog(index: i, stockInMode: true),
onStockOut: (i) => showStockDialog(index: i, stockInMode: false),
),
const SalesPage(),
CategoriesPage(products: products),
const PurchasesPage(),
const SuppliersPage(),
const CustomersPage(),
const ReportsPage(),
StockAlertsPage(
products: products,
onUpdateProduct: (updatedProduct) {
final index = products.indexWhere((p) => p.name == updatedProduct.name);
if (index != -1) updateProduct(index, updatedProduct);
},
),
const SettingsPage(),
],
),
bottomNavigationBar: selectedIndex < 3
? NavigationBar(
backgroundColor: surfaceColor(context),
indicatorColor: primary.withOpacity(.12),
selectedIndex: selectedIndex,
onDestinationSelected: (i) => setState(() => selectedIndex = i),
destinations: const [
NavigationDestination(
icon: Icon(Icons.dashboard_outlined),
selectedIcon: Icon(Icons.dashboard_rounded, color: primary),
label: 'Dashboard',
),
NavigationDestination(
icon: Icon(Icons.inventory_2_outlined),
selectedIcon: Icon(Icons.inventory_2_rounded, color: primary),
label: 'Inventory',
),
NavigationDestination(
icon: Icon(Icons.receipt_long_outlined),
selectedIcon: Icon(Icons.receipt_long_rounded, color: primary),
label: 'Sales',
),
],
)
    : null,
floatingActionButton: selectedIndex == 1
? FloatingActionButton.extended(
backgroundColor: primary,
foregroundColor: Colors.white,
onPressed: () => showProductDialog(),
icon: const Icon(Icons.add),
label: const Text(
'Add Product',
style: TextStyle(fontWeight: FontWeight.w700),
),
)
    : null,
);
}

Widget _buildDrawer() {
return Drawer(
backgroundColor: surfaceColor(context),
child: SafeArea(
child: Column(
children: [
Container(
margin: const EdgeInsets.fromLTRB(14, 12, 14, 10),
padding: const EdgeInsets.all(18),
width: double.infinity,
decoration: BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: darkModeNotifier.value
? const [Color(0xFF30264E), Color(0xFF4A315B), Color(0xFF332B55)]
    : const [Color(0xFFF39399), Color(0xFFF39399), Color(0xFFF39399)],
),
borderRadius: BorderRadius.circular(24),
boxShadow: [
BoxShadow(
color: primary.withOpacity(.18),
blurRadius: 18,
offset: const Offset(0, 8),
),
],
),
child: Row(
children: [
Container(
height: 52,
width: 52,
decoration: BoxDecoration(
color: Colors.white.withOpacity(.15),
borderRadius: BorderRadius.circular(16),
),
child: const Icon(Icons.inventory_2_rounded, color: Colors.white, size: 28),
),
const SizedBox(width: 13),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text('Smart Inventory', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900)),
SizedBox(height: 3),
Text(darkModeNotifier.value ? 'Dark workspace' : 'Light workspace', style: TextStyle(color: darkModeNotifier.value ? Colors.white70 : const Color(0xFF665B78), fontSize: 11)),
],
),
),
],
),
),
Expanded(
child: ListView(
padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
children: [
_drawerLabel('MAIN MENU'),
_drawerItem(Icons.dashboard_outlined, 'Dashboard', 0),
_drawerItem(Icons.inventory_2_outlined, 'Inventory', 1),
_drawerItem(Icons.receipt_long_outlined, 'Sales', 2),
_drawerItem(Icons.category_outlined, 'Categories', 3),
const SizedBox(height: 8),
_drawerLabel('OPERATIONS'),
_drawerItem(Icons.shopping_bag_outlined, 'Purchases', 4),
_drawerItem(Icons.local_shipping_outlined, 'Suppliers', 5),
_drawerItem(Icons.people_outline_rounded, 'Customers', 6),
_drawerItem(Icons.notifications_active_outlined, 'Stock Alerts', 8),
const SizedBox(height: 8),
_drawerLabel('INSIGHTS & SYSTEM'),
_drawerItem(Icons.analytics_outlined, 'Reports & Analytics', 7),
_drawerItem(Icons.settings_outlined, 'Settings', 9),
],
),
),
Container(
margin: const EdgeInsets.fromLTRB(12, 4, 12, 12),
padding: const EdgeInsets.all(12),
decoration: BoxDecoration(
color: surfaceColor(context),
borderRadius: BorderRadius.circular(16),
border: Border.all(color: borderColor(context)),
),
child: Row(
children: [
CircleAvatar(
radius: 20,
backgroundColor: primary.withOpacity(.10),
child: const Icon(Icons.person_outline_rounded, color: primary),
),
const SizedBox(width: 10),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text('Admin User', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12)),
SizedBox(height: 2),
Text('Inventory Manager', style: TextStyle(color: muted, fontSize: 10)),
],
),
),
IconButton(
tooltip: 'Logout',
onPressed: () {
Navigator.pushAndRemoveUntil(
context,
MaterialPageRoute(builder: (_) => const LoginPage()),
(_) => false,
);
},
icon: const Icon(Icons.logout_rounded, color: danger, size: 19),
),
],
),
),
],
),
),
);
}

Widget _drawerLabel(String text) {
return Padding(
padding: const EdgeInsets.fromLTRB(12, 8, 12, 5),
child: Text(
text,
style: TextStyle(color: muted, fontSize: 9, fontWeight: FontWeight.w900, letterSpacing: 1.2),
),
);
}

Widget _drawerItem(IconData icon, String label, int index) {
final selected = selectedIndex == index;

return AnimatedContainer(
duration: const Duration(milliseconds: 180),
margin: const EdgeInsets.symmetric(vertical: 2),
decoration: BoxDecoration(
color: null,
gradient: selected
? LinearGradient(colors: [primary.withOpacity(.13), primary.withOpacity(.05)])
    : null,
borderRadius: BorderRadius.circular(13),
border: selected ? Border.all(color: primary.withOpacity(.08)) : null,
boxShadow: null,
),
child: ListTile(
dense: true,
minLeadingWidth: 24,
contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
leading: Icon(icon, color: selected ? primary : muted, size: 21),
title: Text(label, style: TextStyle(color: selected ? primary : ink, fontSize: 13, fontWeight: selected ? FontWeight.w800 : FontWeight.w600)),
trailing: selected ? const Icon(Icons.chevron_right_rounded, color: primary, size: 18) : null,
onTap: () {
setState(() => selectedIndex = index);
Navigator.pop(context);
},
),
);
}
}

// ============================================================
// EXTRA ADMIN MODULES
// ============================================================

class CategoriesPage extends StatelessWidget {
final List<Product> products;
const CategoriesPage({super.key, required this.products});
@override
Widget build(BuildContext context) {
final categories = <String, List<Product>>{};
for (final p in products) { categories.putIfAbsent(p.category, () => []).add(p); }
return _ModuleShell(
title: 'Categories', subtitle: 'Organize products and monitor category stock', icon: Icons.category_outlined, actionLabel: 'Add Category',
children: categories.entries.map((entry) {
final units = entry.value.fold<int>(0, (s, p) => s + p.quantity);
final value = entry.value.fold<double>(0, (s, p) => s + p.price * p.quantity);
return _ModuleCard(icon: Icons.folder_copy_outlined, title: entry.key, subtitle: '${entry.value.length} products • $units units', trailing: _money(value), color: primary);
}).toList(),
);
}
}

class PurchasesPage extends StatefulWidget {
const PurchasesPage({super.key});

@override
State<PurchasesPage> createState() => _PurchasesPageState();
}

class _PurchasesPageState extends State<PurchasesPage> {
final List<Map<String, String>> purchases = [
{
'title': 'PO-1024',
'subtitle': 'Electronics supplier • 18 items',
'amount': '₹84,500',
},
{
'title': 'PO-1023',
'subtitle': 'Accessories supplier • 42 items',
'amount': '₹31,200',
},
{
'title': 'PO-1022',
'subtitle': 'Awaiting delivery • 12 items',
'amount': '₹18,750',
},
];

void showAddPurchaseDialog() {
final supplier = TextEditingController();
final items = TextEditingController();
final amount = TextEditingController();

showDialog(
context: context,
builder: (dialogContext) => AlertDialog(
backgroundColor: surfaceColor(context),
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
title: Text(
'Add Purchase',
style: TextStyle(fontWeight: FontWeight.w800, color: ink),
),
content: SizedBox(
width: 460,
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
TextField(
controller: supplier,
decoration: const InputDecoration(
labelText: 'Supplier name',
prefixIcon: Icon(Icons.local_shipping_outlined),
),
),
const SizedBox(height: 12),
TextField(
controller: items,
keyboardType: TextInputType.number,
decoration: const InputDecoration(
labelText: 'Number of items',
prefixIcon: Icon(Icons.inventory_2_outlined),
),
),
const SizedBox(height: 12),
TextField(
controller: amount,
keyboardType: TextInputType.number,
decoration: const InputDecoration(
labelText: 'Purchase amount',
prefixIcon: Icon(Icons.currency_rupee),
),
),
],
),
),
actions: [
TextButton(
onPressed: () => Navigator.pop(dialogContext),
child: const Text('Cancel'),
),
FilledButton(
onPressed: () {
final itemCount = int.tryParse(items.text);
final value = double.tryParse(amount.text);

if (supplier.text.trim().isEmpty ||
itemCount == null ||
itemCount <= 0 ||
value == null ||
value <= 0) {
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(content: Text('Please enter valid purchase details')),
);
return;
}

setState(() {
purchases.insert(0, {
'title': 'PO-${1025 + purchases.length}',
'subtitle': '${supplier.text.trim()} • $itemCount items',
'amount': _money(value),
});
});

Navigator.pop(dialogContext);
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(content: Text('Purchase added successfully')),
);
},
child: const Text('Add Purchase'),
),
],
),
);
}

@override
Widget build(BuildContext context) => _ModuleShell(
title: 'Purchases',
subtitle: 'Track incoming stock and purchase activity',
icon: Icons.shopping_bag_outlined,
actionLabel: 'New Purchase',
onAction: showAddPurchaseDialog,
children: purchases.map((purchase) {
return _ModuleCard(
icon: Icons.local_shipping_outlined,
title: purchase['title']!,
subtitle: purchase['subtitle']!,
trailing: purchase['amount']!,
color: primary,
);
}).toList(),
);
}

class SuppliersPage extends StatefulWidget {
const SuppliersPage({super.key});

@override
State<SuppliersPage> createState() => _SuppliersPageState();
}

class _SuppliersPageState extends State<SuppliersPage> {
final List<Map<String, String>> suppliers = [
{
'name': 'TechWorld Distributors',
'category': 'Electronics',
'orders': '12 purchase orders',
'status': 'Active',
},
{
'name': 'Accessory Hub',
'category': 'Accessories',
'orders': '8 purchase orders',
'status': 'Active',
},
{
'name': 'Digital Mart',
'category': 'Computer hardware',
'orders': '5 purchase orders',
'status': 'Review',
},
];

void showAddSupplierDialog() {
final name = TextEditingController();
final category = TextEditingController();
final phone = TextEditingController();
final email = TextEditingController();

showDialog(
context: context,
builder: (dialogContext) => AlertDialog(
backgroundColor: surfaceColor(context),
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
title: Text(
'Add Supplier',
style: TextStyle(fontWeight: FontWeight.w800, color: ink),
),
content: SizedBox(
width: 460,
child: SingleChildScrollView(
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
TextField(
controller: name,
decoration: const InputDecoration(
labelText: 'Supplier name',
prefixIcon: Icon(Icons.business_outlined),
),
),
const SizedBox(height: 12),
TextField(
controller: category,
decoration: const InputDecoration(
labelText: 'Category / Supply type',
prefixIcon: Icon(Icons.category_outlined),
),
),
const SizedBox(height: 12),
TextField(
controller: phone,
keyboardType: TextInputType.phone,
decoration: const InputDecoration(
labelText: 'Phone number',
prefixIcon: Icon(Icons.phone_outlined),
),
),
const SizedBox(height: 12),
TextField(
controller: email,
keyboardType: TextInputType.emailAddress,
decoration: const InputDecoration(
labelText: 'Email address',
prefixIcon: Icon(Icons.email_outlined),
),
),
],
),
),
),
actions: [
TextButton(
onPressed: () => Navigator.pop(dialogContext),
child: const Text('Cancel'),
),
FilledButton(
onPressed: () {
if (name.text.trim().isEmpty ||
category.text.trim().isEmpty ||
phone.text.trim().isEmpty ||
email.text.trim().isEmpty) {
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(content: Text('Please enter all supplier details')),
);
return;
}

setState(() {
suppliers.insert(0, {
'name': name.text.trim(),
'category': category.text.trim(),
'orders': '0 purchase orders',
'status': 'Active',
});
});

Navigator.pop(dialogContext);
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(content: Text('Supplier added successfully')),
);
},
child: const Text('Add Supplier'),
),
],
),
);
}

void deleteSupplier(int index) {
showDialog(
context: context,
builder: (dialogContext) => AlertDialog(
backgroundColor: surfaceColor(context),
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
title: Text(
'Delete supplier?',
style: TextStyle(fontWeight: FontWeight.w800, color: ink),
),
content: Text(
'Remove "${suppliers[index]['name']}" from suppliers?',
style: TextStyle(color: muted),
),
actions: [
TextButton(
onPressed: () => Navigator.pop(dialogContext),
child: const Text('Cancel'),
),
FilledButton(
style: FilledButton.styleFrom(backgroundColor: danger),
onPressed: () {
setState(() => suppliers.removeAt(index));
Navigator.pop(dialogContext);
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(content: Text('Supplier deleted')),
);
},
child: const Text('Delete'),
),
],
),
);
}

@override
Widget build(BuildContext context) => _ModuleShell(
title: 'Suppliers',
subtitle: 'Manage vendor contacts and supply activity',
icon: Icons.local_shipping_outlined,
actionLabel: 'Add Supplier',
onAction: showAddSupplierDialog,
children: List.generate(suppliers.length, (index) {
final supplier = suppliers[index];
return _ModuleCard(
icon: Icons.business_outlined,
title: supplier['name']!,
subtitle: '${supplier['category']} • ${supplier['orders']}',
trailing: supplier['status']!,
color: supplier['status'] == 'Review' ? accent : primary,
onDelete: () => deleteSupplier(index),
);
}),
);
}

class CustomersPage extends StatefulWidget {
const CustomersPage({super.key});

@override
State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
final List<Map<String, String>> customers = [
{
'name': 'Aarav',
'subtitle': '5 orders • Last purchase today',
'amount': '₹1.12L',
},
{
'name': 'Priya',
'subtitle': '8 orders • Returning customer',
'amount': '₹42,800',
},
{
'name': 'Meera',
'subtitle': '3 orders • Last purchase today',
'amount': '₹18,500',
},
];

void showAddCustomerDialog() {
final name = TextEditingController();
final phone = TextEditingController();
final email = TextEditingController();

showDialog(
context: context,
builder: (dialogContext) => AlertDialog(
backgroundColor: surfaceColor(context),
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
title: Text(
'Add Customer',
style: TextStyle(fontWeight: FontWeight.w800, color: ink),
),
content: SizedBox(
width: 460,
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
TextField(
controller: name,
decoration: const InputDecoration(
labelText: 'Customer name',
prefixIcon: Icon(Icons.person_outline_rounded),
),
),
const SizedBox(height: 12),
TextField(
controller: phone,
keyboardType: TextInputType.phone,
decoration: const InputDecoration(
labelText: 'Phone number',
prefixIcon: Icon(Icons.phone_outlined),
),
),
const SizedBox(height: 12),
TextField(
controller: email,
keyboardType: TextInputType.emailAddress,
decoration: const InputDecoration(
labelText: 'Email address',
prefixIcon: Icon(Icons.email_outlined),
),
),
],
),
),
actions: [
TextButton(
onPressed: () => Navigator.pop(dialogContext),
child: const Text('Cancel'),
),
FilledButton(
onPressed: () {
if (name.text.trim().isEmpty ||
phone.text.trim().isEmpty ||
email.text.trim().isEmpty) {
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(content: Text('Please enter all customer details')),
);
return;
}

setState(() {
customers.insert(0, {
'name': name.text.trim(),
'subtitle': '0 orders • New customer • ${phone.text.trim()}',
'amount': '₹0',
});
});

Navigator.pop(dialogContext);
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(content: Text('Customer added successfully')),
);
},
child: const Text('Add Customer'),
),
],
),
);
}

@override
Widget build(BuildContext context) => _ModuleShell(
title: 'Customers',
subtitle: 'View customer activity and purchase history',
icon: Icons.people_outline_rounded,
actionLabel: 'Add Customer',
onAction: showAddCustomerDialog,
children: customers.map((customer) {
return _ModuleCard(
icon: Icons.person_outline_rounded,
title: customer['name']!,
subtitle: customer['subtitle']!,
trailing: customer['amount']!,
color: primary,
);
}).toList(),
);
}

class ReportsPage extends StatelessWidget {
const ReportsPage({super.key});

@override
Widget build(BuildContext context) {
final width = MediaQuery.sizeOf(context).width;
final wide = width > 900;

return ListView(
padding: const EdgeInsets.fromLTRB(18, 12, 18, 34),
children: [
const _SectionHeading(
title: 'Reports & Analytics',
subtitle: 'Visual insights for stock, sales and business performance • demo analytics',
),
const SizedBox(height: 16),

// Summary strip
LayoutBuilder(
builder: (context, constraints) {
final columns = constraints.maxWidth > 850 ? 4 : 2;
return GridView.count(
crossAxisCount: columns,
crossAxisSpacing: 12,
mainAxisSpacing: 12,
childAspectRatio: constraints.maxWidth > 850 ? 2.5 : 2.0,
shrinkWrap: true,
physics: const NeverScrollableScrollPhysics(),
children: const [
_AnalyticsMetric(
icon: Icons.currency_rupee_rounded,
title: 'Total Revenue',
value: '₹2.84L',
note: '+12.5% this month',
color: primary,
),
_AnalyticsMetric(
icon: Icons.shopping_cart_checkout_rounded,
title: 'Total Orders',
value: '186',
note: '+8.2% this month',
color: secondary,
),
_AnalyticsMetric(
icon: Icons.inventory_2_outlined,
title: 'Stock Value',
value: '₹9.62L',
note: 'Current inventory',
color: Color(0xFF8A63D2),
),
_AnalyticsMetric(
icon: Icons.warning_amber_rounded,
title: 'Low Stock',
value: '08',
note: 'Needs attention',
color: accent,
),
],
);
},
),

const SizedBox(height: 20),

// Sales trend + stock movement
if (wide)
const Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Expanded(
child: _AnalyticsChartCard(
title: 'Monthly Sales Trend',
subtitle: 'Revenue movement across the year',
icon: Icons.show_chart_rounded,
child: SizedBox(height: 280, child: _SalesTrendChart()),
),
),
SizedBox(width: 14),
Expanded(
child: _AnalyticsChartCard(
title: 'Stock In vs Stock Out',
subtitle: 'Monthly inventory movement',
icon: Icons.swap_vert_rounded,
child: SizedBox(height: 280, child: _StockMovementChart()),
),
),
],
)
else
const Column(
children: [
_AnalyticsChartCard(
title: 'Monthly Sales Trend',
subtitle: 'Revenue movement across the year',
icon: Icons.show_chart_rounded,
child: SizedBox(height: 280, child: _SalesTrendChart()),
),
SizedBox(height: 14),
_AnalyticsChartCard(
title: 'Stock In vs Stock Out',
subtitle: 'Monthly inventory movement',
icon: Icons.swap_vert_rounded,
child: SizedBox(height: 280, child: _StockMovementChart()),
),
],
),

const SizedBox(height: 14),

// Category + top products
if (wide)
const Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Expanded(
child: _AnalyticsChartCard(
title: 'Inventory by Category',
subtitle: 'Current units by product category',
icon: Icons.pie_chart_outline_rounded,
child: SizedBox(height: 300, child: _CategoryChart()),
),
),
SizedBox(width: 14),
Expanded(
child: _AnalyticsChartCard(
title: 'Top Selling Products',
subtitle: 'Highest performing products',
icon: Icons.bar_chart_rounded,
child: SizedBox(height: 300, child: _TopProductsChart()),
),
),
],
)
else
const Column(
children: [
_AnalyticsChartCard(
title: 'Inventory by Category',
subtitle: 'Current units by product category',
icon: Icons.pie_chart_outline_rounded,
child: SizedBox(height: 300, child: _CategoryChart()),
),
SizedBox(height: 14),
_AnalyticsChartCard(
title: 'Top Selling Products',
subtitle: 'Highest performing products',
icon: Icons.bar_chart_rounded,
child: SizedBox(height: 300, child: _TopProductsChart()),
),
],
),

const SizedBox(height: 18),

const _SectionHeading(
title: 'Business insights',
subtitle: 'Quick observations from your inventory data',
),
const SizedBox(height: 12),
const _InsightRow(
icon: Icons.trending_up_rounded,
title: 'Sales are trending upward',
subtitle: 'Recent months show stronger revenue activity.',
color: secondary,
),
const _InsightRow(
icon: Icons.inventory_2_outlined,
title: 'Electronics hold the largest stock value',
subtitle: 'Monitor high-value items regularly to avoid blocked capital.',
color: primary,
),
const _InsightRow(
icon: Icons.warning_amber_rounded,
title: 'Some products need restocking',
subtitle: 'Review low-stock products before the next sales cycle.',
color: accent,
),
],
);
}
}

class _AnalyticsMetric extends StatelessWidget {
final IconData icon;
final String title;
final String value;
final String note;
final Color color;

const _AnalyticsMetric({
required this.icon,
required this.title,
required this.value,
required this.note,
required this.color,
});

@override
Widget build(BuildContext context) {
return Card(
child: Padding(
padding: const EdgeInsets.all(14),
child: Row(
children: [
Container(
width: 42,
height: 42,
decoration: BoxDecoration(
color: color.withOpacity(.10),
borderRadius: BorderRadius.circular(13),
),
child: Icon(icon, color: color, size: 21),
),
const SizedBox(width: 10),
Expanded(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(title, style: TextStyle(color: muted, fontSize: 10, fontWeight: FontWeight.w700)),
const SizedBox(height: 3),
Text(value, style: TextStyle(color: ink, fontSize: 18, fontWeight: FontWeight.w900)),
Text(note, style: TextStyle(color: color, fontSize: 9, fontWeight: FontWeight.w700)),
],
),
),
],
),
),
);
}
}

class _AnalyticsChartCard extends StatelessWidget {
final String title;
final String subtitle;
final IconData icon;
final Widget child;

const _AnalyticsChartCard({
required this.title,
required this.subtitle,
required this.icon,
required this.child,
});

@override
Widget build(BuildContext context) {
return Card(
child: Padding(
padding: const EdgeInsets.fromLTRB(17, 16, 17, 10),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Row(
children: [
Container(
width: 36,
height: 36,
decoration: BoxDecoration(
color: primary.withOpacity(.16),
borderRadius: BorderRadius.circular(11),
),
child: Icon(icon, color: primary, size: 19),
),
const SizedBox(width: 10),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(title, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: ink)),
const SizedBox(height: 2),
Text(subtitle, style: TextStyle(fontSize: 10, color: muted)),
],
),
),
],
),
const SizedBox(height: 8),
child,
],
),
),
);
}
}

class _SalesTrendChart extends StatelessWidget {
const _SalesTrendChart();

@override
Widget build(BuildContext context) {
const values = [42.0, 48.0, 46.0, 55.0, 62.0, 58.0, 68.0, 73.0, 70.0, 82.0, 88.0, 96.0];
const labels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

return CustomPaint(
painter: _LineGraphPainter(values: values, labels: labels, lineColor: primary),
child: const SizedBox.expand(),
);
}
}

class _StockMovementChart extends StatelessWidget {
const _StockMovementChart();

@override
Widget build(BuildContext context) {
const inValues = [58.0, 70.0, 52.0, 76.0, 64.0, 88.0];
const outValues = [35.0, 44.0, 42.0, 50.0, 46.0, 62.0];
const labels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];

return CustomPaint(
painter: _GroupedBarPainter(
first: inValues,
second: outValues,
labels: labels,
firstColor: secondary,
secondColor: accent,
),
child: const SizedBox.expand(),
);
}
}

class _CategoryChart extends StatelessWidget {
const _CategoryChart();

@override
Widget build(BuildContext context) {
const values = [42.0, 28.0, 18.0, 12.0];
const labels = ['Electronics', 'Accessories', 'Office', 'Other'];
const colors = [primary, secondary, accent, Color(0xFF8A63D2)];

return Row(
children: [
Expanded(
child: CustomPaint(
painter: _PiePainter(values: values, colors: colors),
child: const SizedBox.expand(),
),
),
Expanded(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.start,
children: List.generate(labels.length, (i) {
return Padding(
padding: const EdgeInsets.symmetric(vertical: 7),
child: Row(
children: [
Container(width: 9, height: 9, decoration: BoxDecoration(color: colors[i], shape: BoxShape.circle)),
const SizedBox(width: 7),
Expanded(child: Text(labels[i], style: TextStyle(fontSize: 11, color: ink, fontWeight: FontWeight.w700))),
Text('${values[i].toInt()}%', style: TextStyle(fontSize: 10, color: muted, fontWeight: FontWeight.w800)),
],
),
);
}),
),
),
],
);
}
}

class _TopProductsChart extends StatelessWidget {
const _TopProductsChart();

@override
Widget build(BuildContext context) {
const values = [92.0, 76.0, 61.0, 48.0, 34.0];
const labels = ['Laptop', 'Mouse', 'Monitor', 'Keyboard', 'Headphones'];

return CustomPaint(
painter: _HorizontalBarPainter(values: values, labels: labels, barColor: primary),
child: const SizedBox.expand(),
);
}
}

class _LineGraphPainter extends CustomPainter {
final List<double> values;
final List<String> labels;
final Color lineColor;

_LineGraphPainter({required this.values, required this.labels, required this.lineColor});

@override
void paint(Canvas canvas, Size size) {
if (values.isEmpty) return;

final left = 42.0;
final right = 12.0;
final top = 18.0;
final bottom = 34.0;
final chartW = size.width - left - right;
final chartH = size.height - top - bottom;
final max = values.reduce((a, b) => a > b ? a : b);
final min = values.reduce((a, b) => a < b ? a : b);
final range = (max - min).abs() < 1 ? 1.0 : (max - min);

final grid = Paint()..color = const Color(0xFF3A506C)..strokeWidth = 1;
final line = Paint()
..color = lineColor
..strokeWidth = 3
..style = PaintingStyle.stroke
..strokeCap = StrokeCap.round
..strokeJoin = StrokeJoin.round;
final dot = Paint()..color = lineColor;

for (int i = 0; i < 4; i++) {
final y = top + chartH * i / 3;
canvas.drawLine(Offset(left, y), Offset(size.width - right, y), grid);
}

final path = Path();
final points = <Offset>[];

for (int i = 0; i < values.length; i++) {
final x = left + chartW * i / (values.length - 1);
final y = top + chartH - ((values[i] - min) / range) * chartH;
final p = Offset(x, y);
points.add(p);
if (i == 0) {
path.moveTo(x, y);
} else {
path.lineTo(x, y);
}
}

canvas.drawPath(path, line);

for (final p in points) {
canvas.drawCircle(p, 4.5, dot);
final inner = Paint()..color = Colors.white;
canvas.drawCircle(p, 2, inner);
}

final tp = TextPainter(textDirection: TextDirection.ltr);
for (int i = 0; i < labels.length; i++) {
tp.text = TextSpan(text: labels[i], style: TextStyle(fontSize: 9, color: muted, fontWeight: FontWeight.w600));
tp.layout();
final x = left + chartW * i / (labels.length - 1) - tp.width / 2;
tp.paint(canvas, Offset(x, size.height - 22));
}
}

@override
bool shouldRepaint(covariant _LineGraphPainter oldDelegate) => true;
}

class _GroupedBarPainter extends CustomPainter {
final List<double> first;
final List<double> second;
final List<String> labels;
final Color firstColor;
final Color secondColor;

_GroupedBarPainter({
required this.first,
required this.second,
required this.labels,
required this.firstColor,
required this.secondColor,
});

@override
void paint(Canvas canvas, Size size) {
final left = 35.0;
final right = 10.0;
final top = 16.0;
final bottom = 34.0;
final chartW = size.width - left - right;
final chartH = size.height - top - bottom;
final max = [...first, ...second].reduce((a, b) => a > b ? a : b);
final grid = Paint()..color = const Color(0xFF3A506C)..strokeWidth = 1;

for (int i = 0; i < 4; i++) {
final y = top + chartH * i / 3;
canvas.drawLine(Offset(left, y), Offset(size.width - right, y), grid);
}

final tp = TextPainter(textDirection: TextDirection.ltr);

for (int i = 0; i < labels.length; i++) {
final groupX = left + chartW * (i + .5) / labels.length;
final barW = (chartW / labels.length) * .22;
final h1 = chartH * first[i] / max;
final h2 = chartH * second[i] / max;

final p1 = Paint()..color = firstColor;
final p2 = Paint()..color = secondColor;

canvas.drawRRect(
RRect.fromRectAndRadius(
Rect.fromLTWH(groupX - barW - 2, top + chartH - h1, barW, h1),
const Radius.circular(5),
),
p1,
);
canvas.drawRRect(
RRect.fromRectAndRadius(
Rect.fromLTWH(groupX + 2, top + chartH - h2, barW, h2),
const Radius.circular(5),
),
p2,
);

tp.text = TextSpan(text: labels[i], style: TextStyle(fontSize: 9, color: muted, fontWeight: FontWeight.w600));
tp.layout();
tp.paint(canvas, Offset(groupX - tp.width / 2, size.height - 22));
}
}

@override
bool shouldRepaint(covariant _GroupedBarPainter oldDelegate) => true;
}

class _PiePainter extends CustomPainter {
final List<double> values;
final List<Color> colors;

_PiePainter({required this.values, required this.colors});

@override
void paint(Canvas canvas, Size size) {
final total = values.fold<double>(0, (a, b) => a + b);
final side = size.shortestSide * .72;
final rect = Rect.fromCenter(
center: Offset(size.width / 2, size.height / 2),
width: side,
height: side,
);
final paint = Paint()..style = PaintingStyle.fill;
double start = -1.5708;

for (int i = 0; i < values.length; i++) {
final sweep = 6.28318530718 * values[i] / total;
paint.color = colors[i];
canvas.drawArc(rect, start, sweep, true, paint);
start += sweep;
}

final hole = Paint()..color = const Color(0xFF22344D);
canvas.drawCircle(rect.center, side * .25, hole);

final tp = TextPainter(
text: TextSpan(text: '100%', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: ink)),
textDirection: TextDirection.ltr,
)..layout();
tp.paint(canvas, Offset(rect.center.dx - tp.width / 2, rect.center.dy - tp.height / 2));
}

@override
bool shouldRepaint(covariant _PiePainter oldDelegate) => true;
}

class _HorizontalBarPainter extends CustomPainter {
final List<double> values;
final List<String> labels;
final Color barColor;

_HorizontalBarPainter({required this.values, required this.labels, required this.barColor});

@override
void paint(Canvas canvas, Size size) {
final left = 88.0;
final right = 32.0;
final top = 18.0;
final rowH = (size.height - 35) / values.length;
final max = values.reduce((a, b) => a > b ? a : b);
final track = Paint()..color = const Color(0xFF354B67);
final bar = Paint()..color = barColor;
final tp = TextPainter(textDirection: TextDirection.ltr);

for (int i = 0; i < values.length; i++) {
final y = top + i * rowH + rowH * .22;
final h = rowH * .46;
final w = (size.width - left - right) * values[i] / max;

tp.text = TextSpan(text: labels[i], style: TextStyle(fontSize: 10, color: ink, fontWeight: FontWeight.w700));
tp.layout(maxWidth: left - 10);
tp.paint(canvas, Offset(0, y + h / 2 - tp.height / 2));

canvas.drawRRect(
RRect.fromRectAndRadius(Rect.fromLTWH(left, y, size.width - left - right, h), const Radius.circular(7)),
track,
);
canvas.drawRRect(
RRect.fromRectAndRadius(Rect.fromLTWH(left, y, w, h), const Radius.circular(7)),
bar,
);

tp.text = TextSpan(text: '${values[i].toInt()}', style: TextStyle(fontSize: 9, color: muted, fontWeight: FontWeight.w800));
tp.layout();
tp.paint(canvas, Offset(left + w + 6, y + h / 2 - tp.height / 2));
}
}

@override
bool shouldRepaint(covariant _HorizontalBarPainter oldDelegate) => true;
}

class _InsightRow extends StatelessWidget {
final IconData icon;
final String title;
final String subtitle;
final Color color;

const _InsightRow({
required this.icon,
required this.title,
required this.subtitle,
required this.color,
});

@override
Widget build(BuildContext context) {
return Card(
margin: const EdgeInsets.only(bottom: 9),
child: ListTile(
contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
leading: Container(
width: 42,
height: 42,
decoration: BoxDecoration(
color: color.withOpacity(.10),
borderRadius: BorderRadius.circular(13),
),
child: Icon(icon, color: color),
),
title: Text(title, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12)),
subtitle: Padding(
padding: const EdgeInsets.only(top: 3),
child: Text(subtitle, style: TextStyle(color: muted, fontSize: 10)),
),
),
);
}
}

class StockAlertsPage extends StatefulWidget {
final List<Product> products;
final ValueChanged<Product> onUpdateProduct;

const StockAlertsPage({
super.key,
required this.products,
required this.onUpdateProduct,
});

@override
State<StockAlertsPage> createState() => _StockAlertsPageState();
}

class _StockAlertsPageState extends State<StockAlertsPage> {
void showAddAlertDialog() {
Product? selectedProduct;
final minimum = TextEditingController();

showDialog(
context: context,
builder: (dialogContext) => StatefulBuilder(
builder: (context, setDialogState) => AlertDialog(
backgroundColor: surfaceColor(context),
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
title: Text(
'Add Stock Alert',
style: TextStyle(fontWeight: FontWeight.w800, color: ink),
),
content: SizedBox(
width: 460,
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
DropdownButtonFormField<Product>(
value: selectedProduct,
decoration: const InputDecoration(
labelText: 'Select product',
prefixIcon: Icon(Icons.inventory_2_outlined),
),
items: widget.products.map((product) {
return DropdownMenuItem<Product>(
value: product,
child: Text(product.name),
);
}).toList(),
onChanged: (value) {
setDialogState(() {
selectedProduct = value;
if (value != null) {
minimum.text = value.minimumStock.toString();
}
});
},
),
const SizedBox(height: 12),
TextField(
controller: minimum,
keyboardType: TextInputType.number,
decoration: const InputDecoration(
labelText: 'Alert when stock reaches',
prefixIcon: Icon(Icons.warning_amber_outlined),
suffixText: 'units',
),
),
],
),
),
actions: [
TextButton(
onPressed: () => Navigator.pop(dialogContext),
child: const Text('Cancel'),
),
FilledButton(
onPressed: () {
final threshold = int.tryParse(minimum.text);

if (selectedProduct == null ||
threshold == null ||
threshold < 0) {
ScaffoldMessenger.of(this.context).showSnackBar(
const SnackBar(content: Text('Please select a product and enter a valid threshold')),
);
return;
}

final product = Product(
name: selectedProduct!.name,
category: selectedProduct!.category,
price: selectedProduct!.price,
quantity: selectedProduct!.quantity,
minimumStock: threshold,
);

widget.onUpdateProduct(product);
Navigator.pop(dialogContext);

ScaffoldMessenger.of(this.context).showSnackBar(
const SnackBar(content: Text('Stock alert added successfully')),
);
},
child: const Text('Add Alert'),
),
],
),
),
);
}

List<Product> get alertProducts =>
widget.products.where((p) => p.quantity <= p.minimumStock).toList();

@override
Widget build(BuildContext context) {
final alerts = alertProducts;

return _ModuleShell(
title: 'Stock Alerts',
subtitle: 'Products that need attention',
icon: Icons.notifications_active_outlined,
actionLabel: 'Add Alert',
onAction: showAddAlertDialog,
children: alerts.isEmpty
? [
const _EmptyState(
icon: Icons.notifications_none_rounded,
title: 'No stock alerts',
subtitle: 'All products are above their minimum stock level.',
),
]
    : alerts.map((product) {
final out = product.quantity == 0;
return _ModuleCard(
icon: out
? Icons.error_outline_rounded
    : Icons.warning_amber_rounded,
title: product.name,
subtitle: out
? 'Out of stock • Minimum ${product.minimumStock} units'
    : 'Only ${product.quantity} units left • Minimum ${product.minimumStock}',
trailing: out ? 'URGENT' : 'RESTOCK',
color: out ? danger : accent,
);
}).toList(),
);
}
}

class SettingsPage extends StatelessWidget {
const SettingsPage({super.key});
@override
Widget build(BuildContext context) {
return ListView(
padding: const EdgeInsets.fromLTRB(18, 12, 18, 34),
children: [
const _SectionHeading(title: 'Settings', subtitle: 'Customize your inventory workspace'), const SizedBox(height: 14),
_SettingsCard(icon: Icons.store_outlined, title: 'Business Profile', subtitle: 'Store name, contact and business details'),
_SettingsCard(icon: Icons.notifications_outlined, title: 'Notifications', subtitle: 'Low stock and sales alerts'),
_SettingsCard(icon: Icons.currency_rupee_rounded, title: 'Currency & Pricing', subtitle: 'Currency and price display preferences'),
_SettingsCard(icon: Icons.palette_outlined, title: 'Appearance', subtitle: 'Theme and interface preferences'),
_SettingsCard(icon: Icons.security_outlined, title: 'Security', subtitle: 'Password and account protection'),
],
);
}
}

class _ModuleShell extends StatelessWidget {
final String title, subtitle, actionLabel;
final IconData icon;
final List<Widget> children;
final VoidCallback? onAction;

const _ModuleShell({
required this.title,
required this.subtitle,
required this.icon,
required this.actionLabel,
required this.children,
this.onAction,
});

@override
Widget build(BuildContext context) {
final operationPage = title == 'Purchases' ||
title == 'Suppliers' ||
title == 'Customers' ||
title == 'Stock Alerts';

return ListView(
padding: const EdgeInsets.fromLTRB(18, 12, 18, 34),
children: [
Row(
children: [
Expanded(
child: _SectionHeading(title: title, subtitle: subtitle),
),
FilledButton.icon(
onPressed: onAction,
icon: Icon(icon, size: 17),
label: Text(actionLabel),
),
],
),
const SizedBox(height: 16),
...children.map(
(child) => operationPage && !darkModeNotifier.value
? Container(
decoration: BoxDecoration(
color: const Color(0xFFF5F5DC),
borderRadius: BorderRadius.circular(20),
),
padding: const EdgeInsets.all(2),
margin: const EdgeInsets.only(bottom: 2),
child: child,
)
    : child,
),
],
);
}
}

class _ModuleCard extends StatelessWidget {
final IconData icon; final String title, subtitle, trailing; final Color color;
final VoidCallback? onDelete;

const _ModuleCard({
required this.icon,
required this.title,
required this.subtitle,
required this.trailing,
required this.color,
this.onDelete,
});
@override
Widget build(BuildContext context) => Card(
margin: const EdgeInsets.only(bottom: 10),
child: ListTile(
contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
leading: Container(height: 44, width: 44, decoration: BoxDecoration(color: color.withOpacity(.10), borderRadius: BorderRadius.circular(13)), child: Icon(icon, color: color)),
title: Text(title, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13)),
subtitle: Padding(padding: const EdgeInsets.only(top: 4), child: Text(subtitle, style: TextStyle(color: muted, fontSize: 11))),
trailing: onDelete == null
? Text(trailing, style: TextStyle(color: color, fontWeight: FontWeight.w900, fontSize: 12))
    : Row(
mainAxisSize: MainAxisSize.min,
children: [
Text(trailing, style: TextStyle(color: color, fontWeight: FontWeight.w900, fontSize: 12)),
const SizedBox(width: 4),
IconButton(
tooltip: 'Delete',
onPressed: onDelete,
icon: const Icon(Icons.delete_outline_rounded, color: danger, size: 19),
),
],
),
),
);
}

class _ReportTile extends StatelessWidget {
final IconData icon; final String title, subtitle; final Color color;
const _ReportTile({required this.icon, required this.title, required this.subtitle, required this.color});
@override
Widget build(BuildContext context) => Card(child: Padding(padding: const EdgeInsets.all(15), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
Container(height: 42, width: 42, decoration: BoxDecoration(color: color.withOpacity(.10), borderRadius: BorderRadius.circular(13)), child: Icon(icon, color: color)),
const Spacer(), Text(title, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 13)), const SizedBox(height: 3), Text(subtitle, style: TextStyle(color: muted, fontSize: 10)),
])));
}

class _SettingsCard extends StatelessWidget {
final IconData icon; final String title, subtitle;
const _SettingsCard({required this.icon, required this.title, required this.subtitle});
@override
Widget build(BuildContext context) => Card(
margin: const EdgeInsets.only(bottom: 10),
child: ListTile(leading: Icon(icon, color: primary), title: Text(title, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13)), subtitle: Text(subtitle, style: TextStyle(color: muted, fontSize: 11)), trailing: const Icon(Icons.chevron_right_rounded)),
);
}

// ============================================================
// DASHBOARD
// ============================================================

class DashboardPage extends StatelessWidget {
final List<Product> products;

const DashboardPage({super.key, required this.products});

@override
Widget build(BuildContext context) {
final totalUnits = products.fold<int>(0, (s, p) => s + p.quantity);
final lowStock =
products.where((p) => p.quantity > 0 && p.quantity <= p.minimumStock).length;
final out = products.where((p) => p.quantity == 0).length;
final value = products.fold<double>(
0,
(s, p) => s + (p.price * p.quantity),
);

final healthy = products.length - lowStock - out;

return RefreshIndicator(
onRefresh: () async {},
child: ListView(
padding: const EdgeInsets.fromLTRB(18, 10, 18, 34),
children: [
_HeroBanner(
productCount: products.length,
totalUnits: totalUnits,
),
const SizedBox(height: 14),
const _DashboardContextStrip(),
const SizedBox(height: 18),

LayoutBuilder(
builder: (context, constraints) {
final columns = constraints.maxWidth > 900
? 4
    : constraints.maxWidth > 570
? 2
    : 2;

return GridView.count(
crossAxisCount: columns,
crossAxisSpacing: 12,
mainAxisSpacing: 12,
childAspectRatio: constraints.maxWidth > 570 ? 2.1 : 1.65,
shrinkWrap: true,
physics: const NeverScrollableScrollPhysics(),
children: [
_MetricCard(
label: 'Products',
value: '${products.length}',
helper: 'Active items',
icon: Icons.inventory_2_outlined,
iconBg: const Color(0xFF263E62),
iconColor: primary,
),
_MetricCard(
label: 'Stock units',
value: '$totalUnits',
helper: 'Across products',
icon: Icons.layers_outlined,
iconBg: const Color(0xFF1D4A42),
iconColor: secondary,
),
_MetricCard(
label: 'Low stock',
value: '$lowStock',
helper: lowStock == 0 ? 'All healthy' : 'Needs attention',
icon: Icons.warning_amber_rounded,
iconBg: const Color(0xFF4D3B20),
iconColor: accent,
),
_MetricCard(
label: 'Inventory value',
value: _money(value),
helper: 'Current stock value',
icon: Icons.account_balance_wallet_outlined,
iconBg: const Color(0xFF35405B),
iconColor: const Color(0xFF7BA7FF),
),
],
);
},
),

const SizedBox(height: 20),

Row(
children: [
const Expanded(
child: _SectionHeading(
title: 'Inventory analytics',
subtitle: 'Live view of your current stock',
),
),
_TinyBadge(
icon: Icons.auto_awesome,
text: 'Smart view',
color: primary,
),
],
),
const SizedBox(height: 12),

LayoutBuilder(
builder: (context, constraints) {
if (constraints.maxWidth > 900) {
return Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Expanded(
flex: 3,
child: _ChartCard(
title: 'Stock by product',
icon: Icons.bar_chart_rounded,
child: SizedBox(
height: 300,
child: StockBarChart(products: products),
),
),
),
const SizedBox(width: 14),
Expanded(
flex: 2,
child: _ChartCard(
title: 'Stock health',
icon: Icons.donut_large_rounded,
child: SizedBox(
height: 300,
child: StockHealthChart(
healthy: healthy,
low: lowStock,
out: out,
),
),
),
),
],
);
}

return Column(
children: [
_ChartCard(
title: 'Stock by product',
icon: Icons.bar_chart_rounded,
child: SizedBox(
height: 280,
child: StockBarChart(products: products),
),
),
const SizedBox(height: 14),
_ChartCard(
title: 'Stock health',
icon: Icons.donut_large_rounded,
child: SizedBox(
height: 290,
child: StockHealthChart(
healthy: healthy,
low: lowStock,
out: out,
),
),
),
],
);
},
),

const SizedBox(height: 20),
const _SectionHeading(
title: 'Attention center',
subtitle: 'Products that may need action',
),
const SizedBox(height: 12),

if (lowStock + out == 0)
_EmptyState(
icon: Icons.verified_rounded,
title: 'Everything is healthy',
subtitle: 'All products are above their minimum stock level.',
)
else
...products
    .where((p) => p.quantity <= p.minimumStock)
    .map(
(p) => _AlertProduct(product: p),
),

const SizedBox(height: 20),
const _SectionHeading(
title: 'Quick overview',
subtitle: 'Useful numbers at a glance',
),
const SizedBox(height: 12),
_QuickInfoCard(
items: [
(
Icons.check_circle_outline_rounded,
'Healthy stock',
'$healthy products',
secondary
),
(
Icons.warning_amber_rounded,
'Needs restocking',
'$lowStock products',
accent
),
(
Icons.remove_shopping_cart_outlined,
'Out of stock',
'$out products',
danger
),
],
),
],
),
);
}
}

class _HeroBanner extends StatelessWidget {
final int productCount;
final int totalUnits;

const _HeroBanner({
required this.productCount,
required this.totalUnits,
});

@override
Widget build(BuildContext context) {
return Container(
padding: const EdgeInsets.all(24),
decoration: BoxDecoration(
gradient: const LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: [Color(0xFF203A59), Color(0xFF285B69), Color(0xFF35604D)],
),
borderRadius: BorderRadius.circular(26),
boxShadow: [
BoxShadow(
color: const Color(0xFF0C1726).withOpacity(.34),
blurRadius: 25,
offset: const Offset(0, 12),
),
],
),
child: LayoutBuilder(
builder: (context, constraints) {
return Row(
children: [
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Row(
children: [
Container(
width: 44,
height: 44,
decoration: BoxDecoration(
gradient: const LinearGradient(
colors: [Color(0xFF4D8DFF), Color(0xFF35C7A0)],
),
borderRadius: BorderRadius.circular(14),
boxShadow: [
BoxShadow(
color: const Color(0xFF4D8DFF).withOpacity(.28),
blurRadius: 16,
offset: const Offset(0, 6),
),
],
),
child: const Icon(
Icons.inventory_2_rounded,
color: Colors.white,
size: 24,
),
),
const SizedBox(width: 10),
const Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'SMART INVENTORY',
style: TextStyle(
color: Colors.white,
fontSize: 12,
fontWeight: FontWeight.w900,
letterSpacing: 1.5,
),
),
SizedBox(height: 2),
Text(
'PROJECT OVERVIEW',
style: TextStyle(
color: Color(0xFFB8C4E5),
fontSize: 9,
fontWeight: FontWeight.w800,
letterSpacing: 1.1,
),
),
],
),
],
),
const SizedBox(height: 11),
const Text(
'Your stock, at a glance',
style: TextStyle(
color: Colors.white,
fontSize: 27,
fontWeight: FontWeight.w900,
letterSpacing: -.6,
),
),
const SizedBox(height: 6),
Text(
'Keep stock moving, catch shortages early and stay in control of daily operations.',
style: TextStyle(
color: Colors.white.withOpacity(.75),
height: 1.45,
),
),
],
),
),
if (constraints.maxWidth > 560)
Container(
margin: const EdgeInsets.only(left: 20),
padding: const EdgeInsets.all(18),
decoration: BoxDecoration(
color: Colors.white.withOpacity(.08),
borderRadius: BorderRadius.circular(20),
border: Border.all(
color: Colors.white.withOpacity(.14),
),
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'$productCount',
style: TextStyle(
color: Colors.white,
fontSize: 28,
fontWeight: FontWeight.w900,
),
),
const Text(
'products',
style: TextStyle(color: Colors.white70),
),
const SizedBox(height: 8),
Text(
'$totalUnits units in stock',
style: TextStyle(
color: Colors.white,
fontWeight: FontWeight.w700,
),
),
],
),
),
],
);
},
),
);
}
}

class _DashboardContextStrip extends StatelessWidget {
const _DashboardContextStrip();

@override
Widget build(BuildContext context) {
return Container(
padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
decoration: BoxDecoration(
color: const Color(0xFF1E3149),
borderRadius: BorderRadius.circular(16),
border: Border.all(color: borderColor(context)),
),
child: Row(
children: [
Container(
width: 34,
height: 34,
decoration: BoxDecoration(
color: secondary.withOpacity(.12),
borderRadius: BorderRadius.circular(10),
),
child: const Icon(Icons.warehouse_outlined, color: secondary, size: 19),
),
const SizedBox(width: 10),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'Inventory control center',
style: TextStyle(
color: ink,
fontSize: 12,
fontWeight: FontWeight.w800,
),
),
SizedBox(height: 2),
Text(
'Track stock movement, value and alerts from one place.',
style: TextStyle(color: muted, fontSize: 10),
),
],
),
),
Icon(Icons.arrow_forward_ios_rounded, color: muted, size: 13),
],
),
);
}
}

class _MetricCard extends StatelessWidget {
final String label;
final String value;
final String helper;
final IconData icon;
final Color iconBg;
final Color iconColor;

const _MetricCard({
required this.label,
required this.value,
required this.helper,
required this.icon,
required this.iconBg,
required this.iconColor,
});

@override
Widget build(BuildContext context) {
return Card(
child: Padding(
padding: const EdgeInsets.all(16),
child: Row(
children: [
Container(
height: 46,
width: 46,
decoration: BoxDecoration(
color: iconBg,
borderRadius: BorderRadius.circular(14),
border: Border.all(color: iconColor.withOpacity(.18)),
boxShadow: [
BoxShadow(
color: iconColor.withOpacity(.12),
blurRadius: 12,
offset: const Offset(0, 4),
),
],
),
child: Icon(icon, color: iconColor, size: 23),
),
const SizedBox(width: 12),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text(
label,
maxLines: 1,
overflow: TextOverflow.ellipsis,
style: TextStyle(
color: muted,
fontSize: 12,
fontWeight: FontWeight.w600,
),
),
const SizedBox(height: 4),
Text(
value,
maxLines: 1,
overflow: TextOverflow.ellipsis,
style: TextStyle(
color: ink,
fontSize: 20,
fontWeight: FontWeight.w900,
),
),
const SizedBox(height: 2),
Text(
helper,
maxLines: 1,
overflow: TextOverflow.ellipsis,
style: TextStyle(
color: muted,
fontSize: 10,
),
),
],
),
),
],
),
),
);
}
}

class _SectionHeading extends StatelessWidget {
final String title;
final String subtitle;

const _SectionHeading({
required this.title,
required this.subtitle,
});

@override
Widget build(BuildContext context) {
return Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
title,
style: TextStyle(
color: ink,
fontSize: 19,
fontWeight: FontWeight.w900,
),
),
const SizedBox(height: 3),
Text(
subtitle,
style: TextStyle(
color: muted,
fontSize: 12,
),
),
],
);
}
}

class _TinyBadge extends StatelessWidget {
final IconData icon;
final String text;
final Color color;

const _TinyBadge({
required this.icon,
required this.text,
required this.color,
});

@override
Widget build(BuildContext context) {
return Container(
padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
decoration: BoxDecoration(
color: color.withOpacity(.08),
borderRadius: BorderRadius.circular(20),
),
child: Row(
children: [
Icon(icon, size: 14, color: color),
const SizedBox(width: 5),
Text(
text,
style: TextStyle(
color: color,
fontSize: 11,
fontWeight: FontWeight.w800,
),
),
],
),
);
}
}

class _ChartCard extends StatelessWidget {
final String title;
final IconData icon;
final Widget child;

const _ChartCard({
required this.title,
required this.icon,
required this.child,
});

@override
Widget build(BuildContext context) {
return Card(
child: Padding(
padding: const EdgeInsets.fromLTRB(18, 17, 18, 10),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Row(
children: [
Container(
height: 34,
width: 34,
decoration: BoxDecoration(
color: primary.withOpacity(.16),
borderRadius: BorderRadius.circular(10),
),
child: Icon(icon, color: primary, size: 18),
),
const SizedBox(width: 10),
Text(
title,
style: TextStyle(
color: ink,
fontSize: 15,
fontWeight: FontWeight.w800,
),
),
],
),
const SizedBox(height: 8),
child,
],
),
),
);
}
}

// ============================================================
// BAR CHART
// ============================================================

class StockBarChart extends StatelessWidget {
final List<Product> products;

const StockBarChart({super.key, required this.products});

@override
Widget build(BuildContext context) {
if (products.isEmpty) {
return const Center(child: Text('No products available'));
}

final maxStock = products.fold<int>(
1,
(max, p) => p.quantity > max ? p.quantity : max,
);

return LayoutBuilder(
builder: (context, constraints) {
return Row(
crossAxisAlignment: CrossAxisAlignment.end,
children: products.map((product) {
final ratio = product.quantity / maxStock;
final color = product.quantity == 0
? danger
    : product.quantity <= product.minimumStock
? accent
    : primary;

return Expanded(
child: Tooltip(
message:
'${product.name}: ${product.quantity} units',
child: Padding(
padding: const EdgeInsets.symmetric(horizontal: 5),
child: Column(
mainAxisAlignment: MainAxisAlignment.end,
children: [
Text(
'${product.quantity}',
style: TextStyle(
fontSize: 11,
fontWeight: FontWeight.w800,
color: ink,
),
),
const SizedBox(height: 6),
TweenAnimationBuilder<double>(
tween: Tween(begin: 0, end: ratio),
duration: const Duration(milliseconds: 650),
curve: Curves.easeOutCubic,
builder: (_, value, __) {
return Container(
height: 185 * value + 2,
decoration: BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topCenter,
end: Alignment.bottomCenter,
colors: [
color.withOpacity(.85),
color,
],
),
borderRadius: const BorderRadius.vertical(
top: Radius.circular(10),
),
),
);
},
),
const SizedBox(height: 8),
Text(
product.name.length > 8
? '${product.name.substring(0, 8)}…'
    : product.name,
maxLines: 1,
overflow: TextOverflow.ellipsis,
textAlign: TextAlign.center,
style: TextStyle(
color: muted,
fontSize: 10,
fontWeight: FontWeight.w600,
),
),
],
),
),
),
);
}).toList(),
);
},
);
}
}

// ============================================================
// DONUT / STOCK HEALTH
// ============================================================

class StockHealthChart extends StatelessWidget {
final int healthy;
final int low;
final int out;

const StockHealthChart({
super.key,
required this.healthy,
required this.low,
required this.out,
});

@override
Widget build(BuildContext context) {
final total = healthy + low + out;

return Column(
children: [
Expanded(
child: Center(
child: SizedBox(
width: 190,
height: 190,
child: CustomPaint(
painter: _DonutPainter(
healthy: healthy,
low: low,
out: out,
),
child: Center(
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
Text(
'$total',
style: TextStyle(
fontSize: 28,
fontWeight: FontWeight.w900,
color: ink,
),
),
Text(
'products',
style: TextStyle(
color: muted,
fontSize: 11,
),
),
],
),
),
),
),
),
),
Wrap(
alignment: WrapAlignment.center,
spacing: 15,
runSpacing: 8,
children: [
_LegendDot(
label: 'Healthy $healthy',
color: secondary,
),
_LegendDot(
label: 'Low $low',
color: accent,
),
_LegendDot(
label: 'Out $out',
color: danger,
),
],
),
const SizedBox(height: 12),
],
);
}
}

class _DonutPainter extends CustomPainter {
final int healthy;
final int low;
final int out;

_DonutPainter({
required this.healthy,
required this.low,
required this.out,
});

@override
void paint(Canvas canvas, Size size) {
final total = healthy + low + out;
final rect = Offset.zero & size;
final paint = Paint()
..style = PaintingStyle.stroke
..strokeWidth = 24
..strokeCap = StrokeCap.round;

if (total == 0) {
paint.color = const Color(0xFF3A506C);
canvas.drawArc(rect.deflate(14), 0, 6.283, false, paint);
return;
}

final values = [healthy, low, out];
final colors = [secondary, accent, danger];
double start = -1.5708;

for (var i = 0; i < values.length; i++) {
final sweep = 6.283 * values[i] / total;
paint.color = colors[i];
canvas.drawArc(
rect.deflate(14),
start,
sweep,
false,
paint,
);
start += sweep;
}
}

@override
bool shouldRepaint(covariant _DonutPainter oldDelegate) {
return oldDelegate.healthy != healthy ||
oldDelegate.low != low ||
oldDelegate.out != out;
}
}

class _LegendDot extends StatelessWidget {
final String label;
final Color color;

const _LegendDot({
required this.label,
required this.color,
});

@override
Widget build(BuildContext context) {
return Row(
mainAxisSize: MainAxisSize.min,
children: [
Container(
width: 8,
height: 8,
decoration: BoxDecoration(
color: color,
shape: BoxShape.circle,
),
),
const SizedBox(width: 5),
Text(
label,
style: TextStyle(
color: muted,
fontSize: 11,
fontWeight: FontWeight.w600,
),
),
],
);
}
}

// ============================================================
// ALERTS
// ============================================================

class _AlertProduct extends StatelessWidget {
final Product product;

const _AlertProduct({required this.product});

@override
Widget build(BuildContext context) {
final out = product.quantity == 0;
final color = out ? danger : accent;

return Card(
margin: const EdgeInsets.only(bottom: 9),
child: Padding(
padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
child: Row(
children: [
Container(
height: 40,
width: 40,
decoration: BoxDecoration(
color: color.withOpacity(.10),
borderRadius: BorderRadius.circular(12),
),
child: Icon(
out
? Icons.remove_shopping_cart_outlined
    : Icons.warning_amber_rounded,
color: color,
),
),
const SizedBox(width: 12),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
product.name,
style: TextStyle(
color: ink,
fontWeight: FontWeight.w800,
),
),
const SizedBox(height: 3),
Text(
'${product.category} • Minimum ${product.minimumStock}',
style: TextStyle(
color: muted,
fontSize: 11,
),
),
],
),
),
Text(
out ? 'OUT' : '${product.quantity} left',
style: TextStyle(
color: color,
fontWeight: FontWeight.w900,
fontSize: 12,
),
),
],
),
),
);
}
}

class _EmptyState extends StatelessWidget {
final IconData icon;
final String title;
final String subtitle;

const _EmptyState({
required this.icon,
required this.title,
required this.subtitle,
});

@override
Widget build(BuildContext context) {
return Card(
child: Padding(
padding: const EdgeInsets.all(25),
child: Row(
children: [
Container(
height: 48,
width: 48,
decoration: BoxDecoration(
color: secondary.withOpacity(.10),
shape: BoxShape.circle,
),
child: Icon(icon, color: secondary),
),
const SizedBox(width: 14),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
title,
style: TextStyle(
color: ink,
fontWeight: FontWeight.w800,
),
),
const SizedBox(height: 4),
Text(
subtitle,
style: TextStyle(
color: muted,
fontSize: 12,
),
),
],
),
),
],
),
),
);
}
}

class _QuickInfoCard extends StatelessWidget {
final List<(IconData, String, String, Color)> items;

const _QuickInfoCard({required this.items});

@override
Widget build(BuildContext context) {
return Card(
child: Column(
children: items
    .map(
(item) => ListTile(
dense: true,
leading: Icon(item.$1, color: item.$4),
title: Text(
item.$2,
style: TextStyle(
color: ink,
fontWeight: FontWeight.w600,
),
),
trailing: Text(
item.$3,
style: TextStyle(
color: ink,
fontWeight: FontWeight.w800,
),
),
),
)
    .toList(),
),
);
}
}

// ============================================================
// INVENTORY
// ============================================================

class InventoryPage extends StatefulWidget {
final List<Product> products;
final VoidCallback onAdd;
final Function(int) onEdit;
final Function(int) onDelete;
final Function(int) onStockIn;
final Function(int) onStockOut;

const InventoryPage({
super.key,
required this.products,
required this.onAdd,
required this.onEdit,
required this.onDelete,
required this.onStockIn,
required this.onStockOut,
});

@override
State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
String search = '';
String category = 'All';

@override
Widget build(BuildContext context) {
final categories = [
'All',
...widget.products.map((p) => p.category).toSet(),
];

final filtered = widget.products.where((p) {
final matchesSearch = p.name.toLowerCase().contains(search.toLowerCase()) ||
p.category.toLowerCase().contains(search.toLowerCase());
final matchesCategory = category == 'All' || p.category == category;
return matchesSearch && matchesCategory;
}).toList();

return Column(
children: [
Padding(
padding: const EdgeInsets.fromLTRB(18, 10, 18, 8),
child: TextField(
onChanged: (v) => setState(() => search = v),
decoration: InputDecoration(
hintText: 'Search products or categories...',
prefixIcon: const Icon(Icons.search_rounded),
suffixIcon: search.isEmpty
? null
    : IconButton(
onPressed: () => setState(() => search = ''),
icon: const Icon(Icons.close_rounded),
),
),
),
),
SizedBox(
height: 48,
child: ListView.separated(
padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
scrollDirection: Axis.horizontal,
itemCount: categories.length,
separatorBuilder: (_, __) => const SizedBox(width: 8),
itemBuilder: (_, i) {
final selected = categories[i] == category;
return ChoiceChip(
label: Text(categories[i]),
selected: selected,
onSelected: (_) =>
setState(() => category = categories[i]),
selectedColor: primary.withOpacity(.12),
labelStyle: TextStyle(
color: selected ? primary : muted,
fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
),
side: BorderSide(
color: selected
? primary.withOpacity(.25)
    : const Color(0xFFE3E6EE),
),
);
},
),
),
Padding(
padding: const EdgeInsets.fromLTRB(18, 4, 18, 8),
child: Row(
children: [
Text(
'${filtered.length} products',
style: TextStyle(
color: muted,
fontSize: 12,
fontWeight: FontWeight.w600,
),
),
const Spacer(),
_TinyBadge(
icon: Icons.tune_rounded,
text: 'Filtered view',
color: primary,
),
],
),
),
Expanded(
child: filtered.isEmpty
? const Center(
child: _EmptyState(
icon: Icons.search_off_rounded,
title: 'No products found',
subtitle: 'Try a different search or category.',
),
)
    : ListView.builder(
padding: const EdgeInsets.fromLTRB(18, 4, 18, 100),
itemCount: filtered.length,
itemBuilder: (_, i) {
final product = filtered[i];
final originalIndex = widget.products.indexOf(product);
return _InventoryCard(
product: product,
onEdit: () => widget.onEdit(originalIndex),
onDelete: () => widget.onDelete(originalIndex),
onStockIn: () => widget.onStockIn(originalIndex),
onStockOut: product.quantity == 0
? null
    : () => widget.onStockOut(originalIndex),
);
},
),
),
],
);
}
}

class _InventoryCard extends StatelessWidget {
final Product product;
final VoidCallback onEdit;
final VoidCallback onDelete;
final VoidCallback onStockIn;
final VoidCallback? onStockOut;

const _InventoryCard({
required this.product,
required this.onEdit,
required this.onDelete,
required this.onStockIn,
required this.onStockOut,
});

@override
Widget build(BuildContext context) {
final out = product.quantity == 0;
final low = !out && product.quantity <= product.minimumStock;
final statusColor = out ? danger : low ? accent : secondary;
final status = out ? 'OUT OF STOCK' : low ? 'LOW STOCK' : 'IN STOCK';

return Card(
margin: const EdgeInsets.only(bottom: 11),
child: Padding(
padding: const EdgeInsets.all(13),
child: Column(
children: [
Row(
children: [
Container(
height: 52,
width: 52,
decoration: BoxDecoration(
gradient: LinearGradient(
colors: [
primary.withOpacity(.08),
secondary.withOpacity(.08),
],
),
borderRadius: BorderRadius.circular(15),
),
child: const Icon(
Icons.inventory_2_outlined,
color: primary,
),
),
const SizedBox(width: 13),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
product.name,
style: TextStyle(
color: ink,
fontSize: 15,
fontWeight: FontWeight.w900,
),
),
const SizedBox(height: 4),
Text(
product.category,
style: TextStyle(
color: muted,
fontSize: 11,
),
),
],
),
),
Column(
crossAxisAlignment: CrossAxisAlignment.end,
children: [
Text(
_money(product.price),
style: TextStyle(
color: ink,
fontWeight: FontWeight.w900,
),
),
const SizedBox(height: 5),
Container(
padding: const EdgeInsets.symmetric(
horizontal: 8,
vertical: 4,
),
decoration: BoxDecoration(
color: statusColor.withOpacity(.09),
borderRadius: BorderRadius.circular(20),
),
child: Text(
status,
style: TextStyle(
color: statusColor,
fontSize: 9,
fontWeight: FontWeight.w900,
),
),
),
],
),
],
),
const SizedBox(height: 12),
Row(
children: [
_StockPill(
label: 'Current',
value: '${product.quantity}',
color: statusColor,
),
const SizedBox(width: 8),
_StockPill(
label: 'Minimum',
value: '${product.minimumStock}',
color: muted,
),
const Spacer(),
IconButton(
tooltip: 'Stock in',
onPressed: onStockIn,
style: IconButton.styleFrom(
backgroundColor: secondary.withOpacity(.08),
),
icon: const Icon(
Icons.add_rounded,
color: secondary,
size: 20,
),
),
const SizedBox(width: 4),
IconButton(
tooltip: 'Stock out',
onPressed: onStockOut,
style: IconButton.styleFrom(
backgroundColor: accent.withOpacity(.09),
),
icon: const Icon(
Icons.remove_rounded,
color: accent,
size: 20,
),
),
const SizedBox(width: 4),
IconButton(
tooltip: 'Edit',
onPressed: onEdit,
style: IconButton.styleFrom(
backgroundColor: primary.withOpacity(.08),
),
icon: const Icon(
Icons.edit_outlined,
color: primary,
size: 19,
),
),
const SizedBox(width: 4),
IconButton(
tooltip: 'Delete',
onPressed: onDelete,
style: IconButton.styleFrom(
backgroundColor: danger.withOpacity(.07),
),
icon: const Icon(
Icons.delete_outline_rounded,
color: danger,
size: 19,
),
),
],
),
],
),
),
);
}
}

class _StockPill extends StatelessWidget {
final String label;
final String value;
final Color color;

const _StockPill({
required this.label,
required this.value,
required this.color,
});

@override
Widget build(BuildContext context) {
return Container(
padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
decoration: BoxDecoration(
color: color.withOpacity(.06),
borderRadius: BorderRadius.circular(11),
),
child: RichText(
text: TextSpan(
style: TextStyle(fontSize: 10, color: muted),
children: [
TextSpan(text: '$label  '),
TextSpan(
text: value,
style: TextStyle(
color: color,
fontWeight: FontWeight.w900,
),
),
],
),
),
);
}
}

// ============================================================
// SALES DASHBOARD
// ============================================================

class SaleRecord {
final String product;
final int quantity;
final double amount;
final String date;
final String customer;
final String payment;

const SaleRecord({
required this.product,
required this.quantity,
required this.amount,
required this.date,
required this.customer,
required this.payment,
});
}

class SalesPage extends StatefulWidget {
const SalesPage({super.key});

@override
State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
String period = 'Today';

final sales = const [
SaleRecord(
product: 'Laptop',
quantity: 2,
amount: 110000,
date: '10:30 AM',
customer: 'Aarav',
payment: 'UPI',
),
SaleRecord(
product: 'Mouse',
quantity: 3,
amount: 2100,
date: '11:15 AM',
customer: 'Priya',
payment: 'Card',
),
SaleRecord(
product: 'Keyboard',
quantity: 1,
amount: 1200,
date: '12:05 PM',
customer: 'Rahul',
payment: 'Cash',
),
SaleRecord(
product: 'Headphones',
quantity: 2,
amount: 5000,
date: '4:30 PM',
customer: 'Meera',
payment: 'UPI',
),
];

@override
Widget build(BuildContext context) {
final todayRevenue =
sales.fold<double>(0, (sum, item) => sum + item.amount);
final totalItems =
sales.fold<int>(0, (sum, item) => sum + item.quantity);

return ListView(
padding: const EdgeInsets.fromLTRB(18, 10, 18, 34),
children: [
Row(
children: [
const Expanded(
child: _SectionHeading(
title: 'Sales performance',
subtitle: 'A clean view of revenue and recent orders',
),
),
PopupMenuButton<String>(
onSelected: (v) => setState(() => period = v),
itemBuilder: (_) => const [
PopupMenuItem(value: 'Today', child: Text('Today')),
PopupMenuItem(value: 'Week', child: Text('This week')),
PopupMenuItem(value: 'Month', child: Text('This month')),
],
child: Container(
padding: const EdgeInsets.symmetric(
horizontal: 12,
vertical: 9,
),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(13),
border: Border.all(
color: const Color(0xFFE3E6EE),
),
),
child: Row(
children: [
const Icon(
Icons.calendar_today_outlined,
size: 15,
color: primary,
),
const SizedBox(width: 7),
Text(
period,
style: TextStyle(
color: ink,
fontSize: 11,
fontWeight: FontWeight.w800,
),
),
],
),
),
),
],
),
const SizedBox(height: 14),

// Compact cards instead of large pink boxes.
LayoutBuilder(
builder: (context, constraints) {
final columns = constraints.maxWidth > 800 ? 4 : 2;
return GridView.count(
crossAxisCount: columns,
shrinkWrap: true,
physics: const NeverScrollableScrollPhysics(),
crossAxisSpacing: 11,
mainAxisSpacing: 11,
childAspectRatio: constraints.maxWidth > 800 ? 1.9 : 1.75,
children: [
_SalesMetric(
title: 'Revenue',
value: _money(todayRevenue),
change: '+12.8%',
icon: Icons.trending_up_rounded,
color: primary,
),
_SalesMetric(
title: 'Orders',
value: '${sales.length}',
change: '+4 today',
icon: Icons.shopping_bag_outlined,
color: secondary,
),
_SalesMetric(
title: 'Items sold',
value: '$totalItems',
change: '+7.2%',
icon: Icons.sell_outlined,
color: accent,
),
_SalesMetric(
title: 'Customers',
value: '16',
change: '12 returning',
icon: Icons.people_outline_rounded,
color: const Color(0xFF7BA7FF),
),
],
);
},
),

const SizedBox(height: 14),

_SalesChartCard(
period: period,
revenue: todayRevenue,
),

const SizedBox(height: 14),

Row(
children: [
const Expanded(
child: _SectionHeading(
title: 'Recent transactions',
subtitle: 'Latest orders processed',
),
),
_TinyBadge(
icon: Icons.bolt_rounded,
text: 'Live',
color: secondary,
),
],
),
const SizedBox(height: 10),

...sales.map(
(sale) => _SaleTransaction(sale: sale),
),
],
);
}
}

class _SalesMetric extends StatelessWidget {
final String title;
final String value;
final String change;
final IconData icon;
final Color color;

const _SalesMetric({
required this.title,
required this.value,
required this.change,
required this.icon,
required this.color,
});

@override
Widget build(BuildContext context) {
return Card(
child: Padding(
padding: const EdgeInsets.all(14),
child: Row(
children: [
Container(
height: 42,
width: 42,
decoration: BoxDecoration(
color: color.withOpacity(.09),
borderRadius: BorderRadius.circular(13),
),
child: Icon(icon, color: color, size: 21),
),
const SizedBox(width: 10),
Expanded(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
title,
style: TextStyle(
color: muted,
fontSize: 11,
fontWeight: FontWeight.w600,
),
),
const SizedBox(height: 3),
Text(
value,
maxLines: 1,
overflow: TextOverflow.ellipsis,
style: TextStyle(
color: ink,
fontSize: 18,
fontWeight: FontWeight.w900,
),
),
const SizedBox(height: 3),
Text(
change,
style: TextStyle(
color: color,
fontSize: 9,
fontWeight: FontWeight.w800,
),
),
],
),
),
],
),
),
);
}
}

class _SalesChartCard extends StatelessWidget {
final String period;
final double revenue;

const _SalesChartCard({
required this.period,
required this.revenue,
});

@override
Widget build(BuildContext context) {
final values = period == 'Month'
? [32.0, 48, 42, 66, 58, 78, 92, 86, 108, 96, 122, 135]
    : period == 'Week'
? [34.0, 55, 48, 72, 60, 88, 76]
    : [18.0, 32, 25, 49, 41, 66, 58];

final labels = period == 'Month'
? ['1', '3', '5', '7', '9', '11', '13', '15', '17', '19', '21', '23']
    : period == 'Week'
? ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
    : ['9AM', '10AM', '11AM', '12PM', '2PM', '4PM', '6PM'];

return Card(
child: Padding(
padding: const EdgeInsets.fromLTRB(18, 17, 18, 14),
child: Column(
children: [
Row(
children: [
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'Revenue trend',
style: TextStyle(
color: ink,
fontSize: 15,
fontWeight: FontWeight.w900,
),
),
SizedBox(height: 3),
Text(
'Sales movement across the selected period',
style: TextStyle(
color: muted,
fontSize: 10,
),
),
],
),
),
Text(
_money(revenue),
style: TextStyle(
color: primary,
fontSize: 17,
fontWeight: FontWeight.w900,
),
),
],
),
const SizedBox(height: 18),
SizedBox(
height: 190,
child: _LineChart(
values: values.map((e) => e.toDouble()).toList(),
labels: labels,
),
),
],
),
),
);
}
}

class _LineChart extends StatelessWidget {
final List<double> values;
final List<String> labels;

const _LineChart({
required this.values,
required this.labels,
});

@override
Widget build(BuildContext context) {
return CustomPaint(
painter: _LineChartPainter(values: values, labels: labels),
child: const SizedBox.expand(),
);
}
}

class _LineChartPainter extends CustomPainter {
final List<double> values;
final List<String> labels;

_LineChartPainter({
required this.values,
required this.labels,
});

@override
void paint(Canvas canvas, Size size) {
const left = 10.0;
const right = 10.0;
const top = 10.0;
const bottom = 28.0;

final chart = Rect.fromLTRB(
left,
top,
size.width - right,
size.height - bottom,
);

final grid = Paint()
..color = const Color(0xFFE9ECF3)
..strokeWidth = 1;

for (var i = 0; i <= 4; i++) {
final y = chart.top + chart.height * i / 4;
canvas.drawLine(
Offset(chart.left, y),
Offset(chart.right, y),
grid,
);
}

final max = values.reduce((a, b) => a > b ? a : b);
final min = values.reduce((a, b) => a < b ? a : b);
final range = (max - min).abs() < 0.01 ? 1 : max - min;

final points = <Offset>[];
for (var i = 0; i < values.length; i++) {
final x = values.length == 1
? chart.center.dx
    : chart.left + chart.width * i / (values.length - 1);
final normalized = (values[i] - min) / range;
final y = chart.bottom - normalized * chart.height;
points.add(Offset(x, y));
}

final fill = Path()..moveTo(points.first.dx, chart.bottom);
for (final p in points) {
fill.lineTo(p.dx, p.dy);
}
fill.lineTo(points.last.dx, chart.bottom);
fill.close();

final fillPaint = Paint()
..shader = LinearGradient(
begin: Alignment.topCenter,
end: Alignment.bottomCenter,
colors: [
primary.withOpacity(.18),
primary.withOpacity(.01),
],
).createShader(chart);

canvas.drawPath(fill, fillPaint);

final line = Paint()
..color = primary
..strokeWidth = 3
..style = PaintingStyle.stroke
..strokeCap = StrokeCap.round
..strokeJoin = StrokeJoin.round;

final path = Path()..moveTo(points.first.dx, points.first.dy);
for (var i = 1; i < points.length; i++) {
final previous = points[i - 1];
final current = points[i];
final control1 = Offset(
previous.dx + (current.dx - previous.dx) / 2,
previous.dy,
);
final control2 = Offset(
previous.dx + (current.dx - previous.dx) / 2,
current.dy,
);
path.cubicTo(
control1.dx,
control1.dy,
control2.dx,
control2.dy,
current.dx,
current.dy,
);
}

canvas.drawPath(path, line);

for (var i = 0; i < points.length; i++) {
final p = points[i];

canvas.drawCircle(
p,
5,
Paint()..color = Colors.white,
);
canvas.drawCircle(
p,
3,
Paint()..color = primary,
);

_text(
canvas,
labels[i],
Offset(p.dx - 18, chart.bottom + 8),
10,
muted,
36,
);
}
}

void _text(
Canvas canvas,
String text,
Offset offset,
double fontSize,
Color color,
double width,
) {
final painter = TextPainter(
text: TextSpan(
text: text,
style: TextStyle(
color: color,
fontSize: fontSize,
fontWeight: FontWeight.w600,
),
),
textDirection: TextDirection.ltr,
textAlign: TextAlign.center,
)..layout(maxWidth: width);

painter.paint(canvas, offset);
}

@override
bool shouldRepaint(covariant _LineChartPainter oldDelegate) {
return oldDelegate.values != values || oldDelegate.labels != labels;
}
}

class _SaleTransaction extends StatelessWidget {
final SaleRecord sale;

const _SaleTransaction({required this.sale});

@override
Widget build(BuildContext context) {
return Card(
margin: const EdgeInsets.only(bottom: 9),
child: Padding(
padding: const EdgeInsets.all(12),
child: Row(
children: [
Container(
height: 45,
width: 45,
decoration: BoxDecoration(
color: primary.withOpacity(.16),
borderRadius: BorderRadius.circular(14),
),
child: const Icon(
Icons.shopping_bag_outlined,
color: primary,
size: 21,
),
),
const SizedBox(width: 12),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
sale.product,
style: TextStyle(
color: ink,
fontWeight: FontWeight.w800,
),
),
const SizedBox(height: 4),
Text(
'${sale.quantity} items • ${sale.customer} • ${sale.date}',
style: TextStyle(
color: muted,
fontSize: 10,
),
),
],
),
),
Column(
crossAxisAlignment: CrossAxisAlignment.end,
children: [
Text(
_money(sale.amount),
style: TextStyle(
color: ink,
fontWeight: FontWeight.w900,
),
),
const SizedBox(height: 4),
Container(
padding: const EdgeInsets.symmetric(
horizontal: 7,
vertical: 3,
),
decoration: BoxDecoration(
color: secondary.withOpacity(.08),
borderRadius: BorderRadius.circular(10),
),
child: Text(
sale.payment,
style: TextStyle(
color: secondary,
fontSize: 9,
fontWeight: FontWeight.w800,
),
),
),
],
),
],
),
),
);
}
}

// ============================================================
// HELPERS
// ============================================================

String _money(double value) {
if (value >= 100000) {
return 'Rs.${(value / 100000).toStringAsFixed(value % 100000 == 0 ? 0 : 1)}L';
}
if (value >= 1000) {
return 'Rs.${(value / 1000).toStringAsFixed(value % 1000 == 0 ? 0 : 1)}K';
}
return 'Rs.${value.toStringAsFixed(0)}';
}


