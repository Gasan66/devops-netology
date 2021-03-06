# 11.02 Микросервисы: принципы

1. API Gateway. Погрузившись в тематику, я вышел на много решений. Решил рассматривать on-premise решения. Выделил три решения: 
   1. Kong. 
      1. Опенсорс. 
      2. Построен на nginx, что дает хорошую надежность для высоконагруженных сервисов.
      3. Использует Lua
      4. Легок в развертывании, есть докер образы. 
      5. Может быть развернут на популярном Postgres. 
      6. Большое комьюнити. Есть поддержка для enterprise
      7. Разные версии для комьюнити и энтерпрайза.
      8. Конфигурируется декларативно.
   2. Tyk. 
      1. Опенсорс. 
      2. Написан на Go.
      3. Использует Redis
      4. Одна и та же версия для комьюнити и энтерпрайза.
   3. Apigee
      1. Не опенсорс
      2. Написан на java
      3. Поддерживает xml и soa. Может быть важно, если у вас много легаси.
      4. Сложен в развертывании

Судя по описаниям этих продуктов я бы выбрали kong, так как он прост в развертывании и в нем присутствует все необходимое.

2. Брокер сообщений.

| **Критерий**                      |            **Apache Kafka**             |          **RabbitMQ**           | **Redis** |
|-----------------------------------|:---------------------------------------:|:-------------------------------:|:---------:|
| Кластеризация                     |                  **+**                  |              **+**              |   **+**   |
| Хранение сообщений на диске       |                  **+**                  |              **+**              |   **-**   |
| Высокая скорость работы           |                  **+**                  |              **-**              |   **+**   |
| Форматы сообщений                 | **REST, HTTP, XMPP, STOMP, AMQP, MQTT** |   **AMQP, XMPP, SMTP, STOMP**   |           |
| Разделение прав доступа к потокам |                  **+**                  |              **+**              |   **-**   |
| Простота в эксплуатации           |                  **+**                  |              **+**              |   **+**   |

Исходя из таблицы я бы взял кафку.