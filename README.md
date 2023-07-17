# cPanel-Auto-Config

cPanel'i en iyi uygulamalara göre kurar ve yapılandırır.

## Kurulum

```bash
wget https://raw.githubusercontent.com/csadigital/cPanel-Auto-Config/main/install_cpanel.sh -O ./install_cpanel.sh && bash install_cpanel.sh

cpanel+litespeed+cloudlinux+imunify360+Softaculous
Sunucu paket / kernel güncellemesi
Ram'e uygun swap
php 5.4+ & mariadb 10.3
php opcache, suhosin, imagick
Litespeed Optimizasyonu
MariaDB yükünün düşürülmesi
HTTP/2 Aktivasyonu
GZIP Aktivasyonu
mod_brotli Aktivasyonu
mod_security aktif + IM360 WAF kuralları
CSF Yazılımsal firewall kurulumu ve saldırı önleme
+Cloudflare ipv4 ve ipv6 adresleri
Güvenlik Optimizesi
CGI, Perl ve Python Güvenliği
Mod_userdir Düzenleme
Uzak MySQL Engelleme/kapatma (3306)
Dizinler arası geçişi kapatma
Php.ini fonksiyonları düzenleme
Symlink engelleme
SSH güvenliği (port değişimi, dns kullanımı)
Imunify360 yapılandırılması
