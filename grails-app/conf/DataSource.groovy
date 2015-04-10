dataSource {
    pooled = true
    dbCreate = "update"
    driverClassName = "org.postgresql.Driver"
    url = "jdbc:postgresql://localhost:5432/chalkboard"
    dialect = org.hibernate.dialect.PostgreSQL9Dialect
    username = "dev"
    password = "dev"
}

hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'org.hibernate.cache.SingletonEhCacheRegionFactory'
}

// environment specific settings
environments {
    development {
        dataSource {
        }
    }
    test {
        dataSource {
        }
    }
    production {
        dataSource {
            pooled = true
            dbCreate = "update"
            driverClassName = "org.postgresql.Driver"
            url = "jdbc:postgresql://localhost:5432/chalkboard"
            username = "chalkboard"
            password = "K40rc40Mvg261UykOr"
        }
    }
}