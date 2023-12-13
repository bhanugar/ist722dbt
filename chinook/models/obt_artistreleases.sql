with f_artiestreleases as (
    select * from {{ ref('fact_artistreleases') }}
),
d_artist as (
    select * from {{ ref('dim_artist') }}
),
d_track as (
    select * from {{ ref('dim_track') }}
)
select  art.Artist_Name,t.*,fr.Song_releases
from f_artiestreleases fr
left join d_artist art on art.artistkey = fr.artistkey 
left join d_track t on t.trackkey = fr.trackkey