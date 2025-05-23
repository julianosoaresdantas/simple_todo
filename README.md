# Simple Todo App

A web-based "to-do list" application developed using Ruby on Rails.
Includes user sign-up/login (Devise) and full CRUD (Create, Read,
Update, Delete) functionality for tasks.

---

## Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Make sure you have the following installed:

* **Ruby version:** `3.3.0` (or your specific Ruby version if different)
* **Bundler:** For managing Ruby gems.
* **Node.js:** For JavaScript runtime.
* **Yarn:** For managing JavaScript packages (if your Rails version uses it for assets).
* **PostgreSQL:** The database used for this application. You'll need to have it installed and running locally.

### Installation

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/your-username/simple_todo.git](https://github.com/your-username/simple_todo.git) # Replace with your actual repo URL
    cd simple_todo
    ```

2.  **Install Ruby Gems:**
    ```bash
    bundle install
    ```

3.  **Install JavaScript Packages (if using Yarn):**
    ```bash
    yarn install
    ```

4.  **Database creation & initialization:**
    * Create the database:
        ```bash
        rails db:create
        ```
    * Run migrations to set up the database schema:
        ```bash
        rails db:migrate
        ```
    * (Optional) Seed the database with any initial data if you have a `db/seeds.rb` file:
        ```bash
        rails db:seed
        ```

### Configuration

* **Database:** The `config/database.yml` file is configured for PostgreSQL by default. Ensure your local PostgreSQL server is running and accessible with default credentials, or update the file to match your setup.
* **Environment Variables:** For a simple app, no specific environment variables are typically needed. If you add any in the future (e.g., API keys), document them here.

---

## How to Run the Application

To start the Rails development server:

```bash
rails s