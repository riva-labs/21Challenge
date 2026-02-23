# Gun 21: Final Testleri ve Temizlik

## Bugun Ne Ogreneceksiniz

Bugun son gununuz! Yapacaklariniz:

- Farm icin kapsamli testler yazma
- Hata kosullarini ve sinir durumlarini test etme
- Kodunuzu temizleme
- Ogrendiginiz her seyi gozden gecirme

## Test Kapsamini Anlama

Iyi bir test kapsami sunlari icerir:

- **Mutlu yol** - Normal islemler calisir
- **Durum degisiklikleri** - Sayaclar dogru guncellenir
- **Coklu islemler** - Karmasik senaryolar calisir
- **Sinir durumlari** - Sinir kosullari
- **Hata yonetimi** - Gecersiz girdiler reddedilir

## Test Edilecek Farm Ozellikleri

Farm artik su ozellikleri icermektedir:

- **PlotId dogrulamasi**: PlotId'ler 1 ile 20 arasinda olmalidir
- **Plot takibi**: Bir vector tum ekilen plot'lari takip eder
- **Tekrar onleme**: Ayni plotId iki kez ekilemez
- **Limit uygulamasi**: Maksimum 20 plot
- **Hasat dogrulamasi**: Var olmayan plot'lar hasat edilemez

## Goreviniz

1. day_20'deki kod zaten `sources/main.move` dosyasinda mevcuttur (gerekirse `day_20/sources/solution.move` dosyasini da kontrol edebilirsiniz)
2. Kapsamli testler yazin (toplam 8 test):

   **Test 1: test_create_farm**

   - Bir farm olusturun (shared object)
   - Baslangic sayaclarinin sifir oldugunu kontrol edin
   - Farm'i almak icin `test_scenario::take_shared` kullanin

   **Test 2: test_planting_increases_counter**

   - Farm olusturun, plotId 1'i ekin
   - Ekilen sayacinin 1 oldugunu dogrulayin
   - `test_scenario::take_shared` ve `test_scenario::return_shared` kullanin

   **Test 3: test_harvesting_increases_counter**

   - Farm olusturun, plotId 1'i ekin, sonra plotId 1'i hasat edin
   - Her iki sayacin da 1 oldugunu dogrulayin

   **Test 4: test_multiple_operations**

   - plotId'leri 3, 5, 18 ekin (herhangi bir sirada)
   - plotId 5'i hasat edin
   - Ekilen sayacinin 3, hasat edilen sayacinin 1 oldugunu dogrulayin

   **Test 5: test_invalid_plot_id**

   - plotId 0'i ekmeyi deneyin (`E_INVALID_PLOT_ID` ile iptal olmali)
   - plotId 21'i ekmeyi deneyin (`E_INVALID_PLOT_ID` ile iptal olmali)
   - `#[expected_failure(abort_code = E_INVALID_PLOT_ID)]` kullanin

   **Test 6: test_duplicate_plot**

   - plotId 1'i ekin, sonra plotId 1'i tekrar ekmeyi deneyin
   - `E_PLOT_ALREADY_EXISTS` ile iptal olmali
   - `#[expected_failure(abort_code = E_PLOT_ALREADY_EXISTS)]` kullanin

   **Test 7: test_plot_limit**

   - 20 plot ekin (plotId'ler 1-20)
   - 21. bir plot ekmeyi deneyin
   - `E_PLOT_LIMIT_EXCEEDED` ile iptal olmali
   - `#[expected_failure(abort_code = E_PLOT_LIMIT_EXCEEDED)]` kullanin

   **Test 8: test_harvest_nonexistent_plot**

   - Var olmayan bir plot'u hasat etmeyi deneyin
   - `E_PLOT_NOT_FOUND` ile iptal olmali
   - `#[expected_failure(abort_code = E_PLOT_NOT_FOUND)]` kullanin

3. Kodunuzu temizleyin (gereksiz yorumlari kaldirin, tutarliligi saglayin)

## Shared Object'leri Test Etme

Farm artik bir shared object (paylasilan nesne) oldugu icin (`transfer::share_object` kullanilarak), su fonksiyonlari kullanmaniz gerekmektedir:

- `take_from_sender` yerine `test_scenario::take_shared<Farm>(&scenario)`
- `return_to_sender` yerine `test_scenario::return_shared(farm)`

## Hata Kosullarini Test Etme

Fonksiyonlarin dogru sekilde iptal olduklarini test etmek icin `#[expected_failure]` niteligi kullanin:

```move
#[test]
#[expected_failure(abort_code = E_INVALID_PLOT_ID)]
fun test_invalid_plot_id() {
    // Iptal olmasi gereken test kodu
}
```

## Okuma Materyalleri

1. **Kod Kalitesi Kontrol Listesi** - En iyi uygulamalari gozden gecirin:
   [https://move-book.com/guides/code-quality-checklist/](https://move-book.com/guides/code-quality-checklist/)

## Commit

```bash
cd day_21
sui move test
git add day_21/
git commit -m "Day 21: polish code and finalize 3 projects"
```

## Tebrikler!

21 gunluk Sui Move meydan okumasini basariyla tamamladiniz! Artik su konulari anliyorsunuz:

- Move sozdizimi ve temelleri
- struct'lar (veri yapilari), enum'lar, vector'ler
- Sahiplik kavramlari
- Sui object (nesne) modeli
- Entry function'lar (giris fonksiyonlari)
- Event'ler (olaylar)

Harika bir is cikardiniz! Pratik yapmayi ve gelistirmeyi surdurun!
