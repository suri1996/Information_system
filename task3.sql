/* COMP 3311: Task 3 – Conference Paper Submission and Review Management System */

/* Relation Schemas */

/* For cleaning the database. */
drop table referee_report;
drop table assigned_to;
drop table prefers;
drop table discussion;
drop table author;
drop table paper;
drop table pc_chair;
drop table pc_member;
drop table person;

create table person(
	person_id       int primary key,
	title           char(5) default null check (title in ('Mr', 'Ms', 'Miss', 'Dr', 'Prof', null)),
	name            varchar2(50) not null,
	institution     varchar2(100) not null,
	country         varchar2(30) not null,
	email           varchar2(50) not null,
	phone_number    varchar2(20) not null);
	
create table paper(
	paper_number    int primary key,
	title           varchar2(50) not null,
	submission_type varchar2(20) default 'research' not null check (submission_type in ('research', 'demo', 'industrial', 'vision')),
	abstract        varchar2(300) not null,
	is_pc           char(1) not null,
	decision        varchar2(6) check(decision in ('accept', 'reject', null)));

create table pc_member(
	pc_code     char(4) primary key,
	person_id   int not null references person(person_id) on delete cascade);

create table pc_chair(
	pc_code char(4) primary key references pc_member(pc_code) on delete cascade);

create table author(
	person_id       int references person(person_id) on delete cascade,
	paper_number    int references paper(paper_number) on delete cascade,
	is_contact      char(1) default 'N' not null check(is_contact in ('Y', 'N')),
	primary key(person_id, paper_number));

create table discussion(
	sequence_no	    int,
	paper_number    int references paper(paper_number) on delete cascade,
	pc_code         char(4) references pc_member(pc_code) on delete cascade,
	comments        varchar2(200) not null,
	primary key(sequence_no, paper_number, pc_code));

create table prefers(
	pc_code         char(4) references pc_member(pc_code) on delete cascade,
	paper_number    int references paper(paper_number) on delete cascade,
	preference      int not null check (preference in (1, 2, 3, 4, 5)),
	primary key(pc_code, paper_number));

create table assigned_to(
	pc_code         char(4) references pc_member(pc_code) on delete cascade,
	paper_number    int references paper(paper_number) on delete cascade,
	primary key(pc_code, paper_number));

create table referee_report(
	pc_code                 char(4)	references pc_member(pc_code) on delete cascade,
	paper_number            int references paper(paper_number) on delete cascade,
	relevant                char(1) not null check(relevant in ('Y', 'N', 'M')),
	technically_correct     char(1) not null check(technically_correct in ('Y', 'N', 'M')),
	length_and_content      char(1) not null check(length_and_content in ('Y', 'N', 'M')),
	originality             int not null check(originality between 1 and 8),
	impact                  int not null check(impact between 1 and 8),
	presentation            int not null check(presentation between 1 and 8),
	technical_depth         int not null check(technical_depth between 1 and 8),
	overall_rating          int not null check(overall_rating between 1 and 8),
	confidence              number(2,1) not null check(confidence between 0.5 and 1),
	best_paper              char(1) not null check(best_paper in ('Y', 'N')),
	main_contribution       varchar2(300) not null,
	strong_points           varchar2(300) not null,
	weak_points             varchar2(300) not null,
	overall_summary         varchar2(300) not null,
	detailed_comments       varchar2(1000),
	confidential_comments   varchar2(300),
	primary key(pc_code, paper_number));

/* Sample Database */

