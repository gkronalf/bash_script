#  BASH SCRIPT ANALYZE AND SEND LOG  
  
В рамках проекта подготовлен тестовый стенд vagrant, файл bash-скрипта,    
который на основе регулярных выражений формирует файл для отправки на тестовую почту.  
  
По результату работы скрипта в домашнем каталоге формируется файл send.txt,  
который содержит следующую информацию:  
   - Список IP адресов (с наибольшим кол-вом запросов) с указанием кол-ва запросов c момента последнего запуска скрипта;  
   - Список запрашиваемых URL (с наибольшим кол-вом запросов) с указанием кол-ва запросов c момента последнего запуска скрипта;  
   - Ошибки веб-сервера/приложения c момента последнего запуска;  
   - Список всех кодов HTTP ответа с указанием их кол-ва с момента последнего запуска скрипта.  
  
Предотвращение повторно запуска скрипта осуществляется с помощью утилиты flock,  
параметры которой прописаны в cron задачи и выглядит следующим образом:  
0 * * * * * vagrant /usr/bin/flock -xn /var/lock/mail.sh.lock -c 'source /etc/cron.hourly/mail.sh'  






 
