# Gun 15: Object Model'i (nesne modeli) Okuyun ve FarmState Struct'i (veri yapisi) Olusturun

## Bugun Ne Ogreneceksiniz

Bugun ucuncu projenize baslayacaksiniz: **Farm Simulator**. Ogrenecekleriniz:
- Sui object'lerinin (nesnelerinin) kavramsal olarak ne oldugu
- Sayaclar icin basit bir struct (veri yapisi) nasil olusturulur
- Temel artirma islemleri

## Sui Object'lerini (Nesnelerini) Anlama (Kavram)

Bir **Sui object** (nesnesi) ozel bir struct (veri yapisi) turudur ve:
- Bir adres tarafindan sahiplenilebilir
- Adresler arasinda transfer edilebilir
- Benzersiz bir kimlige sahiptir (UID (benzersiz tanimlayici))
- Zincir uzerinde depolanabilir

**Bugunun Notu:** Bugun henuz bir Sui object (nesnesi) OLUSTURMUYORUZ! Sadece normal bir struct (veri yapisi) olusturuyoruz. Yarin UID (benzersiz tanimlayici) ekleyip onu bir object (nesne) yapacagiz.

## Farm Guncellemeleri

Farm, plotId destegi icermektedir:
- **PlotId dogrulamasi**: PlotId'ler 1 ile 20 arasinda olmalidir
- **Plot takibi**: Bir vector ekilen tum plot'lari takip eder
- **Tekrar onleme**: Ayni plotId iki kez ekilemez
- **Limit uygulamasi**: Maksimum 20 plot
- **Hasat dogrulamasi**: Var olmayan plot'lar hasat edilemez

Tum fonksiyonlar artik `plotId: u8` parametresi almaktadir.

## Goreviniz

1. `sources/main.move` dosyasini acin
2. plotId dogrulamasi ve hata kodlari icin sabitleri tanimlayin
3. Asagidaki alanlara sahip bir `FarmCounters` struct'i (veri yapisi) tanimlayin:
   - `planted: u64`
   - `harvested: u64`
   - `plots: vector<u8>`
4. `copy`, `drop` ve `store` ability'lerini (yeteneklerini) ekleyin (store daha sonra object'ler icin gereklidir)
5. plotId dogrulamasi ile `new_counters()`, `plant(plotId: u8)` ve `harvest(plotId: u8)` fonksiyonlarini yazin

## Okuma Materyalleri

1. **Object Model (Nesne Modeli)** - Sui object'lerini kavramsal olarak ogrenin:
   [https://move-book.com/object/](https://move-book.com/object/)

2. **Object (Nesne) Nedir?** - Kavramini anlayin:
   [https://move-book.com/object/object-model.html/](https://move-book.com/object/object-model.html/)

## Ilgili Gunler

- **Gun 16** - UID (benzersiz tanimlayici) ile ilk Sui object'inizi (nesnenizi) olusturma
- **Gun 17** - Entry function'lar (giris fonksiyonlari) ve object (nesne) sahipligi

## Entry Function'lar (Giris Fonksiyonlari) Rehberi (Yakinda)

Gun 17'den itibaren **entry function'lari (giris fonksiyonlarini)** ogreneceksiniz - explorer'lardan (ornegin https://suiscan.xyz) dogrudan cagrilabilen ozel fonksiyonlar. Bilmeniz gerekenler:

### Entry Function'lar (Giris Fonksiyonlari) Nedir?

Entry function'lar (giris fonksiyonlari) Sui module'unuzun (modulunuzun) genel arayuzudur. Ozellikleri:
- Explorer'lardan dogrudan cagrilabilirler
- `entry` anahtar kelimesi ile isaretlenirler
- (Object olusturuyorlarsa) son parametre olarak `&mut TxContext` almalidir
- Kullanicilarin module'unuzu (modulunuzu) kullanirken etkilestigi fonksiyonlardir

### Temel Entry Function (Giris Fonksiyonu) Deseni

```move
entry fun create_something(ctx: &mut TxContext) {
    // Create an object
    let obj = Object {
      id: object::new(ctx)
    };
    // Transfer it to the sender
    transfer::transfer(obj, ctx.sender());
}
```

### Object (Nesne) Islemleri icin Entry Function'lar (Giris Fonksiyonlari)

Bir object'i (nesneyi) degistirmek istediginizde, entry function'iniz (giris fonksiyonunuz) object'i (nesneyi) alir:

```move
entry fun update_object(obj: &mut MyObject) {
    // Modify the object
    obj.field = new_value;
}
```

### Islem Gonderme

<!-- Screenshots will be added here -->

Entry function'lar (giris fonksiyonlari) hakkinda daha fazlasini Gun 17-21'de ogreneceksiniz!

## Commit

```bash
cd day_15
sui move test
git add day_15/
git commit -m "Day 15: start farm_simulator with FarmCounters"
```