/********** person table data - 25 tuples **********/
insert into person values (1, null, 'Michael J. Cafarella', 'University of Michigan', 'USA', 'michjc@umich.edu', '+1 608 434 3702');
insert into person values (2, 'Prof', 'H. V. Jagadish', 'University of Michigan', 'USA', 'jag@umich.edu', '+1 608 434 3923');
insert into person values (3, 'Mr', 'Aditya Parameswaran', 'USA', 'Stanford University', 'adityagp@cs.stanford.edu', '+1 650 723 7766');
insert into person values (4, 'Dr', 'Nilesh Dalvi', 'Yahoo! Research', 'USA', 'ndalvi@yahooinc.com', '+1 415 589 3029');
insert into person values (5, 'Prof', 'Hector Garcia-Molina', 'Stanford University', 'USA', 'hector@cs.stanford.edu', '+1 650 723 0685');
insert into person values (6, 'Dr', 'Rajeev Rastogi', 'Yahoo! Research', 'USA', 'rrastogi@yahooinc.com', '+1 415 589 3045');
insert into person values (7, 'Dr', 'Eric Crestan', 'Yahoo! Labs', 'USA', 'ecrestan@yahoo-inc.com', '+1 415 678 6654');
insert into person values (8, 'Dr', 'Patrick Pantel', 'Yahoo! Labs', 'USA', 'ppantel@yahoo-inc.com', '+1 415 678 2345');
insert into person values (9, 'Prof', 'Vladimir Zadorozhny', 'University of Pittsburgh', 'USA', 'vladimir@sis.pitt.edu', '+1 657 334 2102');
insert into person values (10, 'Mr', 'Ying-Feng Hsu', 'University of Pittsburgh', 'USA', 'yfhsu@sis.pitt.edu', '+1 657 334 2105');
insert into person values (11, 'Prof', 'Tim Weninger', 'University of Notre Dame', 'USA', 'tweninge@nd.edu', '+1 574 631 6770');
insert into person values (12, 'Prof', 'William H. Hsu', 'Kansas State University', 'USA', 'bhsu@cis.ksu.edu', '+1 785 532 7905');
insert into person values (13, 'Prof', 'Jiawei Han', 'University of Illinois at Urbana-Champaign', 'USA', 'hanj@cs.uiuc.edu', '+1 217 333-6903');
insert into person values (14, 'Mr', 'Rajasekar Krishnamurthy', 'IBM Research - Almaden', 'USA', 'rajase@us.ibm.com', '+1 415 909 1190');
insert into person values (15, 'Mr', 'Jeffrey Naughton', 'University of Wisconsin', 'USA', 'naughton@cs.wisc.edu', '+1 608 262 8737');
insert into person values (16, 'Prof', 'Fred Lochovsky', 'Hong Kong University of Science and Technology', 'Hong Kong', 'fred@cse.ust.hk', '+852 2358 6996');
insert into person values (17, 'Mr', 'Ju Fan', 'National University of Singapore', 'Singapore', 'jfan@comp.nus.edu.sg', '+65 6516 5672');
insert into person values (18, 'Prof', 'Beng Chin Ooi', 'National University of Singapore', 'Singapore', 'ooibc@comp.nus.edu.sg', '+65 6516 6465');
insert into person values (19, 'Mr', 'Garret Swart', 'Oracle Corporation', 'USA', 'garret.swart@oracle.com', '+1 415 935 8846');
insert into person values (20, 'Mr', 'Nelson Ray', 'Metamarkets Group, Inc.', 'USA', 'ncray86@gmail.com', '+1 415 814 1788');
insert into person values (21, 'Dr', 'Mohamed A. Soliman', 'Pivotal Inc.', 'USA', 'Soliman@pivotal.io', '+1 650 846-1647');
insert into person values (22, 'Prof', 'Lei Chen', 'Hong Kong University of Science and Technology', 'Hong Kong', 'leichen@cse.ust.hk', '+852 2358 6980');
insert into person values (23, 'Prof', 'Elke Rundensteiner', 'Worcester Polytechnic Institute', 'USA', 'rundenst@cs.wpi.edu', '+1 508 831 5815');
insert into person values (24, 'Prof', 'Jeffrey Yu', 'Chinese University of Hong Kong', 'Hong Kong', 'yu@se.cuhk.edu.hk', '+852 3943 8309');
insert into person values (25, 'Dr', 'Paul Larson', 'Microsoft Research', 'USA', 'palarson@microsoft.com', '+1 425 703 6260');

/********** pc_member table data - 10 tuples **********/
insert into pc_member values ('hj01', 2);
insert into pc_member values ('ec01', 7);
insert into pc_member values ('pp01', 8);
insert into pc_member values ('jh01', 13);
insert into pc_member values ('fl01', 16);
insert into pc_member values ('bo01', 18);
insert into pc_member values ('lc01', 22);
insert into pc_member values ('er01', 23);
insert into pc_member values ('jy01', 24);
insert into pc_member values ('pl01', 25);

/********** pc_chair table data - 1 tuple **********/
insert into pc_chair values ('fl01');

