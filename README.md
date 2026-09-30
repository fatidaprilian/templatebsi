# Template Typst PKL UBSI (Teknologi Informasi)

Template penulisan naskah Proposal dan Laporan Praktik Kerja Lapangan (PKL) berbasis [Typst](https://typst.app) untuk Program Studi **Teknologi Informasi (S1)**, Fakultas Teknik & Informatika, Universitas Bina Sarana Informatika.

Implementasi tata letak dan tipografi mengacu secara ketat pada **Buku Pedoman Praktik Kerja Lapangan (PKL) UBSI Tahun 2026**.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Typst](https://img.shields.io/badge/Typst-0.15%2B-orange.svg)](https://typst.app)
[![Format: Pedoman UBSI](https://img.shields.io/badge/Format-Pedoman%20UBSI%202026-green.svg)](https://bsi.ac.id)

---

## Spesifikasi Format Dokumen

Format dokumen dikonfigurasi secara baku pada pustaka layout (`lib.typ`):

| Parameter | Ketentuan Pedoman UBSI (Bab II) | Konfigurasi Template |
| :--- | :--- | :--- |
| **Ukuran Kertas** | A4 (Poin 2.1.1) | `paper: "a4"` |
| **Batas Margin** | Kiri 4 cm, Atas 3 cm, Kanan 2.5 cm, Bawah 2.5 cm (Poin 2.1.2) | `margin: (left: 4cm, top: 3cm, right: 2.5cm, bottom: 2.5cm)` |
| **Jenis & Ukuran Font** | Times New Roman, 12pt (Poin 2.1.4) | `font: "Times New Roman", size: 12pt` |
| **Spasi Teks** | Spasi 2 pada isi bab (Poin 2.1.3); Spasi 1.5 pada bagian awal | `leading: 12pt` (Isi Bab); `leading: 9pt` (Bagian Awal) |
| **Alinea Baru** | Menjorok 1.2 cm (5-7 ketukan) | `first-line-indent: 1.2cm` |
| **Perataan Teks** | Rata Kanan-Kiri (*Justified*) | `justify: true` |
| **Penomoran Bab & Sub-bab** | Bab: Romawi kapital; Sub-bab: Latin berakhiran titik (Poin 2.3) | `BAB I`, `1.1.`, `1.1.1.` |
| **Penomoran Halaman** | Awal: Romawi kecil bawah-tengah (Poin 2.4.1)<br>Pokok: Awal bab bawah-tengah, lanjutan kanan-atas (Poin 2.4.2)<br>Akhir: Angka latin bawah-tengah (Poin 2.4.3) | Terintegrasi otomatis melalui query posisi bab |
| **Tabel & Gambar** | Judul tabel di atas tengah; Judul gambar di bawah tengah (Poin 2.5) | Penomoran romawi bab (`Gambar III.1`, `Tabel IV.1`) |
| **Sitasi & Pustaka** | Standar APA Style Versi 6 (Poin 2.6.3 & Poin 2.7.10) | `style: "apa"`, pustaka spasi 1, jarak antar pustaka 2 spasi |

---

## Cakupan Outline Program Studi Teknologi Informasi

Disediakan draf bab sesuai 4 outline resmi peminatan TI S1 serta Proposal PKL:

1. **Proposal PKL** (3 Bab):
   - Bab I Pendahuluan
   - Bab II Rencana Kegiatan
   - Bab III Penutup
2. **Laporan PKL - Proyek Inovasi Perangkat Lunak** (6 Bab):
   - Bab I Latar Belakang Ide Aplikasi
   - Bab II Analisis Masalah
   - Bab III Solusi Inovasi
   - Bab IV Tujuan dan Manfaat Aplikasi
   - Bab V Metode Pengembangan Perangkat Lunak
   - Bab VI Penutup
3. **Laporan PKL - Analisa Program Berbasis Mobile** (4 Bab):
   - Bab I Pendahuluan
   - Bab II Landasan Teori
   - Bab III Pembahasan (Flowchart, HIPO, Analisis Program)
   - Bab IV Penutup
4. **Laporan PKL - Jaringan Komputer** (4 Bab):
   - Bab I Pendahuluan
   - Bab II Landasan Teori
   - Bab III Pembahasan (Topologi, IP Address, Hardware/Software, Analisis)
   - Bab IV Penutup
5. **Laporan PKL - Analisis Sistem** (4 Bab):
   - Bab I Pendahuluan
   - Bab II Landasan Teori
   - Bab III Pembahasan (Dokumen/File/Kode/Program Berjalan, UML)
   - Bab IV Penutup

---

## Cara Penggunaan

### 1. Inisialisasi Proyek Baru via CLI (Direkomendasikan)
Gunakan perintah berikut untuk membuat direktori kerja bersih yang hanya memuat outline pilihan Anda:

```bash
npx github:fatidaprilian/templatebsi <nama-folder-proyek>
```

CLI interaktif akan meminta Anda memilih jenis dokumen (Proposal atau Laporan) serta outline yang relevan, kemudian menyusun struktur berkas mandiri (*isolated workspace*).

### 2. Penggunaan via Web Editor (typst.app)
1. Unduh repositori ini melalui tautan ZIP.
2. Unggah folder ke akun Anda di [typst.app](https://typst.app).
3. Buka `template/metadata.typ` untuk konfigurasi data mahasiswa.
4. Buka `template/proposal.typ` (Proposal) atau `template/main.typ` (Laporan Akhir) untuk proses penulisan.

### 3. Penggunaan via Visual Studio Code (Lokal)
1. Pasang ekstensi **Tinymist Typst** (`myriad-dreamit.tinymist`).
2. Buka folder repositori di VS Code.
3. Buka berkas `template/main.typ` atau `template/proposal.typ`.
4. Jalankan perintah preview melalui Command Palette (`Ctrl + Shift + P` -> `Typst Preview: Preview Opened File`).

---

## Konfigurasi Berkas Pendukung Instansi

Berdasarkan pedoman PKL UBSI, berkas bertanda tangan dari instansi/perusahaan dapat disisipkan langsung:

1. Letakkan salinan berkas scan/foto (`.png` atau `.jpg`) pada folder `template/gambar/`.
2. Daftarkan path berkas pada `template/metadata.typ`:
   ```typst
   #let file-surat-keterangan = "gambar/scan-surat-pkl.png" // Lampiran 26
   #let file-nilai-perusahaan = "gambar/scan-nilai-pkl.png"  // Lampiran 27
   #let file-bukti-kuesioner = "gambar/scan-kuesioner.png"   // Lampiran 32
   ```
   *Jika nilai variabel dibiarkan `none`, sistem akan mencetak format formulir resmi standar UBSI.*

---

## Validasi & Pengujian Otomatis

Repositori ini dilengkapi suite pengujian otomatis untuk memverifikasi keabsahan kompilasi Typst:

```bash
npm test
```

Pengujian mencakup kompilasi Proposal PKL dan seluruh 4 outline Laporan PKL.

---

## Lisensi

Repositori ini didistribusikan di bawah lisensi [MIT License](LICENSE).
