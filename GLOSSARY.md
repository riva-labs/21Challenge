# Move & Sui Sozlugu

Bu challenge boyunca karsilasacaginiz tum terimlerin hizli basvuru rehberi.

---

## A

### Ability (Yetenek)

Move'da bir tip uzerinde hangi islemlerin yapilabilecegini belirleyen yetenekler.

**Dort ability:**

- `copy` - Deger kopyalanabilir
- `drop` - Deger atilabilir/silinebilir
- `store` - Deger baska struct'larin icinde saklanabilir
- `key` - Deger bir object (nesne) olabilir (`id: UID` gerektirir)

**Ornek:**

```move
public struct MyStruct has copy, drop, store {
    field: u64
}
```

**Nerede kullanacaksiniz:** Gun 3 (struct'lar), Gun 16 (object'ler)

---

### Address (Adres)

Blockchain adresini temsil eden bir tip (hesap kimligi gibi).

**Format:** `0x` ve ardindan onaltilik rakamlar (0-9, a-f)

**Ornek:**

```move
let owner: address = @0x1;
let user: address = @0xA1B2C3D4;
```

**Nerede kullanacaksiniz:** Gun 11 (TaskBoard)

---

### Assert (Dogrulama)

Testlerde kosullari kontrol etmenin bir yolu. Kosul yanlis ise test basarisiz olur.

**Ornekler:**

```move
assert!(x > 0, error_code);         // Check condition
assert_eq!(result, expected);      // Check equality
```

**Nerede kullanacaksiniz:** Gun 2 (ilk test), Gun 7 (kapsamli testler)

---

## B

### Borrow (Odunc Alma)

Sahiplik almadan bir degere gecici olarak erismek.

**Iki turu:**

- `&T` - Degismez (immutable) odunc alma (sadece okuma)
- `&mut T` - Degisebilir (mutable) odunc alma (degisiklik yapilabilir)

**Ornek:**

```move
add_habit(&mut list, habit);  // Borrow list mutably
let len = length(&list);      // Borrow list immutably
```

**Nerede kullanacaksiniz:** Gun 4 (ownership), tum challenge boyunca kullanilir

---

### Build (Derleme)

Move kodunuzu Sui'nin calistirabilecegi bytecode'a derleme.

**Komut:** `sui move build`

**Ne yapar:** Sozdizimi, tip guvenligini kontrol eder ve calistirilabilir kod uretir.

---

## C

### Constructor (Yapici Fonksiyon)

Bir struct'in yeni bir ornegini olusturan fonksiyon.

**Gelenek:** Genellikle `new_*` veya `create_*` olarak adlandirilir

**Ornek:**

```move
public fun new_habit(name: String): Habit {
    Habit {
        name,
        completed: false,
    }
}
```

