CREATE TABLE [dbo].[category] (
    [CategoryId]   INT          IDENTITY (100, 1) NOT NULL,
    [CategoryName] VARCHAR (40) NULL,
    CONSTRAINT [PK__category__23CDE5909DC6E7DB] PRIMARY KEY CLUSTERED ([CategoryId] ASC)
);

