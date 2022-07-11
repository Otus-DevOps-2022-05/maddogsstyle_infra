# maddogsstyle_infra
maddogsstyle Infra repository

## Домашнее задание №1
1. Очевидно, на винде ничерта адекватно не работает, и простой флаг "-J" я использовать не смог. Пришлось создать файл ".ssh/config" со следующим содержимым:

		Host bastion
		HostName 51.250.2.144
		IdentityFile ~/.ssh/appuser
		User appuser

		Host internal
		HostName 10.128.0.11
		IdentityFile ~/.ssh/appuser
		User appuser
		ProxyCommand c:\Windows\System32\OpenSSH\ssh.exe -q -W %h:%p bastion

После этого заработали команды "ssh bastion" для подключения к ВМ bastion и "ssh internal" для подключения к ВМ someinternalhost (напрямую с локальной машины). Ура!

2. Посмотрел второе задание, в принципе останется только поменять алиас хоста:

		Host bastion
		HostName 51.250.81.59
		IdentityFile ~/.ssh/appuser
		User appuser

		Host someinternalinternal
		HostName 10.128.0.11
		IdentityFile ~/.ssh/appuser
		User appuser
		ProxyCommand c:\Windows\System32\OpenSSH\ssh.exe -q -W %h:%p bastion

Делать этого, я, конечно, уже не буду :)

3.
		bastion_IP = 51.250.2.144
		someinternalhost_IP = 10.128.0.11

## Домашнее задание №3
	testapp_IP = 51.250.94.165
	testapp_port = 9292

## Домашнее задание №4
Переезжаю на Linux! В общем, достало меня каждый раз прописывать домашнюю директорию вручную, поэтому ставлю себе Ubuntu в качестве второй системы. К тому же, раз уж пишем скрипты, отличная идея тестировать их сразу же в подходящей среде. Надеюсь, миграция пройдет успешно.

Предположив, что скрипт запуска ВМ и деплоя приложения является исполняемым файлом, для выполнения потребуется ввести команду:

	./startup_script.sh

Инфа для себя: индексировать файл и определить его как исполняемый

	git add --chmod=+x
## Домашнее задание №5
1. Создал образ ВМ с помощью Packer, запустил на его основе инстанс, задеплоил приложение.
2. Создал файл с переменными для работы с Packer.
3. Создал новый шаблон для автоматического деплоя приложения при создании ВМ.
4. Написал скрипт для автоматического создания ВМ на основе вышеуказанного образа методами yc.
	
## Домашнее задание №6
1. Научился создавать, изменять и уничтожать ресурсы методами Terraform на основе образов из предыдущего ДЗ.
2. Научился определять переменные и устанавливать их значения по умолчанию.
3. Научился работать с HTTP-балансировщиком, а также запускать его методами Terraform.
4. Научился регулировать количество создаваемых ВМ методами копирования кода и использования параметра count.
Проблемы при копировании кода заключаются в
а) нерациональном использовании текстового пространства;
б) возможных ошибках при копировании (используя count, получаем гарантированно идентичные ВМ);
в) трудночитаемости и невозможности одновременно применить изменения на каждую ВМ.
## Домашнее задание №7
Ох и сложное ДЗ!
1. Разобрал инфраструктуру по модулям
2. Создал два стенда: stage и prod
3. Вынес стейт-файлы в бэкенд
4. Развернул приложение на обоих стендах (из модулей)
## Домашнее задание №8
Это очень приятное ДЗ!)
1. Я нечаянно сломал Убунту, удалив системный Питон)))))))))))) Больше так делать не буду! Переехал на elementary os, она мне понравилась гораздо больше!
2. Установил ansible
3. Написал inventory
4. Написал и использовал playbook
5.1 Первый вывод: ok=2    changed=0 - плейбук отработал
5.2 Второй вывод:ok=2    changed=1 - плейбук отработал. Я не понял, что тут произошло, и спрошу об этом в пулл реквесте.
6. Выполнил задание зо звездочкой! - Вот это был настоящий кайф, очень интересно: я вполне легко передал переменную, но как я соображал, что в ней есть пробелы, и как же их убрать! Теперь инвентори меняется самостоятельно в зависимости от айпи серверов - а скрипт я уж просто так написал, потому что две команды вбивать - не наш метод :)))