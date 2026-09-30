#import "../../../lib.typ": *

= Pembahasan

== Tinjauan Perusahaan
Uraikan profil lengkap instansi atau perusahaan tempat pelaksanaan PKL:
+ Sejarah singkat berdirinya perusahaan dan perkembangan operasionalnya.
+ Visi, misi, dan struktur organisasi divisi Teknologi Informasi beserta uraian tugasnya.

== Skema Jaringan
=== Topologi Jaringan
Gambarkan skema topologi fisik dan logis jaringan komputer yang saat ini berjalan di perusahaan. Jelaskan alasan teknis pemilihan model topologi tersebut.

#figure(
  rect(width: 80%, height: 6cm, stroke: 1pt + black)[
    #set align(center + horizon)
    Bagan Topologi Jaringan Komputer Perusahaan
  ],
  caption: [Topologi Jaringan Komputer Berjalan],
)
#sumber([Hasil Observasi Divisi IT Perusahaan, 2026])

=== Spesifikasi IP Address
Uraikan alokasi dan pembagian IP Address pada seluruh perangkat server, client, switch, dan router di lingkungan perusahaan dalam tabel subnetting:

#figure(
  table(
    columns: (1.5fr, 2fr, 2fr, 2fr),
    inset: 7pt,
    align: (center + horizon, left + horizon, left + horizon, left + horizon),
    [*Segmen VLAN*], [*Network ID*], [*Rentang IP Host*], [*Gateway*],
    [VLAN 10 - Server], [192.168.10.0/24], [192.168.10.2 - 192.168.10.50], [192.168.10.1],
    [VLAN 20 - Staff], [192.168.20.0/24], [192.168.20.2 - 192.168.20.254], [192.168.20.1],
    [VLAN 30 - Tamu], [192.168.30.0/24], [192.168.30.2 - 192.168.30.100], [192.168.30.1],
  ),
  caption: [Alokasi Pengalamatan IP Jaringan Perusahaan],
)
#sumber([Dokumen Konfigurasi Router Perusahaan, 2026])

=== Spesifikasi Perangkat Keras
Detailkan spesifikasi teknis dari seluruh perangkat keras jaringan yang digunakan di lapangan:
+ *Router Utama*: Mikrotik CCR1036-8G-2S+ (36 Core CPU, 4GB RAM).
+ *Switch Distribusi*: Cisco Catalyst 2960 24-Port Gigabit Managed Switch.
+ *Access Point*: Ubiquiti UniFi AP AC Pro (Dual-band 2.4/5GHz).
+ *Media Transmisi*: Kabel UTP Cat6 Belden dan Fiber Optic Single Mode.

=== Spesifikasi Perangkat Lunak
Deskripsikan sistem operasi server dan perangkat lunak pendukung jaringan:
+ Sistem Operasi Server: Ubuntu Server 22.04 LTS.
+ Sistem Operasi Router: MikroTik RouterOS v7.
+ Alat Monitoring & Analisis: PRTG Network Monitor dan Wireshark.

== Analisa Kemampuan Jaringan Berjalan
Lakukan evaluasi terhadap kinerja nyata dari sistem jaringan komputer:
+ Kestabilan konektivitas internet dan latensi antar workstation.
+ Utilisasi penggunaan bandwidth pada jam sibuk kerja.
+ Penerapan kebijakan keamanan firewall dan filtrasi port.

== Permasalahan Pokok
Deskripsikan secara detail masalah teknis atau kendala yang sering terjadi pada jaringan:
+ Terjadinya perebutan bandwidth yang tidak terkontrol akibat ketiadaan aturan _Queue Tree_ per divisi.
+ Penumpukan kabel jaringan pada rak server (_patch panel_) yang belum terlabeli dengan rapi sehingga menyulitkan proses penanganan insiden putus jalur.
+ Ketiadaan jalur koneksi cadangan (_failover_) saat penyedia jasa internet (ISP) mengalami gangguan.

== Pemecahan Masalah
Tawarkan solusi teknis yang konkret dan aplikatif:
+ Konfigurasi manajemen bandwidth berbasis _Simple Queue_ atau _Queue Tree_ pada router Mikrotik.
+ Penataan ulang jalur kabel (_cable management_) dan pemasangan label nomor kabel pada setiap port switch.
+ Implementasi skema multi-WAN dengan mekanisme _Dual-ISP Failover_ otomatis untuk menjamin ketersediaan layanan jaringan 99.9%.
