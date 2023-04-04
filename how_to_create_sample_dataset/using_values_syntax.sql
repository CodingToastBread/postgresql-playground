-- dataset with no column name
values (1, 'name-1', '010-0000-0001'),
       (2, 'name-2', '010-0002-0003'),
       (3, 'name-3', '010-0004-0005'),
       (4, 'name-4', '010-0006-0007');


-- dataset with column name (1)
select * from (
values (1, 'name-1', '010-0000-0001'),
       (2, 'name-2', '010-0002-0003'),
       (3, 'name-3', '010-0004-0005'),
       (4, 'name-4', '010-0006-0007')
) as temp_data(id,name,phone)
;


-- dataset with column name (2)
with temp_data(id,name,phone) as (
values (1, 'name-1', '010-0000-0001'),
       (2, 'name-2', '010-0002-0003'),
       (3, 'name-3', '010-0004-0005'),
       (4, 'name-4', '010-0006-0007')
)
select * from temp_data
;


-- join with two temporary dataset
with temp_data(id, name, phone, address_id) as (
    values (1, 'name-1', '010-0000-0001', 1),
           (2, 'name-2', '010-0002-0003', 1),
           (3, 'name-3', '010-0004-0005', 2),
           (4, 'name-4', '010-0006-0007', 2)
),
temp_data2(address_id, region, zipcode) as (
    values (1, 'korea', 'seoul'),
           (3, 'korea', 'jeju')
)
select * from temp_data a
left join temp_data2 b using (address_id)
;
