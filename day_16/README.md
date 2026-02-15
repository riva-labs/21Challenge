# Gun 16: UID (Benzersiz Tanimlayici) ve key (anahtar ability) ile Object (Nesne) Tanitimi

## Bugun Ne Ogreneceksiniz

Bugun ogrenecekleriniz:
- UID'nin (Benzersiz Tanimlayici) ne oldugu
- `key` (anahtar ability) ability'sinin ne anlama geldigi
- Ilk Sui object'inizi (nesnenizi) nasil olusturacaginiz

## UID'yi (Benzersiz Tanimlayici) Anlama

Bir **UID** (Benzersiz Tanimlayici) bir struct'i (veri yapisini) Sui object'i (nesnesi) yapan seydir. Her Sui object'i (nesnesi) sunlara sahip olmalidir:
- Bir `id: UID` alani
- `key` (anahtar) ability'si

UID, `object::new(ctx)` kullanilarak olusturulur, burada `ctx` bir transaction context'tir (islem baglami).

## `key` (Anahtar) Ability'sini Anlama

`key` (anahtar) ability'si su anlama gelir:
- Bu struct (veri yapisi) global depolamada anahtar olarak kullanilabilir
- Sahiplenilebilir ve transfer edilebilir
- Zincir uzerinde depolanabilir

## Farm Guncellemeleri

Farm, plotId destegi ile genisletilmistir:
- **PlotId dogrulamasi**: PlotId'ler 1 ile 20 arasinda olmalidir
- **Plot takibi**: Bir vector ekilen tum plot'lari takip eder
- **Tekrar onleme**: Ayni plotId iki kez ekilemez
- **Limit uygulamasi**: Maksimum 20 plot
- **Hasat dogrulamasi**: Var olmayan plot'lar hasat edilemez

Tum fonksiyonlar artik `plotId: u8` parametresi almaktadir.

## Goreviniz

1. day_15'teki `FarmCounters` zaten `sources/main.move` icinde plotId destegi eklenmis olarak mevcuttur (gerekirse `day_15/sources/solution.move` dosyasini da kontrol edebilirsiniz)
2. Asagidaki alanlara sahip bir `Farm` struct'i (veri yapisi) tanimlayin:
   - `id: UID`
   - `counters: FarmCounters`
   - `has key` ability'si
3. `object::new(ctx)` kullanarak bir UID (benzersiz tanimlayici) olusturan `new_farm()` fonksiyonunu yazin

## Okuma Materyalleri

1. **Object'leri (Nesneleri) Kullanma** - Object (nesne) olusturmayi ogrenin:
   [https://move-book.com/storage/](https://move-book.com/storage/)

2. **Storage Functions (Depolama Fonksiyonlari)** - object::new'i anlayin:
   [https://move-book.com/storage/storage-functions/](https://move-book.com/storage/storage-functions/)

3. **UID & ID** - Benzersiz tanimlayicilari ogrenin:
   [https://move-book.com/storage/uid-and-id/](https://move-book.com/storage/uid-and-id/)

## Ilgili Gunler

- **Gun 15** - FarmCounters struct'i (veri yapisi) (on kosul)
- **Gun 17** - Entry function'lar (giris fonksiyonlari) ve object'lerin (nesnelerin) transferi

## Commit

```bash
cd day_16
sui move test
git add day_16/
git commit -m "Day 16: create Farm object with UID and counters"
```
