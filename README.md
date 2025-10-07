### $_$ - Post Test 5 PBO - $_$
--------------------------------------------------------------------------------------------

#### Disusun oleh:

Nama: Zahraturramadhani

NIM: 2409116014

Kelas: Sistem Informasi A'2024

--------------------------------------------------------------------------------------------

<h2 align="center">💵💸💹 Manajemen Catatan Keuangan Harian (Budget Tracker) 💰🪙💴 </h2> 

<h2 align="center">=================================================</h2> 
<h1 align="center">🛡️ POCKET GUARD 🛡️</h1>
<h2 align="center">=================================================</h2> 

### ~ 📗 Deskripsi Singkat 📒  ~

Program ini dibuat untuk membantu mencatat dan mengelola catatan keuangan harian. Aplikasinya bernama Pocket Guard, aplikasi Java sederhana berbasis console.

Di dalam program, setiap catatan keuangan dapat diisi lengkap dengan tanggal, keterangan singkat, jenis catatan (pemasukan atau pengeluaran), kategori (gaji, makan, transportasi, hiburan, belanja, tabungan,tagihan), metode pembayaran (cash, e-wallet, atau transfer), serta jumlah uang yang dikeluarkan atau diterima.

Aplikasi ini bisa menambah catatan baru, melihat seluruh daftar catatan, mengubah jika ada kekeliruan, atau menghapus catatan yang tidak diperlukan. Program juga dapat menampilkan ringkasan saldo (total pemasukan, total pengeluaran, dan selisihnya) sehingga kondisi keuangan mudah dipantau.

Tersedia pula fitur filter catatan berdasarkan jenis, kategori, dan metode pembayaran, serta fitur search berdasarkan keterangan catatan. Selain itu, batas pengeluaran bulanan dapat ditetapkan, bila pengeluaran melewati batas, program akan menampilkan peringatan agar pengelolaan uang lebih terkendali.

Secara keseluruhan, Pocket Guard membantu melacak arus kas harian, menjaga keseimbangan keuangan, dan membiasakan pencatatan keuangan secara teratur.

### ~ 📌 Penjelasan Program 📌 ~

1. Penjelasan class yang ada di program "Pocket Guard"
   
   a. Class App.Java yang terdapat di Package main
   
      <img width="331" height="44" alt="image" src="https://github.com/user-attachments/assets/9c8671df-aa36-41fe-9192-2b3d77087926" />

      <img width="647" height="930" alt="image" src="https://github.com/user-attachments/assets/a0d97ec1-65e8-471f-889e-22c9270a21be" />
      
      >App.java berperan sebagai pintu masuk program dan berada di paket com.mycompany.posttest4pbo.main. Saat dijalankan, method main membuat objek TransaksiService lalu memanggil seed untuk mengisi data contoh sehingga setiap menu bisa langsung dicoba tanpa harus mengetik data dari awal. Setelah inisialisasi selesai, layar konsol menampilkan judul aplikasi diikuti daftar pilihan yang rapi. Seluruh interaksi dibaca dari keyboard dan nilai yang masuk diproses satu per satu agar alur tetap terkendali.
      >
      >Pengambilan angka menu ditangani oleh SafeInput.safeNextInt. Kelas kecil ini membungkus Scanner dan akan terus meminta masukan sampai terbaca bilangan yang sah. Cara ini efektif mencegah NumberFormatException dan menjaga aplikasi tetap stabil meskipun terjadi salah ketik atau spasi berlebih. Nilai yang sudah valid diteruskan ke blok switch. Setiap nomor menu langsung dipetakan ke metode pada TransaksiService. Pilihan tambah catatan membuka proses pengisian transaksi baru. Pilihan lihat menampilkan tabel seluruh catatan. Pilihan ubah mengarahkan ke proses pemilihan ID lalu mengganti atribut yang diinginkan. Pilihan hapus menyiapkan konfirmasi sebelum data benar benar dihapus. Pilihan ringkasan menghitung pemasukan, pengeluaran, dan saldo. Pilihan filter membawa ke sub menu untuk penyaringan berdasarkan jenis, kategori, metode pembayaran, serta pencarian keterangan. Pilihan set batas pengeluaran menyimpan angka plafon bulanan dan memunculkan peringatan bila akumulasi pengeluaran melewati batas.
      >
      >Perulangan disusun dengan pola do while sehingga menu selalu kembali muncul setelah satu aksi selesai. Program hanya berhenti ketika opsi keluar dipilih. Jika angka yang dimasukkan di luar rentang, blok default pada switch menampilkan pesan bahwa pilihan tidak valid lalu alur dikembalikan ke menu utama tanpa menghentikan proses. Di bagian penutup, App.java menampilkan ucapan terima kasih dan mengakhiri eksekusi dengan rapi.
      >
      >Peran App.java sengaja dibuat ringan. Seluruh perhitungan dan aturan bisnis ditempatkan di TransaksiService, sedangkan App.java fokus pada pengendalian alur, tampilan menu, dan validasi input dasar. Pemisahan ini membuat kode mudah dibaca serta mudah dirawat. Penambahan fitur baru cukup dilakukan di lapisan service tanpa mengubah struktur App.java. Desain seperti ini juga memudahkan pengujian karena logika inti terkumpul pada satu tempat. Alur kerjanya jelas sejak awal hingga akhir: program dibuat, service diinisialisasi, data contoh diisi, menu muncul, sebuah pilihan diproses, hasilnya ditampilkan, lalu kontrol kembali ke menu sampai akhirnya dipilih keluar.

   b. Class Transaksi.Java yang terdapat di Package model

      <img width="332" height="115" alt="image" src="https://github.com/user-attachments/assets/19888393-0825-4799-b009-dc5324e0b25a" />

      <img width="781" height="771" alt="image" src="https://github.com/user-attachments/assets/b4bc8454-f038-40b5-8c45-622a7650584c" />
      
      >Transaksi adalah kelas induk abstrak untuk seluruh jenis transaksi di aplikasi dan berada di paket com.mycompany.posttest4pbo.model. Kelas ini sekaligus mengimplementasikan interface SaldoEffect sehingga setiap objek turunan mewarisi kontrak perhitungan efek terhadap saldo. Objek Transaksi tidak pernah dibuat langsung. Yang digunakan adalah kelas turunan seperti Pemasukan dan Pengeluaran yang mewarisi struktur dan perilaku dasar dari kelas ini.
      >
      >Seluruh atribut inti disimpan sebagai private untuk menerapkan enkapsulasi. Atribut yang dimaksud mencakup id, tanggal, keterangan, jenis, kategori, metodePembayaran, dan jumlah. Akses terhadap nilai dilakukan melalui getter dan setter agar perubahan data tetap terkendali. Konstruktor Transaksi menerima seluruh parameter tersebut lalu menginisialisasi nilai sejak awal pembuatan objek sehingga data transaksi selalu lengkap dan konsisten ketika diproses lebih lanjut.
      >
      >Di dalam kelas ini terdapat method abstrak tandaSaldo yang berfungsi sebagai penentu arah saldo. Setiap subclass wajib memberikan implementasi yang sesuai. Pemasukan mengembalikan nilai satu sebagai penanda penambahan saldo, sedangkan Pengeluaran mengembalikan nilai minus satu sebagai penanda pengurangan saldo. Implementasi kontrak dari interface SaldoEffect disediakan langsung di kelas Transaksi melalui method efekSaldo. Perhitungan dilakukan dengan mengalikan hasil tandaSaldo dengan jumlah sehingga efek saldo yang dihasilkan sudah bertanda positif atau negatif sesuai jenis transaksi.
      >
      >Rancangan seperti ini memberikan beberapa dampak penting pada lapisan service. Ringkasan saldo dapat dihitung dengan cara menjumlahkan pemanggilan efekSaldo pada seluruh elemen daftar tanpa perlu membuat percabangan untuk membedakan pemasukan dan pengeluaran. Perilaku positif atau negatif telah terenkapsulasi di masing masing subclass. Penambahan jenis transaksi baru juga menjadi lebih mudah. Cukup menurunkan kelas dari Transaksi lalu mengisi tandaSaldo sesuai aturan yang diinginkan dan seluruh mekanisme perhitungan saldo tetap berjalan tanpa perubahan di tempat lain.
      >
      >Dengan demikian, Transaksi berfungsi ganda sebagai basis pewarisan dan sebagai wadah data yang terenkapsulasi. Struktur program menjadi rapi, aturan perhitungan saldo terkonsolidasi di satu tempat, dan kode mudah dipelihara karena tanggung jawab dipisahkan dengan jelas antara kelas induk dan kelas turunannya.

   c. Class Pemasukan.Java yang terdapat di Package model

      <img width="332" height="115" alt="image" src="https://github.com/user-attachments/assets/0b43dcb2-197d-444c-b043-c153776644bd" />

      <img width="928" height="435" alt="image" src="https://github.com/user-attachments/assets/6c3b0274-7885-41ef-a9c7-46c53a83c96d" />
      
      >Kelas Pemasukan berada di package model sebagai turunan dari Transaksi dan merepresentasikan transaksi berjenis pemasukan. Konstruktor langsung mengunci nilai jenis menjadi Pemasukan sekaligus meneruskan atribut lain ke kelas induk agar data tersusun lengkap sejak objek dibuat. Di dalamnya dilakukan overriding pada getJenis yang selalu mengembalikan teks Pemasukan, sedangkan setJenis dioverride menjadi tidak melakukan perubahan apa pun supaya identitas jenis tidak bisa diganti saat proses edit. Method abstrak tandaSaldo juga diisi dengan nilai positif satu yang menandakan efek penambahan terhadap saldo. Dengan susunan ini setiap objek Pemasukan tetap konsisten sebagai transaksi pemasukan dan otomatis dihitung bernilai positif ketika ringkasan saldo memanggil efekSaldo secara polimorfik.
      
   d. Class Pengeluaran.Java yang terdapat di Package model

      <img width="332" height="115" alt="image" src="https://github.com/user-attachments/assets/a878740f-0cc3-4502-85d2-96bcd4401439" />

      <img width="956" height="429" alt="image" src="https://github.com/user-attachments/assets/52b6c02a-56a4-48d9-8930-02d4b03812c1" />
      
      >Kelas Pengeluaran berada di package model sebagai turunan dari Transaksi dan merepresentasikan transaksi berjenis pengeluaran. Konstruktor langsung mengunci nilai jenis menjadi Pengeluaran sekaligus meneruskan atribut lain ke kelas induk agar data objek lengkap sejak awal. Di kelas ini, getJenis dioverride untuk selalu mengembalikan teks Pengeluaran, sementara setJenis dioverride menjadi tidak melakukan perubahan apa pun sehingga identitas jenis tidak bisa diubah ketika proses edit data berlangsung. Method abstrak tandaSaldo juga diisi dengan nilai minus satu sebagai penanda bahwa transaksi ini mengurangi saldo.
      >
      >Dengan rancangan tersebut, setiap objek Pengeluaran konsisten sebagai transaksi pengeluaran dan otomatis berkontribusi negatif saat perhitungan ringkasan saldo melalui pemanggilan polimorfik efekSaldo. Pemisahan yang jelas antara Pemasukan dan Pengeluaran membuat perilaku tiap jenis transaksi tegas tanpa perlu percabangan tambahan di lapisan service, sehingga kode tetap rapi dan mudah dipelihara.

   e. Class SaldoEffect.Java yang terdapat di Package model

      <img width="354" height="114" alt="image" src="https://github.com/user-attachments/assets/b7fc5f3b-cea6-4946-b841-509664cb0aef" />
      
      <img width="1298" height="201" alt="image" src="https://github.com/user-attachments/assets/3a1cf38e-8ad3-4dc3-90e3-c61a00a9e066" />
      
      >SaldoEffect.java berisi sebuah interface bernama SaldoEffect yang menetapkan satu kontrak yaitu method efekSaldo yang mengembalikan nilai bertipe double. Nilai yang dikembalikan bersifat bertanda. Pemasukan menghasilkan nilai positif, sedangkan pengeluaran menghasilkan nilai negatif. Dengan begitu kontrak ini merepresentasikan pengaruh langsung sebuah transaksi terhadap saldo.
      >
      >Kontrak tersebut diimplementasikan oleh kelas abstrak Transaksi. Perhitungannya ditulis langsung di Transaksi melalui rumus efekSaldo sama dengan tandaSaldo dikali jumlah. Penentuan tanda tidak diputuskan di kelas induk melainkan diserahkan ke kelas turunan melalui method abstrak tandaSaldo. Kelas Pemasukan mengembalikan nilai satu, sedangkan kelas Pengeluaran mengembalikan nilai minus satu.
      >
      >Pendekatan ini menyederhanakan proses perhitungan ringkasan di TransaksiService. Daftar transaksi cukup dijumlahkan melalui pemanggilan efekSaldo pada tiap elemen dan hasilnya sudah benar tanpa perlu percabangan. Interface SaldoEffect memisahkan definisi apa yang harus tersedia dari cara mengerjakannya sehingga struktur kode rapi, mudah dirawat, dan siap diperluas bila kelak ditambahkan jenis transaksi lain.
      
   f. Class TransaksiService.Java yang terdapat di Package service

     <img width="343" height="52" alt="image" src="https://github.com/user-attachments/assets/137a271d-7e35-4e0e-b586-ce8c51ef3573" />

     <img width="740" height="938" alt="image" src="https://github.com/user-attachments/assets/38009052-5b64-4e21-8830-86af1f8a8868" />
     
     >TransaksiService berada pada lapisan service dan memegang seluruh logika bisnis aplikasi. Di dalamnya tersimpan koleksi List<Transaksi> yang menampung objek Pemasukan dan Pengeluaran serta disediakan method seed untuk mengisi data awal. Kelas ini menyediakan operasi inti yang lengkap seperti menambah catatan baru, menampilkan seluruh catatan dalam bentuk tabel, mengubah catatan berdasarkan ID, menghapus catatan dengan konfirmasi, menampilkan ringkasan saldo, dan menyetel batas pengeluaran bulanan. Saat menghitung ringkasan, perhitungan memanfaatkan polimorfisme melalui pemanggilan efekSaldo pada setiap elemen daftar sehingga Pemasukan otomatis bernilai positif dan Pengeluaran otomatis bernilai negatif. Dengan cara ini perhitungan selesai tanpa percabangan tambahan.
     >
     >Antarmuka konsol dibuat rapi dengan beberapa utilitas tampilan seperti header judul dan pemformat angka rupiah. Supaya input aman, tersedia rangkaian helper yang menangani validasi. Method inputWajib memastikan kolom tidak kosong. Method inputTanggalWajib memeriksa format tanggal menggunakan regex agar sesuai standar tahun bulan hari. Method inputPilihanWajib membatasi nilai hanya pada opsi yang diizinkan. Method inputDoubleWajib dan inputDoubleNonNegatif memverifikasi angka agar tidak terjadi kesalahan dan tidak bernilai negatif. Untuk proses ubah, tersedia versi opsional yaitu inputStringOpsional dan inputDoubleOpsional yang mengizinkan menekan Enter untuk mempertahankan nilai lama. Pembacaan angka menu ditangani safeNextInt sehingga salah ketik tidak menimbulkan NumberFormatException. Pencarian entitas dilakukan melalui findById, sedangkan garis dan formatRupiah membantu saat mencetak tabel transaksi.
     >
     >Menu filter dan pencarian ditempatkan dalam satu tempat sehingga mudah dijangkau. Data dapat disaring berdasarkan jenis, kategori, atau metode pembayaran, dan tersedia pencarian teks pada kolom keterangan. Jika total pengeluaran melebihi batas yang disetel, layanan menampilkan peringatan sehingga kondisi anggaran terlihat jelas. Sebagai sentuhan OOP tambahan, method tampilkanTabel dibuat dalam dua versi yang memiliki nama sama. Satu versi tanpa parameter untuk menampilkan seluruh daftar, sedangkan versi lain menerima List<Transaksi> untuk menampilkan hasil filter atau pencarian. Inilah bentuk overloading yang sederhana namun efektif karena menghindari duplikasi logika cetak.
     >
     >Secara keseluruhan, TransaksiService menjadi penghubung utama antara kelas App yang menampilkan menu dengan struktur data pada paket model. Validasi berjalan konsisten, keluaran tabel rapi, serta aturan bisnis tersentral sehingga kode mudah dipelihara dan siap diperluas ketika diperlukan.

   g. Class DB.Java yang terdapat di Packages jdbc

      <img width="325" height="68" alt="image" src="https://github.com/user-attachments/assets/664ce0bc-7d12-4dac-8058-a4308c6df2f3" />

      <img width="1126" height="420" alt="image" src="https://github.com/user-attachments/assets/67a825a7-68b6-4691-8425-89bf8b32b201" />

      >
      
   h. Class ShowTransaksiStatement.Java yang terdapat di Package jdbc

      <img width="327" height="67" alt="image" src="https://github.com/user-attachments/assets/0642b55f-a381-4dc1-832e-f8a777c32701" />

      <img width="1357" height="808" alt="image" src="https://github.com/user-attachments/assets/2f4cd5f9-ec9f-4b7b-82e5-13c8c189cf48" />

      >

   i. Class TransaksiEntity.Java yang terdapat di Package orm.entity

      <img width="359" height="38" alt="image" src="https://github.com/user-attachments/assets/cd6b6a9e-d595-46f3-be06-745e3f213b55" />

      <img width="754" height="874" alt="image" src="https://github.com/user-attachments/assets/0eae36ac-1d43-4801-aaf2-5b8906453235" />

      >

   j. Class TransaksiRepository.Java yang terdapat di Package orm.repo

      <img width="334" height="44" alt="image" src="https://github.com/user-attachments/assets/ea74326b-ce81-4a17-9cf1-74c94366126b" />

      <img width="792" height="861" alt="image" src="https://github.com/user-attachments/assets/dfb85724-8b13-429d-a59f-bcb39e8de307" />

      >

   k. Class HibernateUtil yang terdapat di Package orm1

      <img width="324" height="44" alt="image" src="https://github.com/user-attachments/assets/69480e86-69c7-48aa-aa69-da90e7d9648e" />

      <img width="1024" height="813" alt="image" src="https://github.com/user-attachments/assets/bbc8f311-747f-4c7e-bfc1-51b1e1ce8bf4" />

      >
      
