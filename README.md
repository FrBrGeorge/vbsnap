# Shell-сценарии для рабботы с VirtualBox
- `vbsnap` — для быстрого создания клона
- `vbconnect` — для подключения TCP/COM (по имени или по номеру порта)
- `vbintnets` — какие внутренние сети используются в уже запущенных виртуалках
## Подробнее
`vbsnap` — для быстрого создания клона

**TODO** MD instead on moin

* создаёт снапшот `vbsnap` базовой машины, а уж из него делает клоны
** клон создаётся в той же группе, что и базовая машина
   * Например, наш образ — в группе `LinuxNetwork2023`
  * параметры: `vbsnap base clone [port] [intnet1 intnet2 intnet3]`
   * `base` — ID или имя базовой машины
   * `clone` — имя клона
   * `port` — порт для проброса TCP/COM
    * Если не указать, подберётся автоматически (на 1 больше максимального номера уже используемых портов)
   * `intnetN` — к какой сети типа `intnet` подключать сетевой адаптер `ethN`
    * Адаптер `eth0` всегда подключён к «сети `NAT`» (для выхода в интернет)
   * Пример: `vbsnap ALT_minimal router intnet deep`
  * Без параметров — выводит список машин (`VBoxManage list vms`)
  * С одним параметром — базовым образом — выводит список образов в той же группе, что и базовый
   * Пример: `vbsnap ALT_minimal`
  * Если второй параметр — `'ERASE!'`, удаляет все образы из группы, кроме базового
 * [[attachment:vbconnect]] — для подключения TCP/COM (по имени или по номеру порта)
  * С параметром «`-`» выводит список ''всех'' машин, у которых есть настроенный TCP/COM проброс
  * Без параметров выводит список запущенных машин, у которых есть настроенный TCP/COM проброс
  * С параметром `'STOP!'` останавливает все запущенные машины
 * [[attachment:vbintnets]] — какие внутренние сети используются
  * без параметров — запущенными виртуалками
  * с параметром `vms` — всеми виртуалками

