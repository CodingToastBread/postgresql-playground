-- https://www.postgresql.org/docs/current/functions-srf.html

-- just get set of data 1~10
select generate_series(1, 10);

-- 1,3,5,7,9
select generate_series(1, 10, 2);


-- tip: how to use date_trunc ?? =>  https://www.postgresqltutorial.com/postgresql-date-functions/postgresql-date_trunc/
select date_trunc('year', now() + '1 year'::interval);



-- today ~ [next year of current date]
select date_trunc('day', now()); -- 2023-04-09 00:00:00.000000 +00:00
select date_trunc('day', now() + '1 year'::interval); -- 2024-04-09 00:00:00.000000 +00:00

-- 2023-04-09 ~ 2024-04-09
select generate_series(
               date_trunc('day', now()),
               date_trunc('day', now() + '1 year'::interval)
           , '1 day'
)::date; -- generate_series return timestamp, so if want date type you must cast it



-- get series of "year-month-01" date
-- 2023-01-01 ~ 2023-12-01
 select generate_series(
       date_trunc('year', now()),
       date_trunc('year', now() + interval '1' year) - interval '1' day,
       '1 month'
)::date;



-- get only year-month string
select to_char(generate_series(
        date_trunc('year', now()),
        date_trunc('year', now() + interval '1' year) - interval '1' day,
        '1 month'
)::date, 'yyyy-mm');
-- 2023-01 ~ 2023-12

select date_trunc('month', now());


-- get every day in current month
-- 2023-04-01 ~ 2023-04-30
select date_trunc('month', now() + '1 month'::interval) - '1 day'::interval;
select date_trunc('month', now());
select generate_series(
           date_trunc('month', now()),
           date_trunc('month', now() + '1 month'::interval) - '1 day'::interval,
'1 day')::date



