with f_playlisttracksadded as (
    select * from {{ ref('fact_playlisttracksadded') }}
),
d_playlisttrack as (
    select * from {{ ref('dim_playlistrack') }}
),
d_playlist as (
    select * from {{ ref('dim_playlist') }}
),
d_track as (
    select * from {{ ref('dim_track') }}
)
select t.*,p.Playlist_Name,f.Tracks_added,p.playlistkey,p.Playlistid
from f_playlisttracksadded f
 left join d_playlisttrack p on p.playlistkey = f.playlistkey and p.trackkey=f.trackkey
 left join d_track t on t.trackkey = f.trackkey
 left join d_playlist pp on pp.playlistkey=f.playlistkey 