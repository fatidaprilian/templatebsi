#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const readline = require('readline');

const outlines = {
  '1': {
    id: '1',
    name: 'Proyek Inovasi Perangkat Lunak',
    slug: 'inovasi',
    dir: 'pkl-ti-inovasi',
    babs: ['bab1', 'bab2', 'bab3', 'bab4', 'bab5', 'bab6'],
  },
  '2': {
    id: '2',
    name: 'Analisa Program Berbasis Mobile',
    slug: 'mobile',
    dir: 'pkl-ti-mobile',
    babs: ['bab1', 'bab2', 'bab3', 'bab4'],
  },
  '3': {
    id: '3',
    name: 'Jaringan Komputer',
    slug: 'jaringan',
    dir: 'pkl-ti-jaringan',
    babs: ['bab1', 'bab2', 'bab3', 'bab4'],
  },
  '4': {
    id: '4',
    name: 'Analisis Sistem',
    slug: 'analisis-sistem',
    dir: 'pkl-ti-analisis-sistem',
    babs: ['bab1', 'bab2', 'bab3', 'bab4'],
  },
};

function parseArgs(args) {
  const parsed = {
    targetDir: null,
    type: null,
    outline: null,
    yes: false,
    force: false,
    help: false,
  };

  for (let i = 0; i < args.length; i++) {
    const arg = args[i];
    if (arg === '-h' || arg === '--help') {
      parsed.help = true;
    } else if (arg === '-y' || arg === '--yes') {
      parsed.yes = true;
    } else if (arg === '-f' || arg === '--force') {
      parsed.force = true;
    } else if (arg === '-t' || arg === '--type') {
      parsed.type = args[++i];
    } else if (arg.startsWith('--type=')) {
      parsed.type = arg.slice(7);
    } else if (arg === '-o' || arg === '--outline') {
      parsed.outline = args[++i];
    } else if (arg.startsWith('--outline=')) {
      parsed.outline = arg.slice(10);
    } else if (arg === '-d' || arg === '--dir') {
      parsed.targetDir = args[++i];
    } else if (arg.startsWith('--dir=')) {
      parsed.targetDir = arg.slice(6);
    } else if (!arg.startsWith('-') && !parsed.targetDir) {
      parsed.targetDir = arg;
    }
  }

  return parsed;
}

function printHelp() {
  console.log(`Template Typst PKL & Proposal UBSI Scaffolder CLI
Program Studi: Teknologi Informasi (S1)

Penggunaan:
  npx github:fatidaprilian/templatebsi [nama-folder] [opsi]

Opsi:
  -t, --type <proposal|laporan>  Pilih jenis naskah:
                                   proposal : Proposal PKL (3 Bab)
                                   laporan  : Laporan Akhir PKL (default)
  -o, --outline <1|2|3|4>        Pilih outline untuk Laporan Akhir:
                                   1 : Proyek Inovasi Perangkat Lunak (6 Bab) (default)
                                   2 : Analisa Program Berbasis Mobile (4 Bab)
                                   3 : Jaringan Komputer (4 Bab)
                                   4 : Analisis Sistem (4 Bab)
  -y, --yes                      Gunakan seluruh nilai default tanpa interaksi
  -f, --force                    Timpa berkas bila direktori tujuan telah berisi proyek
  -h, --help                     Tampilkan bantuan ini

Contoh:
  npx github:fatidaprilian/templatebsi my-laporan
  npx github:fatidaprilian/templatebsi . --force
  npx github:fatidaprilian/templatebsi proposal-pkl --type proposal --yes
  npx github:fatidaprilian/templatebsi laporan-jaringan --type laporan --outline 3 --yes
`);
}

