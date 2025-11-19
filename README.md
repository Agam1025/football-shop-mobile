<details>
<Summary><b>Tugas 7</b></Summary>
1. Dalam Flutter, widget tree adalah struktur hierarki yang menggambarkan bagaimana widget-widget tersusun di dalam suatu tampilan aplikasi. Semua hal yang terlihat di layar—seperti teks, tombol, gambar, hingga tata letak—merupakan widget yang saling terhubung dalam bentuk pohon (tree). Hubungan antar widget disebut sebagai hubungan parent-child (induk-anak). Widget parent berfungsi sebagai wadah atau pengatur bagi widget child, misalnya mengatur posisi, ukuran, dan perilaku tampilannya. Sebaliknya, widget child berada di dalam parent dan mengikuti aturan tata letak yang diberikan oleh parent-nya. Misalnya, dalam kode Scaffold(body: Center(child: Text('Halo Flutter'))), widget Scaffold adalah parent dari Center, dan Center adalah parent dari Text. Struktur ini membentuk alur hierarki yang memungkinkan Flutter untuk menggambar antarmuka pengguna dengan efisien dan terstruktur.

2. 
1. Scaffold : Menyediakan struktur dasar halaman, termasuk AppBar, body, dan layout utama.
2. AppBar : Menampilkan bilah atas dengan judul aplikasi (“Football Shop”).
3. Text : Menampilkan teks seperti judul, nama, kelas, dan pesan pada SnackBar.
4. Padding : Memberikan jarak di sekitar widget agar tampilan lebih rapi.
5. Column : Menyusun widget secara vertikal (dari atas ke bawah).
6. Row : Menyusun beberapa widget secara horizontal (bersebelahan).
7. SizedBox : Memberikan jarak kosong vertikal/horizontal antar elemen.
8. Center : Menempatkan widget anak tepat di tengah halaman.
9. GridView.count : Menampilkan daftar item dalam bentuk grid dengan jumlah kolom tertentu (3 kolom di proyekmu).
10. Card : Menampilkan informasi (seperti NPM, nama, kelas) dalam tampilan bergaya kartu dengan bayangan.
11. Container : Mengatur ukuran, padding, dan tata letak dalam kartu dan item.
12. MediaQuery : Mengambil ukuran layar perangkat agar ukuran kartu menyesuaikan.
12. Icon : Menampilkan ikon pada setiap item (contohnya menu, person, library_books).
13. Material : Memberikan efek Material Design seperti bayangan dan animasi sentuhan.
14. InkWell : Memberikan efek gelombang (ripple effect) dan aksi saat widget ditekan.
15. SnackBar : Menampilkan pesan sementara di bagian bawah layar saat item ditekan.
16. ScaffoldMessenger : Menangani penampilan dan penghapusan SnackBar.
17. EdgeInsets : Mengatur padding/margin di sekitar widget.
18. BorderRadius : Membuat sudut melengkung pada Material.
19. MaterialApp : Root aplikasi berbasis Material Design; mengatur tema, navigasi, dan halaman awal.
20. ThemeData : Menentukan tampilan visual global (warna utama, sekunder, font, dsb).
21. ColorScheme : Mengatur kombinasi warna agar konsisten di seluruh aplikasi.
22. MyApp : Widget utama yang menjalankan aplikasi (turunan dari StatelessWidget).
23. MyHomePage : Halaman utama aplikasi yang ditampilkan pertama kali.

3. Widget MaterialApp berfungsi sebagai akar (root) dari aplikasi Flutter berbasis Material Design. Widget ini menyediakan berbagai pengaturan penting seperti tema warna (theme), judul aplikasi (title), sistem navigasi antarhalaman (routes dan Navigator), serta konfigurasi dasar lainnya. Dengan menggunakan MaterialApp, semua widget di dalamnya otomatis mewarisi gaya dan prinsip desain Material Design yang konsisten, seperti tampilan tombol, AppBar, dan animasi transisi. Karena itulah MaterialApp hampir selalu digunakan sebagai widget root dalam aplikasi Flutter — agar seluruh tampilan dan elemen di bawahnya memiliki gaya yang seragam serta dapat memanfaatkan fitur-fitur inti Flutter seperti navigasi dan pengaturan tema global.

4. Dalam Flutter, terdapat dua jenis widget utama yaitu StatelessWidget dan StatefulWidget. Perbedaan keduanya terletak pada kemampuan untuk menyimpan dan mengubah state (keadaan). StatelessWidget adalah widget yang bersifat statis — tampilannya tidak akan berubah selama aplikasi berjalan kecuali dilakukan rebuild dari luar. Contohnya adalah teks atau ikon yang hanya menampilkan informasi tetap. Sebaliknya, StatefulWidget adalah widget yang dapat berubah seiring waktu karena memiliki state yang bisa diperbarui, misalnya tampilan penghitung (counter), form input, atau daftar data yang bisa berubah.

