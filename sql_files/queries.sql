use blitz;
# Target Log w/ Videos
select b.email as blitzer_name, t.email as target_name, tl.time_stamp, tl.video_evidence_path,
case
    when tl.is_completed then 'Completed'
    when tl.in_review then 'In Review'
end as status
from target_log tl
    JOIN players b on tl.blitzer = b.asb_id
    JOIN players t on tl.target = t.asb_id
WHERE NOT tl.in_review;