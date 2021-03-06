# 10.04. ELK
1. <kbd> 
      <img src="https://github.com/Gasan66/devops-netology/blob/main/10.4/10_4_1.png" alt="10_4_1"
      title="10_4_1"/> 
   </kbd>
2. <kbd> 
      <img src="https://github.com/Gasan66/devops-netology/blob/main/10.4/10_4_2.png" alt="10_4_2"
      title="10_4_2"/> 
   </kbd>

# 10.03. Grafana
1. <kbd> 
      <img src="https://github.com/Gasan66/devops-netology/blob/main/10.3/10_3_1.png" alt="10_3_1"
      title="10_3_1"/> 
   </kbd>
2. 
   1. 100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[1m])) * 100)
   2. avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[1m])) * 100 <br>
      avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100 <br>
      avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[15m])) * 100 <br>
   3. node_memory_MemFree_bytes
   4. node_filesystem_size_bytes{fstype="ext4"}
   
      <kbd> 
         <img src="https://github.com/Gasan66/devops-netology/blob/main/10.3/10_3_23.png" alt="10_3_23"
         title="10_3_23"/> 
      </kbd>
3. [Dashboard](https://github.com/Gasan66/devops-netology/blob/main/10.3/10_3_4.json)


# 10.2. Системы для мониторинга
1. Модели:
   1. Плюсы Push:
      1. Возможность направлять данные с одного агента в несколько систем.
      2. Каждый клиент можно конфигурировать отдельно.
      3. На мой взгляд есть некий элемент безопасности в такой схеме. Нет единого сервера с административным доступом ко всем агентам.
      4. В случае отсутствия коннекта, агент может хранить инфу на себе, пока сервер не станет доступен, потом передаст.
   2. Минусы Push:
      1. Необходимость установки и обновления агентов.
      2. Контроль жизни агентов.
   3. Плюсы Pull:
      1. Нет необходимость ставить агентов.
      2. Мониторим только те объекты которые хотим. Никто "левый" не будет спамить.
      3. Возможность реализации прокси, в случае разграничения сетей между сервером и агентами.
   4. Минусы Push:
      1. Нужен административный доступ до всех хостов.
      2. в случае отсутствия коннекта, потеряем исторические данные.
2. Системы:
   1. Push:
      1. Zabbix
      2. TICK
      3. VictoriaMetrics
   2. Pull:
      1. Prometheus
      2. Zabbix
      3. VictoriaMetrics
      4. Nagios
3. <kbd> 
      <img src="https://github.com/Gasan66/devops-netology/blob/main/images/10_2_3_1.png" alt="10_2_3_1"
      title="10_2_3_1"/> 
   </kbd>
   <kbd> 
      <img src="https://github.com/Gasan66/devops-netology/blob/main/images/10_2_3_2.png" alt="10_2_3_2"
      title="10_2_3_2"/> 
   </kbd>
4. <kbd> 
      <img src="https://github.com/Gasan66/devops-netology/blob/main/images/10_2_4.png" alt="10_2_4"
      title="10_2_4"/> 
   </kbd>
5. <kbd> 
      <img src="https://github.com/Gasan66/devops-netology/blob/main/images/10_2_5.png" alt="10_2_5"
      title="10_2_5"/> 
   </kbd>


# 10.01. Зачем и что нужно мониторить
1. 
   1. В первую очередь я бы мониторил платформу изнутри: 
      1. CPU
      2. RAM
      3. HDD
      4. Время на обработку отчета
      5. Очередь из запросов
   2. Так же я бы мониторил доступность системы из вне:
      1. Доступность по http
      2. Может быть время отклика.
2. С точки зрения бизнеса можно предложить соглашение об уровне оказания услуг (SLA). Бизнесу интересны показатели доступности систем и время реагирования на возникающие инциденты. Например:
   1. Доступность системы 96% - означает, что в год допускается 15 дней простоя системы.
   2. 96% инцидентов решено в срок. Инциденты можно делить на категории критичные, высокие, средние и тд. В зависимости от приоритета выставить разные сроки реагирования.
3. 
   1. ELK. Является неким стандартом в силу своего долголетнего существования. Много плагинов. В моей практике единственный минус был в невозможности разделения доступа к логам в кибане. Так же отсутствует система оповещений. В платной версии вроде этот функционал присутствует. Непростой процесс установки.
   2. Graylog. Похож на ELK. Есть оповещение. Меньше возможностей для интеграций. Отсутствует поддержка Markdown. Процесс установки проще.
   3. Monq. Молодой продукт со всеми вытекающими последствиями.
4. Нужно добавить еще коды ответов (summ_2xx_requests + summ_3xx_requests)/summ_all_requests

# 09-ci-03-cicd
1. <kbd> 
      <img src="https://github.com/Gasan66/devops-netology/blob/main/9.3/93Sonar.png" alt="931"
      title="931"/> 
      </kbd>
2. [Nexus](https://github.com/Gasan66/devops-netology/blob/main/9.3/93maven-metadata.xml)
3. [Maven](https://github.com/Gasan66/devops-netology/blob/main/9.3/93pom.xml)

# 09.01 Жизненный цикл ПО
1. [BUG NTGY](https://github.com/Gasan66/devops-netology/blob/main/9.1/BUG_NTGY.xml)
2. [TASK NTGY](https://github.com/Gasan66/devops-netology/blob/main/9.1/TASK_NTGY.xml)

# 7.6. Написание собственных провайдеров для Terraform.
1. [resource и data_source](https://github.com/hashicorp/terraform-provider-aws/blob/db1ab4cfcb7ca407398753b158037c4e94472c6b/internal/provider/provider.go#L376-L1852)
2. 
   1. [Параметр name конфликтует с параметром name_prefix](https://github.com/hashicorp/terraform-provider-aws/blob/db1ab4cfcb7ca407398753b158037c4e94472c6b/internal/service/sqs/queue.go#L87)
   2. Вроде 26 символов
   3. [[:xdigit:]]{%d}%s$


# 7.5. Основы golang
3. 
   1. ~~~
      package main

      import "fmt"

      func main() {
       fmt.Print("Enter count of meters: ")
       var input float64
       fmt.Scanf("%f", &input)

       output := input * 0.3048

       fmt.Println("In", input, "meters", output, "foots")
       }
      ~~~
   2. ~~~
      package main

      import (
                 "fmt"
                 "sort"
                )

      func main() {
       x := []int{48, 96, 86, 68, 57, 82, 63, 70, 37, 34, 83, 27, 19, 97, 9, 17}
       sort.Ints(x)
       fmt.Println(x[0])
       }
      ~~~
   3. ~~~
      package main

      import "fmt"

      func main() {
          for i := 1; i < 100; i++ {
              if i%3 == 0 {
                  fmt.Println(i)
              }
          }
      }
      ~~~
      

# 7.4. Средства командной работы над инфраструктурой
1. <kbd> 
      <img src="https://github.com/Gasan66/devops-netology/blob/main/images/741.png" alt="741"
      title="741"/> 
      </kbd>
2. [atlantis](https://github.com/Gasan66/devops-netology/blob/main/7.4/atlantis.yaml)<br>
   [server](https://github.com/Gasan66/devops-netology/blob/main/7.4/server.yaml)
3. [terraform](https://github.com/Gasan66/devops-netology/tree/main/terraform)

# 7.3. Основы и принцип работы Терраформ
2. 
   1. <kbd> 
      <img src="https://github.com/Gasan66/devops-netology/blob/main/images/732.png" alt="732"
      title="732"/> 
      </kbd>
   2. Выполняя все условия задачи (использование count и for each) получилось, что для прода создается 4 инстанса. Вывод команды запихал в файл, показалось что так удобнее.<br>
      [tfPlanProd](https://github.com/Gasan66/devops-netology/blob/main/7.3/tfPlanProd)


# 7.2. Облачные провайдеры и синтаксис Терраформ
1. <kbd> 
   <img src="https://github.com/Gasan66/devops-netology/blob/main/images/721.png" alt="721"
   title="721"/> 
   </kbd>
2. 
   1. При помощи Packer
   2. https://github.com/Gasan66/devops-netology/tree/main/terraform/demo
# 7.1. Инфраструктура как код
1. 
   1. 
      1. Я бы использовал изменяемый тип архитектуры, так как придется вносить много изменений в окружение и делать это быстро. Когда все устаканится можно сделать и неизменяемую.
      2. С моей точки зрения, если нет четкого ТЗ и четкого понимания архитектуры, то лучше не городить огород и использовать простые и действенные средства. Я бы не заморачивался с сервером.
      3. Так как есть ansible скрипты, то я бы его и использовал, т.е. без агентов.
      4. Есть terraform и ansible поэтому я бы их и использовал в качестве управления конфигурациями и инициализацией ресурсов.
   2. Packer, Terraform, Docker, TeamCity
   3. Я бы добавил nexus для хранения артефактов и в качестве registry для образов докера.
2. <kbd> 
   <img src="https://github.com/Gasan66/devops-netology/blob/main/images/712.png" alt="712"
   title="712"/> 
   </kbd>
3. <kbd> 
   <img src="https://github.com/Gasan66/devops-netology/blob/main/images/713.png" alt="713"
   title="713"/> 
   </kbd>

# 6.6. Troubleshooting
1. 
   1. Сначала я найду этот запрос командой db.currentOp({"sec_running":{$qte: 180}}), затем применю killSessionsю
   2. Вычислить запрос из-за которого деградирует база и использовать explain для анализа проблемы.
2. На сколько я понял у редиса есть встроенные механизмы работы с истекшими ключами. Соотношение истекших ключей к общему количеству превышает 25%, те редис начинает блокировать записи, чтобы снизиться до 25%.
3. Такая ситуация может возникать, если в одном или нескольких запросах идет запись миллионов строк. Мы можем увеличить время таймаута net_read_timeout.
4. При нехватке памяти postgres начинает прибивать процессы. Можно либо отключить эту опцию, но лучше проверить настройки памяти для железа.

# 6.5. Elasticsearch
1. 
   1. [Dockerfile](https://github.com/Gasan66/devops-netology/blob/main/6.5/Dockerfile)
   2. https://hub.docker.com/repository/docker/gasan66/elastic
   3. <kbd> 
      <img src="https://github.com/Gasan66/devops-netology/blob/main/images/6513.png" alt="6513"
      title="6513"/> 
      </kbd>
2. 
   1. <kbd> 
      <img src="https://github.com/Gasan66/devops-netology/blob/main/images/6521.png" alt="6521" title="6521"/> 
      </kbd>
   2. На сколько я понял в нашем случае желтый статус возникает по причине отсутствия возможности складывать реплики шардов.
3. 
   1. <kbd> 
      <img src="https://github.com/Gasan66/devops-netology/blob/main/images/6531.png" alt="6531" title="6531"/> 
      </kbd>
      
   2. <kbd> 
      <img src="https://github.com/Gasan66/devops-netology/blob/main/images/6532.png" alt="6532" title="6532"/>
      </kbd>
   3. <kbd> 
      <img src="https://github.com/Gasan66/devops-netology/blob/main/images/6533.png" alt="6533" title="6533"/> 
      </kbd>
   4. <kbd> 
      <img src="https://github.com/Gasan66/devops-netology/blob/main/images/6534.png" alt="6534" title="6534"/>
      </kbd>
   5. <kbd> 
      <img src="https://github.com/Gasan66/devops-netology/blob/main/images/6535.png" alt="6535" title="6535"/> 
      </kbd>

# 6.4. PostgreSQL
1. 
   1. вывод списка БД - \l
   2. подключения к БД - \c
   3. вывода списка таблиц - \dt
   4. вывода описания содержимого таблиц - \d+ 
   5. выхода из psql - \q
2. ![](https://github.com/Gasan66/devops-netology/blob/main/images/642.png)
3. [File](https://github.com/Gasan66/devops-netology/blob/main/6.4/shard) "Ручное" разбиение можно было исключить на этапе проектирования, если сразу задать приложению условие как распределять данные по табличкам.
4. ALTER TABLE public.orders ADD CONSTRAINT title_unique UNIQUE (title);

# 6.3. MySQL
1. 
   1. ![](https://github.com/Gasan66/devops-netology/blob/main/images/6311.png)
   2. ![](https://github.com/Gasan66/devops-netology/blob/main/images/6312.png)
2. ![](https://github.com/Gasan66/devops-netology/blob/main/images/632.png)
3. ![](https://github.com/Gasan66/devops-netology/blob/main/images/633.png)
4. [File](https://github.com/Gasan66/devops-netology/blob/main/6.3/my.cnf)

# 6.2. SQL
1. [File](https://github.com/Gasan66/devops-netology/blob/main/6.2/stack.yml)
2. 
   1. ![](https://github.com/Gasan66/devops-netology/blob/main/images/dblist.png)
   2. ![](https://github.com/Gasan66/devops-netology/blob/main/images/tabledesc.png)
   3. SELECT * from test_db.pg_catalog.pg_user pu;
   4. ![](https://github.com/Gasan66/devops-netology/blob/main/images/users.png)
3. ![](https://github.com/Gasan66/devops-netology/blob/main/images/value.png)
4. 
   update clients set order_id  = 3 where surname = 'Иванов Иван Иванович';<br>
   update clients set order_id  = 4 where surname = 'Петров Петр Петрович';<br>
   update clients set order_id  = 5 where surname = 'Иоганн Себастьян Бах';<br>
   ![](https://github.com/Gasan66/devops-netology/blob/main/images/624.png)
5. ![](https://github.com/Gasan66/devops-netology/blob/main/images/625.png)
6. sd
   1. pg_dump -U test-admin-user test_db > /backup/test_db.dump
   2. psql -U test-admin-user test_db < /backup/test_db.dump
# 6.1. Типы и структура СУБД
1. 
   1. Документо-ориентированные
   2. Реляционная
   3. Иерархическая
   4. Ключ-значение
   5. Графовая
2. 
   1. AP; PA/EC
   2. PA; PA/EC
   3. CP; PC/EL
3. На мой взгляд одна система не может удовлетворять обоим принципам, так как ACID про точность данных, а BASE про доступность и скорость.
4. На сколько я понял речь идет о брокере сообщений. В данном случае есть возможность реализовать асинхронное взаимодействие, например, для шины данных. На мой взгляд проблемы в такой системе могут возникать в случае "нецелевого" использования. Т.е если пытаться ее использовать для долгого хранения данных. По сути данная система реализует очереди, которые разбираются асинхронно и удаляются, а не хранятся.
# 5.5. Оркестрация кластером Docker контейнеров на примере Docker Swarm
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
