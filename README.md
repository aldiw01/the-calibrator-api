# [API] the-calibrator - Centralize database and process in Calibration Laboratory
This project is under development, feel free to contact me for question.

## Installation

#### Clone the repo
``` bash
$ git clone https://github.com/aldiw01/the-calibrator-api.git
```

#### Go into app's directory
``` bash
$ cd the-calibrator-api
```

#### Import database telkom_calibrator.sql into mySQL server

#### Install node and npm
For windows version, you can get it here -> https://nodejs.org/en/download/ 

#### Install app's dependencies
``` bash
$ npm install
```

## Set Environment Variables

#### Primary
```
APP_CIPHER_ALGORITHM
APP_CIPHER_BASE
APP_CIPHER_SECRET
APP_CIPHER_SALT
APP_DATABASE_DB
APP_DATABASE_HOST
APP_DATABASE_PASSWORD
APP_DATABASE_USER
APP_EMAIL_NAME
APP_EMAIL_PASSWORD
APP_EMAIL_USER
APP_HASH_ALGORITHM
APP_TOKEN_SECRET
APP_URL_LOGIN
APP_URL_RESET_PASSWORD
```

## Deploy API
``` bash
$ node src/index
```
or
``` bash
$ npm start
```
or
``` bash
$ yarn start
```

## Status Info
Info about Status ID, any configuration may change in future update.

#### User status
```
0. Not verified
1. Active/Staff
2. Super Admin
9. Deactivated
```