function createPromptReader() {
  const isInteractive = Boolean(process.stdin.isTTY);
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
    terminal: isInteractive,
  });

  const lines = [];
  let waitingResolver = null;
  let isClosed = false;

  rl.on('line', line => {
    if (waitingResolver) {
      const res = waitingResolver;
      waitingResolver = null;
      res(line.trim());
    } else {
      lines.push(line.trim());
    }
  });

  rl.on('close', () => {
    isClosed = true;
    if (waitingResolver) {
      const res = waitingResolver;
      waitingResolver = null;
      res('');
    }
  });

  return {
    ask(q, defaultValue = '') {
      if (lines.length > 0) {
        const line = lines.shift();
        return Promise.resolve(line || defaultValue);
      }
      if (isClosed) {
        return Promise.resolve(defaultValue);
      }
      process.stdout.write(q);

      if (!isInteractive) {
        // Non-TTY fallback: jika tidak ada input setelah 300ms, jangan gantung/block proses
        return new Promise(res => {
          const timer = setTimeout(() => {
            if (waitingResolver) {
              waitingResolver = null;
              process.stdout.write(`${defaultValue} (default)\n`);
              res(defaultValue);
            }
          }, 300);

          waitingResolver = ans => {
            clearTimeout(timer);
            res(ans || defaultValue);
          };
        });
      }

      return new Promise(res => {
        waitingResolver = ans => res(ans || defaultValue);
      });
    },
    close() {
      rl.close();
    },
  };
}

function copyFileSync(src, dest) {
  const parent = path.dirname(dest);
  if (!fs.existsSync(parent)) fs.mkdirSync(parent, { recursive: true });
  fs.copyFileSync(src, dest);
}

function copyDirSync(src, dest) {
  if (!fs.existsSync(dest)) fs.mkdirSync(dest, { recursive: true });
  for (const ent of fs.readdirSync(src, { withFileTypes: true })) {
    const s = path.join(src, ent.name);
    const d = path.join(dest, ent.name);
    if (ent.isDirectory()) copyDirSync(s, d);
    else fs.copyFileSync(s, d);
  }
}

function resolveOutline(outlineArg) {
  if (!outlineArg) return null;
  const lower = String(outlineArg).trim().toLowerCase();
  if (outlines[lower]) return outlines[lower];
  for (const key of Object.keys(outlines)) {
    const o = outlines[key];
    if (o.slug === lower || o.name.toLowerCase().includes(lower)) {
      return o;
    }
  }
  return null;
}

function resolveIsProposal(typeArg) {
  if (!typeArg) return null;
  const lower = String(typeArg).trim().toLowerCase();
  if (lower === '1' || lower === 'prop' || lower === 'proposal') return true;
  if (lower === '2' || lower === 'lap' || lower === 'laporan' || lower === 'akhir') return false;
  return null;
}

