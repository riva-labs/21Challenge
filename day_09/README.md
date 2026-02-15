# Gun 9: Enum'lar ve TaskStatus

## Bugun Ne Ogreneceksiniz

Bugun ogrenecekleriniz:
- Enum'larin (numaralandirma) ne oldugu ve ne zaman kullanilacagi
- Boolean flag'lerin enum'larla nasil degistirilecegi
- Enum degerlerinin nasil kontrol edilecegi

## Enum'lari Anlama

Bir **enum** (numaralandirma), birden fazla varyantttan biri olabilen bir tiptir. Durumlari veya kategorileri temsil etmek icin mukemmeldir.

"Yapildi mi yapilmadi mi" icin `bool` kullanmak yerine bir enum kullanabiliriz:
```move
enum TaskStatus {
    Open,      // Task is available
    Completed, // Task is finished
}
```

Bu daha iyidir cunku:
- Daha okunabilir (status == Open vs done == false)
- Genisletmesi daha kolay (daha sonra daha fazla durum eklenebilir)
- Tip guvenli (yanlis deger kullanmak mumkun degil)

## Goreviniz

1. `Task` struct'inizi day_08'den `sources/main.move` dosyasina kopyalayin
2. `Open` ve `Completed` varyantlarina sahip bir `TaskStatus` enum'u tanimlayin
3. `Task`'i `done: bool` yerine `status: TaskStatus` kullanacak sekilde guncelleyin
4. Bir `is_open()` fonksiyonu yazin

## Okuma Materyalleri

1. **Enum'lar ve Match** - Enum'lar ve oruntu eslestirme hakkinda bilgi edinin:
   [https://move-book.com/move-basics/enum-and-match/](https://move-book.com/move-basics/enum-and-match/)

## Commit

```bash
cd day_09
sui move test
git add day_09/
git commit -m "Day 9: add TaskStatus enum and status helpers"
```

