import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreTest extends StatefulWidget {
  const FirestoreTest({super.key});

  @override
  State<FirestoreTest> createState() => _FirestoreTestState();
}

class _FirestoreTestState extends State<FirestoreTest> {
  final CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  // CREATE
  Future<void> createProduct(
      String name, String description, double price) async {
    await products.add({
      'name': name,
      'description': description,
      'price': price,
    });
  }

  // UPDATE
  Future<void> updateProduct(
      String docId, String name, String description, double price) async {
    await products.doc(docId).update({
      'name': name,
      'description': description,
      'price': price,
    });
  }

  // DELETE
  Future<void> deleteProduct(String docId) async {
    await products.doc(docId).delete();
  }

  // -------------------------------
  // ฟอร์มแก้ไขสินค้า (Dialog)
  void showEditDialog(
      String docId, String currentName, String currentDesc, double currentPrice) {
    final nameController = TextEditingController(text: currentName);
    final descController = TextEditingController(text: currentDesc);
    final priceController = TextEditingController(text: currentPrice.toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('แก้ไขสินค้า'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameController, decoration: const InputDecoration(labelText: 'ชื่อสินค้า')),
            TextField(controller: descController, decoration: const InputDecoration(labelText: 'รายละเอียด')),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'ราคา'),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('ยกเลิก')),
          ElevatedButton(
            onPressed: () {
              updateProduct(
                docId,
                nameController.text,
                descController.text,
                double.tryParse(priceController.text) ?? 0,
              );
              Navigator.pop(context);
            },
            child: const Text('บันทึก'),
          ),
        ],
      ),
    );
  }
  // -------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
        backgroundColor: Colors.blueGrey,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: products.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No products found.'));
          }

          final data = snapshot.data!.docs;

          return ListView.separated(
            itemCount: data.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final product = data[index];
              final productId = product.id;
              final name = product['name'];
              final description = product['description'];
              final price = product['price'];

              return ListTile(
                leading: Text('${index + 1}'),
                title: Text(name),
                subtitle: Text(description),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${price.toString()} ฿',
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.orange),
                      onPressed: () {
                        showEditDialog(productId, name, description, price);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        deleteProduct(productId);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple.shade100,
        child: const Icon(Icons.add, color: Colors.black),
        onPressed: () {
          // ตัวอย่างการเพิ่มข้อมูล
          createProduct('New Product', 'Example item', 9999);
        },
      ),
      backgroundColor: const Color(0xFFF8ECFF),
    );
  }
}