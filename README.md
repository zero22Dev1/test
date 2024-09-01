# 環境構築

1\.gitからclone(今回はgitHunbCLIを使用)する

```
gh repo clone zero22Dev1/test
```

2\. ".env"ファイルを作成し、スキーマ名など変更

下記は例

RDS_HOST=your-rds-endpoint.rds.amazonaws.com　←ホスト名
RDS_PORT=3306
RDS_USER=your-username
RDS_PASS=your-password
RDS_DB=your-database-name