# ERD AUTHENTICATION FLOW

```mermaid
erDiagram

    USERS {
        int id PK
        varchar name
        varchar email 
        text password
        timestamp created_at
        int role_id FK
    }

    SESSIONS {
        int id PK
        int user_id FK
        text token UNIQUE
        timestamp created_at
    }

    ROLES {
        int id PK
        varchar name UNIQUE
    }

    USERS ||--o{ SESSIONS : has
    ROLES ||--o{ USERS : assigned

```