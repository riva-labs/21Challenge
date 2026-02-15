# Sorun Giderme Rehberi

Bu rehber, 21 Gunluk Sui Move Challenge sirasinda karsilasabileceginiz yaygin sorunlari cozmenize yardimci olur.

---

## Kurulum Sorunlari

### Hata: "sui: command not found"

**Sorun:** Sui CLI yuklu degil veya PATH'inizde degil.

**Cozumler:**

1. **Rust'in yuklu oldugunu dogrulayin:**
   ```bash
   rustc --version
   ```
   Bulunamazsa, once Rust'i yukleyin:
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   ```

2. **Shell yapilandirmanizi yeniden yukleyin:**
   ```bash
   source $HOME/.cargo/env
   ```

3. **Sui binary'sinin var olup olmadigini kontrol edin:**
   ```bash
   ls ~/.cargo/bin/sui
   ```
   Bulunamazsa, yeniden yukleyin:
   ```bash
   cargo install --locked --git https://github.com/MystenLabs/sui.git --branch mainnet sui
   ```

4. **Terminalinizi tamamen yeniden baslatin** (kapatip tekrar acin).

---

## Build ve Test Uyarilari

### `sui move build` veya `sui move test` Sirasinda Uyarilar

**Ornek:**
```
warning[W09005]: unused function
   ┌─ sources/main.move:8:16
   │
 8 │     public fun get_name(): vector<u8> {
   │                ^^^^^^^^ ...
```

**Bu bir sorun DEGILDIR!** Uyarilar derleyiciden gelen bilgilendirme mesajlaridir. Kodunuzun derlenmesini veya testlerinizin gecmesini **engellemezler**. Sonunda `Build successful` gordugunuz surece her sey dogru calisiyor demektir.

**Gorebileceginiz yaygin uyarilar:**
- `unused function` - Bir fonksiyon var ama henuz cagrilmiyor (gelistirme sirasinda normal)
- `unused variable` - Bir degisken tanimlanmis ama kullanilmiyor
- `unused import` - Bir import var ama referans verilmiyor

Bu uyarilar, gunler ilerledikce ve fonksiyonlari sonraki alistarmalarda kullandikca dogal olarak kaybolacaktir.

> **Kisaca:** Uyarilar = Sorun yok. Hatalar = Duzeltme gerekli. Build veya test basariliysa, her sey yolunda!

---

### Windows: `Move.lock` Hatasi

**Sorun:** **Windows** makinelerde, onceki bir build'den kalan `Move.lock` dosyasi varsa `sui move build` basarisiz olabilir.

**Belirtiler:**
- Kod dogru olmasina ragmen build beklenmedik sekilde basarisiz olur
- Bagiimlilik cozumleme veya lock dosyasiyla ilgili hata mesajlari

**Cozum:** Build'den once `Move.lock` dosyasini silin:

```bash
rm Move.lock
sui move build
```

**Veya tek komutta birlestirin:**
```bash
rm -f Move.lock && sui move build
```

> **Not:** Bu sorun Windows'a (WSL dahil) ozgudur. macOS ve Linux kullanicilari genellikle bu sorunu yasamaz. `Move.lock` dosyasi otomatik olusturulur, bu yuzden silmek tamamen guvenlidir.

---

## Build Hatalari

### Hata: "could not find module"

**Ornek:**
```
error[E03002]: unbound module
   ┌─ sources/main.move:1:1
   │
 1 │ module challenge::day_01 {
   │        ^^^^^^^^^ Unbound module or type alias 'challenge'
```

**Sorun:** Yanlis dizindesiniz veya Move.toml eksik.

**Cozumler:**

1. **Dogru gunun klasorunde oldugunuzu kontrol edin:**
   ```bash
   pwd
   ```
   Sunu gostermelidir: `.../21Challenge/day_01` (veya day_02, vb.)

2. **Dogru klasore gidin:**
   ```bash
   cd day_01
   ```

3. **Move.toml'un var oldugunu dogrulayin:**
   ```bash
   ls Move.toml
   ```
   Eksikse, baska bir gunden kopyalayin veya repoyu kontrol edin.

---

### Hata: "syntax error"

**Ornek:**
```
error: unexpected token
   ┌─ sources/main.move:10:5
   │
10 │     pubic fun sum(a: u64, b: u64): u64 {
   │     ^^^^^ unexpected token
```

**Sorun:** Kodunuzda yazim hatasi (bu ornekte `public` yerine `pubic`). Bu sorunla karsilastiyorsaniz cozum kodunu kontrol edebilirsiniz.

**Cozumler:**

1. **Hata mesajini dikkatlice okuyun** - satir numarasini (10) ve neyin yanlis oldugunu gosterir.

2. **Yaygin yazim hatalari:**
   - `pubic` → `public`
   - `pubilc` → `public`
   - Eksik noktali virgul `;`
   - Eksik virgul `,`
   - Eksik kapanma susluu parantezi `}`

3. **VS Code kullanin** - sozdizimi hatalarini gercek zamanli olarak vurgular.


---

### Hata: "use of moved value"

**Ornek:**
```
error: cannot use value after move
   ┌─ sources/main.move:20:9
   │
20 │     let habit = new_habit(b"Run");
21 │     add_habit(&mut list, habit);
22 │     add_habit(&mut list, habit);  // Error: habit was moved
   │                          ^^^^^ value used here after move
```

**Sorun:** Zaten tasinmis (sahipligi transfer edilmis) bir degeri kullanmaya calisiyorsunuz.

**Cozumler:**

1. **Sorunu anlama:**
   ```move
   add_habit(&mut list, habit);  // habit is moved into the list
   // habit no longer exists here!
   ```

2. **Yeni bir deger olusturun:**
   ```move
   let habit1 = new_habit(b"Run");
   let habit2 = new_habit(b"Swim");
   add_habit(&mut list, habit1);
   add_habit(&mut list, habit2);
   ```

3. **Veya degeri saklamak istiyorsaniz referans kullanin:**
   ```move
   // But check if your function accepts references
   add_habit(&mut list, &habit);  // borrow instead of move
   ```

---

## Test Hatalari

### Hata: "test failed"

**Ornek:**
```
┌── test_sum ──────────────────────────────────────────────────────
│ error: assertion failed: result == 3
└──────────────────────────────────────────────────────────────────
Test result: FAILED. Total tests: 1; passed: 0; failed: 1
```

**Sorun:** Kodunuz beklenen sonucu uretmiyor.

**Cozumler:**

1. **Fonksiyon mantiginizi kontrol edin:**
   ```move
   // If test expects sum(1, 2) == 3
   public fun sum(a: u64, b: u64): u64 {
       a + b  // Make sure this is correct
   }
   ```

2. **Debug ciktisi ekleyin (testlerde):**
   ```move
   #[test]
   fun test_sum() {
       let result = sum(1, 2);
       std::debug::print(&result);  // See what you actually got
       assert_eq!(result, 3);
   }
   ```

3. **Gunun README'sini tekrar okuyun** - ne beklendigini anlamak icin.

---

### Hata: "no tests found"

**Ornek:**
```
Running Move unit tests
Test result: OK. Total tests: 0; passed: 0; failed: 0
```

**Sorun:** Test fonksiyonu tanimlanmamis veya testler yorum satirina alinmis.

**Cozumler:**

1. **Testlerin yorum satirinda olup olmadigini kontrol edin:**
   ```move
   // #[test]  ← Yorumu kaldirmak icin // isaretini silin
   #[test]
   fun test_sum() {
       // ...
   }
   ```

2. **Test sozdizimini dogrulayin:**
   - `#[test]` ozelligine sahip olmali
   - Bir fonksiyon olmali
   - Fonksiyon adi genellikle `test_` ile baslar

---

## Git ve Surum Kontrolu Sorunlari

### Hata: "build/ klasoru git status'ta gorunmeye devam ediyor"

**Sorun:** Build artefaktlari commit edilmemelidir.

**Cozum:**

`.gitignore` dosyasi build dosyalarini zaten haric tutar. Eger goruyorsaniz:

1. **.gitignore'un var oldugunu kontrol edin:**
   ```bash
   cat .gitignore
   ```

2. **Takip edilen build dosyalarini kaldirin:**
   ```bash
   git rm -r --cached day_*/build
   git commit -m "Remove build artifacts"
   ```

3. **Bundan sonra build/ klasorleri otomatik olarak goz ardi edilecektir.**

---

### Neleri Commit Etmeliyim?

**✅ Bunlari commit edin:**
- `sources/*.move` dosyalari (kodunuz)
- `README.md` dosyalari (not eklerseniz)
- `Move.toml` (degistirdiyseniz)

**❌ Bunlari commit etmeyin:**
- `build/` klasorleri (otomatik olusturulur)
- `Move.lock` dosyalari (otomatik olusturulur)
- `.DS_Store` (Mac sistem dosyalari)
- Editorr yapilandirma dosyalari (`.vscode/`, `.idea/`)

`.gitignore` dosyasi bunu sizin icin halleder!

---

## Performans Sorunlari

### Build veya Test Cok Yavas

**Sorun:** Ilk build tum bagimliliklari derler (1-2 dakika surebilir).

**Cozumler:**

1. **Ilk build her zaman daha yavas olur** - sonraki build'ler hizlidir.

2. **Sabirl olun** - Move tum Sui framework'unu derliyor.

3. **Sisteminizi kontrol edin:**
   - Diger agir uygulamalari kapatin
   - Yeterli disk alaniniz oldugundan emin olun (en az 5GB bos)

---

## Hata Mesajlarini Anlama

### Hata Mesajlari Nasil Okunur

Move hata mesajlari su kalbi takip eder:

```
error[E03002]: unbound module
   ┌─ sources/main.move:15:5
   │
15 │     module challenge::day_01 {
   │            ^^^^^^^^^ Unbound module or type alias 'challenge'
```

**Parcalara ayirma:**
1. `error[E03002]` - Hata kodu (dokumantasyon aramak icin)
2. `unbound module` - Kisa aciklama
3. `sources/main.move:15:5` - Dosya, satir 15, sutun 5
4. Gorsel isaretci (`^^^^^^^`) sorunun tam olarak nerede oldugunu gosterir
5. Asagida aciklama

**Profesyonel ipucu:** Her zaman once satir numarasina ve gorsel isaretciye bakin!

---

## Editorr Sorunlari

### VS Code Sozdizimi Vurgulama Gostermiyor

**Sorun:** Move eklentisi yuklu degil veya etkinlestirilmemis.

**Cozumler:**

1. **Move eklentisini yukleyin:**
   - Eklentileri acin (Ctrl+Shift+X veya Cmd+Shift+X)
   - "Move" arayin
   - Mysten Labs tarafindan yapilan "Move" eklentisini yukleyin

2. **Dosya uzantisini kontrol edin:**
   - Dosyalar `.move` ile bitmeli
   - `.txt` veya `.mv` degil

3. **VS Code'u yeniden yukleyin:**
   - Ctrl+Shift+P (veya Cmd+Shift+P) basin
   - "Reload Window" yazin
   - Enter'a basin

---

### VS Code Hata Gosteriyor Ama Build Calisiyor

**Sorun:** Eklenti senkronize olmamis olabilir.

**Cozumler:**

1. **Build komutuna guvenin** - `sui move build` basariliysa, kodunuz dogruduir.

2. **Pencereyi yeniden yukleyin:**
   - Ctrl+Shift+P / Cmd+Shift+P
   - "Reload Window" yazin

3. **Move eklentisini** en son surume guncelleyin.

---

## Hala Takildiyseniz?

### Yardim Istemeden Once

1. **Hata mesajini tekrar okuyun** - genellikle tam olarak neyin yanlis oldugunu soyler
2. **Gunun README'sini kontrol edin** - cozum orada aciklanmis olabilir
3. **Cozum dosyasina bakin** - her gundeki `sources/solution.move`
4. **Sifirdan build'lemeyi deneyin** - `build/` ve `Move.lock` dosyalarini silip yeniden build'leyin:
   ```bash
   rm -rf build && rm Move.lock
   sui move build
   ```

### Yardim Alma

Yukariadakilerin hicbiri ise yaramazsa:

1. **Sui Dokumantasyonunu kontrol edin:**
   - https://docs.sui.io

2. **Move Book'u kontrol edin:**
   - https://move-book.com

3. **Topluluga Katilin:**
   - Sui Discord
   - Sui Forum

### Bu Challenge'da Hata Bildirme

Challenge materyallerinde bir hata bulursaniz:
- Repoda bilinen bir sorun olup olmadigini kontrol edin
- Asagidakileri iceren ayrintili bir hata raporu olusturun:
  - Hangi gun
  - Ne beklediginiiz
  - Gercekte ne oldugu
  - Hata mesajlari (tam hatayi kopyala-yapistir)


---

**Unutmayin:** Herkes bazen takilir! Pes etmeyin. Her hata bir ogrenme firsatidir. Bunu okuyorsaniz, ben Ali ve size inaniyorum. Basarabilirsiniz.
