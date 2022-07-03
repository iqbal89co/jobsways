## Capstone Project Generasi Gigih 2.0 "Jobsways"

This project was created by :

1. Iqbal Fakhriza (KM_G2BE3099)
2. Aflah Hilmy (KM_G2BE4020)
3. Muhammad Fiqri Turham (KM_G2BE1009)
4. Muhammad Avtara Khrisna (KM_G2BE3003)
5. Novanda Akhsin Diar Fadly (KM_G2BE2178)

## LINKS

# POSTMAN

https://app.getpostman.com/join-team?invite_code=c46d2fc607c95877eab39483ecc17e16&target_code=463fcc1013b43ab4b5634e0a520a934d

# product design (whimsical)

https://whimsical.com/7VCnnpG5GWigqEm3VZWsg3

# github repository

https://whimsical.com/7VCnnpG5GWigqEm3VZWsg3

## FEATURES

# AUTHENTICATION

GET /users

```ruby
response {
    [
        {
            "id": 1,
            "username": "iqbal89co",
            "email": "iqbal@gmail.com",
            "password_digest": "$2a$12$LE81Pn2pqMunzPsquoLGY.qj6.8mwQ4OHwVnm4.cbunzhwYbX3oEC",
            "is_admin": 0,
            "company_id": null,
            "created_at": "2022-07-03T11:28:28.176Z",
            "updated_at": "2022-07-03T11:28:28.176Z"
        }
    ]
}
```

GET /users/:username

```ruby
response {
    {
        "id": 1,
        "username": "iqbal89co",
        "email": "iqbal@gmail.com",
        "password_digest": "$2a$12$LE81Pn2pqMunzPsquoLGY.qj6.8mwQ4OHwVnm4.cbunzhwYbX3oEC",
        "is_admin": 0,
        "company_id": null,
        "created_at": "2022-07-03T11:28:28.176Z",
        "updated_at": "2022-07-03T11:28:28.176Z"
    }
}
```

POST /users
sign up to make user with blank user data

```ruby
body {
    name: Iqbal Fakhriza
    username: iqbal89co
    email: iqbal@gmail.com
    password: iqbal123
    password_confirmation: iqbal123
}
response {
    {
        "id": 1,
        "user_id": 1,
        "name": "Iqbal Fakhriza",
        "location": null,
        "contact": null,
        "birth_date": null,
        "nationality": null,
        "resume": {
            "url": null
        },
        "status": "unemployed",
        "created_at": "2022-07-03T11:28:28.492Z",
        "updated_at": "2022-07-03T11:28:28.492Z"
    }
}
```

POST /auth/login
login with credentials

```ruby
body {
    email: iqbal@gmail.com
    password: iqbal123
}
response {
    {
        "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2NTY5MzQyNDd9.qpYmDwq8gJraXT3T6kxCp2IZBE9up5HQUvX1XeEpQtQ",
        "exp": "07-04-2022 18:30",
        "username": "iqbal89co"
    }
}
```

# USER PROFILE

GET /users/profile

```ruby
response {
    {
        "id": 1,
        "user_id": 1,
        "name": "Iqbal Fakhriza",
        "location": null,
        "contact": null,
        "birth_date": null,
        "nationality": null,
        "resume": {
            "url": null
        },
        "status": "unemployed",
        "created_at": "2022-07-03T11:28:28.492Z",
        "updated_at": "2022-07-03T11:28:28.492Z"
    }
}
```

PATCH /users/profile
update user data

```ruby
body {
    name: Iqbal Fakhriza
    location: Indonesia
    contact: 082312312484
    birth_date: 03/12/2001
    nationality: Indonesia
}
response {
    {
        "name": "Iqbal Fakhriza",
        "location": "Indonesia",
        "contact": "082312312484",
        "birth_date": "2001-12-03",
        "nationality": "Indonesia",
        "resume": {
            "url": null
        },
        "id": 1,
        "user_id": 1,
        "status": "unemployed",
        "created_at": "2022-07-03T11:28:28.492Z",
        "updated_at": "2022-07-03T11:39:24.674Z"
    }
}
```

PATCH /users/profile
update status in user data

```ruby
body {
    status: "employed"
}
response {
    {
    "status": "employed",
    "resume": {
        "url": "/uploads/user_datum/resume/1-"
    },
    "id": 1,
    "user_id": 1,
    "name": "Iqbal Fakhriza",
    ...
}
}
```

PATCH /users/profile
upload and update resume in user data

```ruby
body {
    resume(file): "capstone.pdf"
}
response {
    {
        "resume": {
            "url": "/uploads/user_datum/resume/1-Capstone_Proposal_BE_EM2.pdf"
        },
        "id": 1,
        "user_id": 1,
        "name": "Iqbal Fakhriza",
        ...
    }
}
```

GET /users/profile/downloadCV
download/view resume file in user data

```ruby
response with download/view file
```
