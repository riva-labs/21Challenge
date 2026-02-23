# Gun 6: Aliskanlik Isimleri icin String Tipi

## Bugun Ne Ogreneceksiniz

Bugun ogrenecekleriniz:
- String tipinin ne oldugu
- vector<u8>'in String'e nasil donusturulecegi
- Struct (veri yapisi) icerisinde String'in nasil kullanilacagi

## String'i Anlamak

**String**, metni temsil eden bir tiptir. Move'da String, `vector<u8>` (dinamik dizi) uzerine insa edilmistir, ancak metinle calisma icin daha iyi islevsellik saglar.

Temel islemler:
- `string::utf8(bytes)` - `vector<u8>`'i `String`'e donusturur
- `*&string` - Temel byte'lara referans alir (gerektiginde)

**Neden vector<u8> yerine String kullanalim?**
- Daha anlamsal (acikca metni temsil eder)
- Okunabilirlik icin daha iyidir
- Standart kutuphane, String'e ozel fonksiyonlar (fonksiyon) saglar

## Goreviniz

1. day_05'teki kod zaten `sources/main.move` dosyasindadir (gerekirse `day_05/sources/solution.move` dosyasini da kontrol edebilirsiniz)
2. `Habit` struct'ini, name alani icin `vector<u8>` yerine `String` kullanacak sekilde guncelleyin
3. `new_habit()` fonksiyonunu `String` kabul edecek sekilde guncelleyin
4. Byte'lari String'e donusturen bir yardimci `make_habit()` fonksiyonu yazin

## Okuma Materyalleri

1. **String** - String tipi hakkinda bilgi edinin:
   [https://move-book.com/move-basics/string/](https://move-book.com/move-basics/string/)

## Commit

```bash
cd day_06
sui move test
git add day_06/
git commit -m "Day 6: use String for habit names"
```
