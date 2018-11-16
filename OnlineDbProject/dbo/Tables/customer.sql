CREATE TABLE [dbo].[customer] (
    [CustomerId] INT           IDENTITY (1, 1) NOT NULL,
    [Name]       VARCHAR (30)  NULL,
    [EMail]      NVARCHAR (20) NULL,
    [Password]   VARCHAR (30)  NULL,
    [Phone]      VARCHAR (20)  NULL,
    [Address]    VARCHAR (MAX) NULL,
    CONSTRAINT [PK__customer__A4AE64D8DBDE5CCE] PRIMARY KEY CLUSTERED ([CustomerId] ASC)
);

