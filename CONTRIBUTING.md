# Katki Rehberi

Bu rehber, 21 Gunluk Sui Move Challenge Turkce cevirisindeki hatalari duzeltmek isteyenler icindir. Katkida bulundugunuz icin tesekkurler!

---

## 1. Neye Katki Yapabilirsiniz

### Kapsam ici

- **Yazim / imla hatalari** — ornegin "fonkisyon" yerine "fonksiyon"
- **Dilbilgisi hatalari** — eksik veya yanlis eklerin duzeltilmesi
- **Yanlis ceviri** — Ingilizce anlamindan uzaklasan ifadeler
- **Anlasilmaz ifade** — dogru ama kafa karistirici cumleler

### Kapsam disi

- `.move` kaynak kod degisiklikleri (kod Ingilizce kalir, bilerek)
- Yeni icerik ekleme (yeni gunler, yeni ornekler)
- Dokumantasyon disindaki dosyalar (Move.toml, flake.nix vb.)

Yukaridaki listede yer almayan bir degisiklik oneriniz varsa, once bir issue acaniz veya toplulukta belirtiniz.

---

## 2. Hizli Baslangic

```bash
# 1. Repoyu fork edin (GitHub web arayuzunde "Fork" dugmesi)

# 2. Fork'u bilgisayariniza indirin
git clone https://github.com/<kullanici-adiniz>/21Challenge.git
cd 21Challenge

# 3. Yeni bir dal olusturun (dal adlandirma kurallari icin asagiya bakin)
git checkout -b fix/day05-yazim-duzeltmesi

# 4. Ilgili dosyayi acip degisikligi yapin
# (favori metin editorunuzle)

# 5. Degisikligi commit edin
git add day_05/README.md
git commit -m "fix(tr): day_05 README yazim duzeltmesi"

# 6. Fork'unuza gonderin
git push origin fix/day05-yazim-duzeltmesi

# 7. GitHub web arayuzunde Pull Request acin (asagida ayrintili)
```

---

## 3. Dal Adlandirma Kurali

Dal adi `fix/<hedef>-<kisa-aciklama>` formatinda olmalidir.

| Ornek dal adi | Ne icin |
|---|---|
| `fix/day03-yanlis-ceviri` | Gun 3 README'sindeki yanlis ceviri |
| `fix/glossary-yazim` | GLOSSARY.md'deki yazim hatalari |
| `fix/troubleshooting-dilbilgisi` | TROUBLESHOOTING.md dilbilgisi duzeltmesi |
| `fix/readme-anlasilmaz-ifade` | Kok README'deki anlasilmaz cumle |

---

## 4. Commit Mesaji Formati

Bu repo `docs(tr): ...` ve `fix(tr): ...` conventionini kullanir.

**Iyi ornekler:**

```
fix(tr): day_05 README yazim duzeltmesi
fix(tr): GLOSSARY struct tanimi yanlis ceviri
fix(tr): TROUBLESHOOTING dilbilgisi duzeltmesi
```

**Kotu ornekler:**

```
duzeltme yaptim          # ne duzeltildi belli degil
fix README               # hangi README? Turkce mi? ne duzeltildi?
Update day_05/README.md  # GitHub varsayilan mesaji, bilgi vermiyor
```

Her commit tek bir mantiksal degisiklik icermeli; birden fazla dosyayi etkileyen ayri hatalar ayri commit olarak gonderilebilir.

---

## 5. Iyi Bir Turkce Ceviri Nasil Gorunur

Bu projedeki Turkce cevirinin benimsedigi bazi kurallar:

**Teknik terimler parantez icinde Ingilizcesiyle verilir:**

> Dogru: "struct (veri yapisi) tanimlayabilirsiniz"
> Yanlis: "struct tanimlayabilirsiniz" *(ilk geciste parantez beklenir)*

**Asiri resmi dilden kacinilir:**

> Dogru: "Bu sekilde fonksiyon cagirabilirsiniz."
> Yanlis: "Iste boyle bir fonksiyon cagirimi gerceklestirebilirsiniz."

**Kod ornekleri Ingilizce kalir** — degisken adlari, fonksiyon adlari, yorum satirlari bilerek cevirilmemistir.

**Link metni Turkce olmali:**

> Dogru: `[Move Kitabi](https://move-book.com)`
> Yanlis: `[Move Book](https://move-book.com)` *(metin Ingilizce kalmis)*

---

## 6. Dosya Yapisi Hizli Basvurusu

```
21Challenge/
├── README.md              # Genel tanitim ve kullanim kilavuzu
├── GLOSSARY.md            # Move terimleri sozlugu
├── TROUBLESHOOTING.md     # Yaygin hata cozumleri
├── CONTRIBUTING.md        # Bu dosya
├── day_00_setup/          # Kurulum rehberi
│   └── README.md
├── day_01/ — day_07/      # Proje 1: Habit Tracker (Aliskanlik Takipci)
│   └── README.md          #   Her gun icin kavram aciklamalari
├── day_08/ — day_14/      # Proje 2: Task Bounty Board (Gorev Odul Panosu)
│   └── README.md
└── day_15/ — day_21/      # Proje 3: Farm Simulator (Ciftlik Simulatoru)
    └── README.md
```

Turkce ceviri yalnizca `README.md` dosyalarini kapsar; `.move` kaynak dosyalari cevirilmemistir.

---

## 7. PR Acma

### GitHub Web Arayuzu ile

1. Fork'unuzu tarayicida acin.
2. Dallar arasinda yeni dalinizia gecin.
3. **"Contribute" → "Open pull request"** dugmesine tiklayın.
4. Aciklama alani otomatik olarak PR sablonuyla (`.github/pull_request_template.md`) dolacaktir — her bolumu doldurun.
5. PR basligini `fix(tr): <kisa aciklama>` formatinda yazin.
6. **"Create pull request"** ile gonderin.

### PR Baslik Formati

```
fix(tr): <kisa aciklama>
```

Ornekler:

```
fix(tr): day_03 README struct tanimi yanlis ceviri
fix(tr): GLOSSARY ownership aciklamasi yazim hatasi
fix(tr): TROUBLESHOOTING Windows bolumu dilbilgisi
```

> **Not:** `gh pr create` CLI komutu PR sablon dosyasini otomatik yuklememektedir; bu beklenen bir davranistir. CLI kullaniyorsaniz sablon icerigini `--body` parametresiyle kendiniz girebilirsiniz.

---

## 8. Yardim

Sorulariniz icin topluluga ulasin:

- **WhatsApp Toplulugu:** [Destek grubumuza katilin](https://chat.whatsapp.com/DZH6y2XMDQ58NY5DheUhQs?mode=hqrc)
- **X (Twitter):** [@ercandotsui](https://x.com/ercandotsui)

Soru sormaktan cekinmeyin — birlikte daha iyi bir dokumantasyon olusturabiliriz!
