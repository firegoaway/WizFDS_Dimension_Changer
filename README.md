# WizFDS Dimension Changer

> Язык программы: **AHK**

> Интерфейс: **нативный**

## Особенности и описание работы утилиты
Утилита преобразует масштаб координат **1:1** в масштаб **1:1000** в FDS файле, созданном при помощи [WizFDS](https://wizfds.com/).

**Было:**
```FDS
&OBST ID='OBST3', XB=938318.9343,939114.1418, 510675.7247,519092.9676, 0,2800, SURF_ID='inert' /
&OBST ID='OBST4', XB=935192.4274,939114.1418, 518270.9484,519092.9676, 0,2800, SURF_ID='inert' /
&OBST ID='OBST5', XB=930952.2443,935192.4274, 518270.9484,519104.6933, 0,2800, SURF_ID='inert' /
&OBST ID='OBST6', XB=930952.2443,931402.2443, 516029.5648,519104.6933, 0,2800, SURF_ID='inert' /
```
**Стало:**
```FDS
&OBST ID='OBST1', XB=938.318934300, 939.114141800, 510.675724700, 519.092967600, 0.000, 2.800, SURF_ID='inert' /
&OBST ID='OBST2', XB=935.192427400, 939.114141800, 518.270948400, 519.092967600, 0.000, 2.800, SURF_ID='inert' /
&OBST ID='OBST3', XB=930.952244300, 935.192427400, 518.270948400, 519.104693300, 0.000, 2.800, SURF_ID='inert' /
&OBST ID='OBST4', XB=930.952244300, 931.402244300, 516.029564800, 519.104693300, 0.000, 2.800, SURF_ID='inert' /
```

## Статус разработки
> Релиз

## Как установить и пользоваться
|	№ п/п	|	Действие	|
|---------|---------|
|	1	|	Скачайте последнюю версию **WizFDS_Dimension_Changer.exe** в разделе [Releases](https://github.com/firegoaway/WizFDS_Dimension_Changer/releases);	|
|	2	|	Запустите **WizFDS_Dimension_Changer.exe**.	|
|	3	|	Нажмите **"Browse"** и выберите файл .fds, создайнный в [WizFDS](https://wizfds.com/)	|
|	4	|	Нажмите **Process"**	|

## Профилактика вирусов и угроз
- WizFDS Divider предоставляется "как есть".
- Актуальная версия утилиты доступна в разделе [Releases](https://github.com/firegoaway/Pomenat_plus_3/releases).
- Файлы, каким-либо образом полученные не из текущего репозитория, несут потенциальную угрозу вашему ПК.
- Файл с расширением .exe, полученный из данного репозитория, имеет уникальную Хэш-сумму, позволяющую отличить оригинальную утилиту от подделки. 
- Хэш-сумма обновляется только при обновлении версии утилиты и всегда доступна в конце файла **README.md**.

### Актуальная Хэш-сумма
> **1faccbf4516a2c510485e1616f3fd49e**