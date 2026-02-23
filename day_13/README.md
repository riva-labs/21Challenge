# Gun 13: Basit Aggregation'lar (Toplam Odul, Tamamlanan Sayisi)

## Bugun Ne Ogreneceksiniz

Bugun ogrenecekleriniz:
- Vector'ler uzerinde nasil dongu yapilir
- Toplam ve sayim nasil hesaplanir
- Kosullara gore veri nasil filtrelenir

## Aggregation'lari Anlama

**Aggregation** (toplulastirma), veriyi toplama ve ozetleme anlamina gelir:
- **Toplam** - Tum degerleri toplama (toplam odul)
- **Sayim** - Bir kosulla eslesen ogeleri sayma (tamamlanan gorevler)

Donguler kullanarak:
1. Bir vector'deki her ogenin uzerinden gecersiniz
2. Bir kosul kontrol eder veya bir deger alirsiniz
3. Calisan bir toplam veya sayaca eklersiniz

## Goreviniz

1. day_12'deki kod zaten `sources/main.move` dosyasinda (gerekirse `day_12/sources/solution.move` dosyasini da kontrol edebilirsiniz)
2. Tum gorev odullerini toplayan `total_reward()` yazin
3. Tamamlanan gorevleri sayan `completed_count()` yazin

## Okuma Materyalleri

1. **Kontrol Akisi** - Dongu icin kontrol akisini gozden gecirin:
   [https://move-book.com/move-basics/control-flow/](https://move-book.com/move-basics/control-flow/)

## Commit

```bash
cd day_13
sui move test
git add day_13/
git commit -m "Day 13: add aggregations on TaskBoard"
```

