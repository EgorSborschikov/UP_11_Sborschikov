
# ИНДИВИДУАЛЬНЫЙ ПРОЕКТ ПО УЧЕБНОЙ ПРАКТИКЕ УП.11

## Тема - Ветеринарная клиника

### Функциональные возможности

### Технологический стек:
- **Frontend(Desktop)**: Avalonia + ReactiveUI;
- **Object-Relational Mapping**: EntityFrameworkCore + Npgsql;
- **Datastorage**: PostgreSQL;
- **Containerize**: Docker;

### Навигация в репозитории
- **data_upload/**: скрипты схемы БД, insert-запросы, хранимые процедуры в БД(data_upload/replace_procedures/);
- **documentation/**: описание предметной области, ER-модель;
- **frontend/**: исходный код клиентского приложения, реализующий CRUD-логику;
- **docker/**: bash-скрипт для создания контейнера Docker (удаленное соединение с базой данных)
