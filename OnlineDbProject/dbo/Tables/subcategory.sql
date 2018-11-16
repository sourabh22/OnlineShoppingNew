CREATE TABLE [dbo].[subcategory] (
    [SubCategoryId]   INT          IDENTITY (100, 5) NOT NULL,
    [CategoryId]      INT          NULL,
    [SubCategoryName] VARCHAR (30) NULL,
    PRIMARY KEY CLUSTERED ([SubCategoryId] ASC),
    CONSTRAINT [FK_subcategory_category] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[category] ([CategoryId])
);

