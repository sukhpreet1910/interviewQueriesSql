-- Query 4:

-- From the doctors table, fetch the details of doctors who work in the same hospital but in different speciality.

SELECT d1.*
from doctors d1 
join doctors d2
on d1.hospital = d2.hospital and 
d1.id <> d2.id and d1.speciality <> d2.speciality

-- Sub Question:

-- Now find the doctors who work in same hospital irrespective of their speciality.

SELECT d1.*
from doctors d1 
join doctors d2
on d1.hospital = d2.hospital and 
d1.id <> d2.id 