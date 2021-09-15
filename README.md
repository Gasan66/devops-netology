# 3.5. Файловые системы

2. насколько я понял, жесткие ссылки не являются отдельным объектом (файлом), поэтому на них нельзя устанавливать права и менять владельца
3. 
4. sudo fdisk /dev/xvdb (n p 1 +2G) (n p 2 остаток) (w). В скобках указал параметры вводимые в интерактивном режиме
5. sudo sfdisk -d /dev/xvdb > part_table<br>
sudo sfdisk /dev/xvdf < part_table
6. sudo mdadm --create /dev/md0 --level=1 --raid-devices=2 /dev/xvdb1 /dev/xvdf1
7. sudo mdadm --create /dev/md1 --level=0 --raid-devices=2 /dev/xvdb2 /dev/xvdf2
8. sudo pvcreate /dev/md0 /dev/md1<br>
9. sudo vgcreate vol_grp1 /dev/md0 /dev/md1<br>
10. sudo lvcreate -L 100M -n logical_vol1 vol_grp1 /dev/md1<br>
11. sudo mkfs.ext4 /dev/vol_grp1/logical_vol1<br>
12. mkdir /tmp/new<br>
sudo mount /dev/vol_grp1/logical_vol1 /tmp/new<br>
13. 
14. 
15. 
16. sudo pvmove -n logical_vol1 /dev/md1 /dev/md0
17. sudo mdadm /dev/md0 -f /dev/xvdb1






# 3.3. Операционные системы, лекция 2
1. <p>[Unit]<br>
    Description=example systemd service unit file.
   </p>

   <p>[Service]<br>
    EnvironmentFile=/usr/local/bin/simpleUnit.conf<br>
    ExecStart=/usr/local/bin/simpleUnit.sh $ARG1 $ARG2 $ARG3
   </p>

   <p>[Install]<br>
    WantedBy=multi-user.target
   </p>

2. node_cpu_seconds_total{cpu="0",mode="system"} 42.45
node_cpu_seconds_total{cpu="0",mode="user"} 80.75
node_memory_MemFree_bytes gauge
node_disk_io_time_seconds_total 
node_network_receive_drop_total
3. 
4. походу можно. 
Booting paravirtualized kernel on Xen HVM
xen_netfront: Initialising Xen virtual ethernet driver
systemd[1]: Detected virtualization xen.
5. fs.nr_open = 1048576. - возможное кол-во открытых дескрипторов по умолчанию. я так понял что /etc/security/limits.conf не даст достигнуть этого значения.
6. root@ip-172-31-9-40:~# nsenter --target 1311 --pid --mount
root@ip-172-31-9-40:/# ps aux
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.3   8968  3980 pts/1    S+   18:51   0:00 /bin/bash
root           8  0.0  0.0   7236   528 pts/1    S    18:51   0:00 sleep 1h
root          31  0.0  0.4  10040  4976 pts/2    S    18:57   0:00 -bash
root          42  0.0  0.3  10624  3360 pts/2    R+   18:57   0:00 ps aux
7. я так понял, что номализовал это безобразие некий pids controller. изменить ограничение вроде б как можно в /sys/fs/cgroup/pids/user.slice/user-1000.slice/pids.max 







# 3.3. Операционные системы, лекция 1

1. chdir("/tmp")
2. /usr/share/misc/magic.mgc
3. я тут не совсем понял задачу. если нужно просто обнулить удаленный файл, то, зная PID, мы находим его дескриптор через lsof и командой : > /proc/PID/fd/number очищаем файл.
4. как я понял они потребляют, но очень мало
5. ну в первую секунду больше всего вызовов пришлось на 
   /proc/PID/stat;
   /proc/PID/status;
   /proc/PID/cmdline;
   но были и другие:
   /usr/lib/;
   /lib/
6. uname. Part of the utsname information is also accessible via /proc/sys/kernel/{ostype, hostname, osrelease, version, domainname}
7. && используется для объединения последовательного выполнения команд. Вторая команда выполнится только в случае удачного выполнения первой.
   ; не ждет завершения предыдущей команды
   set -e так же как как и && остановит последовательность команд при ошибке. поэтому нет смысла использовать &&
8. set -e - остановит последовательность при ошибке
   set -u - выведет необъявленный параметр при попытке его вызова
   set -o pipefail - как я понял этот параметр должен передать в пайп сообщение которое ушло в stderr
   set -x - отражает все исполняемые команды в терминале
    set -euxo pipefail - используя такую последовательность очень удобно дебажить получается.
9. вот такую команду сделал ps -eo stat | cut -c 1-1 | sort | uniq -c. Если есть более умная, подскажите пожалуйста). Больше всего получилось S



# 3.2. Работа в терминале, лекция 2
1. cd is a shell builtin. 
2. grep <some_string> <some_file> -c
3. systemd
4. ls 2> /dev/pts/1
5. cat < 1.txt > 2.txt
6. Получится данные не будет видно.
7. bash 5>&1 - создали fd 5 и перенаправили его вывод в stdout. Поэтому и команда echo netology > /proc/$$/fd/5 выводит 	netology в stdout.
8. ls $ 3>&1 1>&2 2>&3 | tee text
9. env
10. cmdline - Этот файл содержит полную командную строку запуска процесса
    exe - является символьной ссылкой, содержащей фактическое полное имя выполняемого файла
11. sse4_2
12. виртуалка в облаке. если нужно подружиться с вагрантом, то сделаю.
13. разница в том, что ech встроенная програмка и запускается с правами shell, а tee можно запустить от sudo, так как она не встроенная.

# DZ 2.1
devops-netologyfirst line
**/.terraform/* - будут проигнорированы все файлы в папке .terraform вне зависимости от родительских каталогов.
*.tfstate - будут проигнорированы все файлы с расширением tfstate
*.tfstate.* - будут проигнорированы все файлы расширения которых содержат .tfstate.
crash.log - файл crash.log будет проигнорирован
*.tfvars - будут проигнорированы все файлы с расширением .tfvars
override.tf - файл override.tf будет проигнорирован
override.tf.json - файл override.tf.json будет проигнорирован
*_override.tf - будут проигнорированы все файлы заканчивающиеся на _override.tf
*_override.tf.json - будут проигнорированы все файлы заканчивающиеся на _override.tf.json
.terraformrc - будут проигнорированы все файлы с расширением .terraformrc
terraform.rc - файл terraform.rc будет проигнорирован
