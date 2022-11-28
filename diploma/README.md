# Diploma

1. Репозиторий с конфигами терраформа. [infra](https://gitlab.com/abduragimov.ga/infra). Данный конфиг создает следующую инфраструктуру в яндексе.
   <kbd> 
      <img src="https://github.com/Gasan66/devops-netology/blob/main/diploma/k8s.png" alt="k8s"
      title="k8s"/> 
   </kbd>
2. Создаем тестовое приложение. [app](https://gitlab.com/abduragimov.ga/app). Запуливаем его в кубер. Под под названием diploma1.
3. <kbd> 
      <img src="https://github.com/Gasan66/devops-netology/blob/main/diploma/diploma.png" alt="diploma"
      title="diploma"/> 
   </kbd>
4. Запускаем сервисы мониторинга в кластере используя kube-prometheus. Получаем набор сервисов.
   <kbd> 
      <img src="https://github.com/Gasan66/devops-netology/blob/main/diploma/pods-monitor.png" alt="pods-monitor"
      title="pods-monitor"/> 
   </kbd>
   ## Grafana
   <kbd> 
      <img src="https://github.com/Gasan66/devops-netology/blob/main/diploma/grafana.png" alt="grafana"
      title="grafana"/> 
   </kbd>
5. CI настроен в гитлабе. [gitlab-ci](https://gitlab.com/abduragimov.ga/app/-/blob/main/.gitlab-ci.yml)
   <kbd> 
      <img src="https://github.com/Gasan66/devops-netology/blob/main/diploma/CI.png" alt="CI"
      title="CI"/> 
   </kbd>