Dalam proyek ini, dipilih StatelessWidget karena seluruh tampilan pada aplikasi Football Shop bersifat statis data seperti nama, NPM, dan daftar menu tidak berubah selama aplikasi berjalan. Tidak ada interaksi yang menyebabkan perubahan nilai variabel atau pembaruan tampilan yang dinamis, sehingga penggunaan StatefulWidget tidak diperlukan. Selain itu, StatelessWidget lebih ringan dan efisien karena tidak perlu mengelola state, sehingga cocok untuk halaman yang hanya menampilkan informasi tetap.

5. BuildContext adalah objek penting di Flutter yang merepresentasikan posisi sebuah widget di dalam widget tree. Setiap widget memiliki BuildContext sendiri yang digunakan untuk mengetahui lokasi dan hubungan hierarkisnya terhadap widget lain. Dengan BuildContext, Flutter dapat mengakses informasi tentang tema, ukuran layar, serta melakukan navigasi antarhalaman. Objek ini juga menjadi perantara agar widget dapat berinteraksi dengan widget di atasnya (seperti mengambil data dari Theme, Navigator, atau ScaffoldMessenger).

Dalam metode build(), BuildContext digunakan sebagai parameter utama karena setiap kali Flutter ingin menggambar ulang tampilan, ia memerlukan konteks posisi widget di dalam tree tersebut. Melalui konteks ini, widget dapat memanggil metode seperti Theme.of(context) untuk mengambil warna tema, atau Navigator.of(context) untuk berpindah halaman. Tanpa BuildContext, widget tidak akan tahu di mana posisinya di dalam struktur aplikasi dan tidak bisa mengakses elemen-elemen penting lain di sekitarnya.'

6. Hot reload di Flutter adalah fitur yang memungkinkan pengembang melihat hasil perubahan kode secara instan tanpa kehilangan state aplikasi yang sedang berjalan. Misalnya, ketika kamu mengubah teks, warna, atau tata letak widget, kamu bisa langsung melihat perubahannya di emulator atau perangkat tanpa memulai ulang aplikasi dari awal. Flutter melakukan ini dengan cara menyuntikkan ulang kode sumber yang telah diperbarui ke dalam Virtual Machine, lalu framework akan membangun ulang widget tree mulai dari titik perubahan. Fitur ini sangat membantu saat proses pengembangan karena mempercepat iterasi dan eksperimen desain.

Sementara itu, hot restart berbeda karena ia mengulang seluruh proses dari awal dan menghapus semua state yang tersimpan. Ketika kamu melakukan hot restart, aplikasi dimuat ulang sepenuhnya seperti baru dijalankan, sehingga variabel, data input, atau tampilan terakhir akan hilang dan kembali ke kondisi awal. Hot restart digunakan ketika ada perubahan besar yang memengaruhi struktur kode utama, seperti menambahkan variabel global atau mengubah fungsi inisialisasi. Jadi, secara singkat: hot reload mempertahankan state aplikasi, sedangkan hot restart mengatur ulang aplikasi sepenuhnya.
</details>

<details>
<Summary><b>Tugas 7</b></Summary>
1.
Navigator.push() digunakan untuk menambahkan halaman baru ke dalam stack navigasi tanpa menghapus halaman sebelumnya. Artinya, halaman lama tetap tersimpan di memori sehingga pengguna masih bisa kembali ke halaman tersebut menggunakan tombol back. Metode ini cocok digunakan ketika aplikasi memerlukan navigasi yang bersifat sementara, seperti berpindah dari halaman daftar produk ke halaman detail produk. Dengan cara ini, pengalaman pengguna menjadi lebih natural karena mereka dapat kembali ke halaman sebelumnya setelah selesai melihat detail produk.

Sementara itu, Navigator.pushReplacement() berfungsi untuk menggantikan halaman saat ini dengan halaman baru. Berbeda dengan push(), metode ini akan menghapus halaman lama dari stack navigasi, sehingga pengguna tidak dapat kembali ke halaman sebelumnya menggunakan tombol back. Fungsi ini berguna ketika transisi antarhalaman bersifat final atau tidak memerlukan opsi kembali. Misalnya, setelah pengguna menekan tombol logout atau berpindah ke halaman utama setelah menyelesaikan proses tertentu.

