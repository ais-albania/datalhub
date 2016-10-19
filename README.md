**DATALHUB is a simple dataset managementsystem platform**.

DATALHUB is an aplication that helps you manage and publish collections of data online.  It is based on the concept of Data Containers (Data Sets) and digital resources (data) which may be stored under a data container. 
It is developed to serve the needs of an institution to store and publish data, reports and other digital assets online. 
DATALHUB provides a webinterface and an API for the representation of the data.


Installation
------------
DATALHUB is developed with GRAILS Framework. It can be deployed to any Web Container and for the sake of simplicity, in this document we just point that it can be deployed in Apache Tomcat.
In order to have an instance of DATALHUB running, you need to download Grails 3.2 from [Grails.org](http://grails.org)
You will need to retrieve a copy for the master branch of [Github Page for DATALHUB](https://github.com/ais-albania/datalhub). You can do so by downloading a ZIP copy of the source code, or checking out via git checkout.
+ ZIP Download -> `curl -L -o master.zip https://github.com/ais-albania/datalhub/zipball/master`
+ GIT Checkout -> `git clone https://github.com/ais-albania/datalhub.git

After doing the neccessary changes to reflect the identity and specific configurations for your instance, you can build a war file. To do so, please run:

    $PATH/bin/grails war

The command above should be run from within the cloned project. A file `al.data.catalog-$version.war` will be generated under /build/libs directory of your. The renamed war can be uploaded at your web container and you should have a fully running Data Repository! Well done!

Configurations
-------
Most of the configurations are done through the application.groovy file. Here you can configure a Piwik instance, include alternative RSS feeds in your webpage, or define an alternative upload path. This may be a folder reference, or a remote FTP Server. In future versions, more alternatives will be provided.

Initialization Users
------
On Boot up, the application will create an admin user 'admin', who will have the password 'password' (no other choice). You should change this password as soon as you login in the system.
(Default user is defined in  ` datalhub/grails-app/init/BootStrap.groovy`

Administration Menu
------
Upon login, a simple flyout tool icon will appear on the right side of the screen. Clicking on the link will allow you to access the Adminstration Menu.

Database reference
-------
DATALHUB makes use of a simple database for the organisation of the entities of the system. These entities are: 
* Datasets
* DigitalData (datum)
* Institutions
* Partners
* Categories 
* Licences
* Users (via Spring-Core-Security)
* User Roles (via Spring-Core-Security)

The system has been tested with MySQL/MariaDB and H2 Database Engine(H2DB). It should run flawlesly with Postgres or any other RDBMS supported by the [Grails GORM interface](http://docs.grails.org/latest/guide/GORM.html).

By default, the production datasource comes with a H2DB configuration. No installations are needed, as this is coupled with the Grails. While H2DB is not deemed for production (by anonymous references), it is a good option to get you started. For a more stabel environment, you may consider MySQL or Postgres. You decide on the underlying persistence layer (database) through the application.yml file which can be found under: `datalhub/grails-app/conf´/`
Scroll to production and switch the configuration with something like:
 ``          dataSource:
            pooled: true
            dbCreate: "update"
            url: "jdbc:mysql://localhost:3306/DBNAME?autoReconnect=true"
            driverClassName: "com.mysql.jdbc.Driver"
            dialect: org.hibernate.dialect.MySQL5InnoDBDialect
            username: "DBUSERNAME"
            password: "DBPASSWORD"
            properties:
              jmxEnabled: true
              initialSize: 5
              maxActive: 50
              minIdle: 5
              maxIdle: 25
              maxWait: 10000``




Support
-------

If you need help with DATALHUB or want to ask a question about DATALHUB, you may contact me at ab@ais.al, or for issues feel free to open a new issue.


License
-------------------
This application is licenced under  [Apache License, Version 2.0](LICENSE.md).
Layout Template is based on Unify Template. You need to purchase this template if you intend to use the application with the default layout.

