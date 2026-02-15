# Gun 7: Habit Tracker icin Birim Testleri

## Bugun Ne Ogreneceksiniz

Bugun ogrenecekleriniz:
- Move'da test yazmayi
- Assertion (dogrulama) kullanmayi
- Testlerinizi nasil organize edeceginizi

## Testleri Anlamak

Move'da testler `#[test]` ile isaretlenmis function (fonksiyon)'lardir. Testler:
- `sui move test` komutunu calistirdiginizda calisir
- Kodunuzun dogru calistigini dogrulamaniza yardimci olur
- Beklenen degerleri kontrol etmek icin assertion (dogrulama) kullanir

Yaygin assertion'lar:
- `assert!(kosul)` - Kosulun dogru olup olmadigini kontrol eder (yerlesik makro)
- `assert_eq!(deger1, deger2)` - Iki degerin esit olup olmadigini kontrol eder (unit_test module'unden)

**Not:** `assert!` Move 2024 surmunde yerlesik bir makrodur, bu nedenle ice aktarmaniza gerek yoktur. Dogrudan kullanabilirsiniz!

## Test Organizasyonu

Iyi testler:
- Bir seferde tek bir seyi test eder
- Neyi test ettigini aciklayan net isimlere sahiptir
- Anlamli test verileri kullanir
- Hem basarili hem de basarisiz durumlari kontrol eder

## Goreviniz

1. day_06'daki kod zaten `sources/main.move` dosyasinda bulunmaktadir (gerekirse `day_06/sources/solution.move` dosyasini da kontrol edebilirsiniz)
2. En az 2 test yazin:
   - Listeye aliskanlik eklemeyi test edin
   - Bir aliskanligi tamamlamayi test edin

## Okuma Materyalleri

1. **Testing (Test Yazimi)** - Test yazmayi ogrenin:
   [https://move-book.com/move-basics/testing/](https://move-book.com/move-basics/testing/)

## Commit

```bash
cd day_07
sui move test
git add day_07/
git commit -m "Day 7: add tests for habit tracker"
```

