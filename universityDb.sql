
create table universities
(
    id                        bigserial not null
        constraint universities_pk
            primary key,
    name                      varchar,
    address                   varchar,
    rating                    double precision,
    foreign_branches_presence boolean,
    type                      varchar,
    professors_number         integer,
    foundation_date           timestamp
);

alter table universities
    owner to postgres;

create table faculties
(
    id              bigserial not null
        constraint faculties_pk
            primary key,
    name            varchar,
    deans_name      varchar,
    foundation_date timestamp,
    budget          double precision,
    subjects_number integer,
    university_id   integer
        constraint faculties_universities_id_fk
            references universities
);

alter table faculties
    owner to postgres;

INSERT INTO universities VALUES (1, 'National Technical University «Kharkiv Polytechnic Institute»',
                                'Kirpichova street 2, Kharkiv',4.0, false, 'University', 312, '15-Sep-1885');
INSERT INTO universities VALUES (2, 'Kharkiv National University of Radio Electronics',
                                 'Nauky Ave. 14, Kharkiv', 4.0, false, 'University', 250, '11-Aug-1930');
INSERT INTO universities VALUES (3, 'V. N. Karazin Kharkiv National University',
                                 '4 Svobody Sq., Kharkiv', 4.0, false, 'University', 1200, '29-Jan-1805');
INSERT INTO universities VALUES (4, 'Simon Kuznets Kharkiv National University of Economics',
                                 'Nauky Ave. 9A, Kharkiv', 4.0, false, 'University', 312, '22-Oct-1930');

INSERT INTO faculties VALUES (1, 'Department of Automation and Cybersecurity', 'Petrov Alexander', '12-Apr-1996',
                              500000, 10, 1);
INSERT INTO faculties VALUES (2, 'Department of Computer Science and Intellectual Property', 'Soloshchuk Michael',
                              '08-Sep-2001', 600000, 8, 1);
INSERT INTO faculties VALUES (3, 'Department of Computer Engineering and Programming', 'Semenov Serhii',
                              '15-Nov-1988', 700000, 14, 1);
INSERT INTO faculties VALUES (4, 'Faculty of Computer Science', 'Andriy Yerokhin',
                              '29-Aug-1995', 650000, 10, 2);
INSERT INTO faculties VALUES (5, 'Faculty of Information and Analytical Technologies and Management',
                              'Volodymyr Doroshenko','03-Jul-1995', 400000, 15, 2);
INSERT INTO faculties VALUES (6, 'Faculty of Іnfocommunications', 'Arkadii Snihurov',
                              '03-Sep-1997', 800000, 17, 2);
INSERT INTO faculties VALUES (7, 'Faculty of Computer Science', 'Lazurik Valenting',
                              '02-Sep-1992', 750000, 9, 3);
INSERT INTO faculties VALUES (8, 'Faculty of History', 'Litovchenko Serhii',
                              '12-Jan-1865', 300000, 12, 3);
INSERT INTO faculties VALUES (9, 'Faculty of Physics', 'Vovk Ruslan',
                              '03-Sep-1867', 250000, 16, 3);
INSERT INTO faculties VALUES (10, 'Faculty of Economy and Law', 'Bril Mykhailo',
                              '03-Sep-1983', 500000, 25, 4);
INSERT INTO faculties VALUES (11, 'Faculty of Information Technologies', 'Kots Hryhorii',
                              '23-Oct-1961', 800000, 16, 4);
INSERT INTO faculties VALUES (12, 'Faculty of Management and Marketing', 'Vovk Volodymyr',
                              '12-Dec-1930', 520000, 12, 4);

SELECT * FROM universities INNER JOIN faculties f on universities.id = f.university_id;