Dalam konteks aplikasi Football Shop, Navigator.push() sebaiknya digunakan untuk navigasi yang memungkinkan pengguna kembali, seperti ketika melihat detail produk atau mengedit produk tertentu. Sedangkan Navigator.pushReplacement() lebih tepat digunakan untuk navigasi utama seperti ketika berpindah dari menu Home ke Add Products melalui drawer. Dengan begitu, navigasi antarhalaman menjadi lebih efisien karena halaman yang tidak dibutuhkan tidak akan menumpuk di dalam stack.

2.
Dalam aplikasi Flutter, widget Scaffold berfungsi sebagai kerangka utama yang digunakan untuk membangun struktur dasar setiap halaman. Widget ini menyediakan tata letak standar yang konsisten di seluruh aplikasi, seperti area untuk AppBar, Drawer, Body, dan FloatingActionButton. Dengan menggunakan Scaffold, setiap halaman di aplikasi Football Shop dapat memiliki tampilan yang seragam dan mudah dikelola, karena semua elemen utama halaman didefinisikan dengan struktur yang sama.

Widget AppBar digunakan sebagai bagian atas halaman yang menampilkan judul dan kontrol navigasi seperti tombol kembali atau menu. Dalam aplikasi Football Shop, AppBar dimanfaatkan untuk menampilkan nama halaman, misalnya "Home" atau "Add Products", agar pengguna selalu tahu konteks halaman yang sedang dibuka. Selain itu, AppBar juga membantu menjaga konsistensi tampilan antarhalaman karena setiap halaman memiliki posisi dan gaya header yang sama.

Sementara itu, Drawer digunakan sebagai navigasi samping yang memungkinkan pengguna berpindah antarhalaman dengan mudah. Dalam aplikasi Football Shop, Drawer berisi daftar menu seperti Home dan Add Products yang menggunakan Navigator.pushReplacement() untuk berpindah halaman tanpa menumpuk stack. Dengan kombinasi Scaffold, AppBar, dan Drawer, aplikasi menjadi lebih terstruktur, konsisten, dan mudah digunakan di seluruh bagian halaman.

3.
Penggunaan layout widget seperti Padding, SingleChildScrollView, dan ListView memberikan kelebihan penting dalam desain antarmuka Flutter, terutama untuk menampilkan elemen-elemen form agar lebih rapi, responsif, dan mudah digunakan. Padding berfungsi memberikan jarak antar elemen agar tampilan tidak terlalu rapat dan lebih nyaman dilihat pengguna. SingleChildScrollView memungkinkan seluruh form bisa digulir ke bawah ketika elemen terlalu banyak atau layar perangkat kecil, sehingga tidak ada bagian form yang tertutup atau sulit diakses. Sementara itu, ListView berguna saat elemen-elemen input bersifat dinamis atau jumlahnya banyak, karena widget ini secara otomatis menangani scrolling dan efisiensi tampilan.

Dalam aplikasi Football Shop, Padding digunakan di setiap elemen input seperti TextFormField untuk memberikan jarak antar komponen form agar terlihat proporsional. Widget SingleChildScrollView membungkus seluruh form agar pengguna bisa menggulir ke bawah ketika mengisi banyak field, seperti nama produk, deskripsi, kategori, harga, dan URL thumbnail. Dengan kombinasi ini, form tetap mudah diisi, tidak terpotong, dan tampilannya konsisten di berbagai ukuran layar perangkat.

4.
Penyesuaian warna tema pada aplikasi ini masih mengikuti warna bawaan dari tutorial, yaitu menggunakan warna biru indigo sebagai warna utama. Warna ini dipilih karena memberikan kesan sporty, modern, dan profesional yang cocok dengan konsep toko perlengkapan sepak bola. Warna biru digunakan secara konsisten di elemen seperti AppBar, tombol (ElevatedButton), dan header pada Drawer agar tampilan tetap harmonis dan mudah dikenali oleh pengguna.

Namun, ke depannya warna tema ini akan disesuaikan lagi ketika ada tugas kreatif atau pengembangan lanjutan, agar bisa lebih mencerminkan identitas visual Football Shop secara unik. Misalnya, mengganti warna utama dengan kombinasi yang lebih khas atau menambahkan aksen warna sekunder untuk memperkuat karakter brand. Dengan begitu, aplikasi tidak hanya fungsional tetapi juga memiliki daya tarik visual yang lebih personal dan selaras dengan identitas toko.
</details>

