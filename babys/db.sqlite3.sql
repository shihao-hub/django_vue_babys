PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO django_migrations VALUES(1,'contenttypes','0001_initial','2024-07-14 09:45:47.177718');
INSERT INTO django_migrations VALUES(2,'auth','0001_initial','2024-07-14 09:45:47.202085');
INSERT INTO django_migrations VALUES(3,'admin','0001_initial','2024-07-14 09:45:47.219035');
INSERT INTO django_migrations VALUES(4,'admin','0002_logentry_remove_auto_add','2024-07-14 09:45:47.235032');
INSERT INTO django_migrations VALUES(5,'admin','0003_logentry_add_action_flag_choices','2024-07-14 09:45:47.245343');
INSERT INTO django_migrations VALUES(6,'contenttypes','0002_remove_content_type_name','2024-07-14 09:45:47.268319');
INSERT INTO django_migrations VALUES(7,'auth','0002_alter_permission_name_max_length','2024-07-14 09:45:47.284687');
INSERT INTO django_migrations VALUES(8,'auth','0003_alter_user_email_max_length','2024-07-14 09:45:47.298718');
INSERT INTO django_migrations VALUES(9,'auth','0004_alter_user_username_opts','2024-07-14 09:45:47.311303');
INSERT INTO django_migrations VALUES(10,'auth','0005_alter_user_last_login_null','2024-07-14 09:45:47.325303');
INSERT INTO django_migrations VALUES(11,'auth','0006_require_contenttypes_0002','2024-07-14 09:45:47.331317');
INSERT INTO django_migrations VALUES(12,'auth','0007_alter_validators_add_error_messages','2024-07-14 09:45:47.341268');
INSERT INTO django_migrations VALUES(13,'auth','0008_alter_user_username_max_length','2024-07-14 09:45:47.355305');
INSERT INTO django_migrations VALUES(14,'auth','0009_alter_user_last_name_max_length','2024-07-14 09:45:47.370270');
INSERT INTO django_migrations VALUES(15,'auth','0010_alter_group_name_max_length','2024-07-14 09:45:47.384273');
INSERT INTO django_migrations VALUES(16,'auth','0011_update_proxy_permissions','2024-07-14 09:45:47.397304');
INSERT INTO django_migrations VALUES(17,'auth','0012_alter_user_first_name_max_length','2024-07-14 09:45:47.413303');
INSERT INTO django_migrations VALUES(18,'sessions','0001_initial','2024-07-14 09:45:47.425269');
INSERT INTO django_migrations VALUES(19,'commodity','0001_initial','2024-08-04 16:36:30.194049');
INSERT INTO django_migrations VALUES(20,'shopper','0001_initial','2024-08-04 16:36:30.206049');
INSERT INTO django_migrations VALUES(21,'commodity','0002_rename_sezes_commodityinfos_sizes','2024-08-12 16:07:20.886157');
INSERT INTO django_migrations VALUES(22,'shopper','0002_alter_cartinfos_commodity_infos_id_and_more','2024-08-12 16:07:20.896191');
CREATE TABLE IF NOT EXISTS "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" smallint unsigned NOT NULL CHECK ("action_flag" >= 0), "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "action_time" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
INSERT INTO django_content_type VALUES(1,'admin','logentry');
INSERT INTO django_content_type VALUES(2,'auth','permission');
INSERT INTO django_content_type VALUES(3,'auth','group');
INSERT INTO django_content_type VALUES(4,'auth','user');
INSERT INTO django_content_type VALUES(5,'contenttypes','contenttype');
INSERT INTO django_content_type VALUES(6,'sessions','session');
INSERT INTO django_content_type VALUES(7,'shopper','cartinfos');
INSERT INTO django_content_type VALUES(8,'shopper','orderinfos');
INSERT INTO django_content_type VALUES(9,'commodity','commodityinfos');
INSERT INTO django_content_type VALUES(10,'commodity','types');
CREATE TABLE IF NOT EXISTS "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
INSERT INTO auth_permission VALUES(1,1,'add_logentry','Can add log entry');
INSERT INTO auth_permission VALUES(2,1,'change_logentry','Can change log entry');
INSERT INTO auth_permission VALUES(3,1,'delete_logentry','Can delete log entry');
INSERT INTO auth_permission VALUES(4,1,'view_logentry','Can view log entry');
INSERT INTO auth_permission VALUES(5,2,'add_permission','Can add permission');
INSERT INTO auth_permission VALUES(6,2,'change_permission','Can change permission');
INSERT INTO auth_permission VALUES(7,2,'delete_permission','Can delete permission');
INSERT INTO auth_permission VALUES(8,2,'view_permission','Can view permission');
INSERT INTO auth_permission VALUES(9,3,'add_group','Can add group');
INSERT INTO auth_permission VALUES(10,3,'change_group','Can change group');
INSERT INTO auth_permission VALUES(11,3,'delete_group','Can delete group');
INSERT INTO auth_permission VALUES(12,3,'view_group','Can view group');
INSERT INTO auth_permission VALUES(13,4,'add_user','Can add user');
INSERT INTO auth_permission VALUES(14,4,'change_user','Can change user');
INSERT INTO auth_permission VALUES(15,4,'delete_user','Can delete user');
INSERT INTO auth_permission VALUES(16,4,'view_user','Can view user');
INSERT INTO auth_permission VALUES(17,5,'add_contenttype','Can add content type');
INSERT INTO auth_permission VALUES(18,5,'change_contenttype','Can change content type');
INSERT INTO auth_permission VALUES(19,5,'delete_contenttype','Can delete content type');
INSERT INTO auth_permission VALUES(20,5,'view_contenttype','Can view content type');
INSERT INTO auth_permission VALUES(21,6,'add_session','Can add session');
INSERT INTO auth_permission VALUES(22,6,'change_session','Can change session');
INSERT INTO auth_permission VALUES(23,6,'delete_session','Can delete session');
INSERT INTO auth_permission VALUES(24,6,'view_session','Can view session');
INSERT INTO auth_permission VALUES(25,7,'add_cartinfos','Can add 购物车');
INSERT INTO auth_permission VALUES(26,7,'change_cartinfos','Can change 购物车');
INSERT INTO auth_permission VALUES(27,7,'delete_cartinfos','Can delete 购物车');
INSERT INTO auth_permission VALUES(28,7,'view_cartinfos','Can view 购物车');
INSERT INTO auth_permission VALUES(29,8,'add_orderinfos','Can add 订单信息');
INSERT INTO auth_permission VALUES(30,8,'change_orderinfos','Can change 订单信息');
INSERT INTO auth_permission VALUES(31,8,'delete_orderinfos','Can delete 订单信息');
INSERT INTO auth_permission VALUES(32,8,'view_orderinfos','Can view 订单信息');
INSERT INTO auth_permission VALUES(33,9,'add_commodityinfos','Can add 商品信息');
INSERT INTO auth_permission VALUES(34,9,'change_commodityinfos','Can change 商品信息');
INSERT INTO auth_permission VALUES(35,9,'delete_commodityinfos','Can delete 商品信息');
INSERT INTO auth_permission VALUES(36,9,'view_commodityinfos','Can view 商品信息');
INSERT INTO auth_permission VALUES(37,10,'add_types','Can add 商品类型');
INSERT INTO auth_permission VALUES(38,10,'change_types','Can change 商品类型');
INSERT INTO auth_permission VALUES(39,10,'delete_types','Can delete 商品类型');
INSERT INTO auth_permission VALUES(40,10,'view_types','Can view 商品类型');
CREATE TABLE IF NOT EXISTS "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(150) NOT NULL UNIQUE);
CREATE TABLE IF NOT EXISTS "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "last_name" varchar(150) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "first_name" varchar(150) NOT NULL);
INSERT INTO auth_user VALUES(1,'pbkdf2_sha256$390000$dRYw58nBE66S2PjDjBNurl$LgQvxqkrAdJ6PJlwhdRSq5UDtBB0pMGxhfczdCkaqKs=','2024-08-04 16:36:52.825924',1,'root','','2958017271@qq.com',1,1,'2024-07-14 09:46:36.363060','');
CREATE TABLE IF NOT EXISTS "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
INSERT INTO django_session VALUES('3cublqq6xdguk3b06hvq3t70zqwex7dm','.eJxVjM0OwiAQhN-FsyErPwU8evcZyMIuUjU0Ke3J-O62SQ96nPm-mbeIuC41rp3nOJK4iLM4_XYJ85PbDuiB7T7JPLVlHpPcFXnQLm8T8et6uH8HFXvd1hk1K2TwgZxizQCUBuV0MKp4tFvwxYHjBKQHys7YbCA5KNan4I0Rny_v6DfY:1sSvpR:YsRb4W0TCwwtaZcx0l2M1ja2TYarhYt87eapzQO6Oew','2024-07-28 09:47:37.369003');
INSERT INTO django_session VALUES('me4gacxwi44j6bt1ob5y6urtjfkdphnu','.eJxVjM0OwiAQhN-FsyErPwU8evcZyMIuUjU0Ke3J-O62SQ96nPm-mbeIuC41rp3nOJK4iLM4_XYJ85PbDuiB7T7JPLVlHpPcFXnQLm8T8et6uH8HFXvd1hk1K2TwgZxizQCUBuV0MKp4tFvwxYHjBKQHys7YbCA5KNan4I0Rny_v6DfY:1saeE0:SVtkdGMUP6toR2r_3HuDl4z_wJBJNEnsvOacWzMSI1M','2024-08-18 16:36:52.831925');
CREATE TABLE IF NOT EXISTS "commodity_commodityinfos" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(100) NOT NULL, "sizes" varchar(100) NOT NULL, "types" varchar(100) NOT NULL, "price" real NOT NULL, "discount" real NOT NULL, "stock" integer NOT NULL, "sold" integer NOT NULL, "likes" integer NOT NULL, "created" date NOT NULL, "img" varchar(100) NOT NULL, "details" varchar(100) NOT NULL);
CREATE TABLE IF NOT EXISTS "commodity_types" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "firsts" varchar(100) NOT NULL, "seconds" varchar(100) NOT NULL);
CREATE TABLE IF NOT EXISTS "shopper_cartinfos" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "quantity" integer NOT NULL, "commodity_infos_id" integer NOT NULL, "user_id" integer NOT NULL);
CREATE TABLE IF NOT EXISTS "shopper_orderinfos" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "price" real NOT NULL, "created" date NOT NULL, "user_id" integer NOT NULL, "state" varchar(20) NOT NULL);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('django_migrations',22);
INSERT INTO sqlite_sequence VALUES('django_admin_log',0);
INSERT INTO sqlite_sequence VALUES('django_content_type',10);
INSERT INTO sqlite_sequence VALUES('auth_permission',40);
INSERT INTO sqlite_sequence VALUES('auth_group',0);
INSERT INTO sqlite_sequence VALUES('auth_user',1);
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_group_id_97559544" ON "auth_user_groups" ("group_id");
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
COMMIT;