/********** paper table data - 10 tuples **********/
insert into paper values (1, 'Example-Driven Schema Mapping', 'vision', 'End-users increasingly find the need to perform light-weight, customized data integration. State-of-the-art tools usually require an in-depth understanding of the semantics of multiple schemas. We propose a system, MWeaver, that facilitates data integration for end-users.', 'Y', null);
insert into paper values (2, 'Optimal Schemes for Robust Web Extraction', 'research', 'We consider the problem of constructing robust wrappers for web information extraction. We consider two models to study robustness formally: the adversarial model and probabilistic model. We demonstrate that our algorithms can reduce wrapper breakage by up to 500% over existing techniques.', 'N', null);
insert into paper values (3, 'Web-Scale Knowledge Extraction', 'research', 'We propose a classification algorithm and a rich feature set for automatically recognizing layout tables and attribute/value tables. In 79% of our Web tables, our method finds the correct protagonist in its top three returned candidates.', 'Y', null);
insert into paper values (4, 'Efficient Fusion of Historical Data', 'research', 'Historical data may include severe data conflicts that prevent researchers from obtaining the correct answers to queries on an integrated historical database. We consider an efficient approach to large-scale historical data fusion.', 'N', null);
insert into paper values (5, 'CETR - Content Extraction via Tag Ratios', 'research', 'Content Extraction via Tag Ratios (CETR) is a method to extract content text from diverse webpages using the HTML document''s tag ratios. We evaluate our approach against a large set of alternative methods, which shows that CETR achieves better content extraction performance than existing methods.', 'Y', null);
insert into paper values (6, 'Towards User-Friendly Entity Resolution', 'research', 'We explore the possibility of treating user input as an integral part of the entity resolution process. We design a simple two-stage approach that separates merging and splitting records into two separate stages.', 'N', null);
insert into paper values (7, 'TsingNUS: A Location-based Service System', 'demo', 'TsingNUS aims to provide users with more user-friendly location-aware search experiences. TsingNUS incorporates continuous search to efficiently support continuously moving queries in a client-server system thereby reducing the communication cost between the client and server.', 'N', null);
insert into paper values (8, 'A Java Stream Computational Model for Big Data', 'industrial', 'The addition of lambda expressions and a Stream API in Java 8 provide a powerful and expressive query language. We build on Java 8 Stream and add a DistributableStream abstraction that supports federated query execution over an extensible set of distributed compute engines.', 'N', null);
insert into paper values (9, 'Druid: A Real-time Analytical Data Store', 'industrial', 'Druid is an open source data store designed for real-time exploratory analytics on large data sets. It combines column-oriented storage layout, distributed, shared-nothing architecture, and advanced indexing to allow for the arbitrary exploration of billion-row tables with sub-second latencies.', 'N', null);
insert into paper values (10, 'Orca: A Modular Query Optimizer', 'industrial', 'Orca, a new query optimizer for all Pivotal data management products, is a comprehensive development uniting state-of-the-art query optimization technology with original research resulting in a modular and portable optimizer architecture.', 'N', null);

/*********** author table data - 20 tuples ***********/
insert into author values (1, 1, 'Y');
insert into author values (2, 1, 'N');
insert into author values (3, 2, 'N');
insert into author values (4, 2, 'N');
insert into author values (5, 2, 'Y');
insert into author values (6, 2, 'N');
insert into author values (7, 3, 'Y');
insert into author values (8, 3, 'N');
insert into author values (9, 4, 'Y');
insert into author values (10, 4, 'N');
insert into author values (11, 5, 'N');
insert into author values (12, 5, 'N');
insert into author values (13, 5, 'Y');
insert into author values (14, 6, 'Y');
insert into author values (15, 6, 'N');
insert into author values (17, 7, 'Y');
insert into author values (19, 8, 'Y');
insert into author values (20, 9, 'N');
insert into author values (21, 9, 'Y');
insert into author values (21, 10, 'Y');

/********** prefers table data - 25 tuples **********/
insert into prefers values ('hj01', 1, 2);
insert into prefers values ('hj01', 3, 3);
insert into prefers values ('hj01', 5, 4);

insert into prefers values ('ec01', 1, 3);
insert into prefers values ('ec01', 2, 4);

insert into prefers values ('pp01', 4, 1);
insert into prefers values ('pp01', 5, 4);
insert into prefers values ('pp01', 6, 4);

insert into prefers values ('jh01', 7, 3);
insert into prefers values ('jh01', 8, 3);

insert into prefers values ('bo01', 5, 1);
insert into prefers values ('bo01', 9, 2);

