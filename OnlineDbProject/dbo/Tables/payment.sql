CREATE TABLE [dbo].[payment] (
    [InvoiceId]   INT          IDENTITY (6500, 1) NOT NULL,
    [OrderId]     INT          NULL,
    [Mode]        VARCHAR (20) NULL,
    [Amount]      MONEY        NULL,
    [PaymentDate] DATE         NULL,
    CONSTRAINT [PK__payment__9B556A38C586C1EE] PRIMARY KEY CLUSTERED ([InvoiceId] ASC),
    CONSTRAINT [FK__payment__oid__797309D9] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[ordertable] ([OrderId])
);

