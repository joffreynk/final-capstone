![](https://img.shields.io/badge/Microverse-blueviolet)

# Car Booking APi

> Car Booking API is Rais API based that allows registered users to book cars. only user of the type admin is allowed to add vehicles in  the system and other users can book them them and see their reservations

## Built With

- Ruby on Rails & postgreSQL.
- JWT.
- Linters Rubocop
- Git & GitHub.

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

    Git
    PostgreSQL
    Ruby on Rails
    
    
    

### Setup

    1. git clone https://github.com/JoffreyNK/final-capstone
    2. cd final-capstone
    3. bundle install
    4. rails db:create
    5. rails db:migrate

### Usage

    1. rails server


The main link is http://localhost:3000/api/v1, then you need to add controller to the main link

eg: creating a user:
http://localhost:3000/api/v1/users and method is post with the data info

{
"name": "Joffrey",
"user_name":"Joffrey1",
"password":"123456",
"email": "joyjoffrey@gmail.com"
}

in case a user to add is admin, add: ```role="admin"``` in that object

:warning: don't add public field for making user admin because only admin is allowed to manage the application



    

### Done!

Ready to work?⛏️ You're all set to explore and change the repo locally (on your computer).

## Authors

👤 **Joffrey**

- GitHub: [@joffreynk](https://github.com/joffreynk)
- Twitter: [@joffreynk](https://twitter.com/joffreynk)
- LinkedIn: [joffreynk](https://linkedin.com/in/joffreynk)

👤 **Guishny DESOR**

- GitHub: [@desorgui](https://github.com/desorgui)
- Twitter: [@DGuishny](https://twitter.com/DGuishny)
- LinkedIn: [Guishny Desor](https://www.linkedin.com/in/guishny-desor-5421a01a9/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- these API was build to hwlp web frontend designers to complete a project designed by  [Murat Korkmaz on Behance.](https://www.behance.net/muratk). you can find the lincese [here](https://creativecommons.org/licenses/by-nc/4.0/)
- Google and Stack Overflow.
- Inspiration.
- etc.

## 📝 License

This project is [MIT](./MIT.md) licensed.
