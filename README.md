# multidb-docker

Running single instance of database container with multiple db's is an anti pattern for microservices architecture. 
So anything that is using docker (or other container environments) for production should not use this type of config.
Why is this an anti-pattern? simply becasue this breaks the horizontal scalability of services and data indenedently. 
With this configuration one service becomes dependency for multiple other services. 

When is it OK to use this configuration?
If you are working in a RAM constrained environment, for example running several containers on a single laptop or development system.
Other than RAM constraint, there is really no great usecase.

How to setup:
1. You will need mor recent versions of databases (in case of postgres, version 12 or newer is recommended)
2. You will need a custom docker entry point (so that environment variables from docker-compose.yml) can be parsed and multiple users as well as db can be created
3. If you plan on using /docker-entrypoint-initdb.d/ mountpoint to sun initialization scripts, 
  3.1 Make sure all the services put one script in that directory as needed (and ensure names are different)
  3.2 The db instance will run all scripts located in /docker-entrypoint-initdb.d/ alphabetically - please take care of interdependencies  
4. With this you are ready to use this type of setup

Why did I try this?
1. I was trying to do an experiment where I wanted to use single DB for nextcloud and invidious. Both these are light on DB requirement if the services are private.
2. There is always an angle of learning. With the complexity involved I have learnt this to be not a good setup.
3. What is an alternalte? if your application can live with some previous releases of DB, then go with those and run multiple containers. As older releases use lesser RAM, sometimes up half the new release.
