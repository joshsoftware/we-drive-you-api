# We Drive You

* Ruby version: 2.6.3
* Rails version: 5.2.4.1
* Database: PostgreSQL 11
* Operating System: Ubuntu 18.04

## Set up Rails 
`bundle install`

## PostgreSQL Database Setup:

##### Add PostgreSQL 11 APT repository

1. Import the repository signing key:
```
sudo apt-get install wget ca-certificate
```
```
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
```
2. Add repository contents to your system:
```
RELEASE=$(lsb_release -cs)
echo "deb http://apt.postgresql.org/pub/repos/apt/ ${RELEASE}"-pgdg main | sudo tee  /etc/apt/sources.list.d/pgdg.list
```
3. Verify repository file contents
```
cat /etc/apt/sources.list.d/pgdg.list
```
deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main


##### Install PostgreSQL 11 
```
sudo apt update
```
```
sudo apt -y install postgresql-11
```

##### Configure PostrgeSQL 11

1. Go to directory /etc/postgresql/11/main
```
cd /etc/postgresql/11/main
```
2. Change permission of pg_hba.conf file 
```
sudo chmod 777 pg_hba.conf
```
3. Open pg_hba.conf file
```
sudo vi pg_hba.conf
```
4. Change `peer` to `md5` in `"local" is for Unix domain socket connections only` line and save the file.

5. Change password of postgres role
```
sudo su - postgres
```
```
psql \password
```
Enter a password, and remember it will be used later.(your_password)

6. Create a new role for test database
```
sudo su - postgres
psql
CREATE ROLE role_name WITH PASSWORD "your_password";
ALTER ROLE role_name WITH superuser;
```
Replace your_password with the password you just created.

7. Bundle Install If pg gemfile error occurs use
```
sudo apt-get install libpq-dev
```

8. Set up Env Variables
Add these lines in .bashrc file
```
export DB_USERNAME="postgres"
export DB_PASSWORD="your_password"
export POSTGRES_PORT="5432"
export CAB_DEV="name_of_development_db"
export CAB_TEST="name_of_test_db"
```
Replace your_password, name_of_development_db, name_of_test_db with their appropriate value.

##### Database creation
```
rails db:create
```

##### Run migration
```
rails db:migrate
```

##### References: 
[For PostgreSQL-11 installation](https://computingforgeeks.com/install-postgresql-11-on-ubuntu-18-04-ubuntu-16-04/)
