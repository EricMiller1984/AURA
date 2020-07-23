/* Create all Table in database (AURA) */

/* System Tables */

/* Users */
CREATE TABLE [dbo].[System_Users] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [UserID]  	INT            NOT NULL,
    [GID]  	INT            NOT NULL,
    [Login]    	VARCHAR (50)   NOT NULL UNIQUE,
    [Password] 	VARCHAR (50)   NOT NULL,
    [Description]  VARCHAR (MAX) NULL,
    [Permissions]  VARCHAR (50)            NOT NULL,
    [Name]     VARCHAR (50)   NOT NULL,
    [Email]    VARCHAR (50)   NULL UNIQUE,
    [CreatedDate]  DATETIME       NOT NULL,
    [CreatedBy]    VARCHAR (50)   NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [ModifiedBy]   VARCHAR (50)   NULL
);

/* Groups */
CREATE TABLE [dbo].[System_Groups] (
    [RecordID]      INT            IDENTITY (1, 1) NOT NULL,
    [GroupID]  	INT            NOT NULL,
    [Type]    VARCHAR (50)   NOT NULL,
    [Name]    VARCHAR (50)   NOT NULL,
    [Description]  VARCHAR (MAX) NULL,
    [Permissions]  VARCHAR (50)   NOT NULL,
    [CreatedDate]  DATETIME       NOT NULL,
    [CreatedBy]    VARCHAR (50)   NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [ModifiedBy]   VARCHAR (50)   NULL
);

/* Permissions */
CREATE TABLE [dbo].[System_Permissions] (
    [RecordID]       INT          IDENTITY (1, 1) NOT NULL,
    [PermID]  	INT            NOT NULL,
    [Type]     VARCHAR (50) NULL,
    [Code]     VARCHAR (50) NULL,
    [Name]     VARCHAR (50) NOT NULL,
    [Description]  VARCHAR (50) NULL,
    [CreatedDate]  DATETIME     NOT NULL,
    [CreatedBy]    VARCHAR (50) NOT NULL,
    [ModifiedDate] DATETIME     NULL,
    [ModifiedBy]   VARCHAR (50) NULL
);

/* Session Data ( May change the SessionID) */
CREATE TABLE [dbo].[System_Session] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [SessionID]  	INT            NOT NULL,
    [UID]  	INT            NOT NULL, /* Get Loged in UserID */
    [Session_Start] DATETIME       NULL,
    [Session_End] DATETIME       NULL,
    [CreatedDate]  DATETIME       NOT NULL,
    [CreatedBy]    VARCHAR (50)   NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [ModifiedBy]   VARCHAR (50)   NULL
);

/* ============= */
/* Lookup Tables */
/* ============= */

/* Dictionary */
CREATE TABLE [dbo].[Lookup_Dictionary] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [TermID]  	INT            NOT NULL,
    [Code]     VARCHAR (50)   NULL UNIQUE, /* Figure out coding system */
    [Title]     VARCHAR (50)   NOT NULL,
    [Description]  NVARCHAR (MAX) NULL,
    [CreatedDate]  DATETIME       NOT NULL,
    [CreatedBy]    VARCHAR (50)   NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [ModifiedBy]   VARCHAR (50)   NULL
);

/* Subjects */
CREATE TABLE [dbo].[Lookup_Subjects] (
    [RecordID]      INT            IDENTITY (1, 1) NOT NULL,
    [TermID]  	INT            NOT NULL,
    [Code]    VARCHAR (50)   NULL UNIQUE,
    [Title]    VARCHAR (MAX)  NOT NULL,
    [Description]  NVARCHAR (MAX) NULL,
    [CreatedDate]  DATETIME       NOT NULL,
    [CreatedBy]    VARCHAR (50)   NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [ModifiedBy]   VARCHAR (50)   NULL
);

/* Categories */
CREATE TABLE [dbo].[Lookup_Category] (
    [RecordID]        INT            IDENTITY (1, 1) NOT NULL,
    [TermID]  	INT            NOT NULL,
    [Code]    VARCHAR (50)   NULL UNIQUE,
    [Name]      VARCHAR (50)   NOT NULL,
    [Description]  NVARCHAR (MAX) NULL,
    [CreatedDate]  DATETIME       NOT NULL,
    [CreatedBy]    VARCHAR (50)   NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [ModifiedBy]   VARCHAR (50)   NULL
);

/* Languages */
CREATE TABLE [dbo].[Lookup_Languages] (
    [RecordID]        INT            IDENTITY (1, 1) NOT NULL,
    [LanguageID]  	INT            NOT NULL,
    [Code]    VARCHAR (50)   NULL UNIQUE,
    [Class]     VARCHAR (50)   NULL,
    [Type]      VARCHAR (50)   NOT NULL,
    [Name]      VARCHAR (MAX)  NOT NULL,
    [CountryID]   INT   NOT NULL, /* Lookup CountryID */
    [Family]    VARCHAR (50)   NULL,
    [Description]   NVARCHAR (MAX) NULL,
    [LangUICulture] VARCHAR (50)   NULL, /* For User Interface */
    [CreatedDate]   DATETIME       NOT NULL,
    [CreatedBy]     VARCHAR (50)   NOT NULL,
    [ModifiedDate]  DATETIME       NULL,
    [ModifiedBy]    VARCHAR (50)   NULL
);

/* Religions */
CREATE TABLE [dbo].[Lookup_Religions] (
    [RecordID]        INT            IDENTITY (1, 1) NOT NULL,
    [ReligionID]  	INT            NOT NULL,
    [Code]    VARCHAR (50)   NULL UNIQUE,
    [Class]   VARCHAR (50)   NULL,
    [Name]    VARCHAR (50)   NOT NULL,
    [Description]  NVARCHAR (MAX) NULL,
    [CreatedDate]  DATETIME       NOT NULL,
    [CreatedBy]    VARCHAR (50)   NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [ModifiedBy]   VARCHAR (50)   NULL
);