<details>
<Summary><b>Tugas 7</b></Summary>
1.
Saat bekerja dengan API Django, data yang dikirim atau diterima berbentuk JSON. Di Flutter, data ini dapat langsung dipetakan sebagai Map<String, dynamic>, tetapi cara tersebut berisiko karena tidak ada jaminan struktur dan tipe datanya benar. Dengan membuat model Dart, kita mendefinisikan struktur data secara eksplisit: setiap field memiliki tipe yang jelas, wajib/tidaknya nilai diatur, dan kita bisa mengontrol proses parsing melalui fromJson dan toJson. Model Dart membuat aplikasi lebih aman terhadap error karena memanfaatkan null-safety, sehingga Flutter memberi peringatan jika ada field yang null pada data yang seharusnya tidak null. Tanpa model, kita bisa saja melakukan typo key JSON, salah tipe data, atau salah casting, dan semua itu baru ketahuan saat runtime—yang tentu jauh lebih sulit dilacak. Oleh karena itu, model memberikan validasi tipe, keamanan null-safety, dan meningkatkan maintainability karena kode menjadi lebih terstruktur dan mudah dipahami.

2.
Package http digunakan untuk melakukan request HTTP biasa seperti GET atau POST tanpa membawa informasi sesi pengguna. Dengan package ini, aplikasi Flutter hanya mengirimkan data ke server tanpa menyimpan cookie atau status login. Sebaliknya, CookieRequest dari package pbp_django_auth digunakan ketika aplikasi membutuhkan mekanisme autentikasi berbasis session seperti yang dilakukan Django. CookieRequest menyimpan dan mengirim cookie secara otomatis pada setiap request sehingga server dapat mengenali pengguna yang sedang login. Dengan kata lain, http cocok untuk request umum (misalnya fetch JSON publik), sedangkan CookieRequest diperlukan untuk endpoint Django yang membutuhkan login, seperti membuat produk atau mengambil data milik user tertentu.

3.
Autentikasi Django menggunakan session berbasis cookie. Artinya, ketika pengguna berhasil login, Django memberikan cookie session yang perlu dikirim pada setiap request berikutnya agar server mengenali pengguna tersebut. Jika tiap widget di Flutter membuat instance CookieRequest baru, maka cookie tidak akan tersimpan, menyebabkan aplikasi "lupa" bahwa pengguna sudah login. Dengan berbagi satu instance CookieRequest menggunakan Provider, seluruh widget dalam aplikasi bisa mengakses informasi autentikasi yang sama—mulai dari status login, data pengguna, hingga cookie session. Hal ini membuat aplikasi konsisten dan mencegah pengguna tiba-tiba logout atau gagal mengakses endpoint tertentu.

4.
Agar Flutter dapat terhubung dengan Django, beberapa konfigurasi perlu dilakukan. Pada Android emulator, alamat localhost merujuk ke perangkat emulator itu sendiri, bukan komputer host. Karena itu, Flutter perlu mengakses Django melalui alamat khusus 10.0.2.2, yang dipetakan ke localhost komputer. Alamat ini harus ditambahkan ke ALLOWED_HOSTS agar Django mengizinkan koneksi dari Flutter. Selain itu, karena Flutter berjalan sebagai aplikasi eksternal, Django harus mengaktifkan CORS dan mengatur cookie SameSite=None; Secure agar browser/client luar dapat menerima dan mengirim cookie session. Tanpa pengaturan cookie ini, proses login tidak akan menyimpan session dan pengguna dianggap terus-menerus logout. Android juga membutuhkan izin internet pada AndroidManifest.xml; jika tidak, aplikasi akan gagal melakukan request ke server. Kesalahan konfigurasi akan menyebabkan request gagal, login tidak tersimpan, atau API sama sekali tidak dapat diakses.

5.
Ketika pengguna mengetik data pada form Flutter, data tersebut dikumpulkan dari controller (misalnya TextEditingController) dan dikirim ke Django melalui request POST (menggunakan http atau CookieRequest). Django menerima data tersebut melalui view, memvalidasinya, menyimpannya ke database, lalu mengembalikan respons JSON. Flutter menerima respons ini, kemudian memparsingnya menjadi model Dart dan menyimpannya dalam state. Setelah state berubah, Flutter otomatis melakukan rebuild UI dan menampilkan data baru pada layar. Dengan alur ini, Flutter dapat menampilkan data yang diambil dari Django secara real-time dan konsisten.

