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
   - Bab II Tempat dan Waktu PKL
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

## Struktur Direktori Proyek

```
templatebsi/
├── lib.typ                   # Engine format baku Pedoman UBSI 2026 (spasi, margin, heading, cover)
├── template/
│   ├── main.typ              # Entrypoint resmi Laporan PKL (Teknologi Informasi)
│   ├── proposal.typ          # Entrypoint resmi Proposal PKL (3 Bab)
│   ├── metadata.typ          # Konfigurasi data mahasiswa, dosen PA, instansi, & switch catatan
│   ├── pustaka.bib           # Sumber pustaka BibTeX (Style APA 6th Edition)
│   ├── public/logo-ubsi.png  # Logo resmi UBSI berwarna (standar 4x4 cm)
│   ├── gambar/               # Folder penyimpanan gambar naskah & berkas scan instansi
│   ├── bagian-awal/          # Lembar Pengesahan, Kata Pengantar, Daftar Isi/Simbol/Gambar/Tabel/Lampiran
│   ├── bagian-akhir/         # Riwayat Hidup, Surat Keterangan, Nilai, Kuesioner, Lampiran-Lampiran
│   └── outlines/             # Draf bab per outline peminatan S1 Teknologi Informasi:
│       ├── proposal/         # Bab 1 s.d. Bab 3 Proposal PKL
│       ├── pkl-ti-inovasi/   # Outline 1: Proyek Inovasi Perangkat Lunak (6 Bab)
│       ├── pkl-ti-mobile/    # Outline 2: Analisa Program Mobile (4 Bab)
│       ├── pkl-ti-jaringan/         # Outline 3: Jaringan Komputer (4 Bab)
│       └── pkl-ti-analisis-sistem/  # Outline 4: Analisis Sistem (4 Bab)
```

---

## Panduan Penggunaan (How to Use)

### 1. Cara Memulai Proyek

Pilih salah satu metode kerja yang paling nyaman untuk Anda:

#### Opsi A: Menggunakan CLI Scaffolder (Paling Praktis)
Perintah ini akan membuat folder kerja mandiri yang hanya memuat outline pilihan Anda (tanpa folder outline lain):
```bash
# Mode Interaktif:
npx github:fatidaprilian/templatebsi <nama-folder-proyek>

# Mode Otomatis / Non-interaktif:
npx github:fatidaprilian/templatebsi my-laporan --type laporan --outline 1 --yes
npx github:fatidaprilian/templatebsi my-proposal --type proposal --yes

# Di dalam folder yang sudah ada / folder aktif (.):
npx github:fatidaprilian/templatebsi . --force
```

CLI mendukung opsi flag berikut:
- `-t, --type <proposal|laporan>` : Memilih jenis dokumen (proposal 3 bab atau laporan akhir).
- `-o, --outline <1|2|3|4>` : Memilih outline laporan (1: Inovasi, 2: Mobile, 3: Jaringan, 4: Analisis Sistem).
- `-y, --yes` : Menggunakan seluruh konfigurasi default tanpa prompt interaktif.
- `-f, --force` : Mengizinkan inisialisasi pada direktori yang sudah ada atau menimpa berkas proyek yang konflik.
- `-h, --help` : Menampilkan petunjuk opsi CLI.

#### Opsi B: Menggunakan Visual Studio Code (Lokal)
1. Pasang ekstensi **Tinymist Typst** (`myriad-dreamit.tinymist`) di VS Code.
2. Buka folder repositori ini di VS Code.
3. Buka berkas `template/main.typ` (untuk Laporan Akhir) atau `template/proposal.typ` (untuk Proposal).
4. Klik tombol ikon **Preview** Tinymist di pojok kanan atas editor (atau gunakan pintasan `Ctrl + K, V`) untuk melihat pratinjau dokumen langsung secara *real-time*.

