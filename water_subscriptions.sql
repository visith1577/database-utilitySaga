CREATE TABLE water_subscriptions(
  nic varchar(13) PRIMARY KEY CHECK (CHAR_LENGTH(nic) > 10),
  email bool,
  sms bool
);