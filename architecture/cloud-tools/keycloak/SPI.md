# Service Provider Interfaces(SPI)


## Providers
+ implement
    + ProviderFactory
        + singleton
    + Provider interfaces

+ add custom SPI
    + implement
        + org.keycloak.provider.Spi
        + ProviderFactory
        + Provider

## Add custom Rest endpoints
+ RealmResourceProviderFactory
+ RealmResourceProvider
    + getResource()
        + return JAX-RS object

## Add JPA entities to the Keycloak data model
+ JpaEntityProviderFactory 
+ JpaEntityProvider



## ref
+ [Service Provider Interfaces (SPI)](https://www.keycloak.org/docs/latest/server_development/#_providers)

+ [Configuring providers](https://www.keycloak.org/server/configuration-provider)

+ [avaible SPIs](http://localhost:8080/admin/master/console/#/master/providers)

+ [SignatureSPi](https://www.keycloak.org/docs-api/21.1.2/javadocs/org/keycloak/crypto/SignatureSpi.html)