-- CampusConnect event seed records
-- Adds each event once without hard-coding event data into the website.
with new_events(title, capacity, starts_at, event_status) as (values
  ('Campus Hackathon', 100, timestamptz '2026-11-18 10:00:00+05:30', 'upcoming'),
  ('Musical Concert', 100, timestamptz '2026-11-21 18:00:00+05:30', 'upcoming'),
  ('Horror House Party', 100, timestamptz '2026-11-27 18:00:00+05:30', 'upcoming')
)
insert into public.events (title, capacity, "timestamp", status, organiser_id)
select n.title, n.capacity, n.starts_at, n.event_status, null
from new_events n
where not exists (
  select 1 from public.events e
  where e.title = n.title and e."timestamp" = n.starts_at
);