/* Countries ( May export to XMMLData ) */
CREATE TABLE [dbo].[Lookup_Countries] (
    [RecordID]    INT            IDENTITY (1, 1) NOT NULL,
    [CountryID]  	INT            NOT NULL,
    [Type]  VARCHAR (50)   NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [Name]  VARCHAR (MAX)  NOT NULL,
    [Description]  NVARCHAR (MAX) NULL,
    [CreatedDate]  DATETIME       NOT NULL,
    [CreatedBy]    VARCHAR (50)   NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [ModifiedBy]   VARCHAR (50)   NULL
);

/* States (USA) Export to XMLData */
CREATE TABLE [dbo].[Lookup_States] (
    [RecordID]      INT          IDENTITY (1, 1) NOT NULL,
    [StateID]  	INT            NOT NULL,
    [CountryID]   INT            NULL,    
    [Type]    VARCHAR (50) NULL, /* State, District or Territory */
    [Code]    NCHAR (10)   NOT NULL,
    [Name]    VARCHAR (50) NOT NULL,
    [Description]  NVARCHAR (MAX) NULL,
    [CreatedDate]  DATETIME     NOT NULL,
    [CreatedBy]    VARCHAR (50) NOT NULL,
    [ModifiedDate] DATETIME     NULL,
    [ModifiedBy]   VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([StateID] ASC)
);

/* Provinces (Other Countries) XMLData */

/* Cities ( Lookup [State, Country, GPSData ) */
CREATE TABLE [dbo].[Lookup_Cities] (
    [RecordID]          INT            IDENTITY (1, 1) NOT NULL,
    [CityID]  	INT            NOT NULL,
    [StateID]     INT            NULL,
    [CountryID]   INT            NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [Name]        VARCHAR (50)   NOT NULL,
    [County] VARCHAR (50)   NULL,
    [Description]     NVARCHAR (MAX) NULL,
    [CreatedDate]     DATETIME       NOT NULL,
    [CreatedBy]       VARCHAR (50)   NOT NULL,
    [ModifiedDate]    DATETIME       NULL,
    [ModifiedBy]      VARCHAR (50)   NULL
);

/* ============= */
/* Common Tables */
/* ============= */

/* Classifications */
CREATE TABLE [dbo].[Common_Class] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [ClassID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [Type]         VARCHAR (50)  NOT NULL,
    [Name]     VARCHAR (50)   NOT NULL,
    [Description]  VARCHAR (MAX) NULL,
    [CreatedDate]  DATETIME       NOT NULL,
    [CreatedBy]    VARCHAR (50)   NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [ModifiedBy]   VARCHAR (50)   NULL
);

/* Types */
CREATE TABLE [dbo].[Common_Types] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [TypeID]  	INT            NOT NULL,
    [Class]    VARCHAR (50)   NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [Name]     VARCHAR (50)   NOT NULL,
    [Description]  VARCHAR (MAX) NULL,
    [CreatedDate]  DATETIME       NOT NULL,
    [CreatedBy]    VARCHAR (50)   NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [ModifiedBy]   VARCHAR (50)   NULL
);

