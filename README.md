# 21 Gunluk Sui Move Ogrenme Challenge'i

Sui Move programlamayi 21 gunde ogrenmek icin basit ve yeni baslayanlar icin uygun bir rehber.

## Nasil Calisir

**Her gunun ihtiyaciniz olan her seyi iceren kendi klasoru vardir:**

- `day_01/` - Gun 1: Module'ler + Ilkel Tipler
- `day_02/` - Gun 2: Fonksiyonlar
- `day_03/` - Gun 3: Struct'lar
- ...
- `day_21/` - Gun 21: Final Testleri

Her gun klasoru sunlari icerir:
- `README.md` - Kavramlarin aciklamasi + okuma materyalleri
- `Move.toml` - Move paket yapilandirmasi
- `sources/main.move` - TODO yorumlari olan kod dosyaniz

## Baslangic

### On Kosullar

**Programlamaya yeni misiniz?** Ayrintili kurulum talimatlari icin `day_00_setup/README.md` ile baslayinn!

- Sui CLI yuklu ([Hizli Kurulum Rehberi](https://docs.sui.io/build/install) veya `day_00_setup/` klasorune bakin)
- Kod editorru (VS Code onerilir)
- Git yuklu
- Temel terminal bilgisi

**Hazir olup olmadiginizdan emin degil misiniz?** Adim adim talimatlar icin `day_00_setup/README.md` dosyasindaki kurulum rehberine bakin.

### Hizli Baslangicc (Sui CLI Yukluyse)

```bash
# Clone or download the project
cd 21Challenge

# Navigate to day 1
cd day_01

# Read the README
cat README.md

# Build and test
sui move build
sui move test
```

**Ilk kez mi?** Bu komutlarin ayrintili aciklamasi icin asagiya bakin ⬇️

## Nasil Kullanilir

1. **Once Kurulum** (gerekiyorsa): Kurulum yardimi icin `day_00_setup/README.md` dosyasini kontrol edin
2. **Gun 1 ile Baslayin**: `day_01/` klasorune gidin
3. **README'yi Okuyun**: Her gunun README'si sunlari aciklar:
   - Ne ogreneceksiniz
   - Temel kavramlar (orneklerle)
   - Gorevleriniz
   - Okuma materyalleri (Move Book baglantilari)
   - **Ilgili Gunler** - hangi gunlerin bununla baglantili oldugunu gorun
4. **Kodlayin**: `sources/main.move` dosyasini acin ve TODO'lari tamamlayin
   - Talimatlarla birlikte `TODO:` yorumlarini arayin
   - Kod ornekleri ve ipuclari yorum olarak saglanmistir
5. **Test Edin**: O gunun klasorunde `sui move test` calistirin
6. **Takildiyseniz?** Cozumu kontrol edin:
   - Tam cevap icin `sources/solution.move` dosyasina bakin
   - Once kendiniz cozmeyi deneyin!
   - Cozumler mantigi aciklayan yardimci yorumlar icerir
7. **Commit**: Calismanizi commit edin
8. **Sonraki gune gecin**: `day_02/`, `day_03/`, vb. icin tekrarlayin

## Proje Yapisi

```
21Challenge/
├── README.md              # Bu dosya
├── GLOSSARY.md            # Terimler ve tanimlar referansi
├── TROUBLESHOOTING.md     # Yaygin sorunlarin cozumleri
├── CONTRIBUTING.md        # Ceviri duzeltmelerine katki rehberi
├── day_00_setup/          # Kurulum talimatlari (yeniyseniz buradan baslayin!)
│   └── README.md
├── day_01/
│   ├── README.md          # Gun 1 rehberi
│   ├── Move.toml          # Paket yapilandirmasi
│   └── sources/
│       ├── main.move      # Kodunuz (TODO'lari tamamlayin)
│       └── solution.move  # Cozum (takildiysaniz kontrol edin)
├── day_02/
│   ├── README.md
│   ├── Move.toml
│   └── sources/
│       ├── main.move
│       └── solution.move
├── ...
└── day_21/
    ├── README.md
    ├── Move.toml
    └── sources/
        ├── main.move
        └── solution.move
```

### Onemli Dosyalar

- **GLOSSARY.md** - Move terimleri icin hizli basvuru (module, struct, ownership, vb.)
- **TROUBLESHOOTING.md** - Yaygin hatalarin cozumleri
- **CONTRIBUTING.md** - Ceviri duzeltmelerine katki rehberi
- **day_00_setup/** - Ayrintili kurulum rehberi (Sui CLI, VS Code, terminal temelleri)
- **sources/main.move** - TODO'larla birlikte kod dosyaniz
- **sources/solution.move** - Tam cozum (once deneyin, sonra kontrol edin!)

## Ogrenme Hedefleri

Bu challenge'i tamamladiktan sonra sunlari anlayacaksiniz:

- ✅ Move sozdizimi ve temel kavramlar
- ✅ Struct'lar, enum'lar, vector'ler
- ✅ Move'da ownership (sahiplik)
- ✅ Sui object modeli
- ✅ Entry function'lar
- ✅ Event'ler
- ✅ Test yazma

## Gunluk Is Akisi

Her gun icin:

1. **Okuyun** (15-30 dk) - README'yi ve Move Book baglantilarini okuyun
2. **Kodlayin** (30-60 dk) - `main.move` dosyasindaki TODO'lari tamamlayin
3. **Test Edin** (5 dk) - `sui move test` calistirin
4. **Commit Edin** (1 dk) - Calismanizi commit edin

## Komutlari Anlama

### `sui move build`

**Ne yapar:** Move kodunuzu bytecode'a derler

**Nerede calistirilir:** Her gunun klasorunde (ornegin `day_01/` icinde)

**Ne zaman calistirilir:** Kod yazdiktan veya degistirdikten sonra

**Basarili gorunum:**
```
BUILDING day_01
Build successful
```

> **Uyarilar gorebilirsiniz — bu normaldir!** Derleyici `unused function` veya `unused variable` gibi uyarilar gosterebilir. Bunlar hata DEGILDIR. Sonunda `Build successful` gordugunuz surece kodunuz dogruduir.

> **Windows kullanicilari:** Build basarisiz olursa, `Move.lock` dosyasini silip yeniden build'lemeyi deneyin: `rm Move.lock && sui move build`. Ayrintilar icin TROUBLESHOOTING.md dosyasina bakin.

**Hata mi?** TROUBLESHOOTING.md dosyasina bakin veya hata mesajini kontrol edin (satir numarasini gosterir!)

### `sui move test`

**Ne yapar:** Kodunuzun calistigini dogrulamak icin tum test fonksiyonlarini calistirir

**Nerede calistirilir:** Her gunun klasorunde

**Ne zaman calistirilir:** Gorevleri tamamladiktan sonra

**Basarili gorunum:**
```
Running Move unit tests
Test result: OK. Total tests: 3; passed: 3; failed: 0
```

> **Uyarilar gorebilirsiniz — bu normaldir!** Testleri calistirirken de `unused function` gibi uyarilar gorebilirsiniz. Testler geciyorsa (`OK` gosteriyorsa), her sey yolundadir.

**Basarisiz mi?** Tum testler gecene kadar kodu duzeltin. Hata mesaji hangi testin basarisiz oldugunu gosterir.

### Yaygin Terminal Komutlari

```bash
# Show current directory
pwd

# List files
ls

# Change directory (move to a folder)
cd folder_name

# Go back one folder
cd ..

# Go to home directory
cd ~

# Read a file
cat filename.md
```

**Daha fazla yardima mi ihtiyaciniz var?** Terminal temelleri icin `day_00_setup/README.md` dosyasina bakin!

## Uc Proje, Adim Adim Ogrenme

Bu challenge, pratik yapmaniza yardimci olacak **3 farkli proje** icerir:

### Gun 1-7: Habit Tracker (Aliskanlik Takipci)
**Odak:** Move temelleri
- Ogrenin: struct'lar, vector'ler, ownership, kontrol akisi
- Oluseturun: Basit bir aliskanlik takip sistemi

### Gun 8-14: Task Bounty Board (Gorev Odul Panosu)
**Odak:** Orta seviye kavramlar
- Ogrenin: enum'lar, Option, visibility (gorunurluk), aggregation'lar
- Olusturun: Odullu bir gorev yonetim sistemi

### Gun 15-21: Farm Simulator (Ciftlik Simulatoru)
**Odak:** Sui'ye ozel ozellikler
- Ogrenin: Object'ler, UID, entry function'lar, event'ler
- Olusturun: Zincir uzerinde duruma sahip bir ciftlik

Her proje, yenilerini tanitirken onceki kavramlari pekistirir!

## Ogrenme Ozellikleri

Bu challenge, etkili bir sekilde ogrenmenize yardimci olacak cesitli ozellikler icerir:

### 📚 Kapsamli Dokumantasyon
- **GLOSSARY.md** - Tum Move terimleri icin hizli basvuru (alfabetik sirali)
- **TROUBLESHOOTING.md** - Orneklerle yaygin hatalarin cozumleri
- **day_00_setup/** - suiup kullanarak adim adim kurulum rehberi

### 🗺️ Akilli Navigasyon
- Her gunun README'sindeki **Ilgili Gunler** bolumleri gosterir:
  - On kosullar (once hangi gunleri tamamlamalisiniz)
  - Sirada ne var (bu nereye goturur)
  - Gunler arasi baglantili kavramlar

### 💡 Her Gunde Ogrenme Yardimcilari
- Net talimatlarla **TODO yorumlari**
- Sozdizimi ve kaliplari gosteren **kod ornekleri**
- Zor kisimlar icin **ipuclari**
- Aciklayici yorumlarla **tam cozumler**
- Daha derin anlayis icin **Move Book baglantilari**

### 🧪 Test Odakli Ogrenme
- Her gun kodunuzu dogrulamak icin testler icerir
- Gorevleri dogru tamamlayana kadar testler basarisiz olur
- Ilerlemeniz hakkinda aninda geri bildirim

### 🎯 Takildiginizda
1. **Gunun README'sini tekrar okuyun** - cevap genellikle oradadir
2. **GLOSSARY.md'yi kontrol edin** - terimleri anlayin
3. **Kod orneklerine bakin** - nasil yapildigini gorun
4. **TROUBLESHOOTING.md'yi kontrol edin** - yaygin hatalar ve duzeltmeler
5. **solution.move'a goz atin** - ama once deneyin!

## Faydali Baglantilar

- [Move Book](https://move-book.com) - Ana ogrenme kaynak
- [Sui Dokumantasyonu](https://docs.sui.io) - Sui platform belgeleri

## Topluluk ve Destek

Yardima mi ihtiyaciniz var veya diger ogrenenlerle baglaantii kurmak mi istiyorsunuz?

- **WhatsApp Toplulugu:** [Destek grubumuza katilin](https://chat.whatsapp.com/DZH6y2XMDQ58NY5DheUhQs?mode=hqrc)
- **X (Twitter):** [@ercandotsui](https://x.com/ercandotsui)

Soru sormaktan cekinmeyin - birlikte ogrenmek daha iyidir!

## Onemli Notlar

- **Gunun klasorunde calisin**: Her gun kendi icinde tamamdir
- **Kodlamadan once okuyun**: Kavramlari anlamak cok onemlidir
- **Ogrenme yardimcilarini kullanin**: TODO yorumlari, ipuclari ve ornekler yardimci olmak icin oradadir
- **Cozumleri kontrol etmeden once deneyin**: Ogrenme ugrasarak gerceklesir!
- **Ilgili Gunler baglantilarini takip edin**: Ogrenme yolunu anlamaniza yardimci olurlar
- **Basit tutun**: Bu egitim materyalidir, uretim kodu degil
- **Sik test edin**: Her degisiklikten sonra testleri calistirin
- **Referans belgelerini kullanin**: GLOSSARY ve TROUBLESHOOTING en iyi dostlariniz
- **Her gun commit edin**: Ilerlemenizi takip edin
- **Temiz commit'ler**: `.gitignore` dosyasi build artefaktlarini haric tutacak sekilde ayarlanmistir - yalnizca kaynak kodunuzu commit edin

🎉 Basari!

21 gun sonra elinizde olacaklar:
- 21 calisan Move module'u
- Sui Move temellerinin anlayisi
- Kendi Move programlarinizi olusturma becerisi

**Iyi ogrenmeler!**
