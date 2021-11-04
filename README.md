<h1 align="center">Tea Subscription</h1>

<p align="center">
  <a href="https://github.com/JasonPKnoll/tea_subscription/graphs/contributors">
    <img src="https://img.shields.io/github/contributors/JasonPKnoll/tea_subscription?style=for-the-badge" alt="contributors_badge">
  </a>
  <a href="https://github.com/JasonPKnoll/tea_subscription/issues">
    <img src="https://img.shields.io/github/issues/JasonPKnoll/tea_subscription?style=for-the-badge" alt="issues_badge">
  </a>
  <a href="https://github.com/JasonPKnoll/tea_subscription/network/members">
    <img src="https://img.shields.io/github/forks/JasonPKnoll/tea_subscription?style=for-the-badge" alt="forks_badge">
  </a>
  <a href="https://github.com/JasonPKnoll/tea_subscription/stargazers">
    <img src="https://img.shields.io/github/stars/JasonPKnoll/tea_subscription?style=for-the-badge" alt="stars_badge">
  </a>
</p>

<h4 align="center">Mock take-home for Turing</h4>


<p align="center">
  <a href="#about-the-project">About The Project</a> •
  <a href="#technologies">Technologies</a> •
  <a href="#getting-started">Getting Started</a> •
  <a href="#database-schema">Database Schema</a> •
  <a href="#endpoints">Endpoints</a> •
</p>

## About The Project

Mock take-home challenge for building an API to handle tea subscriptions

## Technologies

<div align="center">

| Development | Testing       | Dependencies          |
|:-----------:|:-------------:|:---------------------:|
| Ruby 2.7.2. | RSpec         | FastJSONApi           |
| Rails 6.1.4 | coverage      |                       |
| Pry         | VCR           |                       |
| PostgresQL  |               |                       |

</div>

## Getting Started

  - Clone this repo
  - Run `bundle`

## Endpoints

### Retrieve Customer
#### Request
```
GET /api/v1/customers/1/
Content-Type: application/json
Accept: application/json
```
#### 200 Response
```
{
:data=> {
  :id=>"1",
  :type=>"customers",
  :attributes=> {
     :first_name=>"Loise",
     :last_name=>"Boyer",
     :email=>"owen_abernathy@sawayn.biz",
     :address=>"Suite 720 8868 Monte Camp, Altenwerthville, CA 13437-8233",
     :subscriptions=>
    [{
        :id=>1, 
        :title=>"green tea subscription", 
        :price=>10.0, 
        :status=>"active", 
        :frequency=>"monthly", 
        :created_at=>"2021-11-04T18:29:59.727Z", 
        :updated_at=>"2021-11-04T18:29:59.727Z", 
        :customer_id=>1, 
        :tea_id=>1},
    {
       :id=>2, 
       :title=>"black tea subscription", 
       :price=>10.0, 
       :status=>"archived", 
       :frequency=>"monthly", 
       :created_at=>"2021-11-04T18:29:59.732Z", 
       :updated_at=>"2021-11-04T18:29:59.732Z", 
       :customer_id=>1, 
       :tea_id=>2
      }]
    }
  }
}
```
### Add Subscription
#### Request
```
POST /api/v1/customers/1/subscriptions
Params: 
{
  tea: 'green',
  title: 'green tea subscription',
  price: 10.00,
  status: 0,
  frequency: 0,
}
Content-Type: application/json
Accept: application/json
```
#### 201 Response
```
{
:data=>
  {
  :id=>"3", 
  :type=>"subscriptions", 
  :attributes=>
    {
    :title=>"green tea subscription", 
    :price=>10.0, 
    :status=>"active", 
    :frequency=>"monthly"
    }
  }
}
```
### Change Subscription Status
#### Request
```
PATCH /api/v1/customers/1/subscriptions/1
Params: 
{
  status: "archived",
}
Content-Type: application/json
Accept: application/json
```
#### 204 Response
```
{
:data=>
  {
  :id=>"1", 
  :type=>"subscriptions", 
  :attributes=>
    {
    :title=>"green tea subscription", 
    :price=>10.0, 
    :status=>"archived", 
    :frequency=>"monthly"
    }
  }
}
```

