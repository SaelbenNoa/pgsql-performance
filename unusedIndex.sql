select schemaname,relname,indexrelname,idx_scan,pg_size_pretty(pg_relation_size(i.indexrelid)) 
 as index_size from pg_stat_user_indexes i join pg_index using (indexrelid)
 where indisunique is false order by idx_scan,relname;