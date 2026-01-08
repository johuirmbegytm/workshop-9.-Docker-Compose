# Лабораторна-практична робота №9

## Тема:

Робота з Dockerfile та Docker Compose

## Мета:

Навчитися працювати з директивами Dockerfile і запускати багатосервісний застосунок (Flask + Redis) за допомогою Docker Compose

### Хід роботи:

#### 1. Структура проєкту

Структура:

- `requirements.txt` — - список залежностей (flask, redis), які треба встановити всередині контейнера.
- `Dockerfile` — - інструкції для збірки образу твого застосунку: базовий Python, копіювання файлів, установка залежностей, запуск app.py.
- `app.py` — Python‑код веб‑застосунку на Flask, який підключається до Redis і показує лічильник переглядів.
- `docker-compose.yml` — описує сервіси:
  - `web` (твій Flask‑додаток, який збирається з Dockerfile і слухає порт 5000)
  - `redis` (офіційний образ Redis, який використовується як база даних).



#### 2. Побудова та запуск проєкту

Виконуємо збірку образів та запуск контейнерів за допомогою Docker Compose.

```bash
docker compose up --build
```

Команда виконує повний цикл запуску багатосервісного застосунку:

- Redis: автоматично завантажується офіційний образ redis:7, запускається сервер Redis на порту 6379.

- Web (Flask):
  - Збирається власний Docker-образ із Dockerfile.
  - Встановлюються залежності з requirements.txt.
  - Копіюється app.py і запускається Flask-сервер на порту 5000.

- Docker створює мережу між контейнерами, щоб Flask міг звертатися до Redis.

- Контейнери запускаються і переходять у статус Running, якщо все налаштовано правильно.

>![placeholder](<https://github.com/johuirmbegytm/workshop-9.-Docker-Compose/blob/main/images/1.png?raw=true>)

#### 3. Перевірка статусу контейнері у Docker Desktop
Для перевірки успішності запуску використовуємо графічний інтерфейс `Docker Desktop`:

у розділі `Containers` бачимо групу контейнерів workshop-9-docker-compose.

контейнер `redis` (образ `redis:7`) та контейнер `web `(образ застосунку) мають статус `Running`.

для контейнера `web` прокинуто порт `5000:5000`.

>![placeholder](<https://github.com/johuirmbegytm/workshop-9.-Docker-Compose/blob/main/images/2.png?raw=true>)

#### 4. Тестування роботи застосунку

Переходимо за адресою http://localhost:5000 у веб-переглядачі:

Сторінка виводить повідомлення: `"Цю сторінку переглядали {кількість} разів." `

>![placeholder](<https://github.com/johuirmbegytm/workshop-9.-Docker-Compose/blob/main/images/3.png?raw=true>)

Після оновлення сторінки лічильник переглядів коректно збільшується, що підтверджує зв'язок між `Flask` та `Redis`.

>![placeholder](<https://github.com/johuirmbegytm/workshop-9.-Docker-Compose/blob/main/images/4.png?raw=true>)

5. Моніторинг логів та зупинка
У вкладці `Logs` контейнера `web-1` відображаються `HTTP-запити` зі статусом `200 OK`.

>![placeholder](<https://github.com/johuirmbegytm/workshop-9.-Docker-Compose/blob/main/images/5.png?raw=true>)

Після завершення тестування виконуємо команду для зупинки та видалення контейнерів і мереж:

```bash
docker compose down
```

>![placeholder](<https://github.com/johuirmbegytm/workshop-9.-Docker-Compose/blob/main/images/6.png?raw=true>)
