# Jobsways

Jobsways is a job vacancy platform that brings together people looking for work with companies that need quality talent. In it there are many variations of work in various fields. The job vacancy has various criteria according to the job offered. For this opportunity, we are making an application in the form of a REST API, in this application there are 2 (two) user roles in it, namely, there are users who are looking for jobs (talents) and also companies that are looking for talents, so users who are company representatives can create vacancies. more than one job and users who are looking for work can get more extensive information according to the abilities of each user.

This project was created by BE_EM2 group consisting of:

1. Iqbal Fakhriza (KM_G2BE3099)
2. Aflah Hilmy (KM_G2BE4020)
3. Muhammad Fiqri Turham (KM_G2BE1009)
4. Muhammad Avtara Khrisna (KM_G2BE3003)
5. Novanda Akhsin Diar Fadly (KM_G2BE2178)

# Installation

Clone this github repo:

```bash
git clone https://github.com/iqbal89co/jobsways.git
```

Install all required bundle:

```bash
bundle install
```

Run the migration:

```bash
rake db:migrate
```

Run the server:

```bash
rails s
```

# LINKS

## POSTMAN

https://app.getpostman.com/join-team?invite_code=c46d2fc607c95877eab39483ecc17e16&target_code=463fcc1013b43ab4b5634e0a520a934d

## product design (whimsical)

https://whimsical.com/7VCnnpG5GWigqEm3VZWsg3

## github repository

https://whimsical.com/7VCnnpG5GWigqEm3VZWsg3

# Usage

## AUTHENTICATION

#### GET /users

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

#### GET /users/:username

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

#### POST /users

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

#### POST /auth/login

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

## USER PROFILE

#### GET /users/profile

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

#### PATCH /users/profile

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

#### PATCH /users/profile

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

#### PATCH /users/profile

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

#### GET /users/profile/downloadCV

download/view resume file in user data

```ruby
response with download/view file
```

## COMPANY

#### GET {{baseurl}}/companies

```ruby
Body: [
]
Response: [
    {
        "id": 1,
        "name": "Cupcake Study",
        "description": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
        "total_employee": 200,
        "email": "cupcake@study.com",
        "location": "Indonesia",
        "website": "www.studywithcupcake.com",
        "created_at": "2022-07-03T11:33:20.903Z",
        "updated_at": "2022-07-03T11:33:20.903Z"
    }
]
```

#### GET {{baseurl}}/companies/(:id)

```ruby
Body: {
}
Response: {
    "id": 1,
    "name": "Cupcake Study",
    "description": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
    "total_employee": 200,
    "email": "cupcake@study.com",
    "location": "Indonesia",
    "website": "www.studywithcupcake.com",
    "created_at": "2022-07-03T11:33:20.903Z",
    "updated_at": "2022-07-03T11:33:20.903Z"
}
```

#### PATCH {{baseurl}}/companies/(:id)

```ruby
Body: {
    "name": "BCA"
    "description": "Bank BCA adalah lorem ipsum"
    "total_employee": "1000"
    "email": "bank@bca.co.id"
    "location": "Jakarta"
    "website": "bca.co.id"
}
Response: {
    "status": "success"
}
```

#### DELETE {{baseurl}}/companies

```ruby
Body: {
}
Response: {
    "status": "success"
}
```

#### GET {{baseurl}}/jobs

```ruby
Body: {
}
Response: [
    {
        "id": 1,
        "company_datum_id": 2,
        "title": "Software Developer",
        "position": "Product Engineer",
        "salary": 5000000.0,
        "salary_upto": null,
        "location": "Jakarta, Indonesia",
        "job_type": "part-time",
        "description": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
        "status": "hiring",
        "created_at": "2022-07-03T11:41:43.655Z",
        "updated_at": "2022-07-03T11:41:43.655Z"
    }
]
```

## JOBS

#### GET {{baseurl}}/jobs

