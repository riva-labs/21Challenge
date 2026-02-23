# Gun 10: Visibility (Gorunurluk) ve API Tasarimi

## Bugun Ne Ogreneceksiniz

Bugun ogrenecekleriniz:
- `public` ve private fonksiyonlar arasindaki fark
- Iyi bir public API nasil tasarlanir
- Fonksiyonlar ne zaman public, ne zaman private yapilmali

## Visibility'yi Anlama

Move'da fonksiyonlar su sekilde olabilir:
- **`public fun`** - Modul disindan cagrilabilir
- **`fun`** (public yok) - Yalnizca ayni modul icinden cagrilabilir (private)

**API Tasarim Ilkesi:**
- Modulunuzun kullaniiclarinin cagirmasi gereken fonksiyonlari `public` yapin
- Yalnizca dahili olarak kullanulan yardimci fonksiyonlari `private` (sadece `fun`) tutun

## Goreviniz

1. day_09'daki kod zaten `sources/main.move` dosyasinda (gerekirse `day_09/sources/solution.move` dosyasini da kontrol edebilirsiniz)
2. Bir gorevi tamamlanmis olarak isaretleyen `public fun complete_task()` yazin
3. (Opsiyonel) Farki gostermek icin bir private yardimci fonksiyon yazin

## Okuma Materyalleri

1. **Visibility Degistiricileri** - Public ve private hakkinda bilgi edinin:
   [https://move-book.com/move-basics/visibility/](https://move-book.com/move-basics/visibility/)

## Ilgili Gunler

- **Gun 9** - Task struct'i ve enum'lar (on kosul)
- **Gun 11** - TaskBoard ile visibility uzerine insa etme

## Commit

```bash
cd day_10
sui move test
git add day_10/
git commit -m "Day 10: design simple public API for tasks"
```

