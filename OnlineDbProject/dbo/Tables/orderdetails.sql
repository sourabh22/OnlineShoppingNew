CREATE TABLE [dbo].[orderdetails] (
    [OrderId]   INT   NOT NULL,
    [ProductId] INT   NOT NULL,
    [Quantity]  INT   NULL,
    [Price]     MONEY NULL,
    CONSTRAINT [PK_orderdetails_1] PRIMARY KEY CLUSTERED ([OrderId] ASC, [ProductId] ASC),
    CONSTRAINT [FK__orderdetail__oid__75A278F5] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[ordertable] ([OrderId]),
    CONSTRAINT [FK_orderdetails_product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[product] ([ProductId])
);

