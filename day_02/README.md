# Gun 2: Ilkel Tipler ve Basit Fonksiyonlar

## Bugun Ne Ogreneceksiniz

Bugun ogrenecekleriniz:
- Move'da function (fonksiyon) yazmak
- Fonksiyonlarda ilkel tipleri (u64) kullanmak
- Ilk testinizi yazmak

## Fonksiyonlari Anlamak

Bir **function (fonksiyon)**, belirli bir gorevi yerine getiren bir kod bloklardir. Move'da fonksiyonlar:
- Bir isme sahiptir
- Parametre (girdi) alabilir
- Bir deger dondurebilir
- `public` (disaridan cagrilabilir) veya `fun` (ozel) olarak isaretlenebilir

Temel fonksiyon sozdizimi:
```move
public fun function_name(param1: Type1, param2: Type2): ReturnType {
    // code here
    return_value
}
```

Not: Move'da son ifade otomatik olarak dondurulur (`return` anahtar kelimesine gerek yoktur).

## Testleri Anlamak

Move'da testler `#[test]` ile isaretlenmis fonksiyonlardir. Testler:
- `sui move test` komutunu calistirdiginizda calisir
- Kodunuzun dogru calistigini dogrulamaniza yardimci olur
- Beklenen degerleri kontrol etmek icin assertion'lar (dogrulama ifadeleri) kullanir

Temel test sozdizimi:
``` move
fun test_name() {
    assert_eq!(1 + 1, 2)
}
```

`assert_eq!` bir fonksiyon degil, bir macro (makro) oldugu icin unlem isaretiyle cagrilmalidir. Macro'nun ne oldugunu bilmiyorsaniz, onu daha gelismis bir fonksiyon olarak dusunebilirsiniz. Fonksiyonu cagirmak yerine, gercek kodu oldugu yere kopyalar-yapistirir.

Not: Move'da `assert_eq`'i kullanabilmek icin module (modul) icerisinde `std::unit_test`'ten ice aktarmaniz gerekir. Bunu su sekilde yapabilirsiniz:
``` move
#[test_only]
use std::unit_test::assert_eq;
```

Iyi gelistiriciler, derleyici performansini artirmak icin kapsami test ile ilgili seylerle kirletmemek amaciyla `#[test_only]` kullanmayi tercih ederler. Ayrica, bunun gercek kodla ilgili olmadigini belirtmek icin de iyi bir uygulamadir.

## Goreviniz

1. `sources/main.move` dosyasini acin
2. Iki u64 sayisini toplayan bir `sum` fonksiyonu yazin
3. `sum(1, 2) == 3` ifadesini dogrulayan bir test yazin

## Okuma Materyalleri

1. **Ilkel Tipler** - Temel tipleri inceleyin:
   [https://move-book.com/move-basics/primitive-types/](https://move-book.com/move-basics/primitive-types/)

2. **Fonksiyonlar** - Fonksiyon sozdizimini ve kullanimini ogrenin:
   [https://move-book.com/move-basics/function/](https://move-book.com/move-basics/function/)

3. **Test** - Test temellerini ogrenin:
   [https://move-book.com/move-basics/testing/](https://move-book.com/move-basics/testing/)

## Commit

```bash
cd day_02
sui move test
git add day_02/
git commit -m "Day 2: practice primitive types and functions"
```
