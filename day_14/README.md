# Gun 14: Bounty Board icin Testler

## Bugun Ne Ogreneceksiniz

Bugun ogrenecekleriniz:
- Kapsamli testler nasil yazilir
- Birden fazla fonksiyon birlikte nasil test edilir
- Test organizasyonu icin en iyi uygulamalar

## Test Kapsamini Anlama

Iyi testler sunlari kapsar:
- **Mutlu yol** - Normal, beklenen kullanim
- **Sinir durumlari** - Sinir kosullari
- **Coklu fonksiyonlar** - Fonksiyonlarin birlikte nasil calistigi

## Goreviniz

1. day_13'teki kod zaten `sources/main.move` dosyasinda (gerekirse `day_13/sources/solution.move` dosyasini da kontrol edebilirsiniz)
2. En az 3 test yazin:
   - Pano olusturun ve gorev ekleyin
   - Bir gorevi tamamlayin ve sayiyi dogrulayin
   - Toplam odulu hesaplayin

## Okuma Materyalleri

1. **Test Yazma** - Test kavramlarini gozden gecirin:
   [https://move-book.com/move-basics/testing/](https://move-book.com/move-basics/testing/)

## Commit

```bash
cd day_14
sui move test
git add day_14/
git commit -m "Day 14: add unit tests for bounty board"
```