2. Penjelasan packages yang ada di program "Pocket Guard"
   
   - Packages Main
     
     <img width="315" height="25" alt="image" src="https://github.com/user-attachments/assets/43507736-f43d-471e-a16c-bafc7755910c" />
    
     >Package ini memuat kelas utama App.java sebagai titik masuk aplikasi. Saat program dijalankan, method main menampilkan menu Pocket Guard, membaca input dari keyboard melalui utilitas SafeInput, kemudian mendelegasikan setiap pilihan ke TransaksiService untuk diproses. Di paket yang sama, SafeInput menjaga validasi angka sehingga alur tetap stabil meskipun terjadi salah ketik. Fokus paket main adalah antarmuka konsol dan pengendalian alur eksekusi, sementara seluruh aturan dan perhitungan bisnis ditempatkan di paket service agar tanggung jawab terpisah dengan jelas dan kode lebih mudah dirawat.
     
    - Packages Model 

      <img width="335" height="27" alt="image" src="https://github.com/user-attachments/assets/12b5e9c2-8d4e-4ff8-a3b6-40c13c8e86eb" />

      >Package ini menampung struktur dan aturan data transaksi. Di dalamnya terdapat kelas induk abstrak Transaksi yang menyimpan atribut inti berupa id, tanggal, keterangan, jenis, kategori, metodePembayaran, dan jumlah. Seluruh atribut bersifat privat dengan akses melalui getter dan setter untuk menjaga enkapsulasi. Kelas Transaksi juga mengimplementasikan kontrak interface SaldoEffect dan menyediakan perhitungan efek saldo lewat method efekSaldo yang bergantung pada tandaSaldo.
      >
      >Dua turunan konkret yaitu Pemasukan dan Pengeluaran mewarisi struktur tersebut lalu melakukan overriding agar konsistensi jenis transaksi terjaga. Method getJenis selalu mengembalikan nilai tetap sesuai kelas. Method setJenis dibuat tidak mengubah apa pun agar identitas jenis tidak bisa diganti. Method tandaSaldo mengembalikan nilai positif satu pada Pemasukan dan nilai minus satu pada Pengeluaran. Dengan susunan seperti ini, data transaksi rapi dan aman oleh enkapsulasi, siap dipakai secara polimorfik oleh lapisan service tanpa perlu percabangan tambahan. Desainnya juga mudah diperluas apabila kelak ditambahkan jenis transaksi yang baru.

    - Packages Service
      
        <img width="325" height="24" alt="image" src="https://github.com/user-attachments/assets/3c91dc17-f660-4ca6-a227-b79b1e16f29b" />
        
        >Package ini memuat logika bisnis aplikasi melalui kelas TransaksiService. Di dalamnya tersimpan daftar Transaksi berupa objek Pemasukan dan Pengeluaran serta method seed untuk menyiapkan data awal. TransaksiService menyediakan operasi inti seperti menambah data, menampilkan dalam tabel, mengubah berdasarkan ID, menghapus dengan konfirmasi, menampilkan ringkasan saldo melalui pemanggilan polimorfik efekSaldo, dan menyetel batas pengeluaran bulanan lengkap dengan peringatannya. Menu bantu mencakup filter per jenis, kategori, dan metode pembayaran, serta pencarian teks pada kolom keterangan.
        >
        >Agar interaksi konsol tertata, disertakan berbagai helper untuk validasi input, format rupiah, serta tampilan header. Paket service berperan sebagai penghubung antara antarmuka konsol di App dan struktur data pada paket model, sehingga pemisahan tanggung jawab terasa jelas dan keseluruhan kode lebih mudah dikelola.

