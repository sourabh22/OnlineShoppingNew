CREATE TABLE [dbo].[product] (
    [ProductId]     INT            IDENTITY (1, 1) NOT NULL,
    [Title]         VARCHAR (20)   NULL,
    [CategoryId]    INT            NULL,
    [SubCategoryId] INT            NULL,
    [Price]         MONEY          NULL,
    [Quantity]      INT            NULL,
    [ReorderLevel]  INT            NULL,
    [Image]         VARCHAR (1000) NULL,
    CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED ([ProductId] ASC),
    CONSTRAINT [FK__product__categor__3D5E1FD2] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[category] ([CategoryId])
);

