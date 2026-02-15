# Gun 19: Basit Sorgu Fonksiyonlari (View benzeri)

## Bugun Ne Ogreneceksiniz

Bugun ogrenecekleriniz:

- Salt okunur fonksiyonlar nasil yazilir
- Object (nesne) durumu nasil sorgulanir
- Object'lerden degerler nasil dondurulur

## Sorgu Fonksiyonlarini Anlama

**Sorgu fonksiyonlari** salt okunur fonksiyonlardir ve su ozelliklere sahiptir:

- Referans alirlar (`&Object`, `&mut` degil)
- Hicbir seyi degistirmezler
- Object hakkinda bilgi dondururler

Bu fonksiyonlar su durumlar icin kullanislidir:

- Mevcut durumu alma
- Degerleri hesaplama
- Kosullari kontrol etme

## Farm Guncellemeleri

Farm, plotId destegi ile genisletilmistir:

- **PlotId dogrulamasi**: PlotId'ler 1 ile 20 arasinda olmalidir
- **Plot takibi**: Bir vector tum ekilen plot'lari takip eder
- **Tekrar onleme**: Ayni plotId iki kez ekilemez
- **Limit uygulamasi**: Maksimum 20 plot
- **Hasat dogrulamasi**: Var olmayan plot'lar hasat edilemez
- **Shared object'ler (paylasilan nesneler)**: Farm artik bir shared object'tir (`transfer::share_object` kullanilarak)

Tum fonksiyonlar artik `plotId: u8` parametresi almaktadir.

## Goreviniz

1. day_18'deki kod zaten `sources/main.move` dosyasinda plotId destegi eklenmis halde mevcuttur (gerekirse `day_18/sources/solution.move` veya `day_20/sources/main.move` dosyalarini da kontrol edebilirsiniz)
2. Ekilen sayisini donduren `total_planted()` fonksiyonunu yazin
   - `farm: &Farm` alir (salt okunur referans)
   - `u64` dondurur (ekilen sayisi)
3. Hasat edilen sayisini donduren `total_harvested()` fonksiyonunu yazin
   - `farm: &Farm` alir (salt okunur referans)
   - `u64` dondurur (hasat edilen sayisi)

## Test

Bu gun icin testler `tests/day_19_test.move` dosyasinda yer almaktadir. Bu, Sui'nin test scenario framework'u kullanilarak sorgu fonksiyonlarinin nasil test edilecegini gosteren bagimsiz bir test dosyasidir.

Testleri calistirmak icin:
```bash
sui move test
```

## Okuma Materyalleri

1. **Fonksiyonlar** - Fonksiyon sozdizimini gozden gecirin:
   [https://move-book.com/move-basics/function/](https://move-book.com/move-basics/function/)

## Commit

```bash
cd day_19
sui move test
git add day_19/
git commit -m "Day 19: add query helpers for Farm counters"
```