3. Penjelasan encapsulation (getter dan setter)
   
   <img width="1077" height="341" alt="image" src="https://github.com/user-attachments/assets/85f7d6c2-6608-4782-8b76-593537d4647a" />

   > Pada program Pocket Guard, konsep encapsulation diterapkan dengan cara menjadikan seluruh atribut di kelas Transaksi bersifat private. Dengan begitu, data seperti id, tanggal, keterangan, jenis, kategori, metode pembayaran, dan jumlah tidak dapat diakses maupun diubah secara langsung dari luar kelas. Untuk memberikan akses yang aman, setiap atribut memiliki getter dan setter yang bersifat public. Getter digunakan untuk membaca nilai atribut, sedangkan setter dipakai untuk memperbarui nilai atribut. Pola ini memastikan bahwa perubahan data selalu melalui metode resmi yang sudah disediakan, sehingga integritas data tetap terjaga dan program lebih terkontrol.
   >
   > Selain itu, encapsulation juga memudahkan pengembangan di masa depan. Jika diperlukan logika tambahan, misalnya validasi nilai sebelum disimpan, hal tersebut dapat ditambahkan langsung di dalam setter tanpa perlu mengubah kode di bagian lain. Dengan demikian, encapsulation tidak hanya berfungsi melindungi data, tetapi juga membuat program lebih rapi, terstruktur, serta sejalan dengan prinsip dasar Object Oriented Programming (OOP).

4. Penjelasan inheritance (minimal memiliki 1 superclass dengan 2 subclass)

   Pada program ini, konsep inheritance diterapkan dengan menjadikan kelas Transaksi.java sebagai superclass, sedangkan kelas Pemasukan.java dan Pengeluaran.java sebagai subclass.
   
   a. Transaksi.Java (Super Class)

      <img width="165" height="28" alt="image" src="https://github.com/user-attachments/assets/65a8e0d8-7772-4bda-9d2f-a5c31a38b24e" />
      
      >Transaksi adalah kelas induk abstrak pada paket com.mycompany.posttest4pbo.model. Kelas ini menampung seluruh atribut inti sebuah transaksi id, tanggal, keterangan, jenis, kategori, metodePembayaran, dan jumlah yang disimpan privat dan diakses melalui getter serta setter untuk menjaga enkapsulasi. Transaksi juga mengimplementasikan interface SaldoEffect dengan menghadirkan perhitungan efekSaldo berbasis tandaSaldo. Method tandaSaldo dideklarasikan abstrak sehingga detail tanda diserahkan ke kelas turunan. Pemasukan mengembalikan nilai positif satu, sedangkan Pengeluaran mengembalikan nilai minus satu, dan nilai tersebut dikalikan dengan jumlah oleh efekSaldo. Dengan rancangan ini, setiap turunan mewarisi struktur data yang rapi sekaligus perilaku perhitungan saldo yang konsisten, sementara lapisan service dapat menjumlahkan efekSaldo dari daftar transaksi tanpa perlu percabangan tambahan.
      
   b. Pemasukan.Java (Sub Class)

      <img width="163" height="25" alt="image" src="https://github.com/user-attachments/assets/aef230ae-91aa-4fb0-b9ea-d50d1e10bda1" />
      
      >Pemasukan adalah turunan dari kelas Transaksi. Konstruktor langsung mengunci nilai jenis menjadi Pemasukan dan meneruskan atribut lain ke induknya. Di dalamnya terdapat overriding yang menjaga konsistensi data. Method getJenis selalu mengembalikan teks Pemasukan, sedangkan setJenis dibuat tidak melakukan perubahan apa pun agar identitas jenis tidak bisa diganti saat proses edit. Method tandaSaldo diisi dengan nilai positif satu sehingga efekSaldo yang dihitung di kelas induk selalu bernilai positif. Dengan susunan ini setiap objek Pemasukan tetap konsisten sebagai transaksi pemasukan dan otomatis dihitung sebagai penambah saldo ketika ringkasan dibuat di layer service.

   c. Pengeluaran.Java (Sub Class)

      <img width="173" height="23" alt="image" src="https://github.com/user-attachments/assets/ae5e320b-b41b-43a5-beef-a50a880da778" />

      > Pengeluaran adalah turunan dari kelas Transaksi. Konstruktor langsung mengunci nilai jenis menjadi Pengeluaran dan meneruskan atribut lain ke induknya agar data objek lengkap sejak awal. Di dalam kelas ini dilakukan overriding untuk menjaga konsistensi, yaitu getJenis selalu mengembalikan teks Pengeluaran, sedangkan setJenis dibuat tidak melakukan perubahan apa pun sehingga identitas jenis tidak bisa diganti saat proses ubah data. Method abstrak tandaSaldo diisi dengan nilai minus satu, yang menandakan transaksi ini mengurangi saldo. Dengan susunan tersebut, setiap objek Pengeluaran otomatis berkontribusi negatif ketika ringkasan saldo dihitung melalui pemanggilan polimorfik efekSaldo, dan lapisan service tidak perlu menambahkan percabangan khusus untuk membedakan arah saldonya.
      
   Melalui penerapan inheritance ini, program dapat memanfaatkan satu struktur induk yang umum (Transaksi) sekaligus mengelompokkan transaksi ke dalam subclass khusus (Pemasukan dan Pengeluaran).

5. Penjelasan Overriding

   Pada program Pocket Guard, konsep overriding diterapkan di dalam subclass Pemasukan.java dan Pengeluaran.java. Overriding berarti sebuah subclass mendefinisikan ulang method yang sudah ada di superclass dengan perilaku yang lebih spesifik sesuai kebutuhan.

   a. Class Pemasukan.Java

      <img width="405" height="233" alt="image" src="https://github.com/user-attachments/assets/a0aedc93-9373-46d3-b114-9cc94d765e18" />

      >Pada kelas Pemasukan.java, method getJenis() dioverride agar selalu mengembalikan nilai string “Pemasukan”. Dengan demikian, setiap kali objek Pemasukan dipanggil untuk mengetahui jenis transaksinya, hasilnya akan konsisten dan tidak dapat berubah. Selain itu, method setJenis(String jenis) juga dioverride namun dibuat kosong, sehingga meskipun mencoba mengubah jenis transaksi, nilainya tidak akan berubah. Hal ini memastikan bahwa objek Pemasukan akan selalu beridentitas sebagai pemasukan.

   b. Class Pengeluaran.Java

      <img width="392" height="232" alt="image" src="https://github.com/user-attachments/assets/50a4cb6d-7c14-4c84-9e7e-dc92f2c2ce50" />

   >Hal serupa juga dilakukan pada kelas Pengeluaran.java. Method getJenis() dioverride agar setiap kali dipanggil akan mengembalikan nilai string “Pengeluaran”. Sedangkan method setJenis(String jenis) dioverride tanpa isi sehingga upaya untuk mengubah jenis transaksi tidak akan berdampak. Dengan pola ini, semua objek Pengeluaran akan tetap konsisten sebagai transaksi pengeluaran.

   Penerapan overriding ini sangat penting karena menjaga konsistensi data antara jenis transaksi dengan subclass yang menaunginya. Selain itu, hal ini juga memperlihatkan penggunaan prinsip polimorfisme dalam OOP, di mana pemanggilan method getJenis() akan menghasilkan perilaku yang berbeda tergantung pada objek sebenarnya, apakah itu Pemasukan atau Pengeluaran, meskipun keduanya ditampung dalam list bertipe Transaksi.

#### Penjelasan Penerapan Abstraction
Pada program ini, konsep abstraction diterapkan dengan membuat abstract class dan interface

1) **Interface `SaldoEffect`**: mendefinisikan kontrak `efekSaldo()` untuk menghitung pengaruh transaksi terhadap saldo.

   <img width="568" height="155" alt="image" src="https://github.com/user-attachments/assets/243d563b-af09-473a-bc07-9513a49c7921" />

   <img width="578" height="27" alt="image" src="https://github.com/user-attachments/assets/5cf9f219-4e05-4c4e-8e2c-af236a323bdf" />

   <img width="499" height="120" alt="image" src="https://github.com/user-attachments/assets/f2de32cc-27ea-4fe1-a62d-8ac0227ed5dd" />
   
   >Bagian ini menjelaskan peran SaldoEffect sebagai interface yang menetapkan satu kontrak bernama efekSaldo. Kontrak tersebut menuntut setiap tipe transaksi mampu menghitung pengaruh langsungnya terhadap saldo dan hasilnya bersifat bertanda. Nilai positif mewakili pemasukan, sedangkan nilai negatif mewakili pengeluaran. Kelas Transaksi bertindak sebagai kelas induk abstrak yang mengimplementasikan kontrak ini. Perhitungan dilakukan langsung di Transaksi melalui rumus efekSaldo = tandaSaldo × jumlah. Method tandaSaldo dideklarasikan abstrak sehingga penentuan tanda diserahkan pada kelas turunan. Pemasukan mengembalikan nilai satu dan Pengeluaran mengembalikan nilai minus satu. Dengan rancangan ini, lapisan service dapat menghitung saldo cukup dengan menjumlahkan efekSaldo dari setiap objek transaksi. Tidak diperlukan percabangan tambahan karena perilaku positif atau negatif sudah melekat pada masing masing subclass melalui implementasi tandaSaldo. Desain ini membuat kode bersih mudah dirawat serta mudah diperluas ketika tipe transaksi baru ditambahkan.
 
2) **Abstract Class `Transaksi`**: menjadi template bagi semua transaksi. Menyediakan field umum (id, tanggal, dll) dan *abstract method* `tandaSaldo()` yang harus diimplementasi subclass

   <img width="898" height="641" alt="image" src="https://github.com/user-attachments/assets/e6e6876b-a1a6-426f-a9f2-a41c67c201c6" />
   
   >Bagian ini menjelaskan bahwa kelas Transaksi berperan sebagai kelas induk abstrak yang juga mengimplementasikan interface SaldoEffect. Di dalamnya tersimpan atribut inti sebuah transaksi id, tanggal, keterangan, jenis, kategori, metodePembayaran, dan jumlah yang semuanya diset privat untuk menerapkan enkapsulasi. Konstruktor Transaksi(...) digunakan untuk menginisialisasi seluruh atribut tersebut sejak awal pembuatan objek turunan, sehingga setiap transaksi selalu memiliki data lengkap dan konsisten.
   >
   >Elemen kunci pada kelas ini adalah deklarasi method abstrak tandaSaldo. Method inilah yang menentukan arah pengaruh transaksi terhadap saldo dan wajib diisi oleh setiap kelas turunan. Implementasi kontrak interface dilakukan oleh method efekSaldo yang ditulis langsung di kelas induk dengan rumus tandaSaldo × jumlah. Dengan pola ini, penentuan apakah efeknya positif atau negatif tidak diputuskan di kelas induk, melainkan diserahkan ke subclass melalui tandaSaldo dengan Pemasukan mengembalikan nilai +1 dan Pengeluaran mengembalikan nilai −1. Susunan tersebut menjadikan Transaksi landasan yang menyatukan struktur data dan cara menghitung efek saldo, sementara perilaku spesifik ditentukan oleh masing-masing turunan membuat kode rapi, konsisten, dan mudah diperluas.

#### Penjelasan Penerapan Polymorphism
Konsep Polymorphism dalam program ini muncul dalam dua bentuk yaitu Overriding dan Overloading

