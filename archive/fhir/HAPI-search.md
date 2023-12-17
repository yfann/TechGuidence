
## querys
+ `http://example.org/Encounter?subject.name=Simpson`
    + chain
+ `http://example.org/Encounter?_sort=patient.family`
    + patient search parameter


## search parameters
+ _query
+ filter
+ _format
+ _pretty
+ _include
+ _revinclude
+ _type
     + `GET [base]/?_type=Observation,Condition&other params...`


## modifiers
+ `gender:missing=true`
+ `:exact`
+ `:[type]`
+ `:text`
    + `:in`
    + `:not-in`
    + `:below`
    + `:above`


## prefixes
+ eq
+ ne

## Chained parameters
+ `GET Patient?general-practitioner.name=Joe&general-practitioner.address-state=MN`
    +  the chains are evaluated separately
    + or的关系




## Composite Search Parameters 
+ and
+ or





## todo
+ revinclude
+ _filter
    + or
+ reverse chain
    + _has



## ref
+ [R4 fhir search](http://hl7.org/fhir/R4/search.html)
+ [Defined Search Parameters](http://hl7.org/fhir/R4/searchparameter-registry.html)
    + [Parameters for all resources](http://hl7.org/fhir/R4/resource.html#search)
+ [_filter](http://hl7.org/fhir/R4/search_filter.html)
<!-- HAPI search -->
+ [JPA Server Search](https://hapifhir.io/hapi-fhir/docs/server_jpa/search.html)
+ [Rest Operations: Search](https://github.com/hapifhir/hapi-fhir/blob/master/hapi-fhir-docs/src/main/resources/ca/uhn/hapi/fhir/docs/server_plain/rest_operations_search.md)