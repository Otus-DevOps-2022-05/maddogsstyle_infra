# maddogsstyle_infra
maddogsstyle Infra repository

16.06.2022
1. Очевидно, на винде ничерта адекватно не работает, и простой флаг "-J" я использовать не смог. Пришлось создать файл ".ssh/config" со следующим содержимым (без комментов):

<!-- Host bastion
HostName 51.250.2.144
IdentityFile ~/.ssh/appuser
User appuser

Host internal
HostName 10.128.0.11
IdentityFile ~/.ssh/appuser
User appuser
ProxyCommand c:\Windows\System32\OpenSSH\ssh.exe -q -W %h:%p bastion -->

После этого заработали команды "ssh bastion" для подключения к ВМ bastion и "ssh internal" для подключения к ВМ someinternalhost (напрямую с локальной машины). Ура!

2. Посмотрел второе задание, в принципе останется только поменять алиас хоста:

<!-- Host bastion
HostName 51.250.81.59
IdentityFile ~/.ssh/appuser
User appuser

Host someinternalinternal
HostName 10.128.0.11
IdentityFile ~/.ssh/appuser
User appuser
ProxyCommand c:\Windows\System32\OpenSSH\ssh.exe -q -W %h:%p bastion -->

Делать этого, я, конечно, уже не буду :)

18.06.2022

3.
bastion_IP = 51.250.2.144
someinternalhost_IP = 10.128.0.11