/* Roles (Investigator, Witness, User, Administrator, etc.) */
CREATE TABLE [dbo].[Common_Roles] (
    [ID]       INT            IDENTITY (1, 1) NOT NULL,
    [RoleID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [Class]    VARCHAR (50)   NULL,
    [Type]     VARCHAR (50)   NOT NULL,
    [Name]     VARCHAR (50)   NOT NULL,
    [Description]  VARCHAR (MAX) NULL,
    [CreatedDate]  DATETIME       NOT NULL,
    [CreatedBy]    VARCHAR (50)   NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [ModifiedBy]   VARCHAR (50)   NULL
);

/* Attributes (Height, Weight, Color, Etc. ) */
CREATE TABLE [dbo].[Common_Attributes] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [AttributeID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [Class]    VARCHAR (50)   NOT NULL,
    [Type]     VARCHAR (50)   NOT NULL,
    [Name]     VARCHAR (50)   NOT NULL,
    [Description]  VARCHAR (MAX) NULL,
    [CreatedDate]  DATETIME       NOT NULL,
    [CreatedBy]    VARCHAR (50)   NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [ModifiedBy]   VARCHAR (50)   NULL
);

/* Allignment (Seelie, Unseelie, Benevolent, Malevolent, etc. ) */
CREATE TABLE [dbo].[Common_Alignment] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [AlignmentID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [Class]    VARCHAR (50)   NOT NULL,
    [Type]     VARCHAR (50)   NOT NULL,
    [Name]     VARCHAR (50)   NOT NULL,
    [Description]  VARCHAR (MAX) NULL,
    [CreatedDate]  DATETIME       NOT NULL,
    [CreatedBy]    VARCHAR (50)   NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [ModifiedBy]   VARCHAR (50)   NULL
);

/* Abilities (Persons [Levitate, etc], Beings[Mind communications, etc.]) */
CREATE TABLE [dbo].[Common_Abilities] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [AbilityID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [Category] VARCHAR (50)   NULL, /* Used for Main Subject search (Can select multiple) */
    [Class]    VARCHAR (50)   NULL,
    [Type]     VARCHAR (50)   NULL,
    [Name]     VARCHAR (50)   NOT NULL,
    [Description]     NVARCHAR (MAX) NULL,
    [CreatedDate]     DATETIME       NOT NULL,
    [CreatedBy]       VARCHAR (50)   NOT NULL,
    [ModifiedDate]    DATETIME       NULL,
    [ModifiedBy]      VARCHAR (50)   NULL
);

/* Phenomena (Levitation, Time-Slip, etc) */
CREATE TABLE [dbo].[Common_Phenomena] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [PhenomenaID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [Class]    VARCHAR (50)   NULL,
    [Type]     VARCHAR (50)   NULL,
    [Category] VARCHAR (50)   NULL, /* Used for Main Subject search (Can select multiple) */
    [Name]     VARCHAR (50)   NOT NULL,
    [Description]  NVARCHAR (MAX) NULL,
    [CreatedDate]  DATETIME       NOT NULL,
    [CreatedBy]    VARCHAR (50)   NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [ModifiedBy]   VARCHAR (50)   NULL
);

/* Effects (Electromagnetic, Sound, Visual, Perception, Etc. ) */
CREATE TABLE [dbo].[Common_Effects] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [EffectID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [Class]    VARCHAR (50)   NULL,
    [Type]     VARCHAR (50)   NULL,
    [Category] VARCHAR (50)   NULL, /* Used for Main Subject search (Can select multiple) */
    [Name]     VARCHAR (50)   NOT NULL,
    [Description]    NVARCHAR (MAX) NULL,
    [CreatedDate]    DATETIME       NOT NULL,
    [CreatedBy]      VARCHAR (50)   NOT NULL,
    [ModifiedDate]   DATETIME       NULL,
    [ModifiedBy]     VARCHAR (50)   NULL
);

/* Manifestations */
CREATE TABLE [dbo].[Common_Manifestations] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [ManifestationID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [Category] VARCHAR (50)   NULL, /* Used for Main Subject search (Can select multiple) */
    [Class]    VARCHAR (50)   NULL,
    [Type]     VARCHAR (50)   NULL,
    [Name]     VARCHAR (50)   NOT NULL,
    [Description]     NVARCHAR (MAX) NULL,
    [CreatedDate]     DATETIME       NOT NULL,
    [CreatedBy]       VARCHAR (50)   NOT NULL,
    [ModifiedDate]    DATETIME       NULL,
    [ModifiedBy]      VARCHAR (50)   NULL
);

// Narratives (Common Report Fields, Testimony, etc ) */
CREATE TABLE [dbo].[Common_Narratives] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [NarrativeID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [Category] VARCHAR (50)   NULL, /* Used for Main Subject search (Can select multiple) */
    [TableName]    VARCHAR (50)  NOT NULL, /* Has to be associated with a table */
    [Title]        VARCHAR (50)  NOT NULL,
    [Author]       VARCHAR (50)  NULL,
    [Content]      NVARCHAR (MAX) NOT NULL, /* The actual content (Story) */
    [ContentOrder] INT           NULL, /* Order By ContentOrder */
    [CreatedDate]      DATETIME      NOT NULL,
    [CreatedBy]        VARCHAR (50)  NOT NULL,
    [ModifiedDate]     DATETIME      NULL,
    [ModifiedBy]       VARCHAR (50)  NULL,
);

/* Images */
CREATE TABLE [dbo].[Common_Images] (
    [RecordID]     INT           IDENTITY (1, 1) NOT NULL,
    [ImageID]      INT           NOT NULL,
    [TableName]    VARCHAR (50)  NOT NULL,
    [TableIndexID] INT           NOT NULL,
    [FileName]     VARCHAR (50)  NOT NULL,
    [FileType]        VARCHAR (50)  NOT NULL,
    [Title]        VARCHAR (50)  NOT NULL,
    [Description]  VARCHAR (MAX) NULL,
    [ImageDate]    DATETIME      NULL,
    [RecordedBy]    VARCHAR (50)  NOT NULL,
    [CreatedDate]  DATETIME      NOT NULL,
    [CreatedBy]    VARCHAR (50)  NOT NULL,
    [ModifiedDate] DATETIME      NULL,
    [ModifiedBy]   VARCHAR (50)  NULL
);

/* Videos */
CREATE TABLE [dbo].[Common_Videos] (
    [RecordID]     INT           IDENTITY (1, 1) NOT NULL,
    [VideoID]      INT           NOT NULL,
    [TableName]    VARCHAR (50)  NOT NULL,
    [TableIndexID] INT           NOT NULL,
    [FileName]     VARCHAR (50)  NOT NULL,
    [FileType]        VARCHAR (50)  NOT NULL,
    [Title]        VARCHAR (50)  NOT NULL,
    [Description]  VARCHAR (MAX) NULL,
    [RecordingDate]    DATETIME      NULL,
    [RecordedBy]    VARCHAR (50)  NOT NULL,
    [CreatedDate]  DATETIME      NOT NULL,
    [CreatedBy]    VARCHAR (50)  NOT NULL,
    [ModifiedDate] DATETIME      NULL,
    [ModifiedBy]   VARCHAR (50)  NULL
);

/* Audio */
CREATE TABLE [dbo].[Common_Audio] (
    [RecordID]     INT           IDENTITY (1, 1) NOT NULL,
    [AudioID]      INT           NOT NULL,
    [TableName]    VARCHAR (50)  NOT NULL,
    [TableIndexID] INT           NOT NULL,
    [FileName]     VARCHAR (50)  NOT NULL,
    [FileType]        VARCHAR (50)  NOT NULL,
    [Title]        VARCHAR (50)  NOT NULL,
    [Description]  VARCHAR (MAX) NULL,
    [RecordingDate]    DATETIME      NULL,
    [RecordedBy]    VARCHAR (50)  NOT NULL,
    [CreatedDate]  DATETIME      NOT NULL,
    [CreatedBy]    VARCHAR (50)  NOT NULL,
    [ModifiedDate] DATETIME      NULL,
    [ModifiedBy]   VARCHAR (50)  NULL
);

/* Documents */
CREATE TABLE [dbo].[Common_Documents] (
    [RecordID]     INT           IDENTITY (1, 1) NOT NULL,
    [DocumentID]      INT           NOT NULL,
    [TableName]    VARCHAR (50)  NOT NULL,
    [TableIndexID] INT           NOT NULL,
    [FileName]     VARCHAR (50)  NOT NULL,
    [FileType]        VARCHAR (50)  NOT NULL,
    [Title]        VARCHAR (50)  NOT NULL,
    [Description]  VARCHAR (MAX) NULL,
    [DocumentDate]    DATETIME      NULL,
    [Author]    VARCHAR (50)  NOT NULL,
    [CreatedDate]  DATETIME      NOT NULL,
    [CreatedBy]    VARCHAR (50)  NOT NULL,
    [ModifiedDate] DATETIME      NULL,
    [ModifiedBy]   VARCHAR (50)  NULL
);

/* ==================== */
/* Standard Data Tables */
/* ==================== */

/* Equipment */
CREATE TABLE [dbo].[Equipment] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [EquipmentID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [Category] VARCHAR (50)   NULL, /* Used for Main Subject search (Can select multiple) */
    [Class] VARCHAR (50)   NULL,
    [Type]  VARCHAR (50)   NOT NULL,
    [Name]  VARCHAR (50)   NOT NULL,
    [Description]    NVARCHAR (MAX) NULL,
    [Value] VARCHAR (50)   NOT NULL,
    [MFGDate]   DATETIME       NULL,
    [CreatedDate]    DATETIME       NOT NULL,
    [CreatedBy]      VARCHAR (50)   NOT NULL,
    [ModifiedDate]   DATETIME       NULL,
    [ModifiedBy]     VARCHAR (50)   NULL
);

/* Investigators */
CREATE TABLE [dbo].[Investigator] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [InvestigatorID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [TypeID]      INT            NOT NULL,
    [IsUser]    INT            NOT NULL, /* Do they have a user account in system */
    [NameFull]  VARCHAR (50)   NOT NULL, /* Autogenerate from NameLast and NameFirst */
    [NameLast]  VARCHAR (50)   NOT NULL,
    [NameFirst] VARCHAR (50)   NULL,
    [Description]  NVARCHAR (MAX) NULL,
    [CreatedDate]  DATETIME       NOT NULL,
    [CreatedBy]    VARCHAR (50)   NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [ModifiedBy]   VARCHAR (50)   NULL
);

/* Investigator Attributes (Vitals) */
CREATE TABLE [dbo].[Investigator_Attributes] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [Investigator_AttributeID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [InvestigatorID]    INT            NOT NULL, /* Associated Investigator */
    [AttributeID] INT            NOT NULL, /* Lookup from Common_Attributes */
    [Title]    VARCHAR (50)   NOT NULL,
    [Data]     VARCHAR (MAX) NULL,
    [CreatedDate]  DATETIME       NOT NULL,
    [CreatedBy]    VARCHAR (50)   NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [ModifiedBy]   VARCHAR (50)   NULL
);

/* Investigator Abilities */
CREATE TABLE [dbo].[Investigator_Abilities] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [Investigator_AbilityID]  	INT            NOT NULL,
    [InvestigatorID]    INT            NOT NULL, /* Associated Investigator */
    [AbilityID] INT            NOT NULL,
    [AbilityDetails]  NVARCHAR (MAX) NULL,
    [CreatedDate]     DATETIME       NOT NULL,
    [CreatedBy]       VARCHAR (50)   NOT NULL,
    [ModifiedDate]    DATETIME       NULL,
    [ModifiedBy]      VARCHAR (50)   NULL
);

