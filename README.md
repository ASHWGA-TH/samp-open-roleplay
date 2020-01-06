# SA:MP - Open Roleplay

อย่าลืมที่จะให้ 🌟 ถ้าคุณ 💖 มัน

Open Roleplay เป็นฐานโหมดเกม Heavy Text Based (สวมบทบาทด้วยการพิมพ์) สำหรับเซิร์ฟเวอร์ของผม [SW-RP](https://discord.gg/fg6YAeJ)

Open Roleplay มีดิสคอร์ดเป็นของตัวเองอยู่ที่นี่ [Discord อย่างเป็นทางการ](https://discord.gg/KXGGVeg).

### 👉 เป็นสปอนเซอร์ให้กับโปรเจคนี้

ผมทำงานหนักมาก ๆ หากคุณอยากมีส่วนร่วมในการเขียนโค้ด และหรือคุณใช้โปรเจคนี้ อย่างน้อยก็ซื้อกาแฟให้ผมสักแก้ว

-   [ให้ทิปผ่าน PayPal](https://paypal.me/leaks666)
-   True Wallet ผ่านเบอร์โทรศัพท์ 097-241-5274

### 📝 ลิขสิทธิ์

1. ห้ามสร้างรายได้จากโหมดเกมนี้
2. ห้ามลบลายน้ำ
3. ห้ามลบลิงค์ O:RP หรือลิงค์ใด ๆ จากโหมดเกม

### 🚧 รายชื่อฟีเจอร์และแผนงาน

ตอนนี้ยังไม่มีแผนงานเป็นตัวเป็นตน

**สำคัญ** หากคุณไม่ใช่นักพัฒนา; นี่อาจจะไม่ใช่โปรเจคที่เหมาะกับคุณ มีการตั้งค่าบางอย่างที่ต้องทำความเข้าใจและการเข้าใจโค้ดเป็นสิ่งสำคัญ

I **จะไม่** ให้ความช่วยเหลือโดยตรงสำหรับโหมดเกมนี้ ถ้าคุณมีปัญหาหรือพบเจอปัญหาการจากการใช้งานจริง ๆ โปรดแจ้งปัญหาในแท็บ **issues**; ความช่วยเหลือช่องทางอื่นก็มีทางกลุ่มดิสคอร์ด [Discord](https://discord.gg/KXGGVeg)

## 💻 การติดตั้ง

#### หากคุณยังไม่ได้ติดตั้ง sampctl; โปรดไปติดตั้งมันก่อนเป็นอย่างแรก

**ความต้องการ:**

-   พื้นฐานการเขียนโปรแกรม

-   การแก้ปัญหาเบื้องต้น

-   ระบบปฏิบัติการที่ต้องการ Linux (Ubuntu 18+) หรือวินโดว์ 10+

-   [SAMPCTL](https://github.com/Southclaws/sampctl)

-   [GIT](https://git-scm.com/downloads)

-   MySQL

    -   [Xampp](https://www.apachefriends.org/xampp-files/7.3.12/xampp-windows-x64-7.3.12-0-VC15-installer.exe)

---

### ตั้งค่าและติดตั้งโหมดเกมนี้

#### การตั้งค่า O:RP

-   โคลนที่เก็บโปรเจคนี้จาก github

-   เปิด Command Prompt หรือ Power Shell Prompt ในไดเรกทอรีที่โคลน

-   ไปที่ `gamemodes/configuration/` และสร้างไฟล์ database.pwn พร้อมเขียนตั้งค่ารูปแบบนี้

    ```
    #define MYSQL_HOST "โฮสต์ของคุณ" // ปกติเป็น localhost
    #define MYSQL_USER "ชื่อผู้ใช้"
    #define MYSQL_PASS "รหัสผ่าน"
    #define MYSQL_DB   "ชื่อฐานข้อมูล"
    ```

-   พิมพ์ `sampctl package install`

-   คุณจะได้รับไฟล์ `dependencies` สำหรับคอมไพล์สคริปต์

-   พิมพ์ `sampctl package build` เพื่อคอมไพล์ (**อย่าลืมตั้งค่าการเชื่อมต่อ MYSQL**)

-   หลังจากนั้นเซิร์ฟเวอร์ก็พร้อมที่จะรันแล้ว พิมพ์ `sampctl package run`

**ตัวย่อ** คุณสามารถใช้ `p` แทน `package` ได้ อย่างเช่น `sampctl p run`
