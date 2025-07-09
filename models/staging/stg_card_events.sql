{{ config(materialized='view') }}

select
    card_event_id                        as card_event_id,
    card_id                              as card_id,
    slash_account_id                     as slash_account_id,
    replace(lower(event_type), 'pending_', '') as event_type,
    lower(card_status)                   as card_status,
    try_cast("timestamp" as timestamp)   as event_ts
from {{ ref('card_events') }}
