#!/bin/bash

upload_max_filesize="900M"
max_execution_time="300"
disable_functions="shell_exec,symlink,restore_ini,hopenbasedir,f_open,system,dl,passthru,cat,exec,popen,proc_close,proc_get_status,proc_nice,proc_open,escapeshellcmd,escapeshellarg,show_source,posix_mkfifo,mysql_list_dbs,get_current_user,getmyuid,pconnect,link,symlink,pcntl_exec,leak,apache_child_terminate,posix_kill,posix_setpgid,posix_setsid,posix_setuid,proc_terminate,syslog,fpassthru,socket_select,socket_create,socket_create_listen,socket_create_pair,socket_listen,socket_accept,socket_bind,foreach,socket_strerror,pcntl_fork,pcntl_signal,pcntl_waitpid,pcntl_wexitstatus,pcntl_wifexited,pcntl_wifsignaled,pcntl_wifstopped,pcntl_wstopsig,pcntl_wtermsig,openlog,apache_get_modules,apache_get_version,apache_getenv,apache_note,apache_setenv,virtual,mail,phpmail"

# PHP sürümlerini /etc/php dizinindeki PHP sürümlerinin üzerinden geçirin
php_sürümleri=$(ls -1 /etc/php | grep -oE '[0-9]+\.[0-9]+')
for php_sürümü in $php_sürümleri; do
    php_ini_yolu="/etc/php/$php_sürümü/cli/php.ini"
    if [ -f "$php_ini_yolu" ]; then
        echo "PHP $php_sürümü için PHP yapılandırması değiştiriliyor"
        sed -i "s/^\(disable_functions\s*=\s*\).*\$/\1$disable_functions/" "$php_ini_yolu"
        sed -i "s/^\(upload_max_filesize\s*=\s*\).*\$/\1$upload_max_filesize/" "$php_ini_yolu"
        sed -i "s/^\(max_execution_time\s*=\s*\).*\$/\1$max_execution_time/" "$php_ini_yolu"
        echo "PHP yapılandırması güncellendi: PHP $php_sürümü"
    else
        echo "PHP $php_sürümü yapılandırma dosyası $php_ini_yolu adresinde bulunamadı"
    fi
done

# CloudLinux PHP sürümlerini geçirin
cloudlinux_php_sürümleri=$(selectorctl --list | grep -oE 'ea-php[0-9]+\.[0-9]+')
for cloudlinux_php_sürümü in $cloudlinux_php_sürümleri; do
    php_ini_yolu="/opt/alt/php$cloudlinux_php_sürümü/etc/php.ini"
    if [ -f "$php_ini_yolu" ]; then
        echo "CloudLinux PHP $cloudlinux_php_sürümü için PHP yapılandırması değiştiriliyor"
        sed -i "s/^\(disable_functions\s*=\s*\).*\$/\1$disable_functions/" "$php_ini_yolu"
        sed -i "s/^\(upload_max_filesize\s*=\s*\).*\$/\1$upload_max_filesize/" "$php_ini_yolu"
        sed -i "s/^\(max_execution_time\s*=\s*\).*\$/\1$max_execution_time/" "$php_ini_yolu"
        echo "PHP yapılandırması güncellendi: CloudLinux PHP $cloudlinux_php_sürümü"
    else
        echo "CloudLinux PHP $cloudlinux_php_sürümü yapılandırma dosyası $php_ini_yolu adresinde bulunamadı"
    fi
done

echo "Tüm PHP sürümleri için PHP yapılandırma güncelleme işlemi tamamlandı"
exit 0
