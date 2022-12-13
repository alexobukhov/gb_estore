drop table if exists users;

create table users
(
    id         integer not null primary key,
    username   varchar not null,
    password   char    not null,
    first_name varchar not null,
    last_name  varchar not null,
    email      varchar not null,
    phone      varchar not null
);

comment on table users is 'Пользователи информационной системы';

drop table if exists authorities;

create table authorities
(
    id        integer     not null primary key,
    username  varchar(50) not null,
    authority varchar(50) default null,
    constraint fk_role_username foreign key (username) references users (username)
);

comment on table authorities is 'Роли пользователей';

create unique index ix_auth_username on authorities (username, authority);

drop table if exists categories;

create table categories
(
    id          integer      not null primary key,
    title       varchar(255) not null,
    description varchar(5000)
);

comment on table categories is 'Категории товаров';

drop table if exists products;

create table products
(
    id                integer       not null primary key,
    category_id       integer       not null,
    vendor_code       varchar(8)    not null,
    title             varchar(255)  not null,
    short_description varchar(1000) not null,
    full_description  varchar(5000) not null,
    price             decimal(8, 2) not null,
    create_at         timestamp     not null default CURRENT_TIMESTAMP,
    update_at         timestamp     not null default CURRENT_TIMESTAMP,
    constraint fk_category_id foreign key (category_id) references categories
);

comment on table products is 'Товары магазина';

drop table if exists product_images;

create table product_images
(
    id         integer      not null primary key,
    product_id integer      not null,
    path       varchar(250) not null,
    constraint fk_product_img FOREIGN KEY (product_id) REFERENCES products
);

comment on table product_images is 'Изображения товаров';

drop table if exists order_statuses;

create table order_statuses
(
    id    integer not null primary key,
    title varchar(50) default null
);

comment on table order_statuses is 'Статусы заказов';

drop table if exists delivery_addresses;

create table delivery_addresses
(
    id      integer      not null primary key,
    user_id integer      not null,
    address varchar(500) not null,
    constraint fk_user_id_address foreign key (user_id) references users
);

comment on table delivery_addresses is 'Адрес доставки привязанные к пользователю';

drop table if exists orders;

create table orders
(
    id                  integer       not null primary key,
    user_id             integer       not null,
    price               decimal(8, 2) not null,
    delivery_price      decimal(8, 2) not null,
    delivery_address_id integer       not null,
    phone_number        varchar(20)   not null,
    status_id           integer       not null,
    delivery_date       timestamp     not null,
    create_at           timestamp     not null default CURRENT_TIMESTAMP,
    update_at           timestamp     not null default CURRENT_TIMESTAMP,
    constraint fk_user_id foreign key (user_id) references users,
    constraint fk_status_id foreign key (status_id) references order_statuses,
    constraint fk_delivery_address_id foreign key (delivery_address_id) references delivery_addresses
);

comment on table orders is 'Заказы пользователя';

drop table if exists order_item;

create table order_item
(
    id          integer       not null primary key,
    product_id  integer       not null,
    order_id    integer       not null,
    quantity    integer       not null,
    item_price  decimal(8, 2) not null,
    total_price decimal(8, 2) not null,
    constraint fk_order_id foreign key (order_id) references orders,
    constraint fk_product_id_ord_it foreign key (product_id) references products
);

comment on table order_item is 'Товар в заказе привязанный к заказу';

set foreign_key_checks = 1;

-- Добавление пользователей
insert into users (username, password, first_name, last_name, email, phone)
values ('admin', '$2a$10$4p6U8Ve1ZjJ/S0Qd9RFyB.hJjpusgdYmTtIIqpHs3k0hfbhDe6cyq', 'Admin', 'Admin', 'admin@test.com',
        '+79881111111'),
       ('manager', '$2a$10$4p6U8Ve1ZjJ/S0Qd9RFyB.hJjpusgdYmTtIIqpHs3k0hfbhDe6cyq', 'Manager', 'Manager',
        'manager@test.com',
        '+79881111111'),
       ('employee', '$2a$10$4p6U8Ve1ZjJ/S0Qd9RFyB.hJjpusgdYmTtIIqpHs3k0hfbhDe6cyq', 'Employee', 'Employee',
        'emplyee@test.com',
        '+79881111111')
;

-- Добавление привелегий
insert into authorities (username, authority)
values ('employee','ROLE_EMPLOYEE'),
       ('manager','ROLE_MANAGER'),
       ('admin','ROLE_ADMIN');

-- Добавление категорий товаров
insert into categories (title)
values ('Телевизоры'),
       ('Ноутбуки');

-- Добавление статусов заказов
insert into order_statuses (title)
values ('Сформирован');

-- Добавление товаров
insert into products (category_id, vendor_code, title, short_description, full_description, price)
values (1, '00000001', '20\" Телевизор Samsung UE20NU7170U', 'Коротко: Хороший телевизор Samsung 20',
        'LED телевизор Samsung 20', 1.00),
       (1, '00000002', '24\" Телевизор Samsung UE24NU7170U', 'Коротко: Хороший телевизор Samsung 24',
        'LED телевизор Samsung 24', 2.00),
       (1, '00000003', '28\" Телевизор Samsung UE28NU7170U', 'Коротко: Хороший телевизор Samsung 28',
        'LED телевизор Samsung 28', 3.00),
       (1, '00000004', '32\" Телевизор Samsung UE32NU7170U', 'Коротко: Хороший телевизор Samsung 32',
        'LED телевизор Samsung 32', 4.00),
       (1, '00000005', '36\" Телевизор Samsung UE36NU7170U', 'Коротко: Хороший телевизор Samsung 36',
        'LED телевизор Samsung 36', 5.00),
       (1, '00000006', '40\" Телевизор Samsung UE40NU7170U', 'Коротко: Хороший телевизор Samsung 40',
        'LED телевизор Samsung 40', 6.00),
       (1, '00000007', '44\" Телевизор Samsung UE44NU7170U', 'Коротко: Хороший телевизор Samsung 44',
        'LED телевизор Samsung 44', 7.00),
       (1, '00000008', '48\" Телевизор Samsung UE48NU7170U', 'Коротко: Хороший телевизор Samsung 48',
        'LED телевизор Samsung 48', 8.00),
       (1, '00000009', '52\" Телевизор Samsung UE52NU7170U', 'Коротко: Хороший телевизор Samsung 52',
        'LED телевизор Samsung 52', 9.00),
       (1, '00000010', '56\" Телевизор Samsung UE56NU7170U', 'Коротко: Хороший телевизор Samsung 56',
        'LED телевизор Samsung 56', 10.00),
       (1, '00000011', '60\" Телевизор Samsung UE60NU7170U', 'Коротко: Хороший телевизор Samsung 60',
        'LED телевизор Samsung 60', 11.00),
       (1, '00000012', '64\" Телевизор Samsung UE64NU7170U', 'Коротко: Хороший телевизор Samsung 64',
        'LED телевизор Samsung 64', 12.00);

-- Добавление данных об изображениях товаров
insert into product_images (product_id, path)
values (2, '2.jpg');

-- Добавление адресов доставки
insert into delivery_addresses (user_id, address)
values (1, '18a Diagon Alley'),
       (1, '4 Privet Drive');