- **Overriding**
  - `Pemasukan.getJenis()` & `Pengeluaran.getJenis()` mengunci jenis masing-masing, `Pemasukan.tandaSaldo()` mengembalikan `+1`, `Pengeluaran.tandaSaldo()` `-1`

   <img width="959" height="400" alt="image" src="https://github.com/user-attachments/assets/3feedb55-f839-49e0-817c-81d8f8a98b07" />
   
   <img width="966" height="413" alt="image" src="https://github.com/user-attachments/assets/3563bf29-b6de-4701-a765-d1992048cdf0" />
   
   >Di paket model, Pemasukan dan Pengeluaran adalah turunan dari kelas abstrak Transaksi. Keduanya mewarisi struktur data transaksi (id, tanggal, keterangan, jenis, kategori, metodePembayaran, jumlah) dan mengisi perilaku yang diwajibkan oleh Transaksi.
   >
   >Pertama, masing-masing konstruktor memanggil super(...) sambil menetapkan nilai jenis tetap, Pemasukan selalu membawa “Pemasukan” dan Pengeluaran selalu membawa “Pengeluaran”. Supaya identitas ini tidak bisa berubah setelah objek dibuat, keduanya melakukan overriding pada getJenis() dan setJenis(String). getJenis() selalu mengembalikan string tetap sesuai kelasnya, sedangkan setJenis(String) dioverride menjadi tidak melakukan apa pun, ini mencegah perubahan jenis saat proses ubah data.
   >
   >Kedua, keduanya juga mengisi method abstrak tandaSaldo() yang dideklarasikan di Transaksi. Pemasukan.tandaSaldo() mengembalikan +1 dan Pengeluaran.tandaSaldo() mengembalikan -1. Nilai tanda ini dipakai oleh implementasi efekSaldo() di kelas induk (efekSaldo() = tandaSaldo() * jumlah) untuk menghitung pengaruh transaksi terhadap saldo.
   >
   >Dengan rancangan ini, saat ringkasan saldo dihitung di service, daftar transaksi cukup dijumlahkan melalui pemanggilan efekSaldo() tanpa percabangan. Objek Pemasukan otomatis berkontribusi positif, sedangkan Pengeluaran otomatis negatif. Overriding pada getJenis(), setJenis(), dan tandaSaldo() sekaligus menjaga konsistensi data dan mewujudkan polimorfisme yang bersih pada perhitungan saldo.

- **Overloading**
  - `TransaksiService.tampilkanTabel()` di-*overload*: ada versi tanpa parameter dan versi dengan parameter `List<Transaksi>`

    <img width="1562" height="773" alt="image" src="https://github.com/user-attachments/assets/e8909b0f-64cc-42d7-b981-84a80cd47008" />
    
    >Pada kelas TransaksiService, konsep overloading diterapkan pada method bernama tampilkanTabel. Ada dua versi dengan nama yang sama tetapi tanda tangan berbeda. Versi pertama tidak memiliki parameter dan hanya berfungsi sebagai pintu praktis untuk menampilkan seluruh transaksi. Cara kerjanya adalah memanggil versi kedua sambil meneruskan koleksi utama yang menyimpan semua data. Versi kedua menerima parameter berupa List<Transaksi> dan di sinilah proses pencetakan tabel benar-benar dilakukan, mulai dari menulis header kolom, memformat nilai rupiah, memotong keterangan yang terlalu panjang, sampai menutup tampilan. Karena menerima daftar mana pun, versi ini dapat dipakai untuk menampilkan subset hasil filter per jenis, kategori, atau metode pembayaran, termasuk hasil pencarian. Dengan rancangan seperti ini, satu nama method melayani dua kebutuhan sekaligus. Pemanggilan tanpa argumen cukup untuk kasus umum, sedangkan pemanggilan dengan argumen memberi fleksibilitas untuk berbagai hasil seleksi. Kode menjadi lebih rapi karena logika cetak hanya ditulis sekali pada versi berparameter, tidak ada duplikasi, dan keputusan versi mana yang dipakai ditentukan oleh kompiler saat kompilasi sebagai bentuk polimorfisme pada waktu kompilasi.


#### Kombinasi abstract class + interface
- `Transaksi` (abstract class) **mengimplementasikan** interface `SaldoEffect`. Perhitungan saldo global menggunakan pemanggilan polimorfik `efekSaldo()`

  - Transaksi.java — implementasi interface di kelas abstrak 
  
  <img width="633" height="27" alt="image" src="https://github.com/user-attachments/assets/e0f25372-1e28-4c90-b92c-f2ae9915bcfb" />
  
  <img width="543" height="141" alt="image" src="https://github.com/user-attachments/assets/b17f7d2f-90d3-440a-a05c-047423f4d125" />

   - TransaksiService.java — pemakaian polimorfik interface 
     
  <img width="1152" height="378" alt="image" src="https://github.com/user-attachments/assets/817a76e6-31d4-4ad0-a296-384085e6be06" />
  
  >Bagian ini menunjukkan perpaduan abstract class dan interface dalam perhitungan saldo. Kelas Transaksi dideklarasikan sebagai kelas abstrak yang mengimplementasikan interface SaldoEffect. Implementasi method efekSaldo() ditulis sekali di Transaksi dengan rumus tandaSaldo() * jumlah, sementara penentuan nilai tanda diserahkan ke subclass melalui method abstrak tandaSaldo() dengan Pemasukan mengembalikan +1 dan Pengeluaran mengembalikan -1. Saat laporan dibuat di ringkasanSaldo(), daftar transaksi diproses dengan memanggil efekSaldo() pada setiap elemen. Karena pemanggilan itu bersifat polimorfik, setiap objek otomatis memberi kontribusi positif atau negatif sesuai jenisnya tanpa perlu if else. Hasilnya, total saldo global dapat dihitung bersih, terstruktur, dan mudah diperluas bila kelak ada tipe transaksi baru cukup menambahkan subclass yang mengisi tandaSaldo() tanpa mengubah logika di service.


#### Letak Kode Utama & Ringkasannya
- Abstraction (interface & abstract class): `model/SaldoEffect.java`, `model/Transaksi.java`
  
  >SaldoEffect menetapkan kontrak efekSaldo(). Transaksi sebagai kelas abstrak mengimplementasikan kontrak itu dan menyediakan rumus tandaSaldo() * jumlah, sementara detail tanda diisi subclass.
  
- Polymorphism (Overriding): `model/Pemasukan.java`, `model/Pengeluaran.java`
  >Keduanya meng-override getJenis(), setJenis(String) (no-op agar jenis terkunci), dan tandaSaldo() dengan Pemasukan mengembalikan +1, Pengeluaran -1. Efeknya, pemanggilan efekSaldo() bersifat polimorfik.
  
- Polymorphism (Overloading): `service/TransaksiService.java` → `tampilkanTabel()` overload.
  >Ada dua versi method bernama sama: tanpa parameter untuk menampilkan seluruh data, dan dengan parameter List<Transaksi> untuk menampilkan hasil filter/pencarian.
  
- Perhitungan saldo via interface: `TransaksiService.ringkasanSaldo()`.
  >Total saldo dihitung dengan menjumlahkan efekSaldo() pada setiap elemen daftar. Karena efekSaldo() datang dari kontrak interface, Pemasukan otomatis positif dan Pengeluaran otomatis negatif tanpa if else.

    
### ~ Penjelasan Alur Program (Output Program)  ~

<h1 align="center"><img width="369" height="306" alt="image" src="https://github.com/user-attachments/assets/9aaa0cd6-68b4-4dd0-903c-988aa4aedf47" /></h1>

> Saat program dijalankan, muncul pesan pembuka “SELAMAT DATANG DI POCKET GUARD – Aplikasi Catatan Keuangan Harian Anda”. Setelah itu tampil Menu Utama berisi pilihan untuk menambah catatan, melihat daftar catatan, mengubah atau menghapus catatan, menampilkan ringkasan saldo, memfilter catatan (berdasarkan jenis, kategori, atau metode pembayaran) dan searching berdasarkan keterangan, menetapkan batas pengeluaran bulanan, serta opsi keluar untuk mengakhiri program.
>
> ### ✨ Penjelasan Masing-Masing Menu ✨
> 
> 1. Tambah Catatan Keuangan
>    
>    Menu ini digunakan untuk menambahkan catatan keuangan baru. Data yang dimasukkan meliputi tanggal, keterangan, jenis (pemasukan/pengeluaran), kategori, metode pembayaran, dan jumlah. Setelah disimpan, catatan langsung masuk ke daftar utama.
>    
> 2. Lihat Semua Catatan Keuangan
>    
>    Menampilkan seluruh daftar catatan keuangan dalam bentuk tabel yang rapi. Pengguna bisa melihat detail lengkap seperti ID, tanggal, jenis, kategori, metode pembayaran, jumlah, dan keterangan.
>    
> 3. Ubah Catatan Keuangan
>    
>    Menu ini berfungsi untuk memperbarui data catatan keuangan yang sudah ada. Cukup masukkan ID catatan, lalu ganti data yang ingin diperbarui seperti tanggal, keterangan, jenis, kategori, metode pembayaran, maupun jumlah.
>    
> 4. Hapus Catatan Keuangan
>    
>    Digunakan untuk menghapus catatan keuangan yang sudah tidak diperlukan. Cukup masukkan ID catatan, lalu data akan dihapus permanen dari daftar.
>    
> 5. Ringkasan Saldo
>    
>    Menampilkan ringkasan keuangan berupa total pemasukan, total pengeluaran, dan saldo akhir (selisih antara pemasukan dan pengeluaran). Dengan menu ini kondisi keuangan bisa dipantau secara cepat.
>    
> 6. Filter dan Search
>    
>    Menu ini menampilkan sub-menu filter dan search (berdasarkan keterangan) yang bisa digunakan untuk menyaring catatan keuangan berdasarkan:
>    
>    a. Jenis (pemasukan/pengeluaran)
>    
>    b. Kategori (makan, transportasi, hiburan, belanja, tabungan, dll.)
>    
>    c. Metode pembayaran (cash, e-wallet, transfer)
>
>    d. Search (cari berdasarkan keterangan)
>
>    Fitur ini mempermudah pencarian data tertentu agar lebih spesifik.
>    
> 7. Set Batas Pengeluaran
>    
>    Menu ini digunakan untuk menetapkan batas pengeluaran bulanan. Jika total pengeluaran melewati batas yang ditetapkan, sistem akan memberikan peringatan agar pengelolaan keuangan lebih terkendali.
>    
> 8. Keluar
>    
>    Menu ini digunakan untuk keluar dari aplikasi. Setelah memilih opsi ini, sistem akan menampilkan pesan penutup sebelum program dihentikan.

### 1. Menu Tambah Catatan Keuangan

<img width="688" height="407" alt="image" src="https://github.com/user-attachments/assets/feae8186-3ee4-44f1-9104-c23d6dc6ec5b" />

> Ketika menginputkan angka 1 pada menu utama maka akan diarahkan ke menu "Tambah Catatan Keuangan" seperti yang tertera pada gambar di atas

<img width="905" height="217" alt="image" src="https://github.com/user-attachments/assets/cb715ebe-5e17-4511-ae2b-66bccd306636" />

