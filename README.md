proxyx
======

簡単に Web サービスを HTTPS 化するリバースプロキシサーバー


## Description

proxyx は、[Docker](https://www.docker.com/) と [Let's Encrypt](https://letsencrypt.org) を活用します。
SSL サーバ証明書の発行は、Let's Encrypt が定めるレート制限 ( [Rate Limits](https://letsencrypt.org/docs/rate-limits/) ) に依存しますのでご注意ください。
まずは、独自ドメインの A レコードを設定し、Let's Encrypt のサーバーから独自ドメインの Web サービスへアクセスできるようにしてください。
そして、proxyx の certadd を実行すれば、簡単に Web サービスを HTTPS 化することができます。

## Usage

```
docker-compose exec nginx certadd <Your Domain> <Your E-Mail> <Web Service URI>
docker-compose exec nginx certdel <Your Domain>
```

- certadd

    SSL サーバ証明書の発行を実行します。
    `<Your Domain>` にあなたが管理する独自ドメインを指定します。
    `<Your E-Mail>` に Let's Encrypt からのお知らせを受信するメールアドレスを指定します。
    `<Web Service URI>` に Web サービスのURIを指定します。
    
- certdel

    SSL サーバ証明書の失効を実行します。
    `<Your Domain>` にあなたが管理する独自ドメインを指定します。

## Licence

[MIT](https://github.com/delyce/proxyx/LICENCE)

## Author

[delyce](https://github.com/delyce)
