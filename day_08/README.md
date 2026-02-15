# Gun 8: Yeni Module & Basit Task Struct

## Bugun Ne Ogreneceksiniz

Bugun yeni bir projeye baslayacaksiniz: **Task Bounty Board**. Ogrenecekleriniz:
- Farkli bir proje icin yeni bir module (modul) nasil olusturulur
- Gorevler icin bir struct (veri yapisi) nasil tasarlanir
- Constructor function (yapici fonksiyon) nasil yazilir

## Proje Organizasyonunu Anlama

Her gun onceki kavramlarin uzerine insa edilir, ancak bazen farkli kaliplari pratik etmek icin sifirdan projeler baslatiyoruz. Bugun bir gorev yonetim sistemi olusturuyoruz.

## Goreviniz

1. `sources/main.move` dosyasini acin
2. Asagidaki alanlara sahip bir `Task` struct'i tanimlayin:
   - `title: String`
   - `reward: u64`
   - `done: bool`
3. Bir `new_task()` constructor function (yapici fonksiyon) yazin

## Okuma Materyalleri

1. **Modules** - Module yapisini gozden gecirin:
   [https://move-book.com/move-basics/module/](https://move-book.com/move-basics/module/)

2. **Structs** - Struct tanimini gozden gecirin:
   [https://move-book.com/move-basics/struct/](https://move-book.com/move-basics/struct/)

## Commit

```bash
cd day_08
sui move test
git add day_08/
git commit -m "Day 8: create bounty_board module and Task struct"
```