/* Investigator Contact Information */

/* Email Addreses (Can have multiple) */
CREATE TABLE [dbo].[Investigator_Email] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [EmailID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [InvestigatorID]    INT            NOT NULL, /* Associated Investigator */
    [TypeID]      INT NULL, /* Lookup from Common_Types */
    [IsPrimary] INT          NOT NULL, /* Primary contact Address */
    [EmailAddress]   VARCHAR (50) NOT NULL,
    [CreatedDate]    DATETIME     NOT NULL,
    [CreatedBy]      VARCHAR (50) NOT NULL,
    [ModifiedDate]   DATETIME     NULL,
    [ModifiedBy]     VARCHAR (50) NULL
);

/* Phones */
CREATE TABLE [dbo].[Investigator_Phones] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [PhoneID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [InvestigatorID]    INT            NOT NULL, /* Associated Investigator */
    [TypeID]      INT NULL,
    [IsPrimary] INT          NOT NULL,
    [Number]    VARCHAR (50) NOT NULL,
    [CreatedDate]    DATETIME     NOT NULL,
    [CreatedBy]      VARCHAR (50) NOT NULL,
    [ModifiedDate]   DATETIME     NULL,
    [ModifiedBy]     VARCHAR (50) NULL
);

/* Addresses */
CREATE TABLE [dbo].[Investigator_Address] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [AddressID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [InvestigatorID]    INT            NOT NULL, /* Associated Investigator */
    [TypeID]         INT   NULL,
    [IsCurrent]      INT            NOT NULL,
    [BuildingNumber] VARCHAR (50)   NOT NULL, /* Usually the House Number 6547... */
    [Direction]         VARCHAR (50)   NOT NULL, /* NW, SE, N, etc */
    [StreetName]         VARCHAR (50)   NOT NULL,
    [UnitType]         VARCHAR (50)   NOT NULL, /* Unit, Apartment, Suite, Etc. */
    [UnitNumber]         VARCHAR (50)   NOT NULL, /* Or Letter (Example [UnitType] B72 */
    [City]         VARCHAR (50)   NOT NULL, /* Lookup_City, State, Country and Zipcode */
    [State]        VARCHAR (50)   NULL,
    [Country]      VARCHAR (50)   NULL,
    [Zipcode]        VARCHAR (50)   NULL,
    [AttrData]            NVARCHAR (MAX) NULL,
    [CreatedDate]         DATETIME       NOT NULL,
    [CreatedBy]           VARCHAR (50)   NOT NULL,
    [ModifiedDate]        DATETIME       NULL,
    [ModifiedBy]          VARCHAR (50)   NULL
);

/* Investigator Skills */
CREATE TABLE [dbo].[Investigator_Skills] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [SkillID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [InvestigatorID]    INT            NOT NULL, /* Associated Investigator */
    [TypeID]      INT NULL,
    [Title]    VARCHAR (50) NOT NULL,
    [Description]    VARCHAR (50) NOT NULL,
    [SkillLevel]    VARCHAR (50) NOT NULL,
    [CreatedDate]    DATETIME     NOT NULL,
    [CreatedBy]      VARCHAR (50) NOT NULL,
    [ModifiedDate]   DATETIME     NULL,
    [ModifiedBy]     VARCHAR (50) NULL
);

