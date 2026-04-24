import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/admin_controller.dart';
import '../../model/product.dart';

class AdminManageScreen extends StatelessWidget {
  const AdminManageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text("Admin Inventory", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF6366F1),
        onPressed: () => _openProductForm(context, null),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text("Add Product", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Obx(() {
        if (controller.isLoading.value) return const Center(child: CircularProgressIndicator());

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

  // --- Product Card UI ---
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
          child: Image.network(p.imageUrl ?? '', width: 60, height: 60, fit: BoxFit.cover),
        ),
        title: Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("Rs.${p.price}", style: const TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Action 1: Edit
            IconButton(
              icon: const Icon(Icons.edit_rounded, color: Colors.blueAccent),
              onPressed: () => _openProductForm(context, p),
            ),
            // Action 2: Delete
            IconButton(
              icon: const Icon(Icons.delete_outline_rounded, color: Colors.redAccent),
              onPressed: () => _confirmDelete(context, p.id!, controller),
            ),
          ],
        ),
      ),
    );
  }

  // --- Add/Edit Form Function ---
  void _openProductForm(BuildContext context, Product? product) {
    final isEdit = product != null;
    final formKey = GlobalKey<FormState>();
    
    final nameC = TextEditingController(text: product?.name ?? '');
    final priceC = TextEditingController(text: product?.price?.toString() ?? '');
    final aboutC = TextEditingController(text: product?.about ?? '');
    final imgC = TextEditingController(text: product?.imageUrl ?? '');
    final catC = TextEditingController(text: product?.category ?? 'Apple');

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
                Text(isEdit ? "Update Product" : "Add New Mobile", 
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                _buildField(nameC, "Model Name", Icons.phone_android, (v) => v!.isEmpty ? "Required" : null),
                const SizedBox(height: 12),
                _buildField(priceC, "Price (Rs)", Icons.money, (v) => v!.isEmpty ? "Required" : null, isNumber: true),
                const SizedBox(height: 12),
                _buildField(catC, "Brand (Apple, Samsung...)", Icons.category, (v) => v!.isEmpty ? "Required" : null),
                const SizedBox(height: 12),
                _buildField(imgC, "Image URL", Icons.image, (v) => v!.isEmpty ? "Required" : null),
                const SizedBox(height: 12),
                _buildField(aboutC, "Description", Icons.description, (v) => v!.isEmpty ? "Required" : null, maxLines: 3),
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
                    child: const Text("SAVE TO DATABASE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget _buildField(TextEditingController controller, String label, IconData icon, String? Function(String?)? validator, {bool isNumber = false, int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
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
      title: "Delete Product?",
      middleText: "This action cannot be undone.",
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