WITH idx_hit_rate as (
SELECT 
  relname as table_name, 
  n_live_tup,
  round(100.0 * idx_scan / (seq_scan + idx_scan),2) as idx_hit_rate
FROM pg_stat_user_tables
ORDER BY n_live_tup DESC
),

-- Cache hit rate
cache_hit_rate as (
SELECT
 relname as table_name,
 heap_blks_read + heap_blks_hit as reads,
 round(100.0 * sum (heap_blks_read + heap_blks_hit) over (ORDER BY heap_blks_read + heap_blks_hit DESC) / sum(heap_blks_read + heap_blks_hit) over (),4) as cumulative_pct_reads,
 round(100.0 * heap_blks_hit / (heap_blks_hit + heap_blks_read),2) as cache_hit_rate
FROM  pg_statio_user_tables
WHERE heap_blks_hit + heap_blks_read > 0
ORDER BY 2 DESC
)

SELECT 
  idx_hit_rate.table_name,
  idx_hit_rate.n_live_tup as size,
  cache_hit_rate.reads,
  cache_hit_rate.cumulative_pct_reads,
  idx_hit_rate.idx_hit_rate,
  cache_hit_rate.cache_hit_rate
FROM idx_hit_rate, cache_hit_rate
WHERE idx_hit_rate.table_name = cache_hit_rate.table_name
  AND cumulative_pct_reads < 100.0
ORDER BY reads DESC;