/* Investigator Languages */
CREATE TABLE [dbo].[Investigator_Languages] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [Investigator_LanguageID]  	INT            NOT NULL,
    [InvestigatorID]    INT            NOT NULL, /* Associated Investigator */
    [LanguageID]      INT NULL, /* Lookup_Languages */
    [IsPrimary]    INT NOT NULL, /* Is Native Language */
    [Fluency_Read]    INT NOT NULL, /* Can Read the Language */
    [Fluency_Write]    INT NOT NULL, /* Can Write the Language */
    [Fluency_Speak]    INT NOT NULL, /* Can Speak the Language */
    [Competency]     VARCHAR (50) NULL, /* How competent */
    [CreatedDate]    DATETIME     NOT NULL,
    [CreatedBy]      VARCHAR (50) NOT NULL,
    [ModifiedDate]   DATETIME     NULL,
    [ModifiedBy]     VARCHAR (50) NULL
);

/* ========== */

/* Person Data */
CREATE TABLE [dbo].[Person] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [PersonID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [Category] VARCHAR (50)   NULL, /* Used for Main Subject search (Can select multiple) */
    [Sex]           NCHAR (1)      NOT NULL,
    [NameFull]      VARCHAR (50)   NOT NULL, /* Autogenerate from all name fields */
    [NamePrefix]    VARCHAR (50)   NULL,
    [NameLast]      VARCHAR (50)   NULL,
    [NameMiddle]    VARCHAR (50)   NULL,
    [NameFirst]     VARCHAR (50)   NULL,
    [NameSuffix]    VARCHAR (50)   NULL,
    [NameMaiden]    VARCHAR (50)   NULL,
    [Aka]           VARCHAR (50)   NULL,
    [DOB_Year]  INT            NULL,
    [DOB_Month] INT            NULL,
    [DOB_Day]   INT            NULL,
    [BirthTime]       TIME (7)       NULL,
    [BirthLocation] VARCHAR (50)   NULL,
    [Death_Year]    INT            NULL,
    [Death_Month]   INT            NULL,
    [Death_Day]     INT            NULL,
    [DeathTime]         TIME (7)       NULL,
    [DeathLocation] VARCHAR (50)   NULL,
    [Religion]      INT   NOT NULL, /* Lookup */
    [Description]         NVARCHAR (MAX) NULL,
    [CreatedDate]         DATETIME       NOT NULL,
    [CreatedBy]           VARCHAR (50)   NOT NULL,
    [ModifiedDate]        DATETIME       NULL,
    [ModifiedBy]          VARCHAR (50)   NULL
);

/* Person Attributes (Vitals) */
CREATE TABLE [dbo].[Person_Attributes] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [Person_AttributeID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [PersonID]    INT            NOT NULL, /* Associated Investigator */
    [TypeID]      INT NULL,
    [AttributeID] INT            NOT NULL, /* Lookup from Common_Attributes */
    [Title]    VARCHAR (50)   NOT NULL,
    [Data]     VARCHAR (MAX) NULL,
    [CreatedDate]  DATETIME       NOT NULL,
    [CreatedBy]    VARCHAR (50)   NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [ModifiedBy]   VARCHAR (50)   NULL
);

/* Person Languages */
CREATE TABLE [dbo].[Person_Languages] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [Person_LanguageID]  	INT            NOT NULL,
    [PersonID]    INT            NOT NULL, /* Associated Person */
    [LanguageID]      INT NULL, /* Lookup_Languages */
    [IsPrimary]    INT NOT NULL, /* Is Native Language */
    [Fluency_Read]    INT NOT NULL, /* Can Read the Language */
    [Fluency_Write]    INT NOT NULL, /* Can Write the Language */
    [Fluency_Speak]    INT NOT NULL, /* Can Speak the Language */
    [Competency]     VARCHAR (50) NULL, /* How competent */
    [CreatedDate]    DATETIME     NOT NULL,
    [CreatedBy]      VARCHAR (50) NOT NULL,
    [ModifiedDate]   DATETIME     NULL,
    [ModifiedBy]     VARCHAR (50) NULL
);

/* Person Abilities */
CREATE TABLE [dbo].[Person_Abilities] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [Person_AbilityID]  	INT            NOT NULL,
    [PersonID]    INT            NOT NULL, /* Associated Person */
    [AbilityID] INT            NOT NULL,
    [AbilityDetails]  NVARCHAR (MAX) NULL,
    [CreatedDate]     DATETIME       NOT NULL,
    [CreatedBy]       VARCHAR (50)   NOT NULL,
    [ModifiedDate]    DATETIME       NULL,
    [ModifiedBy]      VARCHAR (50)   NULL
);

/* Contact Information */

/* Email Addreses (Can have multiple) */
CREATE TABLE [dbo].[Person_Email] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [EmailID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [PersonID]    INT            NOT NULL, /* Associated Investigator */
    [TypeID]      INT NULL, /* Lookup from Common_Types */
    [IsPrimary] INT          NOT NULL, /* Primary contact Address */
    [EmailAddress]   VARCHAR (50) NOT NULL,
    [CreatedDate]    DATETIME     NOT NULL,
    [CreatedBy]      VARCHAR (50) NOT NULL,
    [ModifiedDate]   DATETIME     NULL,
    [ModifiedBy]     VARCHAR (50) NULL
);

/* Phones */
CREATE TABLE [dbo].[Person_Phones] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [PhoneID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [PersonID]    INT            NOT NULL, /* Associated Investigator */
    [TypeID]      INT NULL,
    [IsPrimary] INT          NOT NULL,
    [Number]    VARCHAR (50) NOT NULL,
    [CreatedDate]    DATETIME     NOT NULL,
    [CreatedBy]      VARCHAR (50) NOT NULL,
    [ModifiedDate]   DATETIME     NULL,
    [ModifiedBy]     VARCHAR (50) NULL
);

