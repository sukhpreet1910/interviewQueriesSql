
with wh as
    (SELECT *
    from warehouse
    order by event_datetime desc),

    days as
    (SELECT OnHandQuantity, event_datetime,
        (event_datetime - INTERVAL '90 DAYS') as DaysOld_90,
        (event_datetime - INTERVAL '180 DAYS') as DaysOld_180,
        (event_datetime - INTERVAL '270 DAYS') as DaysOld_270,
        (event_datetime - INTERVAL '365 DAYS') as DaysOld_365
    from wh 
    limit 1),

    days90 as
    (SELECT sum(OnHandQuantityDelta) as sum90
    from wh 
    cross join days 
    where event_type = 'InBound' and wh.event_datetime >= DaysOld_90),

    final_90 as
    (SELECT case 
        when sum90 > days.OnHandQuantity then days.OnHandQuantity
        else sum90
        end as final90
    from days90 
    cross join days),

    days180 as
    (SELECT sum(OnHandQuantityDelta) as sum180
    from wh 
    cross join days
    where event_type = 'InBound' and 
    wh.event_datetime < days.DaysOld_90 and 
    wh.event_datetime >= days.DaysOld_180),

    final_180 as
    (SELECT CASE 
        when sum180 > (days.OnHandQuantity - final90) 
        then (days.OnHandQuantity - final90)
        else sum180
        end as final180
    from days180
    cross join days
    cross join final_90),

    days270 as
    (SELECT coalesce(sum(days.OnHandQuantity),0) as sum270
    from wh 
    cross join days 
    where event_type = 'InBound' and 
    wh.event_datetime < DaysOld_180 AND
    wh.event_datetime >= DaysOld_270),

    final_270 as
    (select CASE 
        when sum270 > (days.OnHandQuantity - final180 - final90) 
        then (days.OnHandQuantity - final180 - final90)
        else sum270
        end as final270
    from days270
    CROSS join days 
    cross join final_180
    cross join final_90),


    days365 as
    (SELECT COALESCE(sum(wh.OnHandQuantity), 0) as sum365
    from WH 
    cross join days 
    where wh.event_type = 'InBound' AND
    wh.event_datetime < DaysOld_270 AND
    wh.event_datetime >= DaysOld_365),

    final_365 as
    (SELECT CASE 
        when sum365 > (days.OnHandQuantity - (final90 + final180 + final270))
        then (days.OnHandQuantity - (final90 + final180 + final270))
        else sum365
        end as final365
    from days365
    cross join days
    cross join final_90
    cross join final_180
    cross join final_270)

    SELECT 
        final90 as "0 - 90 Days Old",
        final180 as "91 - 180 Days Old",
        final270 as "181 - 270 Days Old",
        final365 as "271 - 365 Days Old"
    from final_90
    cross join final_180
    cross join final_270
    cross join final_365