> Setelah itu bakal diminta untuk menginputkan "Tanggal", "Keterangan", "Jenis Transaksi", "Kategori Transaksi", "Metode Pembayaran", serta "Nominal Transaksi". Ketika berhasil menambahkan data baru akan muncul pesan "Data Berhasil Ditambahkan"

<img width="1025" height="408" alt="image" src="https://github.com/user-attachments/assets/df4b47e0-b4bd-4266-8b85-14f4d19fd624" />

> Setelah data baru berhasil ditambahkan, program akan langsung menampilkan ulang seluruh daftar catatan keuangan dalam bentuk tabel. Tabel ini memuat informasi lengkap seperti ID, Tanggal, Jenis (pemasukan/pengeluaran), Kategori, Metode Pembayaran, Jumlah, serta Keterangan.

> Di bagian bawah tabel, program juga memberikan pilihan "Apakah Ingin Menambah Catatan Lagi? (Y/T):".
> 
>  a. Jika menginputkan "Y", maka akan diarahkan untuk menginputkan catatan baru mulai dari menginputkan tanggal sampai nominal transaksinya. Ketika berhasil menambahkan data maka akan muncul pesan bahwa "Data Berhasil Ditambahkan".
> 
> <img width="957" height="219" alt="image" src="https://github.com/user-attachments/assets/ec4aabe8-aede-4d4a-8296-e7e4c56c4584" />
>
> Dan setelah berhasil menambahkan data baru, program akan langsung menampilkan ulang seluruh daftar catatan keuangan dalam bentuk tabel dan diarahkan kembali ke pertanyaan "Apakah Ingin Menambah Catatan Lagi? (Y/T):", seperti yang tertera pada gambar di bawah ini.
> 
> <img width="1016" height="389" alt="image" src="https://github.com/user-attachments/assets/93414b8b-46ec-4601-8c40-3704b477d5a5" />
>
>  b. Jika  menginputkan "T" maka akan di arahkan ke menu utama program ini.
> 
> <img width="386" height="348" alt="image" src="https://github.com/user-attachments/assets/c1a16e7a-c0f0-4a95-b777-fffb111a0ec5" />

#### Validasi Input Pada Menu "Tambah Catatan Keuangan"

- Pada menu "Tambah Catatan Keuangan", ketika nominal transaksi diinputkan menggunakan huruf alih-alih angka, sistem akan menampilkan peringatan berupa pesan "Harus angka! Silakan input ulang". Pesan ini memastikan agar data yang dimasukkan valid sesuai format angka, sehingga perhitungan transaksi dapat berjalan dengan benar, seperti terlihat pada gambar di bawah ini.
  
  <img width="936" height="202" alt="image" src="https://github.com/user-attachments/assets/0aa64c3f-7944-46ad-b028-b2f69707e823" />

- Selain validasi input angka, pada menu "Tambah Catatan Keuangan", setiap kali catatan pengeluaran baru ditambahkan, sistem akan otomatis menghitung ulang total seluruh pengeluaran. Jika total pengeluaran tersebut melebihi batas bulanan yang sudah ditentukan sebelumnya, maka aplikasi akan langsung menampilkan peringatan agar anggaran tetap terkontrol, seperti yang terlihat pada gambar di bawah ini.
  
  <img width="1061" height="586" alt="image" src="https://github.com/user-attachments/assets/26b2b15c-c5ed-4aae-a019-1fb9122c2e78" />

- Selain validasi input angka, pada menu "Tambah Catatan Keuangan", setiap kali mengosongkan inputan "misal mengosongkan input tanggal", maka sistem akan menampilkan peringatan berupa pesan "Tidak boleh kosong. Coba lagi".

  <img width="670" height="128" alt="image" src="https://github.com/user-attachments/assets/677956e8-ef34-4d7d-bc29-62b201ee3dc0" />

- Jika menginputkan tanggal tidak sesuai format yang diminta yaitu "yyyy-mm-dd", maka akan muncul pesan "Format tanggal harus yyyy-mm-dd" dan sistem akan meminta untuk menginputkan kembali tanggal sesuai dengan format "yyyy-mm-dd".

  <img width="662" height="110" alt="image" src="https://github.com/user-attachments/assets/70540860-6f9a-4e13-abad-1d96ea4ba85d" />

- Jika menginputkan jenis transaksi selain "Pemasukan/Pengeluaran", maka akan muncul pesan "Pilihan tidak valid. Pilihan yang valid: Pemasukan/Pengeluaran" dan sistem akan meminta ulang untuk menginputkan jenis transaksi yang sesuai dengan jenis transaksi yang tersedia yaitu "Pemasukan/Pengeluaran".

  <img width="685" height="192" alt="image" src="https://github.com/user-attachments/assets/5d9be1b6-9710-477e-b8f4-eef87a7d0bba" />

- Jika menginputkan kategori selain "Gaji, Makan, Transportasi, Hiburan, Belanja, Tabungan, Tagihan", maka akan muncul pesan "Pilihan tidak valid. Pilihan yang valid: Gaji/Makan/Transportasi/Hiburan/Belanja/Tabungan/Tagihan" dan sistem akan meminta ulang untuk menginputkan kategori yang sesuai dengan kategori yang tersedia yaitu "Gaji, Makan, Transportasi, Hiburan, Belanja, Tabungan, Tagihan".

  <img width="820" height="251" alt="image" src="https://github.com/user-attachments/assets/27663a6a-582b-4f7a-92f5-2056450bf5b2" />

- Jika menginputkan metode pembayaran selain "Cash, E-Wallet, Transfer", maka akan muncul pesan "Pilihan tidak valid. Pilihan yang valid: Cash/E-Wallet/Transfer" dan sistem akan meminta ulang untuk menginputkan metode pembayaran yang sesuai dengan meode pembayaran yang tersedia yaitu "Cash, E-Wallet, Transfer".

  <img width="802" height="302" alt="image" src="https://github.com/user-attachments/assets/4dc6401a-76e1-4eb4-99f6-9a1fc1449452" />


### 2. Menu Lihat Semua Catatan Keuangan 

<img width="1032" height="684" alt="image" src="https://github.com/user-attachments/assets/f9e507f9-4769-4189-bfe8-c6ad65a0efad" />

> Ketika menginputkan angka 2 pada menu utama maka akan diarahkan ke menu "Lihat Semua Catatan Keuangan" seperti yang tertera pada gambar di atas.
>
> Pada menu ini, seluruh catatan keuangan yang sudah dimasukkan akan ditampilkan dalam bentuk tabel yang rapi, berisi informasi ID, Tanggal, Jenis (Pemasukan/Pengeluaran), Kategori, Metode, Jumlah, dan Keterangan.
>
> Selain itu, pada bagian bawah tabel akan muncul perintah "Ketik 0 untuk kembali" yang berfungsi untuk kembali ke menu utama.

### 3. Menu Ubah Catatan Keuangan

<img width="1018" height="717" alt="image" src="https://github.com/user-attachments/assets/207e61d0-10be-427f-bc5f-da01b1fbb83c" />

> Ketika menginputkan angka 3 pada menu utama maka akan diarahkan ke menu "Ubah Catatan Keuangan" seperti yang tertera pada gambar di atas.
>
>  Pada menu ini, seluruh daftar transaksi ditampilkan lengkap dengan ID, tanggal, jenis, kategori, metode pembayaran, jumlah, dan keterangan, sehingga catatan yang ingin diperbarui dapat dipilih dengan mudah.

<img width="1036" height="602" alt="image" src="https://github.com/user-attachments/assets/23f136c0-7b04-4160-be1e-0c0c8d68a6a6" />

<img width="1016" height="331" alt="image" src="https://github.com/user-attachments/assets/33144f74-7c63-402f-8659-55d029c3a935" />

> Setelah itu sistem akan meminta ID dari transaksi yang ingin diubah. Setelah ID dimasukkan, tersedia opsi untuk mengganti setiap field transaksi, mulai dari tanggal, keterangan, jenis, kategori, metode pembayaran, hingga nominal. Jika pada salah satu field tidak diberikan input baru dan langsung menekan Enter, maka nilai lama akan tetap dipertahankan. Dengan mekanisme ini, perubahan data dapat dilakukan secara fleksibel tanpa perlu menghapus atau menambahkan ulang catatan transaksi.
>
> Sebagai contoh, pada gambar ditunjukkan transaksi dengan ID 11 yang sebelumnya berisi data pemasukan dengan kategori gaji. Beberapa field kemudian diganti, seperti tanggal, keterangan, jenis, kategori, metode pembayaran, dan nominal transaksi. Setelah proses selesai, sistem akan menampilkan pesan “Data berhasil diubah” serta menampilkan kembali tabel catatan keuangan yang sudah diperbarui.

- ID sebelum diubah catatan keuangan nya
  <img width="981" height="25" alt="image" src="https://github.com/user-attachments/assets/57381df9-080b-4e93-a6d5-9150a7dc04fa" />
  
- ID sesudah diubah catatan keuangan nya
  <img width="982" height="28" alt="image" src="https://github.com/user-attachments/assets/1ee1b467-dc9e-4597-8483-5d6e32354b6e" />

Setelah proses Ubah Catatan Keuangan selesai dilakukan, sistem akan menampilkan daftar catatan terbaru yang sudah diperbarui. Selanjutnya, akan diberikan pilihan seperti yang terlihat pada gambar di bawah ini:

<img width="1028" height="395" alt="image" src="https://github.com/user-attachments/assets/9b6c060f-669d-451d-b795-be444910a6db" />

> a. Jika menginputkan "Y"
> 
>  <img width="1038" height="673" alt="image" src="https://github.com/user-attachments/assets/688421af-a675-4f78-8fb7-3b94081e9652" />
>  <img width="1009" height="339" alt="image" src="https://github.com/user-attachments/assets/e6e7773f-d2e4-4fcb-9dba-dca93c0be3c8" />
>
>  Program akan kembali menampilkan menu Ubah Catatan Keuangan. Pada tahap ini dapat dimasukkan ID lain untuk diperbarui. Dengan begitu, proses ubah catatan bisa dilakukan berulang kali sesuai kebutuhan tanpa harus kembali ke menu utama terlebih dahulu.
>
> b. Jika  menginputkan "T"
> 
>  <img width="385" height="349" alt="image" src="https://github.com/user-attachments/assets/bb046725-13d4-4df0-890a-25350b46a088" />
>
>
>  Program akan langsung keluar dari menu ubah catatan dan kembali ke Menu Utama. Hal ini memudahkan jika tidak ingin lagi melakukan perubahan pada catatan yang ada.

#### Validasi Input Pada Menu "Ubah Catatan Keuangan"

- Pada saat menginputkan ID yang tidak tersedia di dalam tabel, sistem akan memberikan peringatan "ID tidak ditemukan" seperti gambar di bawah ini.
  
  <img width="1199" height="815" alt="image" src="https://github.com/user-attachments/assets/7b99194b-783e-4dd7-a122-0a5cb58b09fe" />

  Hal ini menunjukkan bahwa ID yang dimasukkan tidak sesuai dengan daftar transaksi yang ada. Setelah itu, sistem tetap menampilkan ulang tabel catatan keuangan terbaru agar bisa memastikan ID mana yang valid. Dengan cara ini, tidak akan terjadi kesalahan dalam mengubah data transaksi karena hanya ID yang tersedia dalam tabel yang dapat diproses.
  
