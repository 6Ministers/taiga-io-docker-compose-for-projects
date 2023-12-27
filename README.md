# Installing Taiga with docker-compose.

## Quick Installation

**Before starting the instance, direct the domain (subdomain) to the ip of the server where Taiga will be installed!**

## 1. Taiga Server Requirements
From and more
- 2 CPUs
- 2 RAM 
- 10 Gb 

Run for Ubuntu 22.04

``` bash
sudo apt-get purge needrestart
```

Install docker and docker-compose:

``` bash
curl -s https://raw.githubusercontent.com/6Ministers/taiga-io-docker-compose-for-projects/master/setup.sh | sudo bash -s
```

Download Taiga instance:


``` bash
curl -s https://raw.githubusercontent.com/6Ministers/taiga-io-docker-compose-for-projects/master/download.sh | sudo bash -s taiga
```

If `curl` is not found, install it:

``` bash
$ sudo apt-get install curl
# or
$ sudo yum install curl
```

Go to the catalog

``` bash
cd taiga
```
In the configuration file .env`, set the following parameters:

Install what you need, documentation:

``` bash
# Taiga's URLs - Variables to define where Taiga should be served
TAIGA_SCHEME=https  # serve Taiga using "http" or "https" (secured) connection
TAIGA_DOMAIN=taiga.your-domain.com  # Taiga's base URL
SUBPATH="" # it'll be appended to the TAIGA_DOMAIN (use either "" or a "/subpath")
WEBSOCKETS_SCHEME=wss  # events connection protocol (use either "ws" or "wss")

# Taiga's Secret Key - Variable to provide cryptographic signing
SECRET_KEY="g*IWakUU!PX7u#a@"  # Please, change it to an unpredictable value!!

# Taiga's Database settings - Variables to create the Taiga database and connect to it
POSTGRES_USER=taiga  # user to connect to PostgreSQL
POSTGRES_PASSWORD=taiga  # database user's password

# Taiga's SMTP settings - Variables to send Taiga's emails to the users
EMAIL_BACKEND=smtp  # use an SMTP server or display the emails in the console (either "smtp" or "console")
EMAIL_HOST=smtp.domain.com  # SMTP server address
EMAIL_PORT=465   # default SMTP port
EMAIL_HOST_USER=taiga@domain.com  # user to connect the SMTP server
EMAIL_HOST_PASSWORD=tmsa43dfgrertertS9B&63  # SMTP user's password
EMAIL_DEFAULT_FROM=taiga@domain.com.site  # default email address for the automated emails
# EMAIL_USE_TLS/EMAIL_USE_SSL are mutually exclusive (only set one of those to True)
EMAIL_USE_TLS=False  # use TLS (secure) connection with the SMTP server
EMAIL_USE_SSL=True  # use implicit TLS (secure) connection with the SMTP server

# Taiga's RabbitMQ settings - Variables to leave messages for the realtime and asynchronous events
RABBITMQ_USER=taiga  # user to connect to RabbitMQ
RABBITMQ_PASS=taiga  # RabbitMQ user's password
RABBITMQ_VHOST=taiga  # RabbitMQ container name
RABBITMQ_ERLANG_COOKIE=secret-erlang-cookie  # unique value shared by any connected instance of RabbitMQ

# Taiga's Attachments - Variable to define how long the attachments will be accesible
ATTACHMENTS_MAX_AGE=360  # token expiration date (in seconds)

# Taiga's Telemetry - Variable to enable or disable the anonymous telemetry
ENABLE_TELEMETRY=True
```


To change the domain in the `Caddyfile` to your own

``` bash
https://taiga.your-domain:443 {
    header Strict-Transport-Security max-age=31536000;
    reverse_proxy 127.0.0.1:8000
#    tls admin@example.org
	encode zstd gzip
}
```

**Run Taiga:**

``` bash
docker-compose up -d
```

Then open `https://taiga.domain.com:` to access Taiga


## Taiga container management

**Run Taiga**:

``` bash
docker-compose up -d
```

**Restart**:

``` bash
docker-compose restart
```

**Restart**:

``` bash
sudo docker-compose down && sudo docker-compose up -d
```

**Stop**:

``` bash
docker-compose down
```

## Documentation

