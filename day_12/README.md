# Gun 12: Gorev Arama icin Option

## Bugun Ne Ogreneceksiniz

Bugun ogrenecekleriniz:
- `Option<T>` nedir ve ne zaman kullanilir
- "Belki bulundu, belki bulunmadi" durumlarini nasil ele alinir
- `Some(value)` veya `None` nasil dondurulur

## Option'i Anlama

**Option** (opsiyonel), "belki bir deger var, belki yok" durumunu temsil eden bir tiptir. Iki varyanti vardir:
- `Some(value)` - Bir deger var
- `None` - Deger yok

Aradigi seyi bulamayabilecek fonksiyonlar icin mukemmeldir:
```move
fun find_task(...): Option<u64> {
    if (found) {
        option::some(index)  // Found it!
    } else {
        option::none()       // Not found
    }
}
```

## Goreviniz

1. day_11'deki kod zaten `sources/main.move` dosyasinda (gerekirse `day_11/sources/solution.move` dosyasini da kontrol edebilirsiniz)
2. Su ozelliklere sahip `find_task_by_title()` yazin:
   - Bir board ve bir title alir
   - `Option<u64>` dondurur (bulunursa index, bulunmazsa None)
   - Eslesen bir gorev bulmak icin gorevler arasinda dongu yapar

## Okuma Materyalleri

1. **Option** - Option tipi hakkinda bilgi edinin:
   [https://move-book.com/move-basics/option/](https://move-book.com/move-basics/option/)

## Commit

```bash
cd day_12
sui move test
git add day_12/
git commit -m "Day 12: add find_task_by_title using Option"
```

