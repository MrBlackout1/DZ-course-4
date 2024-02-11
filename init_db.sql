CREATE TYPE level AS ENUM('Trainee', 'Junior', 'Middle', 'Senior');
CREATE TABLE worker (
ID bigint NOT NULL PRIMARY KEY,
NAME varchar(1000) NOT NULL,
BIRTHDAY date check(BIRTHDAY > '1900-01-01'),
LEVEL level NOT NULL,
SALARY bigint check(SALARY >= 100 AND SALARY <= 100000)
);

CREATE TABLE public.client (
ID bigint NOT NULL PRIMARY KEY,
NAME varchar(1000) NOT NULL
);

CREATE TABLE public.project (
ID bigint NOT NULL PRIMARY KEY,
CLIENT_ID int,
START_DATE date,
FINISH_DATE date,
FOREIGN KEY (CLIENT_ID) REFERENCES client(ID)
);

CREATE TABLE public.project_worker (
    PROJECT_ID INT,
    WORKER_ID INT,
    PRIMARY KEY (PROJECT_ID, WORKER_ID),
    FOREIGN KEY (PROJECT_ID) REFERENCES public.project(ID),
    FOREIGN KEY (WORKER_ID) REFERENCES public.worker(ID)
);



create sequence worker_seq start 1;
create sequence client_seq start 1;
create sequence project_seq start 1;

alter table public.worker alter column ID set default nextval('worker_seq');
alter table public.client alter column ID set default nextval('client_seq');
alter table public.project alter column ID set default nextval('project_seq');

