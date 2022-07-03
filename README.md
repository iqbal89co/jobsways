# Jobsways

Jobsways is a job vacancy platform that brings together people looking for work with companies that need quality talent. In it there are many variations of work in various fields. The job vacancy has various criteria according to the job offered. For this opportunity, we are making an application in the form of a REST API, in this application there are 2 (two) user roles in it, namely, there are users who are looking for jobs (talents) and also companies that are looking for talents, so users who are company representatives can create vacancies. more than one job and users who are looking for work can get more extensive information according to the abilities of each user.

This project was created by BE_EM2 group consisting of:
- Muhammad Iqbal
- Aflah Hilmy
- Muhammad Avtara Khrisna
- Muhammad Fiqri Turham
- Novanda Akhsin Diar Fadly

## Installation

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


## Usage

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
