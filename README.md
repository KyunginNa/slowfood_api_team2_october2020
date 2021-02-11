# Slowfood api

## Description

This is an API for [Slowfood client](https://github.com/KyunginNa/slowfood_client_team2_october2020). The api authenticates users, stores products and orders data, and provides payment functionality using Stripe. It is built with Ruby on Rails(Ruby version 2.5.1).

- User registration
- Display a list of products
- Display an order detail of current user
- Payment

## The code

### Installation

1. Fork and clone [Slowfood API](https://github.com/KyunginNa/slowfood_api_team2_october2020) to your local workspace.

2. Install the project dependencies.

```
bundle
```

3. Create, migrate and seed(optional) your database.

```
rails db:create db:migrate db:seed
```

4. start the server
(the application is deployed on Heroku, so this is also optional)

```
rails s
```

### The User Interface can be found here:

- [Slowfood client](https://github.com/KyunginNa/slowfood_client_team2_october2020)

## Dependencies
* bootsnap
* rails
* pg
* puma
* rack-cors
* devise_token_auth
* active_model_serializers
* stripe-rails
* jbuilder

## Acknowledgements

- [Craft Academy](https://www.craftacademy.se/) coaches: [Thomas Ochman](https://github.com/tochman) and [Emma-Maria Thalen](https://github.com/emtalen)

## License

MIT License
