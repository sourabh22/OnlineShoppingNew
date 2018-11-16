CREATE TABLE [dbo].[ordertable] (
    [OrderId]     INT        IDENTITY (1, 1) NOT NULL,
    [CategoryId]  INT        NULL,
    [OrderDate]   DATE       NULL,
    [TotalAmount] FLOAT (53) NULL,
    [CustomerId]  INT        NULL,
    CONSTRAINT [PK__ordertab__C2FFCF1350B39F69] PRIMARY KEY CLUSTERED ([OrderId] ASC),
    CONSTRAINT [FK_ordertable_customer] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[customer] ([CustomerId])
);

