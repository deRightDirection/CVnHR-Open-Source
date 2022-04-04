
    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'dbo.[FK_47AB3A99]') and parent_object_id = OBJECT_ID(N'dbo.DEPONERINGSSTUK'))
alter table dbo.DEPONERINGSSTUK  drop constraint FK_47AB3A99
;

    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'dbo.[FK_134EF74B]') and parent_object_id = OBJECT_ID(N'dbo.FUNCTIEVERVULLING'))
alter table dbo.FUNCTIEVERVULLING  drop constraint FK_134EF74B
;

    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'dbo.[FK_5B1B059F]') and parent_object_id = OBJECT_ID(N'dbo.HANDELSNAAM'))
alter table dbo.HANDELSNAAM  drop constraint FK_5B1B059F
;

    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'dbo.[FK_114D9F3E]') and parent_object_id = OBJECT_ID(N'dbo.SBIACTIVITEIT'))
alter table dbo.SBIACTIVITEIT  drop constraint FK_114D9F3E
;

    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'dbo.[FK_A35B0EAE]') and parent_object_id = OBJECT_ID(N'dbo.SBIACTIVITEIT'))
alter table dbo.SBIACTIVITEIT  drop constraint FK_A35B0EAE
;

    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'dbo.[FK_5DC136DA]') and parent_object_id = OBJECT_ID(N'dbo.VESTIGING'))
alter table dbo.VESTIGING  drop constraint FK_5DC136DA
;

    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'dbo.[FK_1D0EFF4D]') and parent_object_id = OBJECT_ID(N'dbo.VESTIGINGSBIACTIVITEIT'))
alter table dbo.VESTIGINGSBIACTIVITEIT  drop constraint FK_1D0EFF4D
;

    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'dbo.[FK_2CCE0BD0]') and parent_object_id = OBJECT_ID(N'dbo.VESTIGINGSBIACTIVITEIT'))
