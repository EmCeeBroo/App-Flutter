import 'package:flutter/material.dart';
import 'package:application_login/pages/auth/change_password.dart';
import 'package:application_login/widgets/appbar.dart';

// lib/pages/settings/settings.dart
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Configuración', showBackButton: true),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Sección CUENTA
          _buildSectionHeader('Cuenta'),
          const SizedBox(height: 8),

          // Cambiar Email
          _buildSettingsTile(
            context,
            icon: Icons.email_outlined,
            iconColor: Colors.blue,
            title: 'Cambiar Email',
            subtitle: 'Actualiza tu dirección de correo electrónico',
            onTap: () {
              _showEmailChangeDialog(context);
            },
          ),

          const SizedBox(height: 8),

          // Cambiar Contraseña
          _buildSettingsTile(
            context,
            icon: Icons.lock_outlined,
            iconColor: Colors.blue,
            title: 'Cambiar Contraseña',
            subtitle: 'Establece una nueva contraseña segura',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
              );
            },
          ),

          const SizedBox(height: 24),

          // Sección APARIENCIA
          _buildSectionHeader('Apariencia'),
          const SizedBox(height: 8),

          // Tema de la App
          _buildSettingsTile(
            context,
            icon: Icons.palette_outlined,
            iconColor: Colors.blue,
            title: 'Tema de la App',
            subtitle: 'Personaliza colores y aspecto',
            onTap: () {
              _showThemeSelectionDialog(context);
            },
          ),

          const SizedBox(height: 8),

          // Idioma
          _buildSettingsTile(
            context,
            icon: Icons.language_outlined,
            iconColor: Colors.blue,
            title: 'Idioma',
            subtitle: 'Selecciona el idioma de la aplicación',
            onTap: () {
              _showLanguageSelectionDialog(context);
            },
          ),
        ],
      ),
    );
  }

  // Encabezado de sección (Cuenta, Apariencia)
  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.grey,
        letterSpacing: 0.5,
      ),
    );
  }

  // Widget para cada opción de configuración
  Widget _buildSettingsTile(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: Colors.grey[50],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey[400],
        ),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),
    );
  }

  // Dialog para cambiar email
  void _showEmailChangeDialog(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cambiar Email'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Nuevo correo electrónico',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              // Validar email
              String email = emailController.text;
              if (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
                print('📧 Nuevo email: $email');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Email cambiado a: $email')),
                );
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Email inválido')));
              }
            },
            child: const Text('Cambiar'),
          ),
        ],
      ),
    );
  }

  // Dialog para selección de tema
  void _showThemeSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Seleccionar Tema'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.light_mode, color: Colors.orange),
              title: const Text('Tema Original (Azul)'),
              onTap: () {
                print('🎨 Tema seleccionado: Original (Azul)');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Tema Original aplicado')),
                );
                Navigator.pop(context);
                // Aquí aplicarías el tema original
              },
            ),
            ListTile(
              leading: const Icon(Icons.palette, color: Colors.purple),
              title: const Text('Tema Personalizado (Púrpura)'),
              onTap: () {
                print('🎨 Tema seleccionado: Personalizado (Púrpura)');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Tema Personalizado aplicado')),
                );
                Navigator.pop(context);
                // Aquí aplicarías tu tema personalizado
              },
            ),
            ListTile(
              leading: const Icon(Icons.dark_mode, color: Colors.grey),
              title: const Text('Tema Oscuro'),
              onTap: () {
                print('🎨 Tema seleccionado: Oscuro');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Tema Oscuro aplicado')),
                );
                Navigator.pop(context);
                // Aquí aplicarías el tema oscuro
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
        ],
      ),
    );
  }

  // Dialog para selección de idioma
  void _showLanguageSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Seleccionar Idioma'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Text('🇪🇸', style: TextStyle(fontSize: 20)),
              title: const Text('Español'),
              onTap: () {
                print('🌐 Idioma seleccionado: Español');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Idioma cambiado a Español')),
                );
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Text('🇺🇸', style: TextStyle(fontSize: 20)),
              title: const Text('English'),
              onTap: () {
                print('🌐 Idioma seleccionado: English');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Language changed to English')),
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
        ],
      ),
    );
  }
}
