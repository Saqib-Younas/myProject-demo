import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_flutter/src/controller/admin_controller.dart';
import 'package:e_commerce_flutter/src/model/product.dart';

// Ensure the class name here matches exactly what you use in main.dart
class AdminManageScreen extends StatelessWidget {
  const AdminManageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // AdminController ko initialize karna zaroori hai
    final controller = Get.put(AdminController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Admin Inventory",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await controller.fetchAdminProducts();
            },
            icon: const Icon(Icons.refresh, color: Colors.black),
          )
        ],
      ),
      
      // Logout Button for Admin Testing
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF6366F1)),
              child: Center(
                child: Text("Admin Panel", 
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout"),
              onTap: () async {
                import 'package:supabase_flutter/supabase_flutter.dart';
                await Supabase.instance.client.auth.signOut();
                Navigator.pushReplacementNamed(context, '/auth');
              },
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF6366F1),
        onPressed: () => _openProductForm(context, null),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text("Add New Product", style: TextStyle(color: Colors.white)),
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator(color: Color(0xFF6366F1)));
        }

        if (controller.products.isEmpty) {
          return const Center(child: Text("No products in database"));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            final product = controller.products[index];
            return _buildAdminCard(context, product, controller);
          },
        );
      }),
    );
  }

  Widget _buildAdminCard(BuildContext context, Product p, AdminController controller) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 15)],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            p.imageUrl ?? '', 
            width: 60, height: 60, fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported),
          ),
        ),
        title: Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("Rs.${p.price}", 
          style: const TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit_rounded, color: Colors.blueAccent),
              onPressed: () => _openProductForm(context, p),
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline_rounded, color: Colors.redAccent),
              onPressed: () => _confirmDelete(context, p.id!, controller),
            ),
          ],
        ),
      ),
    );
  }

  void _openProductForm(BuildContext context, Product? product) {
    final isEdit = product != null;
    final formKey = GlobalKey<FormState>();
    
    final nameC = TextEditingController(text: product?.name ?? '');
    final priceC = TextEditingController(text: product?.price?.toString() ?? '');
    final aboutC = TextEditingController(text: product?.about ?? '');
    final imgC = TextEditingController(text: product?.imageUrl ?? '');
    final catC = TextEditingController(text: product?.category ?? '');

    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10))),
                const SizedBox(height: 20),
                Text(isEdit ? "Edit Product" : "Add New Product", 
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                _buildField(nameC, "Product Name", Icons.shopping_bag_outlined),
                const SizedBox(height: 12),
                _buildField(priceC, "Price (Rs)", Icons.attach_money, isNumber: true),
                const SizedBox(height: 12),
                _buildField(catC, "Category (Apple, Samsung...)", Icons.category_outlined),
                const SizedBox(height: 12),
                _buildField(imgC, "Image URL", Icons.link),
                const SizedBox(height: 12),
                _buildField(aboutC, "About / Description", Icons.description_outlined, maxLines: 3),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6366F1),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Get.find<AdminController>().saveProduct(
                          id: product?.id,
                          name: nameC.text,
                          price: double.parse(priceC.text),
                          about: aboutC.text,
                          imageUrl: imgC.text,
                          category: catC.text,
                        );
                      }
                    },
                    child: const Text("SAVE TO SUPABASE", 
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget _buildField(TextEditingController controller, String label, IconData icon, {bool isNumber = false, int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      validator: (v) => v!.isEmpty ? "Field required" : null,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFF6366F1)),
        filled: true,
        fillColor: const Color(0xFFF3F4F6),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
      ),
    );
  }

  void _confirmDelete(BuildContext context, String id, AdminController controller) {
    Get.defaultDialog(
      title: "Confirm Delete",
      middleText: "Are you sure you want to delete this product?",
      textConfirm: "Delete",
      textCancel: "Cancel",
      confirmTextColor: Colors.white,
      buttonColor: Colors.redAccent,
      onConfirm: () {
        controller.deleteProduct(id);
        Get.back();
      },
    );
  }
}