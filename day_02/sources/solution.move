/// GUN 2: Ilkel Tipler ve Basit Fonksiyonlar - COZUM
///
/// Bu, gun 2 icin cozum dosyasidir.
/// Ogrenciler bu dosya yerine main.move dosyasini tamamlamalidir.
///
/// Bu cozumu test etmek icin main.move dosyasini gecici olarak yeniden adlandirin ve bu dosyayi kullanin.

module challenge::day_02_solution {
    #[test_only]
    use std::unit_test::assert_eq;

    // Iki u64 sayisini toplayan fonksiyon
    public fun sum(a: u64, b: u64): u64 {
        a + b
    }

    // sum(1, 2) == 3 ifadesini dogrulayan test
    #[test]
    fun test_sum() {
        let result = sum(1, 2);
        assert_eq!(result, 3);
    }
}
