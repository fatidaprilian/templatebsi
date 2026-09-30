# Template Typst Laporan PKL & Proposal UBSI
> **Khusus Program Studi Teknologi Informasi (S1) - Fakultas Teknik & Informatika**  
> Template modern, rapi, dan otomatis sesuai standar **Buku Pedoman Praktik Kerja Lapangan (PKL) Universitas Bina Sarana Informatika**.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Typst](https://img.shields.io/badge/Typst-0.11%2B-orange.svg)](https://typst.app)
[![Format: Pedoman UBSI](https://img.shields.io/badge/Pedoman-UBSI%20Resmi-red.svg)](https://bsi.ac.id)

---

## Keunggulan Template

Bagi mahasiswa yang sering mengalami kendala format dokumen bergeser di Microsoft Word atau kerepotan mengunduh paket LaTeX berukuran besar (4-7 GB):

- **Format Standar Otomatis**: Margin, spasi, jenis font, dan posisi nomor halaman (bawah-tengah untuk awal bab, kanan-atas untuk halaman lanjutan) sudah dikonfigurasi otomatis sesuai pedoman resmi kampus.
- **Nol Instalasi (Bisa di Browser)**: Dapat diedit langsung melalui browser web di [typst.app](https://typst.app) tanpa perlu menginstal compiler di perangkat lokal.
- **Kompilasi Cepat**: Dokumen PDF terbuat dalam hitungan milidetik setelah berkas disimpan.
- **Lengkap dengan 4 Outline Program Studi Teknologi Informasi**:
  1. Proyek Inovasi Perangkat Lunak (6 Bab)
  2. Analisa Program Berbasis Mobile (4 Bab)
  3. Jaringan Komputer (4 Bab)
  4. Analisis Sistem (4 Bab)

---

## Cara Penggunaan

### Jalur 1: Menggunakan CLI Interaktif Langsung dari GitHub (Rekomendasi)
Anda dapat membuat folder proyek baru yang rapi sesuai jurusan dan outline pilihan Anda hanya dengan satu perintah Node.js tanpa perlu clone manual:

```bash
npx github:fatidaprilian/templatebsi my-laporan
```

Menu CLI interaktif akan memandu Anda:
1. Memilih jenis dokumen: **Proposal PKL** atau **Laporan Akhir PKL**.
2. Memilih outline PKL yang Anda ambil (Inovasi, Mobile, Jaringan, atau Analisis Sistem).
3. CLI akan otomatis menyalin berkas yang relevan saja ke dalam folder proyek Anda sehingga struktur folder rapi tanpa berkas outline lain yang tidak terpakai.

---

### Jalur 2: Menggunakan Browser Web (typst.app)
1. Unduh repositori ini melalui tombol **Code** -> **Download ZIP**.
2. Ekstrak berkas ZIP di komputer Anda.
3. Buka [typst.app](https://typst.app) dan masuk menggunakan akun Google Anda.
4. Klik **New Project** -> **Upload Project**, lalu pilih folder hasil ekstrak.
5. Anda dapat langsung mengedit dan mengunduh berkas PDF.

---

### Jalur 3: Menggunakan Visual Studio Code (Lokal)
1. Buka folder proyek di **VS Code**.
2. Pasang ekstensi **Tinymist Typst** (`myriad-dreamit.tinymist`).
3. Buka berkas `template/proposal.typ` (untuk proposal) atau `template/main.typ` (untuk laporan PKL).
4. Klik ikon pratinjau di pojok kanan atas untuk melihat tampilan PDF secara langsung.

---

## Pengujian Otomatis (Testing)

Dokumen dalam repositori ini dapat diuji kompilasinya secara otomatis sebagaimana pengujian kode perangkat lunak (`npm test`):

```bash
npm test
```

Perintah tersebut akan menguji dan memvalidasi keabsahan sintaks serta kelayakan kompilasi dari Proposal PKL dan seluruh 4 Outline Laporan PKL.

---

## Peta Berkas Proyek

| Berkas / Folder | Deskripsi & Petunjuk Penggunaan |
| :--- | :--- |
| `template/metadata.typ` | Berkas konfigurasi utama untuk data identitas: Nama, NIM, Kelas, Judul PKL, Dosen PA, Nama Instansi, Tanggal Pelaksanaan, dan Status Kampus Utama/PSDKU. |
| `template/proposal.typ` | Berkas penyusun **Proposal PKL** (Bab 1, 2, 3 dan Lembar Persetujuan Dosen PA). |
| `template/main.typ` | Berkas penyusun **Laporan Akhir PKL** (Cover, Bagian Awal, Bab Isi, hingga Lampiran). |
| `template/outlines/` | Draf bab sesuai outline PKL Anda:<br>- `pkl-ti-inovasi/` : Proyek Inovasi Perangkat Lunak (6 Bab)<br>- `pkl-ti-mobile/` : Analisa Program Berbasis Mobile (4 Bab)<br>- `pkl-ti-jaringan/` : Jaringan Komputer (4 Bab)<br>- `pkl-ti-analisis-sistem/` : Analisis Sistem (4 Bab) |
| `template/gambar/` | Lokasi penyimpanan diagram, flowchart, topologi jaringan, atau foto/scan berkas. |
| `template/pustaka.bib` | Daftar pustaka berformat BibTeX. Otomatis diformat sesuai standar **APA Style Versi 6**. |

---

## Petunjuk Menyisipkan Berkas Scan / PDF dari Perusahaan

Pedoman UBSI memperbolehkan penyisipan berkas asli dari perusahaan (Surat Keterangan, Lembar Nilai, dan Bukti Kuesioner):

### Opsi A: Menggunakan Gambar Scan / Foto (Rekomendasi Template)
1. Ambil foto atau scan berkas resmi bertanda tangan dari perusahaan menggunakan ponsel atau mesin scanner (format **PNG** atau **JPG**).
2. Simpan berkas gambar ke folder `template/gambar/`.
3. Buka berkas `template/metadata.typ` dan daftarkan nama berkasnya:
   ```typst
   #let file-surat-keterangan = "gambar/scan-surat-pkl.png"
   #let file-nilai-perusahaan = "gambar/scan-nilai-pkl.png"
   #let file-bukti-kuesioner = "gambar/scan-bukti-kuesioner.png"
   ```
4. Sistem akan otomatis menampilkan lembar scan tersebut satu halaman penuh pada lampiran laporan.  
*(Catatan: Jika variabel bernilai `none`, sistem otomatis menggunakan template formulir standar UBSI).*

### Opsi B: Menggunakan Berkas PDF
Jika instansi memberikan berkas berformat PDF:
1. **Langsung di Typst**: Typst mendukung penyisipan berkas PDF 1-halaman:
   ```typst
   #let file-surat-keterangan = "gambar/surat-perusahaan.pdf"
   ```
2. **Penggabungan PDF Eksternal (PDF Merge)**:
   - Unduh berkas PDF laporan hasil kompilasi Typst.
   - Gunakan perangkat lunak atau situs penggabung PDF (seperti iLovePDF atau Smallpdf).
   - Sisipkan berkas PDF bertanda tangan dari perusahaan pada nomor halaman lampiran yang bersangkutan.

---

## Petunjuk Lampiran 32: Lembar Kuesioner Pengguna Lulusan

1. Setelah masa PKL selesai serta nilai dan sertifikat telah diperoleh, berikan tautan survei kepuasan kepada mentor atau pimpinan perusahaan:  
   Tautan: [http://tiny.cc/testi-pengguna-lulusan](http://tiny.cc/testi-pengguna-lulusan)
2. Pihak perusahaan mengisi kuesioner Google Form tersebut.
3. Setelah pengisian, pihak perusahaan akan menerima email tanda terima otomatis dari Google Formulir (`forms-receipts-noreply@google.com`).
4. Mahasiswa melampirkan tangkapan layar email tanda terima tersebut pada bagian **Lembar Kuesioner** (melalui variabel `file-bukti-kuesioner` pada `metadata.typ`).

---

## Standar Format Pedoman PKL UBSI

Template telah dikonfigurasi mengikuti pedoman resmi:
- **Ukuran Kertas**: A4
- **Margin**: Kiri 4 cm, Atas 3 cm, Kanan 2.5 cm, Bawah 2.5 cm
- **Jenis dan Ukuran Font**: Times New Roman, 12pt
- **Spasi Paragraf**: 2 (Spasi Ganda) untuk bab isi; 1 (Spasi Tunggal) untuk cover, abstrak, daftar isi, tabel, dan riwayat hidup
- **Penomoran Halaman**:
  - Halaman pertama setiap Bab berada di **Bawah Tengah** (2 cm dari tepi bawah).
  - Halaman lanjutan Bab berada di **Kanan Atas** (2 cm dari tepi atas).
  - Bagian awal menggunakan **angka romawi kecil (i, ii, iii)** di Bawah Tengah.
- **Daftar Pustaka**: Standar sitasi **APA Style Versi 6**.

---

## FAQ (Pertanyaan Umum)

**Q: Bagaimana jika saya kuliah di Kampus PSDKU / Luar Kampus Utama?**  
A: Kampus PSDKU tidak mencantumkan nama kota pada cover dan tidak mencantumkan nama fakultas pada kalimat pengesahan. Ubah konfigurasi pada `template/metadata.typ`:
```typst
#let is-kampus-utama = false
```

**Q: Apa yang harus dilakukan jika dosen meminta berkas Word (.docx)?**  
A: Dokumen resmi yang dikumpulkan ke perpustakaan dan sidang PKL UBSI adalah berkas PDF. Jika dosen pembimbing memerlukan berkas Word untuk proses revisi teks, Anda dapat mengonversi PDF hasil Typst melalui konverter PDF ke Word (seperti iLovePDF).

---

## Lisensi

Proyek ini didistribusikan di bawah lisensi [MIT License](LICENSE).
