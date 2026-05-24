import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Theme Switcher',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: Brightness.light,
            ),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
          themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: const ThemeSwitcherScreen(),
        );
      },
    );
  }
}

class ThemeSwitcherScreen extends StatelessWidget {
  const ThemeSwitcherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Switcher'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon that changes based on theme
                Icon(
                  themeProvider.isDarkMode 
                    ? Icons.dark_mode 
                    : Icons.light_mode,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 32),

                // Current theme text
                Text(
                  'Current Theme',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),

                Text(
                  themeProvider.isDarkMode ? 'Dark Mode' : 'Light Mode',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 48),

                // Theme toggle switch
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Toggle Theme:',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(width: 16),
                    Switch(
                      value: themeProvider.isDarkMode,
                      onChanged: (value) {
                        context.read<ThemeProvider>().toggleTheme();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 48),

                // Reset button (bonus feature)
                ElevatedButton(
                  onPressed: () {
                    context.read<ThemeProvider>().resetTheme();
                  },
                  child: const Text('Reset to Light Mode'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

