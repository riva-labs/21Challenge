# Gun 1: Module (Modul) + Primitive Types (Ilkel Tipler)

## Bugun Ne Ogreneceksiniz

Bugun Move ogrenmeye basladiginiz ilk gun! Ogrenecekleriniz:
- Bir Move module (modul) nasil olusturulur
- Primitive types (ilkel tipler) nelerdir (u64, bool, address, vb.)
- Temel Move sozdizimi

## Module'leri Anlamak

Move'da bir **module** kodunuz icin bir kapsayici gibidir. Birbiriyle iliskili fonksiyonlari ve veri yapilarini bir arada gruplayan bir dosya olarak dusunebilirsiniz.

Move'da her module'un sunlari vardir:
- Bir isim (ornegin `challenge::day_01`)
- Fonksiyonlar (bir islem yapan kodlar)
- Struct'lar (veri yapilari)

Temel yapi su sekilde gorunur:
```move
module challenge::day_01 {
    // Your code goes here
}
```

## Primitive Types'i Anlamak

Move'da **primitive types** adi verilen bircok yerlesik tip bulunur:
- `u64` - Isaretsiz 64-bit tam sayi (0, 1, 2, 3, ...)
- `u8` - Isaretsiz 8-bit tam sayi (0-255)
- `bool` - Boolean (true veya false)
- `address` - Bir blockchain adresi (ornegin 0x123...)
- `vector<T>` - Bir oge listesi (bunu daha sonra ogrenecegiz)

## Constant'lari (Sabitler) Anlamak

Move'da module seviyesinde **constant** (sabit) tanimlayabilirsiniz:

```move
const NUMBER: u64 = 42;
const FLAG: bool = true;
const MY_ADDRESS: address = @0x1;
```

**Kurallar:**
- `const` anahtar kelimesi kullanin
- Isimler BUYUK HARF olmalidir
- Constant'lar degistirilemezdir (immutable)

## Gun 1 Neden Bu Kadar Basit?

Bugun yazacak fazla kod olmadigini fark edebilirsiniz. Bu kasitlidir!

**Gun 1'in amaci:**
- Gelistirme ortaminizi kurmak
- Ilk komutlarinizi calistirmak (`sui move build`, `sui move test`)
- Proje yapisini anlamak
- Move sodzidimine asina olmak
- Ozguven kazanmak!

**Yarin (Gun 2)** ilk fonksiyonunuzu yazacaksiniz. Bugun araclar ve is akisi ile rahat olmaya odaklanin.

## Move.toml Dosyasini Anlamak

Her Move projesi bir `Move.toml` dosyasina ihtiyac duyar. Icinde ne olduguna bakalim:

```toml
[package]
name = "day_01"           # Paket adiniz
version = "1.0.0"         # Versiyon numarasi
edition = "2024"          # Move dil surumu

[dependencies]
Sui = { git = "https://github.com/MystenLabs/sui.git",
        subdir = "crates/sui-framework/packages/sui-framework",
        rev = "framework/mainnet" }

[addresses]
challenge = "0x0"         # Module adresiniz
```

**Her bolumun anlami:**
- **[package]** - Projeniz hakkinda temel bilgiler
- **[dependencies]** - Harici kutuphaneler (burada Sui framework'u)
- **[addresses]** - Adlandirilmis adresler (burada `challenge`, `0x0` icin bir takma addir)

**Bunu degistirmeniz gerekiyor mu?** Bu challenge icin hayir! Sizin icin zaten dogru sekilde ayarlanmis durumda.

**`challenge::day_01` nedir?**
- `challenge`, `[addresses]` bolumunden gelir (`0x0`'dir)
- `day_01` module adidir
- Birlikte: `challenge::day_01` = tam module yolu

## Goreviniz

1. `sources/main.move` dosyasini acin
2. Primitive types kullanarak uc constant tanimlayin (TODO talimatlarina uyun)
3. Derleyin ve test edin: `sui move build` ve `sui move test`
4. (Istege bagli) Proje yapilandirmasini anlamak icin Move.toml dosyasini okuyun

**Constant'lariniz su sekilde gorunmeli:**
```move
const NUMBER: u64 = 42;
const FLAG: bool = true;
const MY_ADDRESS: address = @0x1;
```

**Beklenen cikti:**
```
BUILDING day_01
Build successful
```

**Henuz test yok mu?** Bu normal! Gun 1'de henuz test fonksiyonlari yok. Testlere Gun 2'de baslayacagiz.

## Okuma Materyalleri

Kod yazmadan once Move Book'tan su bolumleri okuyun:

1. **Hello World** - Ilk Move paketinizi nasil olusturacaginizi ogrenin:
   [https://move-book.com/your-first-move/hello-world/](https://move-book.com/your-first-move/hello-world/)

2. **Modules** - Module yapisini anlayin:
   [https://move-book.com/move-basics/module/](https://move-book.com/move-basics/module/)

3. **Primitive Types** - Temel tipleri ogrenin:
   [https://move-book.com/move-basics/primitive-types/](https://move-book.com/move-basics/primitive-types/)

## Commit

```bash
cd day_01
sui move test
git add day_01/
git commit -m "Day 1: setup package and module"
```