/* Addresses */
CREATE TABLE [dbo].[Person_Address] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [AddressID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [PersonID]    INT            NOT NULL, /* Associated Investigator */
    [TypeID]         INT   NULL,
    [IsCurrent]      INT            NOT NULL,
    [BuildingNumber] VARCHAR (50)   NOT NULL, /* Usually the House Number 6547... */
    [Direction]         VARCHAR (50)   NOT NULL, /* NW, SE, N, etc */
    [StreetName]         VARCHAR (50)   NOT NULL,
    [UnitType]         VARCHAR (50)   NOT NULL, /* Unit, Apartment, Suite, Etc. */
    [UnitNumber]         VARCHAR (50)   NOT NULL, /* Or Letter (Example [UnitType] B72 */
    [City]         VARCHAR (50)   NOT NULL, /* Lookup_City, State, Country and Zipcode */
    [State]        VARCHAR (50)   NULL,
    [Country]      VARCHAR (50)   NULL,
    [Zipcode]        VARCHAR (50)   NULL,
    [CreatedDate]         DATETIME       NOT NULL,
    [CreatedBy]           VARCHAR (50)   NOT NULL,
    [ModifiedDate]        DATETIME       NULL,
    [ModifiedBy]          VARCHAR (50)   NULL
);

/* =========== */

/* Beings */
CREATE TABLE [dbo].[Being] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [BeingID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [Category] VARCHAR (50)   NULL, /* Used for Main Subject search (Can select multiple) */
    [Class]    VARCHAR (50)   NULL,
    [Type]     INT   NULL,
    [SubType] INT   NULL,
    [Name]     VARCHAR (50)   NOT NULL,
    [Aka]      VARCHAR (50)   NULL,
    [Description]   NVARCHAR (MAX) NULL,
    [CreatedDate]   DATETIME       NOT NULL,
    [CreatedBy]     VARCHAR (50)   NOT NULL,
    [ModifiedDate]  DATETIME       NULL,
    [ModifiedBy]    VARCHAR (50)   NULL
);

/* Being Attributes (Vitals) */
CREATE TABLE [dbo].[Being_Attributes] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [Being_AttributeID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [BeingID]    INT            NOT NULL, /* Associated Investigator */
    [AttributeID] INT            NOT NULL, /* Lookup from Common_Attributes */
    [Title]    VARCHAR (50)   NOT NULL,
    [Data]     VARCHAR (MAX) NULL,
    [CreatedDate]  DATETIME       NOT NULL,
    [CreatedBy]    VARCHAR (50)   NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [ModifiedBy]   VARCHAR (50)   NULL
);

/* Being Abilities */
CREATE TABLE [dbo].[Being_Abilities] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [Being_AbilityID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [BeingID]    INT            NOT NULL, /* Associated Being */
    [AbilityID] INT            NOT NULL,
    [AbilityDetails]  NVARCHAR (MAX) NULL,
    [CreatedDate]     DATETIME       NOT NULL,
    [CreatedBy]       VARCHAR (50)   NOT NULL,
    [ModifiedDate]    DATETIME       NULL,
    [ModifiedBy]      VARCHAR (50)   NULL
);
/* =============== */

/* Families (Famous, Infamous [Bush, Rothchilds, etc.]) */
CREATE TABLE [dbo].[Families] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [FamilyID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [Category] VARCHAR (50)   NULL, /* Used for Main Subject search (Can select multiple) */
    [Class]  VARCHAR (50)   NOT NULL,
    [Type]   INT   NOT NULL,
    [Name]   VARCHAR (50)   NOT NULL,
    [AKA]    VARCHAR (50)   NOT NULL,
    [Description]  NVARCHAR (MAX) NULL,
    [CreatedDate]  DATETIME       NOT NULL,
    [CreatedBy]    VARCHAR (50)   NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [ModifiedBy]   VARCHAR (50)   NULL
);

/* Orgaizations */
CREATE TABLE [dbo].[Organizations] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [OrgID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [Category] VARCHAR (50)   NULL, /* Used for Main Subject search (Can select multiple) */
    [Class]     VARCHAR (50)   NULL,
    [Type]      INT   NULL,
    [Name]      VARCHAR (50)   NOT NULL,
    [AKA]       VARCHAR (50)   NULL,
    [Description]  NVARCHAR (MAX) NULL,
    [CreatedDate]  DATETIME       NOT NULL,
    [CreatedBy]    VARCHAR (50)   NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [ModifiedBy]   VARCHAR (50)   NULL
);

/* Societies */
CREATE TABLE [dbo].[Societies] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [SocietyID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [Category] VARCHAR (50)   NULL, /* Used for Main Subject search (Can select multiple) */
    [Class]     VARCHAR (50)   NULL,
    [Type]      INT   NULL,
    [Name]      VARCHAR (50)   NOT NULL,
    [AKA]       VARCHAR (50)   NULL,
    [Description]  NVARCHAR (MAX) NULL,
    [CreatedDate]  DATETIME       NOT NULL,
    [CreatedBy]    VARCHAR (50)   NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [ModifiedBy]   VARCHAR (50)   NULL
);

/* Companies */
CREATE TABLE [dbo].[Companies] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [CompanyID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [Category] VARCHAR (50)   NULL, /* Used for Main Subject search (Can select multiple) */
    [Class]    VARCHAR (50)   NULL,
    [Type]     INT   NULL,
    [Name]     VARCHAR (50)   NOT NULL,
    [AKA]      VARCHAR (50)   NULL,
    [Description]  NVARCHAR (MAX) NULL,
    [CreatedDate]  DATETIME       NOT NULL,
    [CreatedBy]    VARCHAR (50)   NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [ModifiedBy]   VARCHAR (50)   NULL
);

/* Symbols */
CREATE TABLE [dbo].[Symbols] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [SymbolID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [Class]           VARCHAR (50)   NULL,
    [Type]            INT   NULL,
    [Name]    VARCHAR (50)   NOT NULL,
    [Description]      NVARCHAR (MAX) NULL,
    [ImageFile]           VARCHAR (50)   NULL,
    [CreatedDate]      DATETIME       NOT NULL,
    [CreatedBy]        VARCHAR (50)   NOT NULL,
    [ModifiedDate]     DATETIME       NULL,
    [ModifiedBy]       VARCHAR (50)   NULL
);

