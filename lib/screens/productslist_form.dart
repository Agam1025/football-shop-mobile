import 'package:flutter/material.dart';
import 'package:football_shop/widgets/left_drawer.dart';

class ProductsFormPage extends StatefulWidget {
  const ProductsFormPage({super.key});

  @override
  State<ProductsFormPage> createState() => _ProductsFormPageState();
}

class _ProductsFormPageState extends State<ProductsFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _title = "";
  String _content = "";
  String _category = "shoes";
  String _thumbnail = "";
  bool _isFeatured = false;
  double _price = 0;

  final List<String> _categories = [
    'shoes',
    'jersey',
    'ball',
    'headband',
    'cone',
    'vest',
  ];

  InputDecoration _inputStyle(String label, String hint) {
    return InputDecoration(
      hintText: hint,
      labelText: label,
      labelStyle: const TextStyle(color: Color(0xFFFA812F)),
      hintStyle: const TextStyle(color: Colors.white70),
      filled: true,
      fillColor: const Color(0xFF2A2A2A),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: Color(0xFFFA812F)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFFA812F)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFE56F20), width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),

      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        elevation: 0,
        title: const Text(
          'Add Products Form',
          style: TextStyle(
            color: Color(0xFFFA812F),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFFFA812F)),
      ),

      drawer: const LeftDrawer(),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // === Nama Produk ===
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: _inputStyle("Nama Produk", "Masukkan Nama Produk"),
                  onChanged: (String? value) {
                    setState(() => _title = value!);
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama Produk tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // === Deskripsi Produk ===
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  maxLines: 5,
                  style: const TextStyle(color: Colors.white),
                  decoration: _inputStyle("Deskripsi Produk", "Masukkan Deskripsi Produk"),
                  onChanged: (String? value) {
                    setState(() => _content = value!);
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi Produk tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // === Harga Produk ===
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                  decoration: _inputStyle("Harga Produk", "Masukkan harga produk (Rp)"),
                  onChanged: (String? value) {
                    setState(() {
                      _price = double.tryParse(value ?? "0") ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Harga tidak boleh kosong!";
                    }
                    if (double.tryParse(value) == null) {
                      return "Masukkan angka yang valid!";
                    }
                    if (double.parse(value) <= 0) {
                      return "Harga harus lebih dari 0!";
                    }
                    return null;
                  },
                ),
              ),

              // === Kategori ===
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: DropdownButtonFormField<String>(
                  dropdownColor: const Color(0xFF2A2A2A),
                  style: const TextStyle(color: Colors.white),
                  decoration: _inputStyle("Kategori", ""),
                  value: _category,
                  items: _categories.map((cat) {
                    return DropdownMenuItem(
                      value: cat,
                      child: Text(
                        cat[0].toUpperCase() + cat.substring(1),
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() => _category = newValue!);
                  },
                ),
              ),

              // === Thumbnail URL ===
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: _inputStyle("URL Thumbnail", "Masukkan URL Thumbnail (opsional)"),
                  onChanged: (String? value) {
                    setState(() => _thumbnail = value!);
                  },
                ),
              ),

              // === Produk Unggulan ===
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SwitchListTile(
                  activeColor: const Color(0xFFFA812F),
                  title: const Text(
                    "Tandai sebagai Produk Unggulan",
                    style: TextStyle(color: Colors.white),
                  ),
                  value: _isFeatured,
                  onChanged: (bool value) {
                    setState(() => _isFeatured = value);
                  },
                ),
              ),

              // === Tombol Simpan ===
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFA812F),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: const Color(0xFF2A2A2A),
                              title: const Text(
                                'Produk berhasil tersimpan',
                                style: TextStyle(color: Color(0xFFFA812F)),
                              ),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Judul: $_title', style: const TextStyle(color: Colors.white)),
                                    Text('Deskripsi: $_content', style: const TextStyle(color: Colors.white)),
                                    Text('Harga: Rp ${_price.toStringAsFixed(0)}', style: const TextStyle(color: Colors.white)),
                                    Text('Kategori: $_category', style: const TextStyle(color: Colors.white)),
                                    Text('Thumbnail: $_thumbnail', style: const TextStyle(color: Colors.white)),
                                    Text(
                                      'Unggulan: ${_isFeatured ? "Ya" : "Tidak"}',
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK', style: TextStyle(color: Color(0xFFFA812F))),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    setState(() {
                                      _formKey.currentState!.reset();
                                      _category = "shoes";
                                      _isFeatured = false;
                                      _price = 0;
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text("Save"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
