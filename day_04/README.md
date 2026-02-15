# Gun 4: Vector + Ownership Temelleri

## Bugun Ne Ogreneceksiniz

Bugun ogrenecekleriniz:
- Vector (dinamik dizi) nedir ve nasil kullanilir
- Move'da temel ownership (sahiplik) kavramlari
- Bir aliskanlik listesi nasil olusturulur

## Vector'leri Anlamak

Bir **vector (dinamik dizi)** buyuyup kuculebilen bir listedir. Bir array gibidir, ancak dinamiktir.

Temel vector islemleri:
- `vector::empty<T>()` - Bos bir vector olusturur
- `vector::push_back(&mut vec, item)` - Sona bir eleman ekler
- `vector::length(&vec)` - Eleman sayisini dondurur
- `vector::borrow(&vec, index)` - Bir elemana salt okunur referans dondurur
- `vector::borrow_mut(&mut vec, index)` - Bir elemana degistirilebilir referans dondurur

## Ownership'i Anlamak

**Ownership (sahiplik)** Move'da temel bir kavramdir. Her degerin ayni anda yalnizca bir sahibi vardir.

Bir degeri bir function'a (fonksiyon) aktardiginizda:
- **Deger ile** (`&` olmadan): Function'a **ownership aktarirsiniz**
- **Referans ile** (`&` veya `&mut`): Degeri **borrow (odunc alma)** edersiniz (function'in sahipligi yoktur)

Ornekler:
```move
// Transfer ownership - 'habit' is moved into the function
add_habit(list, habit)  // After this, 'habit' can't be used anymore

// Borrow - 'list' is borrowed, not moved
add_habit(&mut list, habit)  // 'list' can still be used after this
```

**Onemli noktalar:**
- `&` = salt okunur borrow (odunc alma)
- `&mut` = degistirilebilir borrow (degistirebilir)
- `&` yok = ownership aktarimi (move)

## Not: Metin Icin String Kullanimi

**Gun 3'ten onemli degisiklik:**

Gun 3'te aliskanlik isimleri icin `vector<u8>` kullandiniz. Gun 4'ten itibaren `String` kullaniyoruz!

```move
// Day 3 (old way)
name: vector<u8>

// Day 4 onwards (modern way)
name: String
```

**Neden degisiklik?**
- `String` daha okunabilir ve anlamlidir
- "Bu bir metindir" ifadesini acikca belirtir
- Standart kutuphane, String'e ozel function'lar saglar
- Yeni Move kodu icin onerilen yontemdir

**Her ikisi de calisir, ancak `String` tercih edilir.** Gun 6'da `String` hakkinda daha fazla sey ogreneceksiniz!

## Goreviniz

1. day_03'teki `Habit` struct'inizi (veri yapisi) `sources/main.move` dosyasina kopyalayin
2. **`vector<u8>` yerine `String` kullanacak sekilde guncelleyin** (ornek icin `main.move` dosyasina bakin)
3. `vector<Habit>` alanina sahip bir `HabitList` struct'i olusturun
4. `empty_list()` ve `add_habit()` function'larini yazin

**Not:** `sources/main.move` dosyasindaki kod zaten `String` kullaniyor - bu kaliba uyabilirsiniz!

## Okuma Materyalleri

1. **Vector** - Vector'ler ve islemleri hakkinda bilgi edinin:
   [https://move-book.com/move-basics/vector/](https://move-book.com/move-basics/vector/)

2. **Ownership & Scope** - Move'da ownership'i anlayin:
   [https://move-book.com/move-basics/ownership-and-scope/](https://move-book.com/move-basics/ownership-and-scope/)

## Commit

```bash
cd day_04
sui move test
git add day_04/
git commit -m "Day 4: add HabitList and push habits into vector"
```