async function main() {
  const parsed = parseArgs(process.argv.slice(2));

  if (parsed.help) {
    printHelp();
    return;
  }

  console.log('====================================================');
  console.log('Template Typst PKL & Proposal UBSI Scaffolder CLI');
  console.log('Program Studi: Teknologi Informasi (S1)');
  console.log('====================================================\n');

  const pr = createPromptReader();

  let targetDirName = parsed.targetDir || '';
  let isProposal = resolveIsProposal(parsed.type);
  let selectedOutline = resolveOutline(parsed.outline);

  try {
    const defaultName = 'laporan-pkl-ubsi';
    if (!targetDirName) {
      if (parsed.yes) {
        targetDirName = defaultName;
      } else {
        targetDirName = await pr.ask(`Nama folder proyek [${defaultName}]: `, defaultName);
      }
    }

    if (isProposal === null) {
      if (parsed.yes) {
        isProposal = false;
      } else {
        console.log('\nPilih Jenis Dokumen:');
        console.log('  1. Proposal PKL (3 Bab)');
        console.log('  2. Laporan Akhir PKL (4 Pilihan Outline)');
        const jenisChoice = await pr.ask('Pilihan Anda [1-2] (default: 2): ', '2');
        isProposal = jenisChoice === '1';
      }
    }

    if (!isProposal && !selectedOutline) {
      if (parsed.yes) {
        selectedOutline = outlines['1'];
      } else {
        console.log('\nPilih Outline Laporan PKL Teknologi Informasi:');
        console.log('  1. Proyek Inovasi Perangkat Lunak (6 Bab)');
        console.log('  2. Analisa Program Berbasis Mobile (4 Bab)');
        console.log('  3. Jaringan Komputer (4 Bab)');
        console.log('  4. Analisis Sistem (4 Bab)');
        const outlineChoice = await pr.ask('Pilihan Outline [1-4] (default: 1): ', '1');
        selectedOutline = outlines[outlineChoice] || outlines['1'];
      }
    }

    const targetDir = path.resolve(process.cwd(), targetDirName);
    const conflictingFiles = ['lib.typ', 'metadata.typ', 'pustaka.bib', 'main.typ', 'bab']
      .filter(f => fs.existsSync(path.join(targetDir, f)));

    if (conflictingFiles.length > 0) {
      if (parsed.force) {
        console.warn(`\n[PERINGATAN] Berkas proyek sudah ada di '${targetDirName}', menimpa berkas (--force).`);
      } else if (process.stdin.isTTY && !parsed.yes) {
        const confirm = await pr.ask(
          `\n[PERINGATAN] Berkas proyek (${conflictingFiles.join(', ')}) sudah ada di '${targetDirName}'.\nTimpa berkas yang ada? [y/N]: `,
          'n'
        );
        if (confirm.toLowerCase() !== 'y' && confirm.toLowerCase() !== 'yes') {
          console.log('\nOperasi dibatalkan.');
          return;
        }
      } else {
        console.error(
          `\nError: Direktori '${targetDirName}' sudah memuat berkas proyek (${conflictingFiles.join(', ')}).\n` +
          `Gunakan opsi --force (-f) untuk menimpa berkas.`
        );
        process.exit(1);
      }
    }

    console.log(`\nMenyiapkan proyek di: ${targetDir} ...`);

    const pkgRoot = path.resolve(__dirname, '..');

    // 1. Copy core files
    copyFileSync(path.join(pkgRoot, 'lib.typ'), path.join(targetDir, 'lib.typ'));
    copyFileSync(path.join(pkgRoot, 'template/metadata.typ'), path.join(targetDir, 'metadata.typ'));
    copyFileSync(path.join(pkgRoot, 'template/pustaka.bib'), path.join(targetDir, 'pustaka.bib'));
    copyFileSync(
      path.join(pkgRoot, 'template/gambar/logo-ubsi.png'),
      path.join(targetDir, 'gambar/logo-ubsi.png')
    );

    // 2. Adjust and copy sections
    if (isProposal) {
      copyDirSync(path.join(pkgRoot, 'template/bagian-awal'), path.join(targetDir, 'bagian-awal'));

      const awalPath = path.join(targetDir, 'bagian-awal');
      for (const f of fs.readdirSync(awalPath)) {
        if (f.endsWith('.typ')) {
          const filePath = path.join(awalPath, f);
          let c = fs.readFileSync(filePath, 'utf8');
          c = c.replace(/\.\.\/\.\.\/lib\.typ/g, '../lib.typ');
          c = c.replace(/\.\.\/metadata\.typ/g, '../metadata.typ');
          fs.writeFileSync(filePath, c, 'utf8');
        }
      }

      const babSrc = path.join(pkgRoot, 'template/outlines/proposal');
      fs.mkdirSync(path.join(targetDir, 'bab'), { recursive: true });
      ['bab1.typ', 'bab2.typ', 'bab3.typ'].forEach(b => {
        let content = fs.readFileSync(path.join(babSrc, b), 'utf8');
        content = content.replace(/\.\.\/\.\.\/metadata\.typ/g, '../metadata.typ');
        content = content.replace(/\.\.\/\.\.\/lib\.typ/g, '../lib.typ');
        fs.writeFileSync(path.join(targetDir, 'bab', b), content, 'utf8');
      });

      let propContent = fs.readFileSync(path.join(pkgRoot, 'template/proposal.typ'), 'utf8');
      propContent = propContent.replace(/#import "\.\.\/lib\.typ": \*/g, '#import "lib.typ": *');
      propContent = propContent.replace(/logo-path: "public\/logo-ubsi\.png"/g, 'logo-path: "gambar/logo-ubsi.png"');
      propContent = propContent.replace(/outlines\/proposal\//g, 'bab/');
      fs.writeFileSync(path.join(targetDir, 'main.typ'), propContent, 'utf8');
    } else {
      copyDirSync(path.join(pkgRoot, 'template/bagian-awal'), path.join(targetDir, 'bagian-awal'));
      copyDirSync(path.join(pkgRoot, 'template/bagian-akhir'), path.join(targetDir, 'bagian-akhir'));

      ['bagian-awal', 'bagian-akhir'].forEach(folder => {
        const dirPath = path.join(targetDir, folder);
        for (const f of fs.readdirSync(dirPath)) {
          if (f.endsWith('.typ')) {
            const filePath = path.join(dirPath, f);
            let c = fs.readFileSync(filePath, 'utf8');
            c = c.replace(/\.\.\/\.\.\/lib\.typ/g, '../lib.typ');
            c = c.replace(/\.\.\/metadata\.typ/g, '../metadata.typ');
            fs.writeFileSync(filePath, c, 'utf8');
          }
        }
      });

      fs.mkdirSync(path.join(targetDir, 'bab'), { recursive: true });
      const outlineSrc = path.join(pkgRoot, 'template/outlines', selectedOutline.dir);
      for (const b of selectedOutline.babs) {
        const srcFile = path.join(outlineSrc, `${b}.typ`);
        let c = fs.readFileSync(srcFile, 'utf8');
        c = c.replace(/\.\.\/\.\.\/\.\.\/lib\.typ/g, '../lib.typ');
        c = c.replace(/\.\.\/\.\.\/\.\.\/metadata\.typ/g, '../metadata.typ');
        fs.writeFileSync(path.join(targetDir, 'bab', `${b}.typ`), c, 'utf8');
      }

      let mainContent = fs.readFileSync(path.join(pkgRoot, 'template/main.typ'), 'utf8');
      mainContent = mainContent.replace(/#import "\.\.\/lib\.typ": \*/g, '#import "lib.typ": *');
      mainContent = mainContent.replace(/logo-path: "public\/logo-ubsi\.png"/g, 'logo-path: "gambar/logo-ubsi.png"');

      const babIncludes = selectedOutline.babs.map(b => `#include "bab/${b}.typ"`).join('\n');
      const startMarker = '// OUTLINE PKL: PROYEK INOVASI PERANGKAT LUNAK (6 BAB)';
      const endMarker = '// 4. Bagian Akhir';
      const sIdx = mainContent.indexOf(startMarker);
      const eIdx = mainContent.indexOf(endMarker);
      if (sIdx !== -1 && eIdx !== -1) {
        mainContent = mainContent.slice(0, sIdx) +
          `// OUTLINE PKL: ${selectedOutline.name.toUpperCase()}\n${babIncludes}\n\n` +
          mainContent.slice(eIdx);
      }
      fs.writeFileSync(path.join(targetDir, 'main.typ'), mainContent, 'utf8');
    }

    const subReadme = `# ${isProposal ? 'Proposal PKL UBSI' : `Laporan PKL UBSI - ${selectedOutline.name}`}
Program Studi: Teknologi Informasi (S1)

## Struktur Folder Proyek
- \`main.typ\` : Berkas dokumen utama untuk dikompilasi / dilihat pratinjaunya.
- \`metadata.typ\` : Tempat mengisi Nama, NIM, Judul, Dosen PA, dan tempat PKL.
- \`bab/\` : Berisi draf bab penulisan dokumen Anda.
- \`gambar/\` : Simpan foto, scan dokumen, dan diagram di sini.
- \`pustaka.bib\` : Referensi daftar pustaka (APA Style Versi 6).

## Cara Menulis
1. Buka folder ini di **VS Code** dengan ekstensi **Tinymist Typst** atau unggah ke **[typst.app](https://typst.app)**.
2. Edit identitas pada \`metadata.typ\`.
3. Tulis naskah laporan Anda pada berkas di dalam folder \`bab/\`.
`;
    fs.writeFileSync(path.join(targetDir, 'README.md'), subReadme, 'utf8');

    console.log('\n[BERHASIL] Proyek siap digunakan di: ' + targetDir);
    console.log('\nLangkah selanjutnya:');
    if (path.resolve(targetDir) === process.cwd()) {
      console.log('  1. Anda sudah berada di dalam folder proyek.');
    } else {
      console.log(`  1. Masuk ke folder: cd ${targetDirName}`);
    }
    console.log('  2. Buka metadata.typ untuk melengkapi data identitas.');
    console.log('  3. Mulai menulis naskah di dalam folder bab/.');
    console.log('  4. Pratinjau langsung di VS Code (Tinymist) atau unggah folder ini ke https://typst.app');
  } finally {
    pr.close();
  }
}

main().catch(err => {
  console.error('\nTerjadi kesalahan:', err);
  process.exit(1);
});
