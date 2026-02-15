/// GUN 1: Module (Modul) + Primitive Types (Ilkel Tipler) - COZUM
///
/// Bu cozum dosyasidir.
/// Ogrenciler main.move dosyasini tamamlamalidir, bu dosyayi degil.
///
/// Bu cozumu test etmek icin main.move dosyasini gecici olarak yeniden adlandirin ve bu dosyayi kullanin.

module challenge::day_01_solution {
    // Gun 1: Temel module yapisi + primitive types

    // Move'da constant'lar module seviyesinde tanimlanir
    // Degistirilemez (immutable) olmalidir ve BUYUK HARF ile isimlendirilmelidir

    const NUMBER: u64 = 42;           // 64-bit isaretsiz tam sayi
    const FLAG: bool = true;          // Boolean
    const MY_ADDRESS: address = @0x1; // Blockchain adresi
}