**Nerede kullanacaksiniz:** Gun 3 (Habit constructor'i), tum challenge boyunca kullanilir

---

## D

### Drop (Atma)

Bir degerin atilmasina veya yok edilmesine izin veren ability.

**drop olmadan:** Degerler acikca tuketilmeli veya dondurulmelidir.
**drop ile:** Degerler goz ardi edilebilir veya kapsam disi kalabilir.

**Ornek:**

```move
public struct CanDrop has drop {
    value: u64
}

fun example() {
    let x = CanDrop { value: 5 };
    // x is dropped automatically at end of function
}
```

**Nerede kullanacaksiniz:** Gun 3'ten itibaren (cogu struct buna ihtiyac duyar)

---

## E

### Entry Function (Giris Fonksiyonu)

Dogrudan transaction'lardan/explorer'lardan cagrilabilen fonksiyon.

**Gereksinimler:**

- `entry` anahtar kelimesiyle isaretlenir
- Yalnizca modul seviyesinde olabilir
- Genellikle son parametre olarak `&mut TxContext` alir

**Ornek:**

```move
entry fun create_farm(ctx: &mut TxContext) {
    let farm = Farm { id: object::new(ctx), ... };
    transfer::transfer(farm, ctx.sender());
}
```

**Nerede kullanacaksiniz:** Gun 17-21 (Sui object'leri ve transaction'lar)

---

### Enum (Numaralandirma)

Birden fazla varyanttan biri olabilen bir tip.

**Ornek:**

```move
public enum TaskStatus has copy, drop {
    Open,
    Completed,
}
```

**Nerede kullanacaksiniz:** Gun 9 (TaskStatus)

---

### Event (Olay)

Yurutme sirasinda yayinlanan ve daha sonra sorgulanabilen bir mesaj.

**Ornek:**

```move
public struct PlantEvent has copy, drop {
    planted_after: u64
}

// Emit the event
event::emit(PlantEvent { planted_after: 5 });
```

**Nerede kullanacaksiniz:** Gun 20 (event'ler)

---

## F

### Function (Fonksiyon)

Belirli bir gorevi gerceklestiren adlandirilmis kod blogu.

**Turleri:**

- `fun` - Ozel (sadece modul icinden)
- `public fun` - Diger modullerden cagrilabilir
- `entry fun` - Explorer'lardan cagrilabilir

**Ornek:**

```move
public fun add(a: u64, b: u64): u64 {
    a + b
}
```

**Nerede kullanacaksiniz:** Gun 2'den itibaren (her yerde!)

---

## K

### Key (Anahtar)

Bir struct'in Sui object'i olmasini saglayan ability.

**Gereksinimler:**

- `id: UID` alanina sahip olmali
- Sahiplenilebilir ve transfer edilebilir
- Zincir uzerinde (on-chain) saklanabilir

**Ornek:**

```move
public struct Farm has key {
    id: UID,
    counters: FarmCounters,
}
```

**Nerede kullanacaksiniz:** Gun 16 (ilk Sui object'i)

---

## M

### Module (Modul)

Move kodu icin bir kapsayici. Diger dillerdeki dosya veya paket gibi.

**Yapi:**

```move
module package_name::module_name {
    // structs, functions, etc.
}
```

**Ornek:**

```move
module challenge::day_01 {
    // Your code here
}
```

**Nerede kullanacaksiniz:** Gun 1'den itibaren (her gun bir module icerir)

---

### Move

Ogrendiginiz programlama dili! Blockchain uzerinde guvenli varlik yonetimi icin tasarlanmistir.

**Temel ozellikleri:**

- Nesne merkezli (object-centric)
- Tip guvenli (type-safe)

---

### Mutable (Degisebilir)

Degistirilebilir/duzenlenebilir.

**Kullanim:**

- Degiskenler: `let mut x = 5;` (yeniden atanabilir)
- Referanslar: `&mut T` (odunc alinan deger degistirilebilir)

**Ornek:**

```move
let mut counter = 0;
counter = counter + 1;  // OK, counter is mutable

add_habit(&mut list, habit);  // Mutable borrow
```

---

## O

### Object (Nesne)

Sui'de `key` ability'sine ve `UID` alanina sahip bir struct.

**Ozellikleri:**

- Zincir uzerinde (on-chain) saklanir
- Adresler tarafindan sahiplenilebilir (veya diger sahiplik modelleri)
- Transfer edilebilir
- Benzersiz bir kimlige (ID) sahiptir

**Ornek:**

```move
public struct Farm has key {
    id: UID,
    planted: u64,
}
```

**Nerede kullanacaksiniz:** Gun 15-21 (Sui object'leri)

---

### Option (Opsiyonel)

"Belki bir degere sahip, belki degil" ifadesini temsil eden bir tip.

**Varyantlari:**

- `Some(value)` - Bir degere sahip
- `None` - Deger yok

**Ornek:**

```move
let maybe_index: Option<u64> = option::some(5);
let nothing: Option<u64> = option::none();
```

**Nerede kullanacaksiniz:** Gun 12 (gorev bulma)

---

### Ownership (Sahiplik)

Move'da her degerin tam olarak bir sahibi vardir. Sahiplik transfer edildiginde (tasindiginda), orijinal sahip degeri artik kullanamazler.

**Ornek:**

```move
let habit = new_habit(b"Run");
add_habit(&mut list, habit);  // habit moves into list
// Can't use habit here anymore!
```

**Nerede kullanacaksiniz:** Gun 4 (acikca ogretilir), her yerde kullanilir

---

## P

### Primitive Type (Ilkel Tip)

Move'daki yerlesik temel tipler.

**Yaygin ilkel tipler:**

- `u8`, `u64`, `u128`, `u256` - Isaretsiz tam sayilar (unsigned integer)
- `bool` - Boolean (true/false)
- `address` - Blockchain adresi

**Ornek:**

```move
let count: u64 = 42;
let flag: bool = true;
let owner: address = @0x1;
```

**Nerede kullanacaksiniz:** Gun 1 (giris), her yerde kullanilir

---

### Public (Genel Erisim)

Modul disindandan gorulebilir ve cagrilabilir.

**Kullanim:**

- `public fun` - Fonksiyon diger modullerden ve adreslerden cagrilabilir

**Ornek:**

```move
public fun get_count(counter: &Counter): u64 {
    counter.value
}
```

**Nerede kullanacaksiniz:** Gun 10 (gorunurluk)

---

## R

### Reference (Referans)

Sahiplik almadan bir degere erisme yolu.

**Turleri:**

- `&T` - Degismez referans (sadece okuma)
- `&mut T` - Degisebilir referans (degistirme yapilabilir)

**Ornek:**

```move
fun read_value(x: &u64): u64 { *x }        // Read only
fun increment(x: &mut u64) { *x = *x + 1 } // Can modify
```

**Nerede kullanacaksiniz:** Gun 4'ten itibaren (her yerde!)

---

### Return Type (Donus Tipi)

Bir fonksiyonun dondurdugu degerin tipi.

**Sozdizimi:** `fun name(params): ReturnType { ... }`

**Ornek:**

```move
public fun sum(a: u64, b: u64): u64 {  // Returns u64
    a + b
}
```

**Not:** Move'da son ifade otomatik olarak dondurulur (`return` anahtar kelimesine gerek yoktur).
**Not:** Move'da bir degisken dondururken satir sonuna `;` koymamalisiniz.

---

## S

### Struct (Veri Yapisi)

Ilgili alanlari bir araya getiren ozel bir veri tipi.

**Ornek:**

```move
public struct Habit has copy, drop {
    name: String,
    completed: bool,
}
```

**Nerede kullanacaksiniz:** Gun 3'ten itibaren (temel kavram)

---

### Sui

Uzerine gelistirme yaptiginiz blockchain platformu (temelde diger blockchain'lerin Ferrari'si). Yuksek performansi ve nesne merkezli tasarimiyla bilinir.

---

## T

### Test

Kodunuzun dogru calistigini dogrulayan fonksiyon.

**Isaretlenir:** `#[test]` ozelligiyle

**Ornek:**

```move
#[test]
fun test_sum() {
    let result = sum(1, 2);
    assert_eq!(result, 3);
}
```

**Calistirilir:** `sui move test`

**Nerede kullanacaksiniz:** Gun 2'den itibaren (kodunuzu test etme)

---

### Transaction Context (Islem Baglami) (TxContext)

Mevcut transaction hakkinda bilgi (kim gonderdi, ne zaman, vb.).

**Yaygin kullanimlar:**

- `object::new(ctx)` - Bir UID olusturma
- `ctx.sender()` - Gonderenin adresini alma
- `ctx.epoch()` - Mevcut epoch'u (donem) alma

**Ornek:**

```move
entry fun create_something(ctx: &mut TxContext) {
    let id = object::new(ctx);
    let owner = ctx.sender();
    // ...
}
```

**Nerede kullanacaksiniz:** Gun 16-21 (object'ler ve entry function'lar)

---

### Type Annotation (Tip Aciklamasi)

Bir degiskenin veya ifadenin tipini acikca belirtme.

**Ornek:**

```move
let x: u64 = 5;        // Type annotation
let name: String = b"Alice".to_string();
```

**Nerede kullanacaksiniz:** Gun 1'den itibaren (Move tipler gerektirir)

---

## U

### UID

Unique Identifier (Benzersiz Tanimlayici) - bir struct'i Sui object'i yapan sey.

**Olusturulur:** `object::new(ctx)`

**Ornek:**

```move
public struct Farm has key {
    id: UID,  // Required for objects
    value: u64,
}

fun create_farm(ctx: &mut TxContext): Farm {
    Farm {
        id: object::new(ctx),
        value: 0,
    }
}
```

**Nerede kullanacaksiniz:** Gun 16'dan itibaren (Sui object'leri)

---

## V

### Vector (Dinamik Dizi)

Boyutu buyuyup kuculebilen bir liste.

**Yaygin islemler:**

- `vector::empty<T>()` - Bos vector olusturma
- `vector::push_back(&mut vec, item)` - Sona ekleme
- `vector::length(&vec)` - Boyut alma
- `vector::borrow(&vec, index)` - Eleman okuma
- `vector::borrow_mut(&mut vec, index)` - Eleman degistirme

**Ornek:**

```move
let mut numbers: vector<u64> = vector::empty();
vector::push_back(&mut numbers, 1);
vector::push_back(&mut numbers, 2);
```

**Nerede kullanacaksiniz:** Gun 4 (vector'ler ve listeler)

---

### Visibility (Gorunurluk)

Fonksiyonlara veya struct'lara kimin erisebilecegini/cagirabilecegini kontrol eder.

**Seviyeler:**

- `fun` - Ozel (sadece modul icinden)
- `public fun` - Diger moduller ve adresler cagirabilir
- `entry fun` - Explorer'lardan cagrilabilir

**Nerede kullanacaksiniz:** Gun 10 (acikca ogretilir)

---

## Hizli Basvuru Tablolari

### Ability'ler Hizli Basvuru

| Ability | Anlami                        | Yaygin Kullanim     |
| ------- | ----------------------------- | ------------------- |
| `copy`  | Cogaltiilabilir               | Basit veri tipleri  |
| `drop`  | Atilabilir                    | Cogu struct         |
| `store` | Diger struct'larda saklanabilir| Ic ice veri         |
| `key`   | Object olabilir               | Ust duzey object'ler|

### Ilkel Tipler Hizli Basvuru

| Tip       | Aralik             | Ornek                    |
| --------- | ------------------ | ------------------------ |
| `u8`      | 0 ile 255          | `let x: u8 = 200;`       |
| `u64`     | 0 ile 2^64-1       | `let x: u64 = 1000;`     |
| `u128`    | 0 ile 2^128-1      | `let x: u128 = 1000000;` |
| `bool`    | true/false         | `let x: bool = true;`    |
| `address` | Blockchain adresi  | `let x: address = @0x1;` |

### Referans Tipleri Hizli Basvuru

| Tip      | Anlami                  | Degistirebilir mi?      |
| -------- | ----------------------- | ----------------------- |
| `&T`     | Degismez referans       | Hayir (sadece okuma)    |
| `&mut T` | Degisebilir referans    | Evet                    |
| `T`      | Deger olarak (tasima)   | Sahipligi transfer eder |

---

**Bu Sozlugu Kullanma:**

- Terimleri aramak icin `Ctrl+F` / `Cmd+F` tuslarini kullanin
- Hizli erisim icin bu sayfayi yer imlerine ekleyin
- Terimler, ogrenecceginiz gunlerle iliskilendirilmistir

**Ogrenme Ipucu:** Her seyi ezberlemeye calismayin! Challenge boyunca yeni terimlerle karsilastiginizda bu sozluge geri donun.