alter table dbo.VESTIGINGSBIACTIVITEIT  drop constraint FK_2CCE0BD0
;

    if exists (select * from dbo.sysobjects where id = object_id(N'dbo.DEPONERINGSSTUK') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table dbo.DEPONERINGSSTUK;

    if exists (select * from dbo.sysobjects where id = object_id(N'dbo.FUNCTIEVERVULLING') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table dbo.FUNCTIEVERVULLING;

    if exists (select * from dbo.sysobjects where id = object_id(N'dbo.HANDELSNAAM') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table dbo.HANDELSNAAM;

    if exists (select * from dbo.sysobjects where id = object_id(N'dbo.KVKINSCHRIJVING') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table dbo.KVKINSCHRIJVING;

    if exists (select * from dbo.sysobjects where id = object_id(N'dbo.SBIACTIVITEIT') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table dbo.SBIACTIVITEIT;

    if exists (select * from dbo.sysobjects where id = object_id(N'dbo.SBICODE') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table dbo.SBICODE;

    if exists (select * from dbo.sysobjects where id = object_id(N'dbo.VESTIGING') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table dbo.VESTIGING;

    if exists (select * from dbo.sysobjects where id = object_id(N'dbo.VESTIGINGSBIACTIVITEIT') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table dbo.VESTIGINGSBIACTIVITEIT;

    create table dbo.DEPONERINGSSTUK (
        Id INT IDENTITY NOT NULL,
       DEPOTID NVARCHAR(255) null,
       DATUMDEPONERING DATETIME2 null,
       TYPE NVARCHAR(255) null,
       STATUS NVARCHAR(255) null,
       GAATOVER NVARCHAR(255) null,
       KvkInschrijving_id INT null,
       primary key (Id)
    );

    create table dbo.FUNCTIEVERVULLING (
        Id INT IDENTITY NOT NULL,
       FUNCTIE NVARCHAR(255) null,
       FUNCTIETITEL NVARCHAR(255) null,
       VOLLEDIGENAAM NVARCHAR(255) null,
       SCHORSING NVARCHAR(255) null,
       LANGSTZITTENDE NVARCHAR(255) null,
       BEVOEGDHEID NVARCHAR(255) null,
       HANDELINGSBEKWAAM NVARCHAR(255) null,
       KvkInschrijving_id INT null,
       primary key (Id)
    );

    create table dbo.HANDELSNAAM (
        Id INT IDENTITY NOT NULL,
       HANDELSNAAM NVARCHAR(255) null,
       KvkInschrijving_id INT null,
       primary key (Id)
    );

    create table dbo.KVKINSCHRIJVING (
        Id INT IDENTITY NOT NULL,
       NAAM NVARCHAR(255) null,
       KVKNUMMER NVARCHAR(255) null,
       PEILMOMENT NVARCHAR(255) null,
       INGEVOEGDOP DATETIME2 null,
       GELDIGTOT DATETIME2 null,
       OPGEVRAAGDOP DATETIME2 null,
       REGISTRATIEDATUMAANVANG NVARCHAR(255) null,
       REGISTRATIEDATUMEINDE NVARCHAR(255) null,
       DATUMOPRICHTING NVARCHAR(255) null,
       DATUMUITSCHRIJVING NVARCHAR(255) null,
       PERSOONRECHTSVORM NVARCHAR(255) null,
       UITGEBREIDERECHTSVORM NVARCHAR(255) null,
       BIJZONDERERECHTSTOESTAND NVARCHAR(255) null,
       REDENINSOLVENTIE NVARCHAR(255) null,
       BEPERKINGINRECHTSHANDELING NVARCHAR(255) null,
       EIGENAARHEEFTGEDEPONEERD NVARCHAR(255) null,
       VOLLEDIGENAAMEIGENAAR NVARCHAR(255) null,
       FULLTIMEWERKZAMEPERSONEN NVARCHAR(255) null,
       PARTTIMEWERKZAMEPERSONEN NVARCHAR(255) null,
       TOTAALWERKZAMEPERSONEN NVARCHAR(255) null,
       GEPLAATSTKAPITAAL NVARCHAR(255) null,
       GESTORTKAPITAAL NVARCHAR(255) null,
       RECHTERLIJKEUITSPRAAK NVARCHAR(255) null,
       BERICHTENBOXNAAM NVARCHAR(255) null,
       NONMAILING NVARCHAR(255) null,
       primary key (Id)
    );

    create table dbo.SBIACTIVITEIT (
        Id INT IDENTITY NOT NULL,
       SbiCode_id NVARCHAR(255) null,
       KvKInschrijving_id INT null,
       ISHOOFDSBIACTIVITEIT BIT null,
       primary key (Id)
    );

    create table dbo.SBICODE (
        Code NVARCHAR(255) not null,
       OMSCHRIJVING NVARCHAR(255) null,
       primary key (Code)
    );

    create table dbo.VESTIGING (
        Id INT IDENTITY NOT NULL,
       VESTIGINGSNUMMER NVARCHAR(255) null,
       NAAM NVARCHAR(255) null,
       ADRES NVARCHAR(255) null,
       STRAAT NVARCHAR(255) null,
       HUISNUMMER NVARCHAR(255) null,
       HUISNUMMERTOEVOEGING NVARCHAR(255) null,
       POSTCODECIJFERS NVARCHAR(255) null,
       POSTCODELETTERS NVARCHAR(255) null,
       WOONPLAATS NVARCHAR(255) null,
       TELEFOON NVARCHAR(255) null,
       FAX NVARCHAR(255) null,
       EMAIL NVARCHAR(255) null,
       GEMEENTE NVARCHAR(255) null,
       BAGID NVARCHAR(255) null,
       RSIN NVARCHAR(255) null,
       EORI NVARCHAR(255) null,
       INGEVOEGDOP DATETIME2 null,
       GELDIGTOT DATETIME2 null,
       ISHOOFDVESTIGING BIT null,
       POSTBUSNUMMER NVARCHAR(255) null,
       POSTADRES NVARCHAR(255) null,
       POSTSTRAAT NVARCHAR(255) null,
       POSTHUISNUMMER NVARCHAR(255) null,
       POSTHUISNUMMERTOEVOEGING NVARCHAR(255) null,
       POSTPOSTCODECIJFERS NVARCHAR(255) null,
       POSTPOSTCODELETTERS NVARCHAR(255) null,
       POSTWOONPLAATS NVARCHAR(255) null,
       POSTGEMEENTE NVARCHAR(255) null,
       REGISTRATIEDATUMAANVANG NVARCHAR(255) null,
       REGISTRATIEDATUMEINDE NVARCHAR(255) null,
       FULLTIMEWERKZAMEPERSONEN NVARCHAR(255) null,
       PARTTIMEWERKZAMEPERSONEN NVARCHAR(255) null,
       TOTAALWERKZAMEPERSONEN NVARCHAR(255) null,
       KvkInschrijving_id INT null,
       primary key (Id)
    );

    create table dbo.VESTIGINGSBIACTIVITEIT (
        Id INT IDENTITY NOT NULL,
       SbiCode_id NVARCHAR(255) null,
       Vestiging_id INT null,
       ISHOOFDSBIACTIVITEIT BIT null,
       primary key (Id)
    );

    alter table dbo.DEPONERINGSSTUK 
        add constraint FK_47AB3A99 
        foreign key (KvkInschrijving_id) 
        references dbo.KVKINSCHRIJVING;

    alter table dbo.FUNCTIEVERVULLING 
        add constraint FK_134EF74B 
        foreign key (KvkInschrijving_id) 
        references dbo.KVKINSCHRIJVING;

    alter table dbo.HANDELSNAAM 
        add constraint FK_5B1B059F 
        foreign key (KvkInschrijving_id) 
        references dbo.KVKINSCHRIJVING;

    create index IX_KVKINSCHRIJVING_NAAM on dbo.KVKINSCHRIJVING (NAAM);

    create index IX_KVKINSCHRIJVING_KVKNUMMER on dbo.KVKINSCHRIJVING (KVKNUMMER);

    alter table dbo.SBIACTIVITEIT 
        add constraint FK_114D9F3E 
        foreign key (SbiCode_id) 
        references dbo.SBICODE;

    alter table dbo.SBIACTIVITEIT 
        add constraint FK_A35B0EAE 
        foreign key (KvKInschrijving_id) 
        references dbo.KVKINSCHRIJVING;

    create index IX_VESTIGING_VESTIGINGSNUMMER on dbo.VESTIGING (VESTIGINGSNUMMER);

    create index IX_VESTIGING_NAAM on dbo.VESTIGING (NAAM);

    create index IX_VESTIGING_BAGID on dbo.VESTIGING (BAGID);

    create index IX_VESTIGING_RSIN on dbo.VESTIGING (RSIN);

    alter table dbo.VESTIGING 
        add constraint FK_5DC136DA 
        foreign key (KvkInschrijving_id) 
        references dbo.KVKINSCHRIJVING;

    alter table dbo.VESTIGINGSBIACTIVITEIT 
        add constraint FK_1D0EFF4D 
        foreign key (SbiCode_id) 
        references dbo.SBICODE;

    alter table dbo.VESTIGINGSBIACTIVITEIT 
        add constraint FK_2CCE0BD0 
        foreign key (Vestiging_id) 
        references dbo.VESTIGING;
