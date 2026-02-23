# Gun 3: Struct'lar (Aliskanlik Modeli Iskeleti)

## Bugun Ne Ogreneceksiniz

Bugun ogrenecekleriniz:
- Struct (veri yapisi) nedir ve nasil tanimlanir
- Ozel veri tipleri nasil olusturulur
- Constructor (yapici) function'lar (fonksiyonlar) nasil yazilir

## Struct'lari Anlamak

Bir **struct** (veri yapisi), birbiriyle iliskili verileri bir arada gruplayan ozel bir veri tipidir. Birden fazla bilgiyi barindiran bir kapsayici olarak dusunebilirsiniz.

Ornegin, bir `Habit` struct'i sunlari icerebilir:
- Aliskanligin adi
- Tamamlanip tamamlanmadigi

Temel struct sozdizimi:
```move
public struct Habit has copy, drop {
    name: vector<u8>,
    completed: bool,
}
```

## Ability'leri Anlamak

Ability'ler (yetenekler) Move'a bir tip ile neler yapilabilecegini soyler:
- `copy` - Kopyalanabilir
- `drop` - Atilabilir (bellekten silinebilir)
- `store` - Global depolamada saklanabilir (bunu daha sonra ogrenecegiz)
- `key` - Global depolamada anahtar olarak kullanilabilir (bunu daha sonra ogrenecegiz)

Simdilik basit struct'lar icin `copy` ve `drop` kullanin.

## Constructor Fonksiyonlarini Anlamak

Bir **constructor** (yapici fonksiyon), bir struct'in yeni bir ornegini olusturan function'dir (fonksiyondur). Bunu `new_*` seklinde adlandirmak yaygin bir kaliptir:

```move
public fun new_habit(name: vector<u8>): Habit {
    Habit {
        name,
        completed: false,
    }
}
```

## Goreviniz

1. `sources/main.move` dosyasini acin
2. `name: vector<u8>` ve `completed: bool` alanlarina sahip bir `Habit` struct'i tanimlayin
3. Bir `new_habit` constructor function'i yazin

## Okuma Materyalleri

1. **Struct'lar** - Struct'lari tanimlama ve kullanma hakkinda bilgi edinin:
   [https://move-book.com/move-basics/struct/](https://move-book.com/move-basics/struct/)

2. **Ability'ler** - copy, drop, store, key kavramlarini anlayin:
   [https://move-book.com/move-basics/abilities/](https://move-book.com/move-basics/abilities/)

## Commit

```bash
cd day_03
sui move test
git add day_03/
git commit -m "Day 3: add Habit struct and constructor"
```
