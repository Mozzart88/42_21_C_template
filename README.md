# 42_21_C_template
Template repo for 42/21 school C-projects

## Install
For simple instalation run this command
```bash
make proj=PROJ_NAME [u|user=USER_NAME]
```
Where `PROJ_NAME` will be subordinate everywhere as the name of the project, including for executable in main Makefile. And `USER_NAME` is name that will writed to `author` file, if not specified, than will enviroment `USER` will used.

## Uninstall
```bash
make -C .mozz deinstall proj=PROJ_NAME
```

### Features
Sh script to build projrct using your **`Makefile`** and attache **`main.c`** with output **`a.out`**
```bash
[PROJ_NAME]_build
```
Sh script for check file with **`norminate`**
```bash
[PROJ_NAME]_norm [file]
```
Sh scrip to check executable with **`valgrind`** for memmory leaks. Try to execute **`a.out`**.
```bash
[PROJ_NAME]_valg
```