- Pada saat mencoba menginputkan ID dengan huruf (contoh: "sebelas") alih-alih angka (11), sistem akan otomatis menolak input tersebut. Program akan menampilkan pesan error "Harus angka! Silakan input ulang:".
  
  <img width="994" height="474" alt="image" src="https://github.com/user-attachments/assets/c6004323-fdf3-4281-bf23-ab5368a095b0" />

  Pesan ini memastikan bahwa input yang diterima hanya berupa angka valid sesuai ID transaksi.

- Pada saat mengosongkan inputan ID yang ingin diubah, maka sistem akan memberikan peringatan "Harus angka! Silakan input ulang:" seperti gambar di bawah ini.

  <img width="1009" height="477" alt="image" src="https://github.com/user-attachments/assets/1d1b1b34-876c-4b94-bd76-6101caea9f0f" />

- Apabila nominal transaksi diinputkan dengan huruf (contoh: "tiga juta") alih-alih angka (3000000), sistem akan langsung menolak input tersebut dan menampilkan pesan error "Harus angka! Silakan input ulang:" seperti pada gambar di bawah ini.
  
  <img width="497" height="211" alt="image" src="https://github.com/user-attachments/assets/115dfe19-20a1-409c-85be-36bf89500fcc" />
  <img width="1266" height="462" alt="image" src="https://github.com/user-attachments/assets/cffebac3-341f-4648-94b3-ab0c20ce469b" />

  Setelah itu, sistem akan meminta untuk memasukkan ulang nilai nominal dengan format angka yang benar. Begitu input diperbaiki, data transaksi akan berhasil diperbarui dan ditampilkan kembali pada tabel catatan keuangan.

- Pada menu "Ubah Catatan Keuangan", jika mengosongkan inputan yang ingin di update "misal mengosongkan inputan input tanggal baru, keterangan baru, jenis baru, kategori baru, metode pembayaran baru, dan nominal transaksi baru" maka nilai lama yang akan dipertahankan.

  <img width="1001" height="518" alt="image" src="https://github.com/user-attachments/assets/6668a812-564b-472c-8717-4abb92e583d6" />


### 4. Menu Hapus Catatan Keuangan  

<img width="998" height="724" alt="image" src="https://github.com/user-attachments/assets/2f9ce51e-330b-4a68-978a-a1401913bc5e" />

<img width="1045" height="438" alt="image" src="https://github.com/user-attachments/assets/3ccec24b-50e3-4458-8b6f-3104ed8a5a7a" />

>  Ketika  menginputkan angka 4 pada menu utama, sistem akan mengarahkan ke menu Hapus Catatan Keuangan. Pada tahap ini, tabel catatan keuangan akan ditampilkan terlebih dahulu agar tidak terjadi kebingungan mengenai data mana yang ingin dihapus. Setelah tabel ditampilkan, sistem kemudian meminta untuk menginputkan ID catatan yang ingin dihapus atau klik enter untuk membatalkan penghapusan catatan.
>
> Jika kita berubah pikiran, tidak jadi ingin menghapus catatan keuangan maka bisa klik enter saja untuk membatalkan penghapusan dan akan muncul pesan "Penghapusan dibatalkan" dan akan diarahkan lagi ke menu utama program ini, seperti gambar yang tertera di bawah ini.
> 
> <img width="560" height="372" alt="image" src="https://github.com/user-attachments/assets/940b3ef7-ec5c-43a8-a1bd-489427a24b51" />

> Jika ID yang diinputkan sesuai dengan data yang ada, maka sistem akan menampilkan pertanyaan konfirmasi "Apakah Anda yakin ingin menghapus data dengan ID ... (Y/T)?".
> 
> a. Jika  menginputkan "Y"
> 
>  <img width="531" height="108" alt="image" src="https://github.com/user-attachments/assets/765e9670-676f-4baa-9cb1-a1aec2497058" />
>
>   Maka catatan akan dihapus dari daftar, dan sistem menampilkan pesan "Data berhasil dihapus".
>
>   - Tampilan tabel sebelum dihapus datanya
>     <img width="987" height="308" alt="image" src="https://github.com/user-attachments/assets/6141a705-e19c-4652-b2f7-ef0abdd308b0" />
>    
>   - Tampilan tabel setelah di hapus datanya
>     <img width="1000" height="289" alt="image" src="https://github.com/user-attachments/assets/e3e67acc-690e-4c74-9fa3-3895c3bdfa05" />
>
> b. Jika menginputkan "T"
> 
>   <img width="550" height="105" alt="image" src="https://github.com/user-attachments/assets/cecccff0-205f-4406-bb0f-483ed10689ac" />
>
>   Maka proses penghapusan dibatalkan, dan sistem menampilkan pesan "Penghapusan dibatalkan".

Setelah berhasil menghapus data, sistem akan menampilkan pertanyaan "Apakah Ingin Menghapus Catatan Lagi? (Y/T):" seperti terlihat pada gambar di bawah.

  <img width="1006" height="448" alt="image" src="https://github.com/user-attachments/assets/9f3618d5-4345-4936-892d-d81015957710" />

> a. Jika menginputkan "Y"
> 
>   <img width="1009" height="551" alt="image" src="https://github.com/user-attachments/assets/66af7810-6277-41dc-98e3-cb2ad9d5e119" />
>
>  Program akan kembali menampilkan tabel catatan keuangan terbaru, kemudian meminta untuk  menginputkan ID catatan lain yang ingin dihapus. Proses ini dapat dilakukan berulang kali sampai dipilih untuk berhenti. Dengan cara ini, lebih dari satu catatan dapat dihapus dalam satu kali sesi tanpa harus kembali ke menu utama terlebih dahulu.
>
> b. Jika menginputkan "T"
> 
>  <img width="394" height="352" alt="image" src="https://github.com/user-attachments/assets/08b57eb1-5e35-477b-971d-9116a3f91602" />
>
>
>  Program akan langsung kembali ke Menu Utama tanpa menghapus catatan tambahan.

#### Validasi Input Pada Menu "Hapus Catatan Keuangan"

<img width="1024" height="485" alt="image" src="https://github.com/user-attachments/assets/72867780-f83f-4f8e-9a36-7014f33cd9dd" />

> Jika ID yang diinputkan tidak sesuai atau tidak ada dalam daftar catatan keuangan, maka sistem akan menampilkan pesan "ID tidak ditemukan".
>
> Hal ini bertujuan agar tidak terjadi kesalahan dalam menghapus catatan yang tidak ada pada tabel. Setelah itu, sistem tetap memberikan pilihan "Apakah Ingin Menghapus Catatan Lagi? (Y/T):" sehingga dapat dicoba kembali dengan memasukkan ID yang benar, atau keluar dari proses penghapusan dengan menginputkan "T".


<img width="1038" height="422" alt="image" src="https://github.com/user-attachments/assets/5f670a08-9cab-4713-8535-fb659566e937" />

> Jika ID diinputkan dalam bentuk huruf (contoh: mengetik "satu" alih-alih angka 1), maka sistem tidak akan menerima input tersebut dan akan menampilkan pesan "Harus angka! Silakan input ulang:".
>
> Pesan ini berfungsi sebagai validasi agar ID hanya bisa diinputkan dalam bentuk angka sesuai dengan tabel catatan yang tersedia.

### 5. Menu Ringkasan Saldo

<img width="686" height="474" alt="image" src="https://github.com/user-attachments/assets/2e60355e-8fe5-4cf1-b81b-7f5106fc4a0c" />

> Ketika menginputkan angka 5 pada menu utama, sistem akan menampilkan menu Ringkasan Saldo. Pada menu ini ditampilkan rekapitulasi keuangan yang berisi total pemasukan, total pengeluaran, serta saldo akhir yang merupakan selisih dari keduanya. Informasi ini membantu menampilkan kondisi keuangan terkini secara lebih jelas dan ringkas. Setelah ringkasan saldo ditampilkan, sistem akan meminta untuk mengetik angka 0 agar dapat kembali ke menu utama.

<img width="701" height="225" alt="image" src="https://github.com/user-attachments/assets/1080d1c1-cb4b-46b8-a54b-c792eded2da2" />

> Ketika menambahkan catatan pengeluaran dengan jumlah yang melebihi pemasukan, lalu membuka menu Ringkasan Saldo, sistem akan tetap menampilkan total pemasukan, total pengeluaran, dan saldo akhir. Karena nilai pengeluaran lebih besar dibandingkan pemasukan, saldo ditampilkan dalam kondisi negatif. Selain itu, sistem juga memberikan catatan berupa peringatan: “Pengeluaran lebih besar dari pemasukan. Harap bijak mengatur keuangan.” Setelah itu, sistem meminta untuk mengetik angka 0 agar dapat kembali ke menu utama.

### 6. Menu Filter dan Search Catatan

<img width="628" height="514" alt="image" src="https://github.com/user-attachments/assets/655b7415-3cac-417f-8ba4-846db2ef18c7" />

> Ketika menginputkan angka 6 pada menu utama, sistem akan menampilkan menu filter/search. Pada menu ini tersedia beberapa pilihan filter dan search (berdasarkan keterangan), untuk pilihan filter yaitu ada filter per jenis transaksi (pemasukan atau pengeluaran), filter per kategori, dan filter per metode pembayaran. Selain itu, juga tersedia opsi untuk kembali ke menu sebelumnya. Melalui menu ini, catatan keuangan dapat disaring sesuai kriteria tertentu agar informasi yang ditampilkan lebih fokus dan mudah dipahami.

a. Filter per Jenis (Pemasukan/Pengeluaran) 

  <img width="685" height="294" alt="image" src="https://github.com/user-attachments/assets/0a5138b5-f668-47ae-9423-3923062de9c9" />

  > Setelah memilih opsi 1. Filter per Jenis (Pemasukan/Pengeluaran) pada menu filter/search, sistem akan menampilkan tampilan baru bertuliskan Filter berdasarkan Jenis. Pada tahap ini, sistem meminta input jenis transaksi yang ingin difilter, apakah termasuk pemasukan atau pengeluaran. Input tersebut akan digunakan untuk menampilkan daftar catatan keuangan sesuai jenis yang dipilih sehingga data lebih terfokus.

- Pemasukan
  
  <img width="1013" height="255" alt="image" src="https://github.com/user-attachments/assets/24f57eb7-3956-43ff-90e5-759c3ebb0ca7" />
  
  > Setelah memilih jenis transaksi Pemasukan, sistem akan menampilkan daftar catatan keuangan yang hanya berisi transaksi dengan jenis tersebut. Tabel yang ditampilkan memuat detail berupa ID, tanggal, jenis, kategori, metode, jumlah, serta keterangan dari setiap transaksi pemasukan. Dari hasil filter terlihat bahwa hanya transaksi dengan kategori gaji maupun tabungan yang masuk dalam daftar. Setelah selesai melihat data, dapat diketik angka 0 untuk kembali ke menu sebelumnya.

