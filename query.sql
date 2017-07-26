select title, abstract, submission_type, is_pc from paper where paper_number = '4';

select person.title, person.name, person.institution, person.country, person.email, person.phone_number, author.is_contact from author, paper, person where paper.paper_number = author.paper_number and author.person_id = person.person_id;

select max(paper_number) from paper;

insert into paper values (paper_number, title, abstract, is_pc, decision);

insert into person values (personId, title, name, institution, country, email, phoneNumber);

insert into author values (personId, paper_number, is_contact);

select count(pc_code) from pc_chair where pc_code = '2';

insert into person values (personId, title, name, institution, country, email, phoneNumber);

insert into pc_member values (pc_code, person_id);

select paper_number from paper;

select title from paper where paper_number = '2';

select assigned_to.pc_code, person.name from assigned_to, pc_member, person where assigned_to.paper_number='2' and assigned_to.pc_code = pc_member.pc_code and pc_member.person_id = person.person_id;

with result as (select pc_code, count(paper_number)as c from assigned_to group by pc_code) select prefers.pc_code, prefers.preference, result.c from prefers, result where prefers.paper_number = '2' and prefers.pc_code not in (select pc_code from assigned_to where paper_number = '2') and prefers.preference>'3' and result.pc_code = prefers.pc_code;

with result as (select pc_code, count(paper_number)as c from assigned_to group by pc_code) select pc_member.pc_code, null, result.c from pc_member, result where pc_member.pc_code not in (select pc_code from assigned_to where paper_number = '2') and pc_member.pc_code not in (select pc_code from prefers where paper_number = '2') and result.pc_code = pc_member.pc_code;

insert into assigned_to values (pcCode, paper_number);

