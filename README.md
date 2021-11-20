#5.5. Оркестрация кластером Docker контейнеров на примере Docker Swarm
1. 
   1. replicated - количество сервисов указывается нами
   2. global - сервис запускается на каждой ноде
   3. Кластер использует Raft
   4. Overlay Network - сеть для создания кластера swarm.
2. ![](https://github.com/Gasan66/devops-netology/blob/main/images/552.png)
3. ![](https://github.com/Gasan66/devops-netology/blob/main/images/553.png)
# 5.4. Оркестрация группой Docker контейнеров на примере Docker Compose
1. ![](https://github.com/Gasan66/devops-netology/blob/main/images/541.png)
2. ![](https://github.com/Gasan66/devops-netology/blob/main/images/542.png)
3. ![](https://github.com/Gasan66/devops-netology/blob/main/images/543.png)
# 5.3. Введение. Экосистема. Архитектура. Жизненный цикл Docker контейнера
2. 
   1. VM
   2. Container
   3. Container
   4. Container
   5. Container
   6. Container
   7. VM
   8. VM
3. ![](https://github.com/Gasan66/devops-netology/blob/main/images/533.png)
4. [Image](https://hub.docker.com/r/gasan66/ansible)
# 5.2. Применение принципов IaaC в работе с виртуальными машинами
1. 
   1. Основные преимущества IaaC: идентичность настроек всех ландшафтов, бэкап настроек, культура инженерного состава.
   2. Основопологающий принцип на мой взгляд это идемпотентность.
2. 
   1. У ansible низкий порог входа и push модель.
   2. pull более надежен, но требует установки агентов.
3. 
   1. Parallels Desktop ![](https://github.com/Gasan66/devops-netology/blob/main/images/parallels.png)
   2. Vagrant ![](https://github.com/Gasan66/devops-netology/blob/main/images/vagrant.png)
   3. Ansible ![](https://github.com/Gasan66/devops-netology/blob/main/images/ansible.png)

# 5.1. Введение в виртуализацию. Типы и функции гипервизоров. Обзор рынка вендоров и областей применения.
1. 
   1. Аппаратная виртуализация - гипервизор является и ОС. Нет прослойки в виде ОС.
   2. Паравиртуализация - гипервизор ставится на ОС хоста в виде отдельного севрвиса. главное отличие от аппаратной это необходимость изменения ядра гостевой ОС
   3. Виртуализация уровня ОС - нет гипервизора, ОС сама отвечает за разделение ресурсов.
2. 
   1. Для высоконагруженных БД я бы использовал аппаратную виртуализвацию нескольких серверов объединенных в кластер для обеспечения отказоустойчивости.
   2. Для различных веб приложений я бы использовал виртуализацию на уровне ОС (контейнеризация), если не требуется обеспечить изолированность от ядра.
   3. Для виртуалок бухгалтеров я бы использовал паравиртуализацию для возоможности ограничения ресурсов и разделения виртуалок друг от друга.
   4. Предполагаю, что для GPU лучше использовать виртуализацию на уровне ОС, чтобы можно было напрямую подключить устройство gpu.
3. 
   1. Если рассматривать платные решения, то я бы использовал Hyper-V. Многое идет из коробки.
   2. Использовал бы KVM так как оно интегрировано в ядро линукса, что дает хорошую производительность.
   3. Использовал бы Hyper-V так как идет с winserver по умолчанию.
   4. Использовал бы Docker
4. Достоинства гетерогенной системы, на мой взгляд, заключаются в том, что можно сэкономить средства, а так же "не сесть на вендорскую иглу". Минусы конечно же в том, что сопровождать этот зоопарк очень сложно. Я бы выбрал одно решение. Были бы деньги, то использовал бы VMware. Иначе KVM. 

# 4.3. Языки разметки JSON и YAML
1. Добавил ковычки к ключу ip и к его значению "71.78.22.43". Не понял нужно ли что то делать со значением 7175, с точки зрения синтаксиса вроде норм, а с точки зрения логики не понятно что тут хотели.
[File](https://github.com/Gasan66/devops-netology/blob/main/4.3/4.3.1.json)
2. [Script](https://github.com/Gasan66/devops-netology/blob/main/4.3/4.3.2.py)
# 4.2. Использование Python
1. 
   1. нельзя сложить str и int.
   2. c = str(a) + b
   3. c= a + int(b)
2. Убрал break. [Script](https://github.com/Gasan66/devops-netology/blob/main/4.2/4.2.2.py)
3. [Script](https://github.com/Gasan66/devops-netology/blob/main/4.2/4.2.2.py)
4. [Script](https://github.com/Gasan66/devops-netology/blob/main/4.2/4.2.4.py)
# 4.1. Командная оболочка Bash
1. В переменной $c будет содержаться "a+b", так как в баше все строка. В $d будет содержаться 1+2, произошла 
конкатенация. В $e уже будет сумма равная 3.
2. <p>while ((1==1))<br>
   do<br>
   curl http://localhost:5000<br>
   if (($? != 0))<br>
   then<br>
   date > curl.log<br>
   else<br>
   break<br>
   fi<br>
   done</p>
3. [Задание 3](https://github.com/Gasan66/devops-netology/blob/main/4.1/task3)
4. [Задание 4](https://github.com/Gasan66/devops-netology/blob/main/4.1/task4)
# 3.9. Элементы безопасности информационных систем
1. ![](https://github.com/Gasan66/devops-netology/blob/main/images/391.jpg)
2. ![](https://github.com/Gasan66/devops-netology/blob/main/images/392.jpg)
3. ![](https://github.com/Gasan66/devops-netology/blob/main/images/393.png)
4. ![](https://github.com/Gasan66/devops-netology/blob/main/images/394.png)
5. ![](https://github.com/Gasan66/devops-netology/blob/main/images/395.png)
6. ![](https://github.com/Gasan66/devops-netology/blob/main/images/396.png)
7. ![](https://github.com/Gasan66/devops-netology/blob/main/images/397.jpg)
# 3.8. Компьютерные сети, лекция 3
2. ![](https://github.com/Gasan66/devops-netology/blob/main/images/dummy%20and%20route.png)
3. ![](https://github.com/Gasan66/devops-netology/blob/main/images/tcp%20and%20udp.png)
4. ![](https://github.com/Gasan66/devops-netology/blob/main/images/homenet.jpg)
# 3.7. Компьютерные сети, лекция 2
1. Работаю на ubuntu. Использую команду ip. (ip a|addr|address). Интерфейсы:
   1. lo
   2. eth0
2. llpd. пакет lldpd. команда lldpctl
3. VLAN. пакет vlan. команды:
   1. sudo apt install vlan
   2. sudo ip link add link eth0 name vlan4 type vlan id 10
   3. sudo ip addr add 192.168.0.1/24 dev vlan4
   4. sudo ip link set up vlan4
   5. ip a:
      1. ![](https://github.com/Gasan66/devops-netology/blob/main/images/ip%20a.png)
4. 
   1. типы агрегации:
      1. статический
      2. динамический
   2. опции для балансировки:
      1. mode=0 (balance-rr)
      2. mode=2 (balance-xor)
      3. mode=5 (balance-tlb)
      4. mode=6 (balance-alb)
   3. конфиг:<p>
      iface bond0 inet static<br>
address 10.0.1.5<br>
netmask 255.255.255.0<br>
network 10.0.1.0<br>
gateway 10.0.1.254<br>
bond_mode balance-tlb<br>
bond_miimon 100<br>
bond_downdelay 200<br>
bond_updelay 200<br>
slaves eth0 eth1</p>
5.  
   1. адресов 6 
   2. сетей 32
   3. подсети:
      1. 10.10.10.0/29
      2. 10.10.10.8/29
      3. 10.10.10.16/29
6. 
   1. 100.64.0.0/10
   2. 100.64.0.0/26
7. 
   1. ip neigh
   2. sudo ip neigh flush all
   3. sudo ip neighbour flush to
   








# 3.6. Компьютерные сети, лекция 1
1. 301 Moved Permanently - значит что ресурс перемещен на постоянной основе.
2. Дольше всего выполнялся запрос "https://sb.scorecardresearch.com/cs/17440561/beacon.js".
3. 77.223.93.200
4. CJSC "ER-Telecom Holding" Yekaterinburg branch. AS51604
5. <p>
   1 ec2-54-93-0-91.eu-central-1.compute.amazonaws.com (54.93.0.91) [AS16509/AS14618]  4.062 ms ec2-54-93-0-161.eu-central-1.compute.amazonaws.com (54.93.0.161) [AS16509/AS14618]  57.730 ms ec2-54-93-0-93.eu-central-1.compute.amazonaws.com (54.93.0.93) [AS16509/AS14618]  3.178 ms<br>
   2  100.65.17.80 (100.65.17.80) [*]  48.314 ms 243.253.18.254 (243.253.18.254) [*]  0.376 ms  0.359 ms<br>
   3  240.0.92.20 (240.0.92.20) [*]  0.347 ms 240.0.92.16 (240.0.92.16) [*]  0.378 ms 240.0.92.28 (240.0.92.28) [*]  0.427 ms<br>
   4  100.66.10.194 (100.66.10.194) [*]  1.438 ms 242.1.93.225 (242.1.93.225) [*]  7.060 ms 100.66.11.102 (100.66.11.102) [*]  9.921 ms<br>
   5  100.95.4.12 (100.95.4.12) [*]  1.711 ms 243.253.17.70 (243.253.17.70) [*]  0.527 ms 243.253.20.66 (243.253.20.66) [*]  0.466 ms<br>
   6  240.0.92.16 (240.0.92.16) [*]  0.453 ms 100.100.6.14 (100.100.6.14) [*]  0.936 ms 100.100.4.100 (100.100.4.100) [*]  1.056 ms<br>
   7  242.1.92.113 (242.1.92.113) [*]  0.705 ms  0.683 ms 142.250.166.96 (142.250.166.96) [AS15169]  2.672 ms<br>
   8  100.95.20.14 (100.95.20.14) [*]  0.325 ms 100.95.20.8 (100.95.20.8) [*]  1.132 ms *
   9  dns.google (8.8.8.8) [AS15169]  0.766 ms  0.974 ms  0.773 ms</p>
6. Наибольшая задержка на 11. AS15169  74.125.146.150
7. <p>dns.google.		286	IN	A	8.8.4.4<br>
   dns.google.		286	IN	A	8.8.8.8</p>
8. <p>;; ANSWER SECTION:<br>
   4.4.8.8.in-addr.arpa.	300	IN	PTR	dns.google.</p>
   <p>;; ANSWER SECTION:<br>
   8.8.8.8.in-addr.arpa.	300	IN	PTR	dns.google.</p>


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
    Description=Node Exporter<br>
    After=network.target
   </p>

   <p>[Service]<br>
    EnvironmentFile=/usr/local/bin/simpleUnit.conf<br>
   User=node_exporter<br>
   Group=node_exporter<br>
   Type=simple<br>
   ExecStart=/usr/local/bin/node_exporter $ARG1<br>
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
7. я так понял, что нормализовал это безобразие некий pids controller. изменить ограничение вроде б как можно в /sys/fs/cgroup/pids/user.slice/user-1000.slice/pids.max 

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
