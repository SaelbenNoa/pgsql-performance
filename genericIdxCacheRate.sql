SELECT
     round(100*sum(heap_blks_hit) / (sum(heap_blks_hit) + sum(heap_blks_read)),4) AS cache_hit_rate,
	 round(100*(sum(idx_blks_hit)) / sum(idx_blks_hit + idx_blks_read),4) AS index_hit_rate
FROM pg_statio_user_tables;