insert into prefers values ('lc01', 1, 1);
insert into prefers values ('lc01', 2, 2);
insert into prefers values ('lc01', 3, 1);
insert into prefers values ('lc01', 4, 2);
insert into prefers values ('lc01', 6, 3);

insert into prefers values ('er01', 7, 4);
insert into prefers values ('er01', 8, 3);

insert into prefers values ('jy01', 9, 1);
insert into prefers values ('jy01', 8, 2);
insert into prefers values ('jy01', 3, 4);
insert into prefers values ('jy01', 4, 5);

insert into prefers values ('pl01', 9, 4);
insert into prefers values ('pl01', 7, 4);

/********** assigned_to table data - 30 tuples **********/
insert into assigned_to values ('hj01', 3);
insert into assigned_to values ('hj01', 5);
insert into assigned_to values ('hj01', 10);

insert into assigned_to values ('ec01', 1);
insert into assigned_to values ('ec01', 2);
insert into assigned_to values ('ec01', 4);

insert into assigned_to values ('pp01', 5);
insert into assigned_to values ('pp01', 6);
insert into assigned_to values ('pp01', 10);

insert into assigned_to values ('jh01', 7);
insert into assigned_to values ('jh01', 8);
insert into assigned_to values ('jh01', 1);

insert into assigned_to values ('lc01', 6);
insert into assigned_to values ('lc01', 4);
insert into assigned_to values ('lc01', 8);

insert into assigned_to values ('er01', 7);
insert into assigned_to values ('er01', 8);
insert into assigned_to values ('er01', 1);

insert into assigned_to values ('jy01', 3);
insert into assigned_to values ('jy01', 4);
insert into assigned_to values ('jy01', 2);

insert into assigned_to values ('pl01', 9);
insert into assigned_to values ('pl01', 7);
insert into assigned_to values ('pl01', 10);

insert into assigned_to values ('fl01', 2);
insert into assigned_to values ('fl01', 6);
insert into assigned_to values ('fl01', 9);

/********** referee_report table data - 10 tuples **********/
/* Paper 1 */
insert into referee_report values ('ec01', 1, 'Y', 'Y', 'Y', 8, 7, 8, 7, 8, 1.0, 'Y', 'The paper proposes a new way to do schema mappings that involve the user providing example instances of the result data. The system then constructs the schema mapping "behind the scenes" from the provided examples.', 'The described example-based schema mapping is novel in that it has not been used before specifically for the schema mapping problem.', 'The user study is fairly small-scale. It is not clear that any statistical significance can be drawn from such a small-scale study, though the results do look promising for the given example.', 'An excellent paper.', null, null);
insert into referee_report values ('jh01', 1, 'Y', 'Y', 'Y', 7, 6, 6, 7, 7, 0.9, 'N', 'The paper proposes a new way to do schema mappings.', 'The technique is novel and technique is efficient. ', 'Applicable only to small-scale schema mappings.', 'An interesting technique to do schema mappings.', null, null);
insert into referee_report values ('er01', 1, 'Y', 'N', 'Y', 6, 4, 7, 5, 3, 1.0, 'N', 'The paper proposes a new way to do schema mappings, but the algorithm is incorrect.', 'None really.', 'The algorithm is incorrect.', 'Should be rejected as it is technically not correct.', null, null);

/* Paper 2 */
insert into referee_report values ('ec01', 2, 'Y', 'Y', 'Y', 5, 4, 4, 5, 5, 0.8, 'N', 'This paper focuses on robust wrapper construction. In particular, two models are studied: the adversarial model and the probabilistic model.', 'A new approach, which has been proved to be the optimal for wrapper robustness, is proposed.', 'The paper is presented in a way which is very difficult to understand. I would like to see some examples to help explain the models.', 'This paper requires further work to make it acceptable for inclusion in the conference.', null, null);
insert into referee_report values ('jy01', 2, 'Y', 'Y', 'Y', 5, 5, 6, 6, 6, 0.8, 'N', 'A provable most robust wrapper is proposed for the two models. Experiments show the robustness of the wrapper. The paper is presented clearly and each part is well motivated.', 'Two models, adversarial model and probabilistic model, are proposed. For each model, an extraction confidence is provided.', 'The two models could be better motivated.', 'A well written paper on an interesting and timely topic that is very relevant to the conference.', null, null);
insert into referee_report values ('fl01', 2, 'Y', 'Y', 'Y', 5, 5, 5, 5, 5, 0.8, 'N', 'A robust wrapper is proposed that is shown to be robust. The paper is clearly presented and well motivated.', 'An adversarial and a probabilistic model are proposed.', 'The two models care well motivated.', 'A good paper on a timely topic.', null, null);

