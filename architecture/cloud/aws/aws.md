

## s3
+ Durability
+ Availability
+ Scalability


## Elastic Beanstalk
+ 第一次部署需要admin权限，部署LB,EC2...
+ `eb init`
+ `eb create` create new environment 
+ `eb deploy` push changes

## reliability
+ defining performance
+ Service-Level Objectives(SLOs)
    + is a measurable goal set by the SRE team to ensure a standard level of performance during a specified period of time.
    + latency and uptime
    + customer-centric
        1. Do what a user would do. You will want to stress test the product and use it the same way the user would.
        2. Map the journey to services. Once you understand the customer journey, you can map out what that journey looks like in terms of what specific services are used.
        3. Find the metrics. Once you know what services are involved, you can identify the metrics for those services.
        4. Determine goals. Once we have relevant metrics in mind, it is relatively easy to determine what goals would be reasonable and would tap into these metrics.
        5. Design formal SLOs. Once you have your goals, it's time to formalize them as SLOs. These SLOs will then appear in your team charter, and you and your team will have a clear objective that you can be accountable for.

+ Service-level Indicators(SLIs)
    + is a specific metric used to measure the performance of a service.



+ Error Budgets
    + Error budget = 100% – SLO
+ Building SLAs

+ golden signals
    + latency
        + total milliseconds
    + traffic
        + requests/second
    + errors
        + number of HTTP 500 responses
    + saturation
        + percentage of memory used

## tips
+ SLO 要达到的目标
+ SLI 真实值
+ SRE model

## ref
+ [NAT gateways](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html)
+ [Elastic Beanstalk](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/GettingStarted.html)
+ [Deploying an Express application to Elastic Beanstalk](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create_deploy_nodejs_express.html)