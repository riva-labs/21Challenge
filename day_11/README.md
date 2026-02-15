# Gun 11: TaskBoard ve Sahiplik Fikirleri (Address Tipi)

## Bugun Ne Ogreneceksiniz

Bugun ogrenecekleriniz:
- `address` tipinin ne oldugu
- Veri yapilarinizda sahipligin nasil takip edilecegi
- Adres iceren struct'larda sahipligin nasil calistigi

## Address'i Anlama

Move'da bir **address** (adres), bir blockchain adresini temsil eder (`0x123...` gibi). Su amaclarla kullanilir:
- Bir seyin kime ait oldugunu belirleme
- Bir seyi kimin olusturdugunu takip etme
- Kaynaklara erisimi kontrol etme

## Adreslerle Sahipligi Anlama

`owner: address` ile bir `TaskBoard` olusturdugunnuzda:
- Pano o adrese "aittir"
- Birinin sahip olup olmadigini kontrol edebilirsiniz
- Bu, blockchain programlamada yaygin bir kaliptir

**Sahiplik Hatirlatmasi:**
- Panoya bir gorev eklediginizde, gorevin sahipligini transfer edersiniz
- Pano artik vector'undeki gorevi "sahiplenir"
- Bu, day_04'te ogrendigimize benzer

## Goreviniz

1. day_10'daki kod zaten `sources/main.move` dosyasinda (gerekirse `day_10/sources/solution.move` dosyasini da kontrol edebilirsiniz)
2. Asagidakilere sahip bir `TaskBoard` struct'i tanimlayin:
   - `owner: address`
   - `tasks: vector<Task>`
3. `new_board()` ve `add_task()` fonksiyonlarini yazin

## Okuma Materyalleri

1. **Address Tipi** - Adresler hakkinda bilgi edinin:
   [https://move-book.com/move-basics/address/](https://move-book.com/move-basics/address/)

2. **Sahiplik ve Kapsam** - Sahiplik kavramlarini gozden gecirin:
   [https://move-book.com/move-basics/ownership-and-scope/](https://move-book.com/move-basics/ownership-and-scope/)

## Ilgili Gunler

- **Gun 10** - Visibility degistiricileri (on kosul)
- **Gun 12** - Daha fazla fonksiyonla TaskBoard uzerine insa etme

## Commit

```bash
cd day_11
sui move test
git add day_11/
git commit -m "Day 11: add TaskBoard with owner and tasks"
```

