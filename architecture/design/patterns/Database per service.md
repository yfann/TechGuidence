# Pattern: Database per service
+ Keep each microservice’s persistent data private to that service and accessible only via its API. 
+ A service’s transactions only involve its database.
+ benefits
    + Helps ensure that the services are loosely coupled
    + Each service can use the type of database that is best suited to its needs
+ transactions span services
     + Saga
+ queries span services
    + API Composition 
         + the application performs the join rather than the database
    + CQRS
         + maintain one or more materialized views that contain data from multiple services. The views are kept by services that subscribe to events that each services publishes when it updates its data.
## ref
+ [Pattern: Database per service](https://microservices.io/patterns/data/database-per-service.html)