
# CarConnect – The Social Media for Car Enthusiasts

## Overview
CarConnect is a niche social media platform built for people who live and breathe cars.  
From group chats (like Bimmerpost forums) to a personalized “Suggested for You” car parts recommendation system, CarConnect is designed to connect enthusiasts, advertisers, and organizers in one unified space.

With dedicated tools for:
- **Users** to share builds, ask questions, and join communities
- **Advertisers** to reach an engaged audience
- **Event organizers** to host meets and showcases
- **Moderators** to keep the platform safe and welcoming

CarConnect brings the entire automotive world into one application.

## Features
- Group chat functionality with moderation tools and bots
- Content feed for posts, photos, and videos
- Personalized recommendations for car parts based on similar user builds
- Advertiser dashboard with ad posting, analytics, and trending insights
- Event management tools with RSVPs, updates, and media galleries
- Profile pages for all users with bios, car lists, and posts
- Streamlit-powered front end and Flask-based REST API

## Technology Stack
- **Frontend:** Streamlit
- **Backend:** Flask (Python)
- **Database:** MySQL
- **Containerization:** Docker & Docker Compose
- **Data Generation:** Mockaroo / Python Faker


## Config files

### API env
```
SECRET_KEY=<some secret key>
DB_USER=root
MYSQL_ROOT_PASSWORD=<your password>
DB_HOST=db
DB_PORT=3306
DB_NAME=RevNet
```

### Streamlit secrets (UI -> API)
```
mkdir -p app/src/.streamlit
printf 'API_BASE_URL = "http://api:4000"\n' > app/src/.streamlit/secrets.toml
```

- Run `docker compose up -d`
- Open app (Streamlit): `http://localhost:8501`
- API sample JSON: `http://localhost:4000/bots/`
- Reset DB if needed: `docker compose down -v` and `docker compose up -d`

## Quick Navigation

- Streamlit pages: `app/src/pages/`

- Navigation helpers: `app/src/modules/`

- API client: `app/src/utils/api.py` (reads API_BASE_URL)

- Flask blueprints: `api/backend/*`

- Schema/seed SQL: `database-files/*.sql` (loaded on first run)

## Troubleshooting

- **UI can’t reach API** → check `app/src/.streamlit/secrets.toml` with `API_BASE_URL = "http://api:4000"`
- **404 hitting `/api/...`** → client should NOT include `/api/`. Use `bots/`, `follows/`, etc.
- **Empty DB** → run a clean reset (see reset DB snippet above).

## Team Members 
 - Sam Penubothula
 - Haoran Wei
 - Ethan Cabalona
 - Brian Kubinec
 - Ayan Imran
