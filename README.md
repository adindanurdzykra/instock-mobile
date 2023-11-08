# Tugas 7

**1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?**
Stateless Widget merupakan widget yang tidak memiliki state internal untuk dikelola sehingga tidak bergantung pada data eksternal atau input pengguna dan tidak mengubah tampilannya saat program berjalan. Hal ini menyebabkan stateless widget bersifat immutable atau tidak dapat diubah setelah widget dibuat. Stateless widget juga bersifat idempotent atau selalu mengembalikan output yang sama untuk setiap input.

Kebalikan dari stateless widget, Stateful Widget adalah widget yang memiliki state internal untuk dikelola sehingga bergantung pada data eksternal atau input pengguna. Oleh karena itu, stateful widget bersifat mutable dan non-idempotent.

**2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.**
- MyHomePage, mengatur layout halaman utama dan mendefinisikan ShopItem
- Scaffold, untuk struktur visual dasar yang mencakup AppBar, Body, dan lain-lain.
- AppBar, menampilkan AppBar di atas layar
- SingleChildScrollView, memungkinkan konten untuk dapat di scroll
- Padding, memberikan padding di sekitar widget
- Text, menampilkan string teks
- 

**3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)**