/* Objects */
CREATE TABLE [dbo].[Objects] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [ObjectID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [Category] VARCHAR (50)   NULL, /* Used for Main Subject search (Can select multiple) */
    [Class]    VARCHAR (50)   NULL,
    [Type]    INT   NULL,
    [Name]     VARCHAR (50)   NOT NULL,
    [Aka]      VARCHAR (50)   NOT NULL,
    [Description]    NVARCHAR (MAX) NULL,
    [CreatedDate]    DATETIME       NOT NULL,
    [CreatedBy]      VARCHAR (50)   NOT NULL,
    [ModifiedDate]   DATETIME       NULL,
    [ModifiedBy]     VARCHAR (50)   NULL
);

/* Object Attributes */
CREATE TABLE [dbo].[Object_Attributes] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [Object_AttributeID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [ObjectID]    INT            NOT NULL, /* Associated Object */
    [AttributeID] INT            NOT NULL, /* Lookup from Common_Attributes */
    [Title]    VARCHAR (50)   NOT NULL,
    [Data]     VARCHAR (MAX) NULL,
    [CreatedDate]  DATETIME       NOT NULL,
    [CreatedBy]    VARCHAR (50)   NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [ModifiedBy]   VARCHAR (50)   NULL
);

/* Locations */
CREATE TABLE [dbo].[Location] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [LocationID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [Category] VARCHAR (50)   NULL, /* Used for Main Subject search (Can select multiple) */
    [Class]     VARCHAR (50)  NULL,
    [Type]      INT  NULL,
    [Name]      VARCHAR (50)  NOT NULL,
    [Aka]       VARCHAR (50)  NULL,
    [Country]   INT  NULL, /* Lookup Country */
    [County]    VARCHAR (50)  NULL,
    [City]      VARCHAR (50)  NULL, /* Poulate Country, State, County, Zipcode (Lookup online) */
    [State]     INT  NULL, /* Lookup State */
    [Zipcode]   VARCHAR (50)  NULL,
    [Description]  VARCHAR (MAX) NULL,
    [CreatedDate]  DATETIME      NOT NULL,
    [CreatedBy]    VARCHAR (50)  NOT NULL,
    [ModifiedDate] DATETIME      NULL,
    [ModifiedBy]   VARCHAR (50)  NULL
);

/* Location Points (GPS Data) */
CREATE TABLE [dbo].[Locations_Points] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [Location_PointID]  	INT            NOT NULL,
    [LocationID]    INT            NOT NULL, /* Associated Location */
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [Type]       INT NOT NULL,
    [Name]       VARCHAR (50) NOT NULL,
    [GPSLat]     VARCHAR (50) NOT NULL,
    [GPSLong]    VARCHAR (50) NOT NULL,
    [Elevation]  VARCHAR (50) NULL,
    [CreatedDate]     DATETIME     NOT NULL,
    [CreatedBy]       VARCHAR (50) NOT NULL,
    [ModifiedDate]    DATETIME     NULL,
    [ModifiedBy]      VARCHAR (50) NULL
);

/* Location Attributes */
CREATE TABLE [dbo].[Location_Attributes] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [Location_AttributeID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [LocationID]    INT            NOT NULL, /* Associated Location */
    [AttributeID] INT            NOT NULL, /* Lookup from Common_Attributes */
    [Title]    VARCHAR (50)   NOT NULL,
    [Data]     VARCHAR (MAX) NULL,
    [CreatedDate]  DATETIME       NOT NULL,
    [CreatedBy]    VARCHAR (50)   NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [ModifiedBy]   VARCHAR (50)   NULL
);

/* Events */
CREATE TABLE [dbo].[Events] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [EventID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [Category] VARCHAR (50)   NULL, /* Used for Main Subject search (Can select multiple) */
    [Class]           VARCHAR (50)   NULL,
    [Type]            INT   NULL,
    [Name]            VARCHAR (50)   NOT NULL,
    [Description]          NVARCHAR (MAX) NULL,
    [LocationID]      INT            NULL, /* Lookup -  Add New Location */
    [StartDate_Year]  INT            NULL,
    [StartDate_Month] INT            NULL,
    [StartDate_Day]   INT            NULL,
    [StartTime]       TIME (7)       NULL,
    [EndDate_Year]    INT            NULL,
    [EndDate_Month]   INT            NULL,
    [EndDate_Day]     INT            NULL,
    [EndTime]         TIME (7)       NULL,
    [CreatedDate]          DATETIME       NOT NULL,
    [CreatedBy]            VARCHAR (50)   NOT NULL,
    [ModifiedDate]         DATETIME       NULL,
    [ModifiedBy]           VARCHAR (50)   NULL
);

/* Incidents */
CREATE TABLE [dbo].[Incidents] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [IncidentID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [Category] VARCHAR (50)   NULL, /* Used for Main Subject search (Can select multiple) */
    [Class]           VARCHAR (50)   NULL,
    [Type]            INT   NULL,
    [Title]    VARCHAR (50)   NOT NULL,
    [Description]      NVARCHAR (MAX) NULL,
    [CreatedDate]      DATETIME       NOT NULL,
    [CreatedBy]        VARCHAR (50)   NOT NULL,
    [ModifiedDate]     DATETIME       NULL,
    [ModifiedBy]       VARCHAR (50)   NULL
);

/* Cases - Investigations */
CREATE TABLE [dbo].[Investigation] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [InvestigationID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [Category] VARCHAR (50)   NULL, /* Used for Main Subject search (Can select multiple) */
    [Class]           VARCHAR (50)   NULL,
    [Type]            INT   NULL,
    [Title]    VARCHAR (50)   NOT NULL,
    [Description]      NVARCHAR (MAX) NULL,
    [StartDate_Year]  INT            NULL,
    [StartDate_Month] INT            NULL,
    [StartDate_Day]   INT            NULL,
    [StartTime]       TIME (7)       NULL,
    [EndDate_Year]    INT            NULL,
    [EndDate_Month]   INT            NULL,
    [EndDate_Day]     INT            NULL,
    [EndTime]         TIME (7)       NULL,
    [Status]           VARCHAR (50)   NULL,
    [CreatedDate]      DATETIME       NOT NULL,
    [CreatedBy]        VARCHAR (50)   NOT NULL,
    [ModifiedDate]     DATETIME       NULL,
    [ModifiedBy]       VARCHAR (50)   NULL
);

