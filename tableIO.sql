select relname,round(100*cast(heap_blks_hit as numeric) /(heap_blks_hit +heap_blks_read),4) 
 as hit_pct,heap_blks_hit,heap_blks_read from pg_statio_user_tables 
  where (heap_blks_hit + heap_blks_read) >0 order by hit_pct;