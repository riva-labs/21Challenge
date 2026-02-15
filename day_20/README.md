# Gun 20: Event'ler (Olaylar)

## Bugun Ne Ogreneceksiniz

Bugun ogrenecekleriniz:

- Event'lerin (olaylarin) ne oldugu ve neden faydali olduklari
- Bir event struct'i (veri yapisi) nasil tanimlanir
- Event'ler nasil yayinlanir (emit edilir)

## Event'leri Anlama

**Event'ler (olaylar)** bir sey oldugunda kodunuzun gonderebilecegi mesajlardir. Ozellikleri:

- Zincir uzerinde (on-chain) saklanirlar
- Istemciler tarafindan sorgulanabilirler
- Islemlerde neler oldugunu takip etmeye yardimci olurlar

Yaygin kullanim alanlari:

- Onemli eylemleri kaydetme
- Harici sistemleri bilgilendirme
- Islem gecmisi olusturma

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

1. day_19'daki kod zaten `sources/main.move` dosyasinda mevcuttur (gerekirse `day_19/sources/solution.move` dosyasini da kontrol edebilirsiniz)
2. event module'unu (modulunu) ice aktarin: `use sui::event;`
3. Asagidaki ozelliklere sahip bir `PlantEvent` struct'i (veri yapisi) tanimlayin:
   - Alan: `planted_after: u64`
   - Yetenekler: `copy, drop`
   - Format: `public struct PlantEvent has copy, drop { planted_after: u64, }`
4. Ekme isleminden sonra event yayinlamak icin `plant_on_farm_entry(farm: &mut Farm, plotId: u8)` fonksiyonunu guncelleyin:
   - Oncelikle, ekme islemi icin `plant_on_farm(farm, plotId)` fonksiyonunu cagirin
   - `total_planted(farm)` kullanarak toplam ekilen sayisini alin
   - `event::emit(PlantEvent { planted_after: planted_count })` kullanarak event'i yayinlayin
   - Not: Fonksiyon imzasi artik `plotId: u8` parametresini icermektedir

## Okuma Materyalleri

1. **Event'ler** - Event'ler hakkinda bilgi edinin:
   [https://move-book.com/programmability/events/](https://move-book.com/programmability/events/)

## Commit

```bash
cd day_20
sui move test
git add day_20/
git commit -m "Day 20: emit simple PlantEvent when planting"
```
