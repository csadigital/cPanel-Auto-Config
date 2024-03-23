#!/bin/bash

# Limitler ve disable_functions değeri
upload_max_filesize="900M"
max_execution_time="300"
disable_functions="shell_exec,symlink,restore_ini,hopenbasedir,f_open,system,dl,passthru,cat,exec,popen,proc_close,proc_get_status,proc_nice,proc_open,escapeshellcmd,escapeshellarg,show_source,posix_mkfifo,mysql_list_dbs,get_current_user,getmyuid,pconnect,link,symlink,pcntl_exec,leak,apache_child_terminate,posix_kill,posix_setpgid,posix_setsid,posix_setuid,proc_terminate,syslog,fpassthru,socket_select,socket_create,socket_create_listen,socket_create_pair,socket_listen,socket_accept,socket_bind,foreach,socket_strerror,pcntl_fork,pcntl_signal,pcntl_waitpid,pcntl_wexitstatus,pcntl_wifexited,pcntl_wifsignaled,pcntl_wifstopped,pcntl_wstopsig,pcntl_wtermsig,openlog,apache_get_modules,apache_get_version,apache_getenv,apache_note,apache_setenv,virtual,mail,phpmail"

# PHP sürümlerini belirleyin (örneğin: /usr/local/php veya /opt/remi/php)
php_paths=("/usr/local/php" "/opt/remi/php")

for php_path in "${php_paths[@]}"; do
    if [ -d "$php_path" ]; then
        for php_version in "$php_path"/*; do
            php_ini_path="$php_version/etc/php.ini"
            if [ -f "$php_ini_path" ]; then
                echo "Updating PHP configuration for $php_version"
                sed -i "s/^\(disable_functions\s*=\s*\).*\$/\1$disable_functions/" "$php_ini_path"
                sed -i "s/^\(upload_max_filesize\s*=\s*\).*\$/\1$upload_max_filesize/" "$php_ini_path"
                sed -i "s/^\(max_execution_time\s*=\s*\).*\$/\1$max_execution_time/" "$php_ini_path"
                echo "PHP configuration updated: $php_version"
            else
                echo "PHP configuration file not found at $php_ini_path"
            fi
        done
    else
        echo "PHP path not found: $php_path"
    fi
done

echo "PHP configuration update process completed for all PHP versions"
exit 0
