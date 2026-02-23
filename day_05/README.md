# Gun 5: Control Flow (Kontrol Akisi) & Aliskanligi Tamamlanmis Olarak Isaretleme

## Bugun Ne Ogreneceksiniz

Bugun ogrenecekleriniz:
- if/else ifadelerini nasil kullanacaginizi
- Vector (dinamik dizi) elemanlarına nasil eriseceginizi
- Struct (veri yapisi) alanlarini nasil degistireceginizi

## Control Flow'u (Kontrol Akisi) Anlama

**Control flow (kontrol akisi)** kodunuzun karar vermesini ve islemleri tekrarlamasini saglar:
- `if/else` - Kosullara gore karar verme
- `while` - Bir kosul dogru oldugu surece kodu tekrarlama
- `loop` - Kodu sonsuza kadar tekrarlama (break ile durdurana kadar)

Temel soz dizimi:
```move
if (condition) {
    // do something
} else {
    // do something else
}
```

## Vector Erisimini Anlama

Bir vector'deki elemanlara erismek icin:
- `vector::length(&vec)` - Eleman sayisini alma
- `vector::borrow(&vec, index)` - Salt okunur bir referans alma (`&` kullanilir)
- `vector::borrow_mut(&mut vec, index)` - Degistirilebilir bir referans alma (`&mut` kullanilir)

**Onemli:** Erisimden once index'in gecerli olup olmadigini her zaman kontrol edin!

## Goreviniz

1. day_04'teki kodunuzu `sources/main.move` dosyasina kopyalayin
2. Bir aliskanligi index'e gore tamamlanmis olarak isaretleyen `complete_habit()` function'i (fonksiyon) yazin
3. Erisimden once index'in gecerli olup olmadigini kontrol edin

## Okuma Materyalleri

1. **Control Flow (Kontrol Akisi)** - if/else, while ve donguler hakkinda bilgi edinin:
   [https://move-book.com/move-basics/control-flow/](https://move-book.com/move-basics/control-flow/)

## Commit

```bash
cd day_05
sui move test
git add day_05/
git commit -m "Day 5: add complete_habit with simple control flow"
```

