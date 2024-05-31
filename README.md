# Distributed Database Project

## Introduction

This project demonstrates the implementation of distributed database concepts such as links, synonyms, and fragmentation. Each user's SQL script includes the necessary setup for these concepts. The project aims to showcase how distributed database concepts can enhance data access and management across multiple locations.

## Prerequisites

- Oracle Database (or any other RDBMS that supports distributed database features)
- SQL Developer or any other SQL client
- Basic knowledge of SQL and database management

## Installation

1. Download and install Oracle Database from the [official website](https://www.oracle.com/database/technologies/).
2. Install SQL Developer from the [official website](https://www.oracle.com/tools/downloads/sqldev-downloads.html).

## Configuration

1. Ensure that the database services for each user are running and accessible.
2. Set up the environment variables and configuration files as required by your RDBMS.

## Project Structure

The project includes the following files:

- `System.sql`: Contains the SQL script for the main system database.
- `user1_Alice.sql`: SQL script for Alice's database, including links, synonyms, and fragmentation.
- `user2_Bob.sql`: SQL script for Bob's database, including links, synonyms, and fragmentation.
- `user3_Clare.sql`: SQL script for Clare's database, including links, synonyms, and fragmentation.
- `user4_David.sql`: SQL script for David's database, including links, synonyms, and fragmentation.
- `user5_Emily.sql`: SQL script for Emily's database, including links, synonyms, and fragmentation.

## Key Concepts

1. **Links**: Database links facilitate remote data access. Each user's SQL script creates and configures database links to enable communication between their database and the main system database.
2. **Synonyms**: Synonyms create aliases for database objects, simplifying access across databases. Each user's SQL script includes the creation of synonyms for remote objects.
3. **Fragmentation**: This involves dividing a database into smaller pieces, which can be distributed across different locations. Each user's SQL script implements horizontal and vertical fragmentation for efficient data distribution.

## Setup Instructions

1. **Main System Database**:
    - Execute `System.sql` to set up the main system database.
2. **User Databases**:
    - Execute the SQL scripts for individual user databases (`user1_Alice.sql` to `user5_Emily.sql`).

## Troubleshooting

- **Database Link Errors**: Ensure the database services are running and the connection details are correct.
- **Synonym Issues**: Verify that the remote objects exist and the synonyms are correctly created.
- **Fragmentation Problems**: Check the fragmentation logic and ensure the data is correctly distributed.

## Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -m 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Open a Pull Request.

## Contact Information

For questions or support, please contact [Your Name](mailto:chouaiba629@gmail.com).