```ruby
Body: {
    "s": "developer"
}
Response: [
    {
        "id": 1,
        "company_datum_id": 2,
        "title": "Software Developer",
        "position": "Product Engineer",
        "salary": 5000000.0,
        "salary_upto": null,
        "location": "Jakarta, Indonesia",
        "job_type": "part-time",
        "description": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
        "status": "hiring",
        "created_at": "2022-07-03T11:41:43.655Z",
        "updated_at": "2022-07-03T11:41:43.655Z"
    }
]
```

#### GET {{baseurl}}/jobs/(:id)

```ruby
Body: {
}
Response: {
    "id": 2,
    "company_datum_id": 2,
    "title": "Software Developer",
    "position": "Product Engineer",
    "salary": 5000000.0,
    "salary_upto": null,
    "location": "Jakarta, Indonesia",
    "job_type": "part-time",
    "description": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
    "status": "hiring",
    "created_at": "2022-07-03T11:53:21.536Z",
    "updated_at": "2022-07-03T11:53:21.536Z"
}
```

#### POST {{baseurl}}/jobs

```ruby
Body: {
    "title": "Software Developer"
    "position": "Product Engineer"
    "salary": "5000000"
    "salary_upto": ""
    "location": "Jakarta, Indonesia"
    "job_type": "part-time"
    "description": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
    "status": "hiring"
}
Response: {
    "status": "success"
}
```

#### PATCH {{baseurl}}/jobs/(:id)

```ruby
Body: {
    "title": "Back End Programmer"
    "position": "Can do Ruby on Rails"
    "salary": "5000000"
    "salary_upto": ""
    "location": "Jakarta, Indonesia"
    "job_type": "full-time"
    "description": "Can do Ruby on Rails"
    "status": "hiring"
}
Response: {
    "msg": "success"
}
```

#### DELETE {{baseurl}}/jobs/(:id)

```ruby
Body: {
}
Response: {
    "msg": "success"
}
```

## JOB APPLICATIONS

#### GET {{baseurl}}/applications

```ruby
Body: {
}
Response: [
    {
        "id": 2,
        "user_datum_id": 1,
        "job_id": 2,
        "status": 0,
        "created_at": "2022-07-03T11:57:13.258Z",
        "updated_at": "2022-07-03T11:57:13.258Z"
    }
]
```

#### GET {{baseurl}}/applications/(:id)

```ruby
Body: {
}
Response: {
    "id": 2,
    "user_datum_id": 1,
    "job_id": 2,
    "status": 0,
    "created_at": "2022-07-03T11:57:13.258Z",
    "updated_at": "2022-07-03T11:57:13.258Z"
}
```

#### GET {{baseurl}}/applications

```ruby
Body: {
    "filter": "user"
}
Response: [
    {
        "id": 2,
        "user_datum_id": 1,
        "job_id": 2,
        "status": 0,
        "created_at": "2022-07-03T11:57:13.258Z",
        "updated_at": "2022-07-03T11:57:13.258Z"
    }
]
```

#### GET {{baseurl}}/applications

```ruby
Body: {
    "filter": "job"
    "id": "2"
}
Response: [
    {
        "id": 2,
        "user_datum_id": 1,
        "job_id": 2,
        "status": 0,
        "created_at": "2022-07-03T11:57:13.258Z",
        "updated_at": "2022-07-03T11:57:13.258Z"
    }
]
```

#### POST {{baseurl}}/applications

```ruby
Body: {
    "user_datum_id": "1"
    "job_id": "1"
    "status": "on process"
}
Response: {
    "status": "success"
}
```

#### PATCH {{baseurl}}/applications/(:id)

```ruby
Body: {
    "user_datum_id": "1"
    "job_id": "1"
    "status": "hired"
}
Response: {
    "status": "success"
}
```

#### DELETE {{baseurl}}/applications/(:id)

```ruby
Body: {
}
Response: {
    "status": "success"
}
```
