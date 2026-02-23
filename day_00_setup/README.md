# Gun 0: Kurulum ve Baslangic

21 Gunluk Sui Move Challenge'ina hos geldiniz! Kodlamaya baslamadan once gelistirme ortaminizi kuralim.

## Ne Kuracaksiniz

- ✅ Sui CLI (komut satiri araci)
- ✅ Kod editoru (VS Code onerilir)
- ✅ Terminal temelleri
- ✅ Ilk build ve testiniz

**Gereken sure:** 20-30 dakika

---

## Adim 1: Sui CLI Kurulumu

Sui CLI, Move kodunu build'lemek ve test etmek icin kullanacaginiz ana aractir.

### Onerilen Yontem: suiup Kullanarak (Tum Platformlar)

**suiup**, Sui'nin resmi yukleyicisi ve surum yoneticisidir. macOS, Linux ve Windows'ta (WSL uzerinden) calisir.

#### Adim 1.1: suiup'i Yukleyin

Terminal'i acin ve calistirin:

```bash
curl -sSfL https://raw.githubusercontent.com/Mystenlabs/suiup/main/install.sh | sh
```

Bu, `suiup` aracini indirip yukler.

#### Adim 1.2: Sui CLI'yi Yukleyin

suiup yuklendikten sonra calistirin:

```bash
suiup install sui@testnet
```

**Not:** Bu, testnet icin Sui'yi yukler. Farkli bir surume ihtiyaciniz varsa [suiup reposunu](https://github.com/MystenLabs/suiup) kontrol edin.

### Windows'a Ozel Talimatlar

**Windows kullanicilari:** Once WSL2'yi (Windows Subsystem for Linux) yukleyin:

1. PowerShell'i Yonetici olarak acin
2. Calistirin: `wsl --install`
3. Bilgisayarinizi yeniden baslatin
4. Baslat menusunden Ubuntu'yu acin
5. Ubuntu terminalinde yukaridaki suiup kurulum adimlarini takip edin

### NixOS'a Ozel Talimatlar

**NixOS kullanicilari:** suiup kullanmak yerine, bu repo ile birlikte gelen `flake.nix` dosyasini kullanabilirsiniz.

Flake'i kullanmanin en kolay yolu `nix develop` komutunu calistirmaktir.

### Kurulumu Dogrulama

Kurulumdan sonra calistigini dogrulayin:

```bash
sui --version
```

Suna benzer bir sey gormelisiniz: `sui 1.x.x-testnet`

### Sorun Giderme

**"command not found" hatasi mi?**

Sui binary dizini PATH'inizde olmayabilir. Deneyin:

```bash
# Reload your shell configuration
source ~/.bashrc   # For bash
# or
source ~/.zshrc    # For zsh

# Then try again
sui --version
```

