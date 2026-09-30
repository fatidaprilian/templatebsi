# Template Typst Skripsi & PKL UBSI (Teknologi Informasi)

Template modern berbasis [Typst](https://typst.app) untuk penulisan Laporan Praktik Kerja Lapangan (PKL) dan Tugas Akhir / Skripsi bagi mahasiswa Program Studi **Teknologi Informasi**, Fakultas Teknik & Informatika, Universitas Bina Sarana Informatika.

---

## Mengapa Typst?
- **Kompilasi Super Cepat**: Waktu build dokumen hanya dalam hitungan milidetik.
- **Bebas Instalasi Besar**: Tidak perlu mengunduh TeX Live / MiKTeX sebesar 4-7 GB.
- **Preview Real-time**: Perubahan teks langsung terlihat saat mengetik.
- **Dukungan Cloud & Lokal**: Bisa diedit langsung di browser via [Typst Web App](https://typst.app) atau di VS Code.

---

## Cara Penggunaan

### Opsi 1: Lewat Web (Tanpa Install Apapun)
1. Buka [typst.app](https://typst.app) dan login dengan akun Anda.
2. Buat project baru dan unggah (*upload*) folder template ini.
3. Buka file `metadata.typ` untuk mengisi nama, NIM, dan judul skripsi Anda.
4. Tulis isi bab Anda di dalam folder `babs/`. Dokumen PDF akan ter-update otomatis.

### Opsi 2: Lewat VS Code (Lokal)
1. Unduh biner [Typst](https://github.com/typst/typst/releases) atau instal via winget (Windows):
   ```powershell
   winget install --id Typst.Typst
   ```
2. Buka folder ini di **Visual Studio Code**.
3. Pasang extension resmi: **Tinymist Typst** (`myriad-dreamit.tinymist`).
4. Buka file `template/main.typ` lalu tekan tombol preview di pojok kanan atas untuk melihat pratinjau PDF langsung.

---

## Struktur Folder

```text
typst/
├── typst.toml                 # Manifest paket templatebsi
├── lib.typ                    # Core layout engine (margin, font, heading, cover)
└── template/
    ├── main.typ               # File utama dokumen
    ├── metadata.typ           # Identitas mahasiswa, judul, prodi, dan pembimbing
    ├── pustaka.bib            # File referensi/sitasi BibTeX
    ├── gambar/
    │   └── logo-ubsi.png      # Logo resmi UBSI
    └── babs/
        └── bab1.typ           # Bab 1: Pendahuluan
```

---

## Pengaturan Dokumen
Cukup ubah informasi Anda pada file `template/metadata.typ`:
- `judul`: Judul skripsi / PKL Anda
- `jenis`: Pilih `"skripsi"` atau `"pkl"`
- `penulis`: Nama lengkap mahasiswa
- `nim`: Nomor Induk Mahasiswa
- `program-studi`: Default `"Teknologi Informasi"`
