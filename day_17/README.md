# Gun 17: Object'lerin (Nesnelerin) Sahipligi ve Basit Entry Function (Giris Fonksiyonu)

## Bugun Ne Ogreneceksiniz

Bugun ogrenecekleriniz:
- Object (nesne) sahipliginin nasil calistigi
- Entry function'larin (giris fonksiyonlarinin) ne oldugu
- Object'lerin (nesnelerin) kullanicilara nasil transfer edilecegi

## Entry Function'lari (Giris Fonksiyonlarini) Anlama

Bir **entry function** (giris fonksiyonu) bir transaction'da (islemde) dogrudan cagrilabilen bir fonksiyondur. `entry` anahtar kelimesi ile isaretlenir:

```move
entry fun create_farm(ctx: &mut TxContext) {
    // This can be called from a transaction
}
```

Entry function'lar (giris fonksiyonlari) module'unuzun (modulunuzun) "genel API'sidir" - kullanicilarin kodunuzla etkilesmek icin cagirdigi fonksiyonlardir.

## Object (Nesne) Transferini Anlama

Bir object (nesne) olusturdugunuzda, onu birine vermeniz gerekir. Yapabilecekleriniz:

1. `transfer::transfer()` kullanarak **sahipligi transfer etme**:
   ```move
   transfer::transfer(farm, ctx.sender())
   ```
   Bu, `farm`'in sahipligini islemi gonderen adrese transfer eder.

2. `transfer::share_object()` kullanarak **object'i (nesneyi) paylasma**:
   ```move
   transfer::share_object(farm)
   ```
   Bu, object'i (nesneyi) zincir uzerinde herkes icin erisilebilir kilar. Bu challenge icin paylasilan object'ler (nesneler) kullaniyoruz.

## Farm Guncellemeleri

Farm, plotId destegi ile genisletilmistir:
- **PlotId dogrulamasi**: PlotId'ler 1 ile 20 arasinda olmalidir
- **Plot takibi**: Bir vector ekilen tum plot'lari takip eder
- **Tekrar onleme**: Ayni plotId iki kez ekilemez
- **Limit uygulamasi**: Maksimum 20 plot
- **Hasat dogrulamasi**: Var olmayan plot'lar hasat edilemez
- **Paylasilan object'ler (nesneler)**: Farm artik paylasilan bir object'tir (nesnedir) (`transfer::share_object` kullanilarak)

Tum fonksiyonlar artik `plotId: u8` parametresi almaktadir.

## Goreviniz

1. day_16'daki kod zaten `sources/main.move` icinde plotId destegi eklenmis olarak mevcuttur (gerekirse `day_16/sources/solution.move` dosyasini da kontrol edebilirsiniz)
2. Asagidakileri yapan bir `entry fun create_farm(ctx: &mut TxContext)` yazin:
   - `new_farm(ctx)` kullanarak bir Farm olusturur
   - `transfer::share_object(farm)` kullanarak paylasilabilir yapar
3. Yardimci fonksiyonlar yazin:
   - `plant_on_farm(farm: &mut Farm, plotId: u8)` - farm.counters uzerinde plotId ile `plant()` fonksiyonunu cagirir
   - `harvest_from_farm(farm: &mut Farm, plotId: u8)` - farm.counters uzerinde plotId ile `harvest()` fonksiyonunu cagirir

## Okuma Materyalleri

1. **Ownership (Sahiplik) (object'ler)** - Object (nesne) sahipligini ogrenin:
   [https://move-book.com/object/ownership/](https://move-book.com/object/ownership/)

2. **Transaction'lar (Islemler)** - Entry function'lari (giris fonksiyonlarini) anlayin:
   [https://move-book.com/concepts/what-is-a-transaction/](https://move-book.com/concepts/what-is-a-transaction/)

## Commit

```bash
cd day_17
sui move test
git add day_17/
git commit -m "Day 17: add Farm entry function and basic actions"
```