/* Paper 4 */
insert into referee_report values ('jy01', 4, 'Y', 'Y', 'Y', 5, 6, 6, 5, 6, 0.8, 'N', 'This paper discusses three types of conflicts: temporal conflicts, due to overlapping time intervals, spatial conflicts, due to overlapping locations and name conflicts, due to the use of different names that refer to the same concept.', 'Dealing with conflicts in historical data is an important and interesting problem.', 'The assumptions in Section 4.2.1 on which the conflict resolution method and experiments are based are not adequately justified.', 'The paper is acceptable for the conference.', null, null);
insert into referee_report values ('ec01', 4, 'Y', 'Y', 'Y', 6, 5, 5, 6, 6, 0.9, 'N', 'When integrating data from several documents, several types of conflicts may arise in the data. These conflicts may result in inaccurate query results due to over- or under-estimation. This paper discusses three types of conflicts.', 'The paper clearly defines each of the three types of conflicts with examples and how they may affect the results of queries.', 'No convincing validation of the method on real historical data is provided.', 'The paper is suitable for the conference.', null, null);
insert into referee_report values ('lc01', 4, 'Y', 'Y', 'Y', 7, 6, 7, 6, 6, 1.0, 'N', 'This paper discusses three types of conflicts that may arise when integrating data from several documents.', 'A method for dealing with this problem for temporal conflicts is proposed.', 'There are some technical errors in the paper (see the detailed comments).', 'The paper is OK for the conference.', 'In Section 4.1 the equation for RO(t1,t2) seems to be wrong. Since you are taking the absolute value of the sum and overlap, when there is a (non-zero) time gap between two time intervals, the value for RO will still be greater than 0.', null);

/* Paper 6 */
insert into referee_report values ('pp01', 6, 'N', 'Y', 'Y', 3, 4, 4, 3, 3, 1.0, 'N', 'This paper focuses on user feedback during the entity resolution (ER) process. It identifies a set of properties for making the ER methods transparent such that users can easily evaluate the results during the resolution process.', 'Considering user feedback to improve ER result seems very useful.', 'Although the paper describes what the user would do to improve the final result, it does not mention how the user does it. Does the user check all the intermediate results or choose part of the results? Is there any way to check whether new rules are applicable or not?', 'This approach does not seem to be practical in practice.', null, null);
insert into referee_report values ('lc01', 6, 'N', 'Y', 'Y', 4, 4, 3, 3, 4, 0.9, 'N', 'The paper proposes a two-stage ER approach in which users can incrementally check, debug or improve the intermediate results. During the stages, this approach can improve precision and recall separately.', 'The idea of improving precision and recall separately is interesting.', 'The experiments only involve two datasets. A lack of experiments on more datasets and other domains, make the work less convincing.', 'While the ideas proposed in this paper are interesting, more experiments are needed to verify the practicality of this proposed ER method.', null, null);

/********** discussion table data - 8 tuples **********/
insert into discussion values (1, 1, 'ec01', 'On a more careful reading I agree with er01''s assessment that the algorithm is incorrect. I also have some problems with the paper''s ''liberal'' use of other people''s text.');
insert into discussion values (2, 1, 'jh01', 'Yes, I agree that the paper is technically incorrect and is possibly repetitive of other papers. For my part, I am willing to lower my overall score to 3.');
insert into discussion values (3, 1, 'ec01', 'I have also decided to reduce my overall score for this paper to 3.');
insert into discussion values (4, 1, 'er01', 'It seems that with the revised overall score this paper will not be accepted.');
insert into discussion values (5, 1, 'ec01', 'OK I am happy with this result. I guess we are done discussing this paper.');
insert into discussion values (1, 2, 'jh01', 'I feel that with some minor rewriting, the paper would be acceptable for inclusion in the conference. I would really like to see this paper accepted.');
insert into discussion values (2, 2, 'ec01', 'Yes, adding some examples would make the paper much clearer and easier to understand. I am willing to change my overall score to 7 if you are willing to oversee the revision of the paper.');
insert into discussion values (3, 2, 'jh01', 'OK I am willing to oversee the revision of the paper.');

commit;