- Pengeluaran
  
  <img width="1024" height="308" alt="image" src="https://github.com/user-attachments/assets/4175bc72-9c95-4eec-944e-321486b2d114" />

  > Setelah memilih jenis transaksi Pengeluaran, sistem menampilkan daftar catatan keuangan yang hanya berisi transaksi dengan jenis pengeluaran. Tabel yang ditampilkan berisi detail ID, tanggal, jenis, kategori, metode, jumlah, serta keterangan dari setiap transaksi. Dari hasil filter terlihat bahwa data pengeluaran meliputi kebutuhan sehari-hari seperti makan, transportasi, hiburan, belanja, serta tagihan. Dengan tampilan ini, semua transaksi pengeluaran dapat diamati secara lebih jelas tanpa bercampur dengan pemasukan. Setelah selesai, cukup mengetik angka 0 untuk kembali ke menu sebelumnya.

- Selain pilihan pemasukan dan pengeluaran
  
  <img width="673" height="118" alt="image" src="https://github.com/user-attachments/assets/acb5f4f7-8f5a-42ed-bffe-0fa9d19d8970" />

  > Jika pada filter jenis transaksi dimasukkan selain pilihan Pemasukan atau Pengeluaran, misalnya kata pendapatan, maka sistem akan menampilkan pesan“ Pilihan tidak valid. Pilihan yang valid: Pemasukan/Pengeluaran”. Setelah itu, sistem secara otomatis akan meminta input ulang yang benar yaitu "Pemasukan/Pengeluaran".

- Pada filter berdasarkan jenis, jika mengosongkan inputan "Masukan Jenis (Pemasukan/Pengeluaran). Maka akan muncul pesan peringatan yaitu "Tidak boleh kosong. Coba lagi", dan akan diminta untuk menginputkan ulang jenis yang ingin di filter.

  <img width="681" height="127" alt="image" src="https://github.com/user-attachments/assets/b52560ec-c886-46aa-932d-445b791e5251" />


b. Filter per Kategori  

  <img width="716" height="288" alt="image" src="https://github.com/user-attachments/assets/f9e842f5-eea3-434f-9940-27be111e86d7" />


  > Ketika memilih opsi Filter per Kategori pada menu filter/search, sistem akan menampilkan pilihan untuk memasukkan kategori transaksi. Kategori yang tersedia antara lain gaji, makan, transportasi, hiburan, belanja, tabungan, dan tagihan. Setelah kategori dimasukkan, sistem akan menampilkan catatan transaksi yang sesuai dengan kategori tersebut dalam bentuk tabel, sehingga lebih mudah untuk melihat pengeluaran atau pemasukan berdasarkan kategori tertentu.

- Kategori gaji
  
  <img width="1019" height="210" alt="image" src="https://github.com/user-attachments/assets/4dc47c9e-072a-41cd-92a9-4240bb77cce5" />

  > Ketika memilih kategori gaji, sistem akan menampilkan daftar transaksi yang termasuk dalam kategori tersebut. Pada tampilan terlihat catatan pemasukan pada tanggal 1 September 2025 dengan metode transfer sebesar Rp 3.000.000 yang tercatat sebagai Gaji Bulan September. Setelah data ditampilkan, tersedia perintah untuk mengetik angka 0 agar bisa kembali ke menu sebelumnya.

- Kategori makan
  
  <img width="1008" height="214" alt="image" src="https://github.com/user-attachments/assets/7dae145d-325a-4fab-a905-65ef1f65300b" />

  > Ketika memilih kategori makan, sistem akan menampilkan data transaksi yang sesuai dengan kategori tersebut. Pada hasil filter terlihat satu catatan pengeluaran pada tanggal 2 September 2025 dengan metode pembayaran cash sebesar Rp 25.000, yang tercatat sebagai Beli Makan Siang. Setelah data ditampilkan, sistem memberikan opsi untuk mengetik angka 0 agar dapat kembali ke menu sebelumnya.
  
- Kategori transportasi
  
  <img width="1003" height="215" alt="image" src="https://github.com/user-attachments/assets/e1533edb-284f-426f-a00b-fb69bce4c928" />
  
  > Ketika memilih kategori transportasi, sistem akan menampilkan data transaksi yang sesuai dengan kategori tersebut. Pada hasil filter terlihat satu catatan pengeluaran pada tanggal 3 September 2025 dengan metode pembayaran cash sebesar Rp 10.000, yang tercatat sebagai Ongkos Transportasi. Setelah data ditampilkan, sistem akan meminta untuk mengetik angka 0 agar dapat kembali ke menu sebelumnya.

- Kategori hiburan
  
  <img width="1009" height="214" alt="image" src="https://github.com/user-attachments/assets/03ce37e8-0027-421b-9be9-3e5c7dbab591" />

  > Ketika memilih kategori hiburan, sistem akan menampilkan transaksi yang tercatat dalam kategori tersebut. Pada hasil filter terlihat satu catatan pengeluaran pada tanggal 4 September 2025 dengan metode pembayaran E-Wallet sebesar Rp 50.000, yang digunakan untuk kegiatan nonton bioskop. Setelah informasi ditampilkan, sistem memberikan opsi untuk mengetik angka 0 agar dapat kembali ke menu sebelumnya.

- Kategori belanja
  
  <img width="1005" height="216" alt="image" src="https://github.com/user-attachments/assets/4fa0a197-ffb1-4d67-a579-6d45e3353329" />

  > Ketika memilih kategori belanja, sistem akan menampilkan catatan transaksi yang termasuk dalam kategori tersebut. Pada hasil filter terlihat satu transaksi pengeluaran yang terjadi pada tanggal 5 September 2025 dengan metode pembayaran transfer sebesar Rp 200.000, yang digunakan untuk membeli pakaian. Setelah data ini ditampilkan, sistem memberikan opsi untuk mengetik angka 0 agar dapat kembali ke menu sebelumnya.

- Kategori tabungan
  
  <img width="1029" height="238" alt="image" src="https://github.com/user-attachments/assets/c7e691ba-19bb-48f4-b4f5-e80d056e9a96" />

  > Ketika memilih kategori tabungan, sistem akan menampilkan daftar transaksi yang berkaitan dengan tabungan. Dari hasil filter terlihat ada dua transaksi pemasukan. Transaksi pertama terjadi pada tanggal 6 September 2025 sebesar Rp 500.000 dengan metode transfer, yang dicatat sebagai kegiatan menabung rutin. Transaksi kedua terjadi pada tanggal 9 September 2025 sebesar Rp 300.000 dengan metode transfer, yang dicatat sebagai isi saldo tabungan. Setelah data ditampilkan, sistem menunggu input angka 0 untuk kembali ke menu sebelumnya.

- Kategori tagihan
  
  <img width="1006" height="238" alt="image" src="https://github.com/user-attachments/assets/69386296-20ab-436e-bf40-626b39e72146" />

  > Ketika memilih kategori tagihan, sistem menampilkan dua transaksi pengeluaran. Transaksi pertama tercatat pada tanggal 7 September 2025 sebesar Rp 150.000 dengan metode E-Wallet, digunakan untuk membayar listrik. Transaksi kedua terjadi pada tanggal 8 September 2025 sebesar Rp 100.000 dengan metode transfer, digunakan untuk membayar air. Setelah daftar transaksi tagihan ditampilkan, sistem menunggu input angka 0 untuk kembali ke menu sebelumnya.

- Selain yang ada di pilihan kategori
  
  <img width="806" height="128" alt="image" src="https://github.com/user-attachments/assets/e1f5e12e-96f9-4907-a163-0068a9c9cc50" />

   > Ketika memasukkan kategori yang tidak tersedia dalam daftar pilihan, misalnya sedekah, sistem akan menampilkan pesan "Pilihan tidak valid. Pilihan yang valid: Gaji/Makan/Transportasi/Hiburan/Belanja/Tabungan/Tagihan". Dengan begitu, hanya kategori yang memang tercatat dalam sistem seperti gaji, makan, transportasi, hiburan, belanja, tabungan, atau tagihan yang dapat difilter. Setelah itu, tampilan akan kembali meminta untuk menginputkan kategori sesuai kategori yang ada.

- Pada filter kategori, jika mengosongkan inputan "Masukkan Kategori (gaji, makan, transportasi, hiburan, belanja, tabungan, tagihan):", maka akan muncul pesan peringatan yaitu "Tidak boleh kosong. Coba lagi", dan akan diminta untuk menginputkan ulang kategori yang ingin di filter.

  <img width="728" height="121" alt="image" src="https://github.com/user-attachments/assets/16f8cb25-9561-4952-8fc5-41fe7bfa542d" />

c. Filter per Metode Pembayaran 

   <img width="678" height="293" alt="image" src="https://github.com/user-attachments/assets/62430ead-a506-4378-a6c2-53ff27f83d65" />


  > Ketika memilih menu Filter per Metode Pembayaran pada menu filter/search, sistem akan menampilkan opsi untuk memasukkan metode pembayaran, yaitu Cash, E-Wallet, atau Transfer.

- Cash
  
  <img width="1025" height="233" alt="image" src="https://github.com/user-attachments/assets/3f97f153-3452-4f0a-bb29-b3541e66cb98" />

  > Ketika memilih metode pembayaran Cash, sistem akan menampilkan daftar transaksi yang menggunakan metode pembayaran tersebut. Pada tampilan terlihat dua catatan pengeluaran, yaitu transaksi makan dengan nominal Rp 25.000 dan transaksi transportasi dengan nominal Rp 10.000. Setelah data ditampilkan, tersedia perintah untuk mengetik angka 0 agar bisa kembali ke menu sebelumnya.

- Transfer
  
  <img width="1037" height="295" alt="image" src="https://github.com/user-attachments/assets/444926c9-c446-4f7b-9cb1-efbca08994ae" />

  > Ketika memilih metode pembayaran Transfer, sistem akan menampilkan daftar transaksi yang menggunakan metode tersebut. Pada tampilan terlihat beberapa catatan, di antaranya pemasukan gaji sebesar Rp 3.000.000, pengeluaran belanja sebesar Rp 200.000, pemasukan tabungan sebesar Rp 500.000, pembayaran tagihan air sebesar Rp 100.000, serta pemasukan tabungan sebesar Rp 300.000. Seluruh transaksi ditampilkan dalam bentuk tabel agar lebih jelas, dan setelah itu tersedia perintah untuk mengetik angka 0 agar bisa kembali ke menu sebelumnya.

- E-Wallet
  
  <img width="1015" height="242" alt="image" src="https://github.com/user-attachments/assets/4ab75684-8f54-4050-be4d-5fc08afee3d3" />

  > Ketika memilih metode pembayaran E-Wallet, sistem akan menampilkan daftar transaksi yang dilakukan menggunakan dompet digital. Pada tabel terlihat dua catatan pengeluaran, yaitu sebesar Rp 50.000 untuk hiburan menonton bioskop dan Rp 150.000 untuk pembayaran tagihan listrik. Seluruh data ditampilkan dengan format tabel agar mudah dibaca, dan setelah selesai tersedia instruksi untuk mengetik angka 0 agar kembali ke menu sebelumnya.