#### Opsi C: Menggunakan Web Editor Typst (typst.app)
1. Unduh repositori ini dalam bentuk berkas ZIP.
2. Buka akun Anda di [typst.app](https://typst.app), klik **Create Project**, lalu pilih **Upload from ZIP**.
3. Buka berkas `template/main.typ` atau `template/proposal.typ`.

---

### 2. Langkah-Langkah Penulisan Naskah

#### Langkah 1: Mengisi Identitas pada `template/metadata.typ`
Buka berkas `template/metadata.typ` dan lengkapi data Anda:
```typst
#let judul = "SISTEM PEMANTAUAN INFRASTRUKTUR JARINGAN..."
#let penulis = "Nama Mahasiswa"
#let nim = "12200001"
#let kelas = "7A.01"
#let dosen-pa = "Nama Dosen Penasehat Akademik, M.Kom"
#let nama-instansi = "PT. Telekomunikasi Indonesia Prima"
#let divisi-instansi = "Divisi Information Technology & Infrastructure"
#let tanggal-mulai-pkl = "1 Agustus 2026"
#let tanggal-selesai-pkl = "31 Oktober 2026"

// Konfigurasi Kampus (Sesuai Lampiran 1 & 2):
// true  = Kampus Utama (mencantumkan Kota pada cover dan persetujuan)
// false = PSDKU / Luar Kampus Utama (tanpa Kota)
#let is-kampus-utama = true

// Master Switch Catatan Petunjuk Pedoman:
// true  = Menampilkan catatan petunjuk pedoman kampus (disertai peringatan wajib dihapus)
// false = Otomatis menyembunyikan SELURUH catatan petunjuk pedoman saat dijilid/dicetak
#let tampilkan-catatan-pedoman = true
```

#### Langkah 2: Memilih / Mengganti Outline Laporan
Secara default, berkas `template/main.typ` memuat **Outline 1: Proyek Inovasi Perangkat Lunak (6 Bab)**. Jika Anda mengerjakan topik peminatan lain, cukup sesuaikan baris `#include` pada `template/main.typ`:

- **Jaringan Komputer (4 Bab):**
  ```typst
  #include "outlines/pkl-ti-jaringan/bab1.typ"
  #include "outlines/pkl-ti-jaringan/bab2.typ"
  #include "outlines/pkl-ti-jaringan/bab3.typ"
  #include "outlines/pkl-ti-jaringan/bab4.typ"
  ```
- **Program Berbasis Mobile (4 Bab):**
  Ganti dengan folder `outlines/pkl-ti-mobile/bab1.typ` s.d. `bab4.typ`.
- **Analisis Sistem (4 Bab):**
  Ganti dengan folder `outlines/pkl-ti-analisis-sistem/bab1.typ` s.d. `bab4.typ`.

*(Jika Anda menulis Proposal PKL, gunakan langsung `template/proposal.typ` yang memuat 3 Bab resmi).*

#### Langkah 3: Menulis Isi Bab & Fitur Format Baku
Tulis konten naskah Anda pada berkas bab masing-masing. Seluruh format baku Pedoman UBSI sudah diatur otomatis:

- **Heading & Sub-bab (Gambar 2):**
  ```typst
  = Latar Belakang Masalah   // Otomatis tercetak: BAB I \ (2 spasi) \ LATAR BELAKANG MASALAH
  == Kondisi Sistem Berjalan // Otomatis tercetak: 1.1. Kondisi Sistem Berjalan (12pt Bold Rata Kiri)
  === Analisis Kebutuhan     // Otomatis tercetak: 1.1.1. Analisis Kebutuhan (12pt Bold Rata Kiri)
  ```
- **Menyisipkan Gambar (Lampiran 21):**
  ```typst
  #figure(
    image("../gambar/topologi.png", width: 80%),
    caption: [Topologi Jaringan Usulan],
  )
  ```
  *Caption otomatis diformat 2 baris terpusat (`Gambar III.1.` di baris atas dan judul gambar di baris bawah), serta otomatis masuk ke Daftar Gambar dengan nomor urut (`1. Gambar III.1. Topologi Jaringan Usulan ......... 28`).*

- **Menyisipkan Tabel (Lampiran 22):**
  ```typst
  #figure(
    table(
      columns: (1fr, 2fr),
      [*Komponen Perangkat*], [*Spesifikasi Teknis*],
      [Komputer Server], [Intel Xeon 3.2GHz, RAM 32GB],
      [Switch Managed], [Cisco Catalyst 2960 24-Port],
    ),
    caption: [Spesifikasi Perangkat Jaringan],
  )
  ```
  *Isi tabel otomatis berukuran font 10pt dan spasi 1, judul tabel berada di atas, serta otomatis masuk ke Daftar Tabel.*

- **Kutipan Langsung Panjang ($\ge$ 5 Baris) – Poin 2.6.7:**
  ```typst
  #kutipan-panjang(sumber: "Pressman, 2014, hal. 45")[
    Rekayasa perangkat lunak adalah penerapan pendekatan yang sistematis, disiplin, dan terukur terhadap pengembangan, pengoperasian, dan pemeliharaan perangkat lunak, yaitu penerapan rekayasa terhadap perangkat lunak.
  ]
  ```
  *Otomatis diketik dengan spasi 1, teks menjorok 1.2 cm, dan tanpa tanda petik sesuai pedoman.*

- **Sitasi & Daftar Pustaka (APA 6th Edition) – Poin 2.6 & 2.7:**
  - Tambahkan pustaka buku/jurnal ke berkas `template/pustaka.bib`.
  - Sitasi pada teks: `@pressman2014` atau `@tanenbaum2011[hal. 12]`.
  - Daftar pustaka di akhir naskah otomatis diformat dengan *hanging indent*, spasi 1 per entri, dan spasi 2 antar-entri.

#### Langkah 4: Melampirkan Berkas Scan Instansi (Opsional)
Jika instansi tempat PKL Anda telah menerbitkan surat keterangan atau nilai dengan format asli bertanda tangan/stempel:
1. Simpan foto/scan berkas (`.png` atau `.jpg`) di `template/gambar/`.
2. Cantumkan nama berkas pada `template/metadata.typ`:
   ```typst
   #let file-surat-keterangan = "gambar/scan-surat-pkl.png" // Lampiran 26
   #let file-nilai-perusahaan = "gambar/scan-nilai-pkl.png"  // Lampiran 27
   #let file-bukti-kuesioner = "gambar/scan-kuesioner.png"   // Lampiran 32
   ```
   *Jika nilai variabel dibiarkan `none`, template akan otomatis mencetak formulir resmi standar pedoman UBSI.*

#### Langkah 5: Menghilangkan Catatan Petunjuk Sebelum Dijilid / Dicetak
Ketika seluruh naskah sudah selesai diisi dan siap dijilid atau dikumpulkan:
Buka `template/metadata.typ` dan ubah master switch menjadi `false`:
```typst
#let tampilkan-catatan-pedoman = false
```
Seluruh catatan petunjuk pedoman di Daftar Isi, Daftar Simbol, Daftar Gambar, Daftar Tabel, Daftar Lampiran, Daftar Riwayat Hidup, Surat Keterangan, Lembar Nilai, dan Kuesioner **otomatis bersih dan tidak akan muncul di hasil cetak**.

#### Langkah 6: Kompilasi Dokumen ke PDF via Terminal
Jika Anda ingin mengompilasi naskah menjadi berkas PDF melalui terminal / command prompt:
```bash
# Kompilasi Laporan Akhir PKL:
typst compile --root . template/main.typ laporan-pkl.pdf

# Kompilasi Proposal PKL:
typst compile --root . template/proposal.typ proposal-pkl.pdf
```
> [!IMPORTANT]
> Selalu gunakan opsi `--root .` saat mengompilasi agar Typst dapat mengakses pustaka inti `lib.typ` dari direktori root.

---

## Validasi & Pengujian Otomatis

Repositori ini dilengkapi suite pengujian otomatis untuk memvalidasi bahwa seluruh berkas laporan dan proposal dapat dikompilasi secara bebas error:

```bash
npm test
```
*Pengujian memverifikasi kompilasi Proposal PKL dan seluruh 4 outline Laporan PKL S1 TI.*

---

## Lisensi

Repositori ini didistribusikan di bawah lisensi [MIT License](LICENSE).