**Hala calismiyor mu?**
1. Terminalinizi tamamen kapatip yeniden acin
2. suiup'in dogru yuklenip yuklenmedigini kontrol edin: `which suiup`
3. Ayrintili sorun giderme icin bakin: [Sui Kurulum Belgeleri](https://docs.sui.io/build/install)

### Alternatif: Manuel Kurulum (Ileri Seviye)

suiup calismiyorsa, cargo ile yukleyebilirsiniz:

```bash
# Install Rust first
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

# Install Sui CLI
cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui
```

**Not:** Bu yontem 10-15 dakika surer ve daha fazla disk alani gerektirir.

---

## Adim 2: VS Code Kurulumu (Kod Editoru)

VS Code, Move ile harika calisan ucretsiz bir kod editorudur.

### Indirme ve Kurulum

1. Su adrese gidin: https://code.visualstudio.com/
2. Isletim sisteminiz icin indirin
3. Yukleyin ve VS Code'u acin

### Move Eklentisini Yukleyin

1. VS Code'u acin
2. Sol kenardaki Eklentiler simgesine (4 kare) tiklayin
3. "Move" arayin
4. Mysten Labs tarafindan yapilan "Move" eklentisini yukleyin

**Faydalari:**
- Sozdizimi vurgulama (kod icin renkler)
- Otomatik tamamlama
- Hata tespiti

---

## Adim 3: Terminal Temellerini Anlama

Terminal (komut satiri olarak da adlandirilir), komutlari calistiracaginiz yerdir.

### Terminali Acma

**macOS:**
- `Cmd + Space` basin
- "Terminal" yazin
- Enter'a basin

**Linux:**
- `Ctrl + Alt + T` basin

**Windows (WSL):**
- Baslat menusunden "Ubuntu" acin

### Temel Komutlar

```bash
# Show current directory
pwd

# List files in current directory
ls

# Change directory
cd folder_name

# Go to parent directory
cd ..

# Go to home directory
cd ~
```

### Pratik

Bu komutlari deneyin:
```bash
# Navigate to your Desktop
cd ~/Desktop

# See where you are
pwd

# List files
ls
```

---

## Adim 4: Bu Projeyi Klonlayin veya Indirin

### Secenek A: Git Kullanarak (Onerilen)

Git yukluyse:

```bash
cd ~/Desktop
git clone [repository-url]
cd 21Challenge
```

### Secenek B: ZIP Indirme

1. Projeyi ZIP olarak indirin
2. Masaustunuze cikartin
3. Terminal'i acin ve gidin:
   ```bash
   cd ~/Desktop/21Challenge
   ```

---

## Adim 5: Ilk Build ve Testiniz

Her seyin calistigindan emin olalim!

### Gun 1'e Gidin

```bash
cd day_01
```

**Bu komutu anlama:**
- `cd` = change directory (bir klasore git)
- `day_01` = klasor adi

### Kodu Build'leyin

```bash
sui move build
```

**Ne yapar:** Move kodunuzu Sui'nin anlayabilecegi bir formata derler (cevirir).

**Beklenen cikti:**
```
BUILDING day_01
Build successful
```

> **Uyarilar gorebilirsiniz — bu normaldir!** `unused function` veya `unused variable` gibi uyarilar hata DEGILDIR. Sonunda `Build successful` gordugunuz surece kodunuz dogrudur. Bu uyarilar, fonksiyonlari ilerleyen gunlerde kullandikca kaybolacaktir.

> **Windows kullanicilari:** Build basarisiz olursa, `Move.lock` dosyasini silip yeniden build'lemeyi deneyin:
> ```bash
> rm Move.lock
> sui move build
> ```
> Bu bilinen bir Windows'a ozgu sorundur. Ayrintilar icin TROUBLESHOOTING.md dosyasina bakin.

**Hata goruyorsaniz:** Proje kokundeki TROUBLESHOOTING.md dosyasini kontrol edin.

### Testleri Calistirin

```bash
sui move test
```

**Ne yapar:** Kodun dogru calistigini dogrulamak icin tum test fonksiyonlarini calistirir.

**Beklenen cikti:**
```
Running Move unit tests
Test result: OK. Total tests: 0; passed: 0; failed: 0
```

> **Uyarilar gorebilirsiniz — bu normaldir!** Testleri calistirirken de uyarilar gorebilirsiniz. Testler geciyorsa (`OK` gosteriyorsa), kodunuz dogru calisiyor demektir.

**Not:** Gun 1'de henuz test yok, bu normaldir!

---

## Adim 6: Projeyi VS Code'da Acin

### Terminalden Acma

`21Challenge` klasorundeyken:

```bash
code .
```

**Not:** `.` "mevcut dizin" anlamina gelir

### Veya Manuel Olarak Acin

1. VS Code'u acin
2. "File" → "Open Folder" tiklayin
3. `21Challenge` klasorune gidin
4. "Open" tiklayin

### Yapiyi Kesfedin

VS Code'un kenar cubugunda sunlari goreceksiniz:
```
21Challenge/
├── README.md
├── day_01/
│   ├── README.md
│   ├── Move.toml
│   └── sources/
│       └── main.move
├── day_02/
...
```

---

## Adim 7: Is Akisini Anlama

Her gun su kalbi takip edeceksiniz:

### 1. Gunun Klasorune Gidin

```bash
cd day_01
```

### 2. README'yi Okuyun

```bash
cat README.md
```

Veya VS Code'da acin.

### 3. Kod Dosyasini Acin

VS Code'da `sources/main.move` dosyasini acin.

### 4. TODO'lari Tamamlayin

Su sekildeki yorumlari arayin:
```move
// TODO: Your task here
```

### 5. Degisikliklerden Sonra Build'leyin

```bash
sui move build
```

Sonraki adima gecmeden once **hatalari duzeltin**.

### 6. Testleri Calistirin

```bash
sui move test
```

Tum testler gecmeli ✅

### 7. Calismanizi Commit Edin

```bash
git add .
git commit -m "Day 1: completed"
```

---

## Sik Sorulan Sorular

### S: Hangi terminali kullanmaliyim?

**macOS/Linux:** Yerlesik Terminal mukemmeldir
**Windows:** WSL Ubuntu terminali (WSL yuklendikten sonra)

### S: Rust bilmem gerekiyor mu?

**Hayir!** Move'un Rust ile bazi benzerlikleri var, ama Move'u sifirdan ogreneceksiniz.

### S: Farkli bir editor kullanabilir miyim?

**Evet!** VS Code onerilir, ama sunlari da kullanabilirsiniz:
- Move eklentileriyle Vim/Neovim
- Herhangi bir metin editoru (ama sozdizimi vurgulama olmaz)

### S: Gunde ne kadar zaman gerekiyor?

**Gunde 1-2 saat** planlayin:
- 15-30 dk okuma
- 30-60 dk kodlama
- 5-10 dk test

### S: Gunleri atlayabilir miyim?

**Onerilmez!** Her gun onceki gunlerin uzerine insa eder. Atlarsaniz onemli kavramlari kacirirsiniz.

### S: Takildiysam ne yapmaliyim?

1. Gunun README'sini tekrar okuyun
2. TROUBLESHOOTING.md dosyasini kontrol edin
3. `sources/solution.move` dosyasina bakin (ama once deneyin!)
4. Saglanan Move Book baglantilarini kontrol edin

---

## Kontrol Listesi: Hazir misiniz?

Gun 1'e baslamadan once sunlardan emin olun:

- [ ] `sui --version` calisiyor
- [ ] Move eklentisiyle VS Code yuklu
- [ ] Terminalde `cd` ile gezinebiliyorsunuz
- [ ] day_01'de `sui move build` calisiyor
- [ ] Gunluk is akisini anliyorsunuz

**Hepsi tamam mi?** Hazirsiniz! `day_01/README.md` klasorune gidin ve ogrenmeye baslayin!

---

## Sonraki Adimlar

1. day_01 klasorune gidin: `cd day_01`
2. README'yi okuyun: `cat README.md` veya VS Code'da acin
3. Kodlamaya baslayin!

---

## Yardima mi Ihtiyaciniz Var?

Takildiysaniz veya sorulariniz varsa:

- **WhatsApp Toplulugu:** [Destek grubumuza katilin](https://chat.whatsapp.com/DZH6y2XMDQ58NY5DheUhQs?mode=hqrc)
- **X (Twitter):** [@ercandotsui](https://x.com/ercandotsui)

Soru sormaktan cekinmeyin - yardim etmek icin buradayiz!

**Iyi ogrenmeler!**