/* Investigation Investigators */
CREATE TABLE [dbo].[Investigation_Investigators] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [Investigation_InvestigatorID]  	INT            NOT NULL,
    [Code]  VARCHAR (50)   NULL UNIQUE,
    [InvestigationID]    INT            NOT NULL, /* Associated Investigation */
    [Class]           VARCHAR (50)   NULL,
    [Type]            INT   NULL,
    [Title]    VARCHAR (50)   NOT NULL,
    [Description]      NVARCHAR (MAX) NULL,
    [CreatedDate]      DATETIME       NOT NULL,
    [CreatedBy]        VARCHAR (50)   NOT NULL,
    [ModifiedDate]     DATETIME       NULL,
    [ModifiedBy]       VARCHAR (50)   NULL
);

/* Investigation Incidents */
CREATE TABLE [dbo].[Investigation_Incidents] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [Investigation_IncidentID]  	INT            NOT NULL,
    [InvestigationID]    INT            NOT NULL, /* Associated Investigation */
    [IncidentID]            INT   NULL, /* Associated Incident */
    [CreatedDate]      DATETIME       NOT NULL,
    [CreatedBy]        VARCHAR (50)   NOT NULL,
    [ModifiedDate]     DATETIME       NULL,
    [ModifiedBy]       VARCHAR (50)   NULL
);

/* Investigation Persons */
CREATE TABLE [dbo].[Investigation_Persons] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [Investigation_PersonID]  	INT            NOT NULL,
    [InvestigationID]    INT            NOT NULL, /* Associated Investigation */
    [PersonID]            INT   NULL, /* Associated Person */
    [Role]            INT   NOT NULL,
    [CreatedDate]      DATETIME       NOT NULL,
    [CreatedBy]        VARCHAR (50)   NOT NULL,
    [ModifiedDate]     DATETIME       NULL,
    [ModifiedBy]       VARCHAR (50)   NULL
);

/* Investigation Beings */
CREATE TABLE [dbo].[Investigation_Beings] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [Investigation_BeingID]  	INT            NOT NULL,
    [InvestigationID]    INT            NOT NULL, /* Associated Investigation */
    [BeingID]            INT   NULL, /* Associated Being */
    [Role]            INT   NOT NULL,
    [CreatedDate]      DATETIME       NOT NULL,
    [CreatedBy]        VARCHAR (50)   NOT NULL,
    [ModifiedDate]     DATETIME       NULL,
    [ModifiedBy]       VARCHAR (50)   NULL
);

/* Investigation Locations */
CREATE TABLE [dbo].[Investigation_Locations] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [Investigation_LocationID]  	INT            NOT NULL,
    [InvestigationID]    INT            NOT NULL, /* Associated Investigation */
    [LocationID]            INT   NULL, /* Associated Location */
    [Description]      NVARCHAR (MAX) NULL,
    [CreatedDate]      DATETIME       NOT NULL,
    [CreatedBy]        VARCHAR (50)   NOT NULL,
    [ModifiedDate]     DATETIME       NULL,
    [ModifiedBy]       VARCHAR (50)   NULL
);

/* Investigation Phenomena */
CREATE TABLE [dbo].[Investigation_Phenomena] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [Investigation_PhenomenaID]  	INT            NOT NULL,
    [InvestigationID]    INT            NOT NULL, /* Associated Investigation */
    [PhenomenaID]            INT   NULL, /* Associated Phenomena */
    [Description]      NVARCHAR (MAX) NULL,
    [CreatedDate]      DATETIME       NOT NULL,
    [CreatedBy]        VARCHAR (50)   NOT NULL,
    [ModifiedDate]     DATETIME       NULL,
    [ModifiedBy]       VARCHAR (50)   NULL
);

/* Investigation Objects */
CREATE TABLE [dbo].[Investigation_Objects] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [Investigation_ObjectID]  	INT            NOT NULL,
    [InvestigationID]    INT            NOT NULL, /* Associated Investigation */
    [ObjectID]            INT   NULL, /* Associated Object */
    [Description]      NVARCHAR (MAX) NULL,
    [CreatedDate]      DATETIME       NOT NULL,
    [CreatedBy]        VARCHAR (50)   NOT NULL,
    [ModifiedDate]     DATETIME       NULL,
    [ModifiedBy]       VARCHAR (50)   NULL
);

/* Investigation Effects */
CREATE TABLE [dbo].[Investigation_Effects] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [Investigation_EffectID]  	INT            NOT NULL,
    [InvestigationID]    INT            NOT NULL, /* Associated Investigation */
    [EffectID]            INT   NULL, /* Associated Object */
    [Description]      NVARCHAR (MAX) NULL,
    [CreatedDate]      DATETIME       NOT NULL,
    [CreatedBy]        VARCHAR (50)   NOT NULL,
    [ModifiedDate]     DATETIME       NULL,
    [ModifiedBy]       VARCHAR (50)   NULL
);

/* Investigation Societies */
CREATE TABLE [dbo].[Investigation_Societies] (
    [RecordID]       INT            IDENTITY (1, 1) NOT NULL,
    [Investigation_SocietyID]  	INT            NOT NULL,
    [InvestigationID]    INT            NOT NULL, /* Associated Investigation */
    [SocietyID]            INT   NULL, /* Associated Society */
    [Role]            INT   NOT NULL,
    [Description]      NVARCHAR (MAX) NULL,
    [CreatedDate]      DATETIME       NOT NULL,
    [CreatedBy]        VARCHAR (50)   NOT NULL,
    [ModifiedDate]     DATETIME       NULL,
    [ModifiedBy]       VARCHAR (50)   NULL
);
