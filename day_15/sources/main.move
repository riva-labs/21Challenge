/// GUN 15: Object Model'i (nesne modeli) Okuyun ve FarmState Struct'i (veri yapisi) Olusturun (henuz UID yok)
///
/// Bugun yapacaklariniz:
/// 1. Sui object'lerini (nesnelerini) kavramsal olarak ogrenmek
/// 2. Farm sayaclari icin basit bir struct (veri yapisi) olusturmak
/// 3. Sayaclari artirmak icin temel fonksiyonlar yazmak
///
/// NOT: Bugun henuz bir Sui object (nesnesi) OLUSTURMUYORUZ, sadece normal bir struct (veri yapisi).
/// Yarin UID (benzersiz tanimlayici) ekleyip onu bir object (nesne) yapacagiz.

module challenge::day_15 {
    // TODO: plotId dogrulamasi icin sabitleri tanimlayin
    // const MAX_PLOTS: u64 = 20;
    // const E_PLOT_NOT_FOUND: u64 = 1;
    // const E_PLOT_LIMIT_EXCEEDED: u64 = 2;
    // const E_INVALID_PLOT_ID: u64 = 3;
    // const E_PLOT_ALREADY_EXISTS: u64 = 4;

    // TODO: Asagidaki alanlara sahip 'FarmCounters' adinda bir struct (veri yapisi) tanimlayin:
    // - planted: u64
    // - harvested: u64
    // - plots: vector<u8>
    // 'copy', 'drop' ve 'store' ability'lerini (yeteneklerini) ekleyin
    // (store gereklidir cunku bunu daha sonra bir object'in (nesnenin) icine koyacagiz)
    // public struct FarmCounters has copy, drop, store {
    //     // Alanlari buraya yazin
    // }

    // TODO: Sifirlarla sayaclar donduren bir 'new_counters' constructor'i (olusturucusu) yazin
    // fun new_counters(): FarmCounters {
    //     // Kodunuz buraya (plots: vector::empty() dahil edin)
    // }

    // TODO: plotId: u8 alan ve planted sayacini artiran bir 'plant' fonksiyonu yazin
    // fun plant(counters: &mut FarmCounters, plotId: u8) {
    //     // Kodunuz buraya
    //     // plotId'yi dogrulayin, limitleri kontrol edin, tekrarlari onleyin
    // }

    // TODO: plotId: u8 alan ve harvested sayacini artiran bir 'harvest' fonksiyonu yazin
    // fun harvest(counters: &mut FarmCounters, plotId: u8) {
    //     // Kodunuz buraya
    //     // Plot'u vector'den bulun ve kaldirin
    // }
}