6.
Autentikasi dimulai ketika pengguna mengisi username dan password di Flutter. Flutter mengirim data ini ke endpoint Django (/login/) menggunakan CookieRequest. Django memvalidasi kredensial; jika benar, Django membuat session dan mengirimkan cookie session kembali ke Flutter. Cookie ini disimpan oleh CookieRequest, sehingga request selanjutnya bersifat autentikasi. Setelah login berhasil, Flutter menavigasi pengguna ke halaman utama. Proses register mirip: Flutter mengirim data ke endpoint Django /register/, Django membuat akun baru, lalu pengguna bisa login menggunakan kredensial tersebut. Logout dilakukan dengan memanggil endpoint /logout/, Django menghapus session di server, dan CookieRequest menghapus cookie yang disimpan. Setelah itu, Flutter kembali ke halaman login karena pengguna tidak memiliki session aktif lagi.

7.
Untuk mengimplementasikan seluruh checklist, saya mengerjakannya secara bertahap dari sisi backend (Django) hingga frontend (Flutter). Langkah pertama yang saya lakukan adalah memastikan proyek Django yang sudah saya buat sebelumnya dapat di-deploy dan berjalan dengan baik. Saya menjalankan server menggunakan virtual environment, melakukan migrasi, kemudian mengkonfigurasi ALLOWED_HOSTS agar mencakup localhost, 127.0.0.1, dan 10.0.2.2 sehingga dapat diakses oleh Flutter, khususnya ketika memakai Android emulator. Selain itu, saya menambahkan konfigurasi CORS serta pengaturan cookie seperti CORS_ALLOW_CREDENTIALS, SESSION_COOKIE_SAMESITE, dan CSRF_COOKIE_SAMESITE agar Django dapat menerima dan mengirim cookie sesi ke Flutter tanpa ditolak oleh browser/mobile engine. Setelah server berjalan, saya memastikan endpoint JSON (/json/) dapat dibuka melalui browser sebagai bukti bahwa backend siap untuk diintegrasikan.

Tahap berikutnya adalah mengimplementasikan sistem autentikasi, yaitu fitur registrasi dan login pada Django. Saya membuat view untuk register dan login yang mengembalikan respons JSON dan mengatur agar Django mengirim session cookie ketika login berhasil. Setelah itu, saya beralih ke Flutter dan mulai membangun halaman register. Pada halaman ini, saya membuat form untuk mengambil input username dan password, lalu mengirimkannya ke endpoint register Django menggunakan CookieRequest. Halaman login juga dibuat dengan mekanisme serupa, tetapi kali ini saya menggunakan fungsi request.login() agar session cookie otomatis tersimpan di instance CookieRequest setelah login berhasil. Setelah autentikasi berhasil, aplikasi Flutter langsung menavigasi pengguna ke menu utama.

Agar frontend dan backend dapat berkomunikasi dengan baik, saya membagikan satu instance CookieRequest ke seluruh aplikasi menggunakan Provider. Dengan cara ini, login state dan session cookie dapat diakses dari halaman mana pun, termasuk halaman daftar item dan halaman tambah item. Tanpa sharing instance seperti ini, Flutter akan kehilangan cookie yang dikirim Django sehingga pengguna harus login berulang kali.

Setelah autentikasi selesai, saya membuat model Dart yang sesuai dengan struktur JSON dari Django. Model ini mencakup field seperti name, price, description, thumbnail, category, is_featured, dan user_id. Model Dart diperlukan agar data yang dikirim Django dapat di-parse dengan aman, memiliki tipe yang jelas, dan mudah digunakan di seluruh aplikasi. Tanpa model Dart, saya akan berurusan dengan Map<String, dynamic> yang rentan error tipe, sulit ditelusuri, dan tidak aman terhadap null-safety.

Langkah selanjutnya adalah membuat halaman daftar item di Flutter. Pada halaman ini, saya melakukan fetch data dari endpoint JSON Django menggunakan request.get(), lalu memetakan hasilnya menjadi list objek model Dart. Data tersebut kemudian saya tampilkan dalam bentuk card yang berisi nama produk, harga, deskripsi singkat, thumbnail, kategori, serta status featured. Setelah daftar item berhasil ditampilkan, saya menambahkan halaman detail item yang terbuka ketika salah satu card ditekan. Pada halaman detail, seluruh atribut item ditampilkan dan saya menambahkan tombol atau fitur navigasi untuk kembali ke halaman daftar item.

Checklist terakhir yang saya implementasikan adalah fitur filtering item berdasarkan pengguna yang sedang login. Untuk melakukannya, saya memastikan bahwa endpoint JSON Django mengirim field user_id untuk setiap item. Setelah itu, saya memanfaatkan instance CookieRequest yang sudah memiliki informasi pengguna login, lalu saya melakukan penyaringan data di sisi Flutter sehingga hanya item yang dimiliki oleh user tersebut yang ditampilkan. Dengan demikian, daftar item menjadi personal dan sesuai dengan akun yang sedang login.
</details>