- Selain yang ada di pilihan metode pembayaran
  
  <img width="675" height="114" alt="image" src="https://github.com/user-attachments/assets/02fbf1c0-e75e-452b-8695-04aa5240e6e7" />

   > Ketika pada menu filter dimasukkan metode pembayaran yang tidak tersedia, misalnya “Kartu debit”, sistem akan langsung menampilkan pesan bahwa "Pilihan tidak valid. Pilihan yang valid: Cash/E-Wallet/Transfer". Setelah itu, sistem akan menampilkan untuk meminta ulang input metode pembayaran yang tersedia.

- Pada filter metode pembayaran, jika mengosongkan inputan "Masukkan Metode (Cash/E-Wallet/Transfer):", maka akan muncul pesan peringatan yaitu "Tidak boleh kosong. Coba lagi", dan akan diminta untuk menginputkan ulang metode pembayaran yang ingin di filter.

  <img width="682" height="121" alt="image" src="https://github.com/user-attachments/assets/eb0676d8-a796-44a0-b25a-4f152e42dfbe" />

d. Search (cari di keterangan)  

<img width="682" height="292" alt="image" src="https://github.com/user-attachments/assets/7d890f9c-d9b7-4afd-99ff-ff973ff32bd4" />

> Pada menu Filter/Search dipilih opsi 4. Search (cari di keterangan). Sistem menampilkan header SEARCH KETERANGAN dan meminta input “Kata kunci:” untuk memulai pencarian pada kolom keterangan transaksi.

<img width="999" height="230" alt="image" src="https://github.com/user-attachments/assets/fe6fb5a0-4fcf-4811-89cb-5510f59989a6" />

> Input kata kunci: “makan”. Sistem melakukan pencarian case-insensitive pada kolom keterangan, lalu menampilkan tabel hasil yang cocok (ID, Tanggal, Jenis, Kategori, Metode, Jumlah, Keterangan). Tampil dua catatan transaksi yang mengandung kata “makan”. Di bagian bawah tabel terdapat prompt “-> Ketik 0 untuk kembali” untuk kembali ke menu.

<img width="689" height="148" alt="image" src="https://github.com/user-attachments/assets/68f52940-d063-447c-9886-387cbf9902d4" />

> Input kata kunci: “bayar utang”. Sistem tidak menemukan catatan transaksi dengan keterangan yang memuat frasa tersebut, sehingga muncul pesan “Tidak ada data dengan hasil pencarian.” dan tetap menampilkan opsi “-> Ketik 0 untuk kembali” ke menu sebelumnya.

<img width="685" height="127" alt="image" src="https://github.com/user-attachments/assets/e826ca27-510f-4694-9c69-1bee409eb77e" />

> Saat masuk ke menu SEARCH KETERANGAN, tombol Enter ditekan tanpa mengisi kata kunci. Sistem mendeteksi input kosong lalu menampilkan pesan “Tidak boleh kosong. Coba lagi”. Setelah itu, sistem kembali meminta input “-> Kata kunci:” hingga nilai yang dimasukkan valid.

e. Kembali

  <img width="642" height="522" alt="image" src="https://github.com/user-attachments/assets/92fa30e3-292b-49f6-8ac1-c01bf6863bed" />

  > Ketika pada menu filter dipilih opsi nomor 5, sistem akan mengembalikan tampilan ke menu utama. Dengan begitu, proses penyaringan catatan dapat dihentikan sementara dan navigasi diarahkan kembali ke pilihan utama aplikasi, seperti menambah catatan keuangan, melihat daftar catatan, mengubah, menghapus, hingga ringkasan saldo. Fitur ini berfungsi sebagai jalan pintas agar tidak perlu menutup aplikasi saat ingin berpindah dari menu filter dan search ke menu utama.

f. Jika menginputkan selain menu 1-5

  <img width="629" height="450" alt="image" src="https://github.com/user-attachments/assets/516b43f7-3075-4e1d-93b8-e86c7f80a4c4" />

  > Apabila pada menu filter dimasukkan angka di luar pilihan 1 sampai 5, sistem akan langsung menampilkan pesan “Pilihan tidak valid”. Setelah itu, menu filter catatan ditampilkan kembali sehingga dapat memilih opsi yang benar sesuai dengan daftar yang tersedia. Hal ini memastikan agar hanya input yang sesuai dengan menu yang bisa diproses oleh sistem.

g. Jika menginputkan menu pakai huruf bukan angka

  <img width="627" height="223" alt="image" src="https://github.com/user-attachments/assets/0da41826-f2a1-4983-b749-a9f45bef5db1" />

  > Apabila pada menu filter dimasukkan huruf alih-alih angka, sistem akan langsung menolak input tersebut dengan menampilkan pesan “Harus angka! Silakan input ulang”. Dengan begitu, hanya input berupa angka yang valid sesuai pilihan menu 1 sampai 4 yang bisa diterima. Mekanisme ini dibuat untuk memastikan agar sistem tetap berjalan sesuai alur yang benar dan menghindari kesalahan input.

h. Jika mengosongkan input pada menu

<img width="642" height="221" alt="image" src="https://github.com/user-attachments/assets/cd658bc2-873a-428e-8b33-469f9fa152e4" />

Maka akan muncul pesan "Harus angka! Silakan input ulang:".


### 7. Menu Set Batas Pengeluaran

<img width="697" height="420" alt="image" src="https://github.com/user-attachments/assets/9c7eaf12-58ae-4787-91b2-1298c2fa5819" />

> Ketika menginputkan angka 7 pada menu utama, sistem akan menampilkan menu Set Batas Pengeluaran Bulanan. Pada menu ini, ditunjukkan terlebih dahulu batas pengeluaran saat ini. Jika batas belum pernah ditentukan, maka statusnya akan ditampilkan sebagai “tidak diaktifkan”. Selanjutnya, diminta untuk memasukkan batas baru sesuai kebutuhan, atau mengetik angka 0 apabila ingin menonaktifkan fitur batas pengeluaran.

<img width="715" height="195" alt="image" src="https://github.com/user-attachments/assets/529ef75f-34ed-42e2-8f88-1a625e7e4991" />

> Setelah memasukkan batas pengeluaran baru, sistem akan menampilkan informasi yang lebih detail. Batas pengeluaran ditetapkan sesuai angka yang dimasukkan, misalnya Rp 1.000.000. Kemudian, sistem menampilkan total pengeluaran saat ini, yaitu Rp 535.000. Dari data tersebut, dihitung sisa ruang anggaran sebesar Rp 465.000. Informasi ini membantu dalam memantau sejauh mana pengeluaran mendekati batas yang sudah ditentukan. Setelah itu, dapat mengetik angka 0 untuk kembali ke menu utama.

<img width="733" height="218" alt="image" src="https://github.com/user-attachments/assets/5cc2fd79-04b4-4ba8-bd90-8cb28cff1bc8" />

> Ketika batas pengeluaran baru ditetapkan sebesar Rp 1.000.000, sistem langsung membandingkannya dengan total pengeluaran yang sudah tercatat. Dari hasil perhitungan, total pengeluaran mencapai Rp 4.035.000, yang berarti jauh melebihi batas yang telah ditentukan. Akibatnya, sisa ruang anggaran menjadi negatif, yaitu Rp -3.035.000. Sistem kemudian memberikan peringatan dengan jelas berupa pesan: “Pengeluaran sudah melebihi batas !!!”. Hal ini berfungsi sebagai pengingat agar lebih berhati-hati dalam mengatur keuangan. Setelah informasi ini ditampilkan, dapat mengetik angka 0 untuk kembali ke menu utama.

<img width="706" height="162" alt="image" src="https://github.com/user-attachments/assets/f7adb9fd-b96a-4b6f-8d75-068e41b4ae9e" />

> Ketika batas pengeluaran diatur dengan nilai 0, sistem akan secara otomatis menonaktifkan fitur pembatasan pengeluaran bulanan. Setelah itu, ditampilkan pesan konfirmasi berupa “Batas pengeluaran bulanan dinonaktifkan” sebagai tanda bahwa pengaturan sebelumnya tidak lagi berlaku. Untuk kembali ke menu utama, cukup mengetik angka 0 sesuai instruksi yang diberikan sistem.

<img width="688" height="150" alt="image" src="https://github.com/user-attachments/assets/04b689b2-6cb4-4ff9-be2d-d9f1fe62f9a1" />

> Ketika mengosongkan input "Masukkan batas baru (ketik 0 untuk menonaktifkan):", makan akan muncul pesan "Tidak boleh kosong. Coba lagi", sehingga hanya boleh mengisi batas pengeluaran terbaru atau ketik 0 untuk menonaktifkan.

<img width="675" height="133" alt="image" src="https://github.com/user-attachments/assets/e65fd4c4-af86-4bf2-a6fe-5db1148ab43c" />

> Ketika menginputkan batas pengeluaran dengan angka negatif, maka akan muncul pesan "Tidak boleh negatif. Coba lagi" dan sistem akan meminta menginputkan ulang batas pengeluaran atau input 0 untuk menonaktifkan.


### 8. Menu Keluar

<img width="454" height="401" alt="image" src="https://github.com/user-attachments/assets/d0652801-2e8f-47f5-9db6-a739c1f7b7ce" />

> Ketika menginputkan angka 8 pada menu utama, sistem akan langsung menutup aplikasi Pocket Guard. Sebelum keluar, ditampilkan pesan ucapan terima kasih berupa “Terima kasih telah menggunakan POCKET GUARD” serta doa agar keuangan selalu aman dan terjaga. Dengan begitu, aplikasi benar-benar mengakhiri jalannya program setelah perintah keluar dipilih.

### 9. Jika Menginputkan Menu Selain Menu 1-8, Menginputkan Menu Pakai Huruf Bukan Angka, dan Mengosongkan inputan pada saat input menu 1-8

<img width="430" height="702" alt="image" src="https://github.com/user-attachments/assets/640fee0c-2940-4da6-8931-8cde3526e169" />

> Ketika menginputkan angka di luar rentang 1 sampai 8 pada menu utama, sistem akan menampilkan pesan “Pilihan tidak valid. Silakan coba lagi!!!” lalu mengembalikan tampilan ke menu utama agar dapat memilih ulang menu yang benar.


<img width="431" height="326" alt="image" src="https://github.com/user-attachments/assets/5e558d4d-c4b3-4581-b535-eaf94c632bc6" />

> Selain itu, jika input yang dimasukkan berupa huruf atau teks alih-alih angka, sistem akan menolak dengan menampilkan pesan “Harus angka! Silakan input ulang:” kemudian meminta masukan baru sampai format yang dimasukkan benar berupa angka dalam rentang 1–8.


<img width="404" height="325" alt="image" src="https://github.com/user-attachments/assets/325cdbbe-ea57-43c5-a232-41ac93870e5a" />

> Jika input yang dimasukkan kosong atau bukan angka, sistem akan menolak dengan menampilkan pesan “Harus angka! Silakan input ulang:”, lalu meminta pengguna untuk memasukkan kembali pilihan menu dalam bentuk angka 1–8.


