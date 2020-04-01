proxyx
======

簡単に Web サービスを HTTPS 化するリバースプロキシサーバー


## Description

proxyx は、[Docker](https://www.docker.com/) と
[Let's Encrypt](https://letsencrypt.org) を活用します。
SSL サーバ証明書の発行は、Let's Encrypt が定めるレート制限 ( [Rate Limits](https://letsencrypt.org/docs/rate-limits/) ) に依存しますのでご注意ください。
まずは、独自ドメインの A レコードを設定し、Let's Encrypt のサーバーから独自ドメインの Web サービスへアクセスできるようにしてください。
そして、proxyx の certadd を実行すれば、簡単に Web サービスを HTTPS 化することができます。

## Usage

インストール

```bash
git clone https://github.com/delyce/proxyx.git /opt/proxyx
cd /opt/proxyx
docker-compose up -d
```

SSL サーバ証明書の発行
certadd *Your Domain* *Your E-Mail Address* *Web Service URI*
*Your Domain*
あなたが管理する独自ドメインを指定します。
*Your E-Mail Address*
Let's Encrypt からのお知らせを受信するメールアドレスを指定します。
*Web Service URI*
Web サービスのURIを指定します。

```bash
cd /opt/proxyx
docker-compose exec nginx certadd www.example.com webmaster@example.com http://localhost:3000
```

SSL サーバ証明書の失効
certdel *Your Domain*
*Your Domain*
あなたが管理する独自ドメインを指定します。

```bash
cd /opt/proxyx
docker-compose exec nginx certdel www.example.com
```

## Licence

[MIT](https://github.com/delyce/LICENCE)

## Author

[delyce](https://github.com/delyce)


