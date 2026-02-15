# Gun 18: Object'leri (Nesneleri) Alma ve Durumu Guncelleme

## Bugun Ne Ogreneceksiniz

Bugun ogrenecekleriniz:
- Object'leri (nesneleri) alan entry function'lar (giris fonksiyonlari) nasil yazilir
- Zincir uzerinde object (nesne) durumu nasil guncellenir
- Transaction'larda (islemlerde) object'ler (nesneler) nasil iletilir

## Entry Function'larda (Giris Fonksiyonlarinda) Object (Nesne) Parametrelerini Anlama

Entry function'lar (giris fonksiyonlari) parametre olarak object'ler (nesneler) alabilir. Bir entry function'i (giris fonksiyonunu) bir object (nesne) ile cagirdiginizda:
- Sahipli object'ler (nesneler) icin: Object (nesne) transaction gondereni tarafindan sahiplenilmis olmalidir
- Paylasilan object'ler (nesneler) icin: Object'e (nesneye) herkes erisebilir (paylasilan object'ler `transfer::share_object()` ile olusturulur)
- Fonksiyon degistirilebilir bir referans alir (`&mut Object`)
- Object'teki (nesnedeki) degisiklikler zincir uzerinde kalici olarak kaydedilir

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

1. day_17'deki kod zaten `sources/main.move` icinde plotId destegi eklenmis olarak mevcuttur (gerekirse `day_17/sources/solution.move` dosyasini da kontrol edebilirsiniz)
2. Asagidakileri yapan bir entry function (giris fonksiyonu) `plant_on_farm_entry(farm: &mut Farm, plotId: u8)` yazin:
   - `farm: &mut Farm` ve `plotId: u8` parametreleri alir
   - Belirtilen plot uzerinde ekim yapmak icin `plant_on_farm(farm, plotId)` fonksiyonunu cagirir
3. Asagidakileri yapan bir entry function (giris fonksiyonu) `harvest_from_farm_entry(farm: &mut Farm, plotId: u8)` yazin:
   - `farm: &mut Farm` ve `plotId: u8` parametreleri alir
   - Belirtilen plot'tan hasat yapmak icin `harvest_from_farm(farm, plotId)` fonksiyonunu cagirir

## Okuma Materyalleri

1. **Object (Nesne) Olarak Alma** - Object (nesne) parametrelerini ogrenin:
   [https://move-book.com/storage/transfer-to-object](https://move-book.com/storage/transfer-to-object)

## Commit

```bash
cd day_18
sui move test
git add day_18/
git commit -m "Day 18: add entry functions to plant and harvest on Farm"
```
