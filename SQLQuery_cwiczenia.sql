Select adult_member_no, m.lastname,m.firstname from adult
    join juvenile j on j.adult_member_no = adult.member_no
    join member m on adult.member_no = m.member_no
where state = 'AZ'
group by adult_member_no, m.lastname,m.firstname
having count(*)>2

