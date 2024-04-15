### Prerequisites

Make sure you have [Ruby on Rails](https://rubyonrails.org/) installed on your machine. If you haven't installed Ruby on Rails yet, you can follow the installation instructions provided on the [official website](https://rubyonrails.org/).

### Installation

1. Clone this repository to your local machine using `git clone`.
2. Navigate into the project directory.
3. Run `bundle install` to install all the necessary dependencies.
4. Create .env file in root directory and copy and paste this variable and put the values as you need.

```bas
POSTGRES_USERNAME=postgres
POSTGRES_PASSWORD=123456
DATABASE_NAME=frogmi
HOST=localhost
```

### Database Setup

1. Make sure you have PostgreSQL installed on your machine. If not, you can download and install it from [here](https://www.postgresql.org/).
2. Create the database by running `rails db:create`.
3. Migrate the database schema by running `rails db:migrate`.

### Running the Application

Once you have installed all the dependencies and set up the database, you can run the application by following these steps:

1. In the project directory, run `rails server`.
2. Open [http://localhost:4000](http://localhost:4000) in your browser to view the application.
