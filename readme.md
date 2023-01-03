## 패키지 설명
* Codeigniter 3를 실행하는 환경 구성
	* myapp 디렉토리에 소스 코드가 있다고 가정	
	* 소스 패치를 위해서 composer update를 실행해야 함
* php 7.4 사용
* Database는 외부 환경을 사용함

## 패키지 구성
```shell
% tree -L 4
.
├── docker
│   ├── Dockerfile
│   ├── docker-entrypoint.sh
│   └── supervisor
│       ├── app.ini
│       └── supervisor.ini
├── docker-compose.yml
├── my-project
│   └── myapp
│       ├── composer.json
│       └── index.php
└── readme.md

```

## 환경변수 설정 
* environment에 정의된 것을 읽어서 사용함

### docker-compose.yml
```yml
environment:
    - CI_ENV=development
    - CODEIGNITER_DATABASE_HOST=host
    - CODEIGNITER_DATABASE_USER=username
    - CODEIGNITER_DATABASE_PASSWORD=password
    - CODEIGNITER_DATABASE_NAME=dbname
```


### index.php, 환경 변수 읽어오기
```php
define('ENVIRONMENT', !empty(getenv('CI_ENV')) ? getenv('CI_ENV') : 'development');
```

### database.php
```php

$db['default'] = array(
	'dsn'	=> '',
    'hostname' => getenv('CODEIGNITER_DATABASE_HOST', true) ?: getenv('CODEIGNITER_DATABASE_HOST'),
    'username' => getenv('CODEIGNITER_DATABASE_USER', true) ?: getenv('CODEIGNITER_DATABASE_USER'),
    'password' => getenv('CODEIGNITER_DATABASE_PASSWORD', true) ?: getenv('CODEIGNITER_DATABASE_PASSWORD'),
    'database' => getenv('CODEIGNITER_DATABASE_NAME', true) ?: getenv('CODEIGNITER_DATABASE_NAME'),
```


## Todo
