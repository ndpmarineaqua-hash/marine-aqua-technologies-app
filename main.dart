import 'package:flutter/material.dart';

void main() => runApp(const MarineAquaApp());

class MarineAquaApp extends StatelessWidget {
  const MarineAquaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MARINE AQUA TECHNOLOGIES',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF007C91),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF4FAFB),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phone = TextEditingController();
  final otp = TextEditingController();
  bool otpSent = false;

  @override
  void dispose() {
    phone.dispose();
    otp.dispose();
    super.dispose();
  }

  void sendOtp() {
    if (phone.text.trim().length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a valid 10-digit mobile number')),
      );
      return;
    }
    setState(() => otpSent = true);
  }

  void verifyOtp() {
    if (otp.text.trim().length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter 6-digit OTP')),
      );
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const MainShell()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Container(
                  width: 82,
                  height: 82,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF005B70), Color(0xFF00A6A6)],
                    ),
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: const Icon(Icons.waves, color: Colors.white, size: 45),
                ),
                const SizedBox(height: 20),
                const Text(
                  'MARINE AQUA TECHNOLOGIES',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Smart Aquaculture. Better Results.',
                  style: TextStyle(color: Color(0xFF607D85)),
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: const Color(0xFFE0EFF1)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Login',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
                      const SizedBox(height: 6),
                      const Text('Login with your mobile number',
                          style: TextStyle(color: Color(0xFF78909C))),
                      const SizedBox(height: 22),
                      TextField(
                        controller: phone,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration: InputDecoration(
                          counterText: '',
                          prefixText: '+91  ',
                          labelText: 'Mobile Number',
                          prefixIcon: const Icon(Icons.phone_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      if (otpSent) ...[
                        const SizedBox(height: 14),
                        TextField(
                          controller: otp,
                          keyboardType: TextInputType.number,
                          maxLength: 6,
                          decoration: InputDecoration(
                            counterText: '',
                            labelText: 'Enter OTP',
                            prefixIcon: const Icon(Icons.lock_outline),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ],
                      const SizedBox(height: 18),
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: FilledButton(
                          onPressed: otpSent ? verifyOtp : sendOtp,
                          child: Text(otpSent ? 'VERIFY OTP' : 'SEND OTP'),
                        ),
                      ),
                      if (otpSent) ...[
                        const SizedBox(height: 12),
                        Center(
                          child: TextButton(
                            onPressed: sendOtp,
                            child: const Text('Resend OTP'),
                          ),
                        ),
                      ],
                    ],
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

class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int index = 0;

  final pages = const [
    HomePage(),
    ProductsPage(),
    PondsPage(),
    SupportPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.inventory_2_outlined), selectedIcon: Icon(Icons.inventory_2), label: 'Products'),
          NavigationDestination(icon: Icon(Icons.water_drop_outlined), selectedIcon: Icon(Icons.water_drop), label: 'My Ponds'),
          NavigationDestination(icon: Icon(Icons.support_agent_outlined), selectedIcon: Icon(Icons.support_agent), label: 'Support'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void open(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 48, height: 48,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Color(0xFF006B7A), Color(0xFF00A6A6)]),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(Icons.waves, color: Colors.white, size: 28),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('MARINE AQUA TECHNOLOGIES', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                      Text('Smart Aquaculture. Better Results.', style: TextStyle(color: Color(0xFF607D85), fontSize: 12)),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => open(context, const NotificationsPage()),
                  icon: const Icon(Icons.notifications_none_rounded),
                ),
              ],
            ),
            const SizedBox(height: 22),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF005B70), Color(0xFF009D9A)],
                  begin: Alignment.topLeft, end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('SMART AQUACULTURE', style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 1)),
                  SizedBox(height: 8),
                  Text('Better Pond.\nBetter Growth.', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800, height: 1.05)),
                  SizedBox(height: 10),
                  Text('Manage your pond, products and technical support in one place.', style: TextStyle(color: Colors.white70, fontSize: 13)),
                ],
              ),
            ),
            const SizedBox(height: 22),
            const Text('Quick Actions', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800)),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.45,
              children: [
                QuickCard(Icons.add_business_outlined, 'Add Pond', 'Create pond profile', () => open(context, const AddPondPage())),
                QuickCard(Icons.science_outlined, 'Water Test', 'Record parameters', () => open(context, const WaterTestPage())),
                QuickCard(Icons.menu_book_outlined, 'Pond Diary', 'Daily pond notes', () => open(context, const PondDiaryPage())),
                QuickCard(Icons.description_outlined, 'Reports', 'View pond reports', () => open(context, const ReportsPage())),
              ],
            ),
            const SizedBox(height: 22),
            const Text('Pond Snapshot', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 18, offset: const Offset(0, 8))],
              ),
              child: const Row(
                children: [
                  Expanded(child: Metric(title: 'My Ponds', value: '0', icon: Icons.water)),
                  Expanded(child: Metric(title: 'Water Tests', value: '0', icon: Icons.science)),
                  Expanded(child: Metric(title: 'Reports', value: '0', icon: Icons.analytics_outlined)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuickCard extends StatelessWidget {
  final IconData icon; final String title; final String subtitle; final VoidCallback onTap;
  const QuickCard(this.icon, this.title, this.subtitle, this.onTap, {super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: const Color(0xFFE0EFF1))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, color: const Color(0xFF007C91), size: 27),
          const SizedBox(height: 9),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
          const SizedBox(height: 3),
          Text(subtitle, style: const TextStyle(color: Color(0xFF78909C), fontSize: 11)),
        ]),
      ),
    );
  }
}

