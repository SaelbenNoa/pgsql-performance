# Postgres Analyzer
-------------

A couple of small scripts to analyze the performance of a Postgres database, for when things get slow and sticky

Manual
-------------

**selectIdxCacheRateByTable**

    Selects the hit rates of cache and index for each table, as well as cumulative read percentage.

**unusedIndex**

    Compares the index size and their usage, sorting from least used to most used.

**indexAccess**

    This shows all of the disk i/o for every index on each table

**indexIO**

    Shows disk I/O for each index

**tableAccess**

    Shows general acces statistics for table

**tableIO**

    Shows caching and I/O stats for table

**databaseAnalytics**

    Shows the index and cache hit rate averages for the table