class Metric extends StatelessWidget {
  final String title, value; final IconData icon;
  const Metric({required this.title, required this.value, required this.icon, super.key});
  @override
  Widget build(BuildContext context) => Column(children: [
    Icon(icon, color: const Color(0xFF008B91), size: 24),
    const SizedBox(height: 7),
    Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
    Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 10, color: Color(0xFF78909C))),
  ]);
}

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});
  static const products = [
    ['MARINE-6G', 'Liquid Minerals', Icons.water_drop],
    ['MARINE WHITE SHIELD', 'Advanced Gut Health', Icons.shield_outlined],
    ['MARINE VIBRIO SHIELD', 'Vibrio Management', Icons.biotech_outlined],
    ['MARINE PROTAB', 'Probiotic Tablet', Icons.medication_outlined],
    ['OXY TAB+', 'Oxygen Support', Icons.bubble_chart_outlined],
    ['MARINE VOLT-X', 'Growth Booster', Icons.trending_up],
    ['BIO SLUDGE-X', 'Pond Bottom Management', Icons.layers_outlined],
    ['FREE MOULT', 'Moulting Support', Icons.sync],
  ];
  @override
  Widget build(BuildContext context) => AppPage(
    title: 'Products', subtitle: 'Marine Aqua Technologies product range',
    child: ListView.separated(
      shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length, separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (_, i) => InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailsPage(name: products[i][0] as String, subtitle: products[i][1] as String))),
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: const Color(0xFFE0EFF1))),
          child: Row(children: [
            Container(width: 54, height: 54, decoration: BoxDecoration(color: const Color(0xFFE7F7F8), borderRadius: BorderRadius.circular(16)),
              child: Icon(products[i][2] as IconData, color: const Color(0xFF007C91))),
            const SizedBox(width: 14),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(products[i][0] as String, style: const TextStyle(fontWeight: FontWeight.w800)),
              const SizedBox(height: 4),
              Text(products[i][1] as String, style: const TextStyle(color: Color(0xFF78909C), fontSize: 12)),
            ])),
            const Icon(Icons.chevron_right_rounded, color: Color(0xFF78909C)),
          ]),
        ),
      ),
    ),
  );
}

class ProductDetailsPage extends StatelessWidget {
  final String name, subtitle;
  const ProductDetailsPage({required this.name, required this.subtitle, super.key});
  @override
  Widget build(BuildContext context) => AppPage(
    title: name, subtitle: subtitle,
    child: Column(children: [
      Container(height: 210, width: double.infinity, decoration: BoxDecoration(
        color: const Color(0xFFE7F7F8), borderRadius: BorderRadius.circular(24)),
        child: const Icon(Icons.inventory_2_outlined, size: 90, color: Color(0xFF007C91)),
      ),
      const SizedBox(height: 18),
      const Card(child: Padding(padding: EdgeInsets.all(18), child: Text(
        'Product information and application details will appear here.\n\nProduct photos can be added later.',
        style: TextStyle(height: 1.5),
      ))),
    ]),
  );
}

class PondsPage extends StatelessWidget {
  const PondsPage({super.key});
  @override
  Widget build(BuildContext context) => AppPage(
    title: 'My Ponds', subtitle: 'Manage your pond profiles',
    child: Column(children: [
      Container(width: double.infinity, padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: const Color(0xFFE0EFF1))),
        child: const Column(children: [
          Icon(Icons.water_drop_outlined, size: 50, color: Color(0xFF008B91)),
          SizedBox(height: 12),
          Text('No ponds added yet', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
          SizedBox(height: 6),
          Text('Add your first pond to start tracking water tests and pond activity.', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF78909C), fontSize: 12)),
        ]),
      ),
      const SizedBox(height: 14),
      SizedBox(width: double.infinity, child: FilledButton.icon(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AddPondPage())), icon: const Icon(Icons.add), label: const Text('Add New Pond'))),
    ]),
  );
}

class AddPondPage extends StatelessWidget {
  const AddPondPage({super.key});
  @override
  Widget build(BuildContext context) => FormPage(title: 'Add New Pond', fields: const ['Pond Name', 'Farmer Name', 'Village / Location', 'Pond Area (Acres)']);
}

class WaterTestPage extends StatelessWidget {
  const WaterTestPage({super.key});
  @override
  Widget build(BuildContext context) => FormPage(title: 'Water Test', fields: const ['Pond Name', 'pH', 'Salinity', 'Temperature', 'Dissolved Oxygen']);
}

class PondDiaryPage extends StatelessWidget {
  const PondDiaryPage({super.key});
  @override
  Widget build(BuildContext context) => FormPage(title: 'Pond Diary', fields: const ['Pond Name', 'Date', 'Feed Details', 'Pond Observation', 'Remarks']);
}

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});
  @override
  Widget build(BuildContext context) => AppPage(title: 'Pond Reports', subtitle: 'Your pond activity summary',
    child: Container(width: double.infinity, padding: const EdgeInsets.all(28), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: const Column(children: [Icon(Icons.analytics_outlined, size: 60, color: Color(0xFF007C91)), SizedBox(height: 12), Text('No reports yet', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)), SizedBox(height: 6), Text('Reports will be generated after pond data is recorded.', textAlign: TextAlign.center)])));
}

class FormPage extends StatelessWidget {
  final String title; final List<String> fields;
  const FormPage({required this.title, required this.fields, super.key});
  @override
  Widget build(BuildContext context) => AppPage(title: title, subtitle: 'Enter details and save',
    child: Column(children: [
      ...fields.map((f) => Padding(padding: const EdgeInsets.only(bottom: 12), child: TextField(
        decoration: InputDecoration(labelText: f, border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)), filled: true, fillColor: Colors.white),
      ))),
      SizedBox(width: double.infinity, height: 50, child: FilledButton(onPressed: () => Navigator.pop(context), child: const Text('SAVE'))),
