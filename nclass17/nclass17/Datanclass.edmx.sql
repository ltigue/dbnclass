
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/17/2014 15:26:09
-- Generated from EDMX file: C:\Users\Grand\Documents\GitHub\dbnclass\nclass17\nclass17\Datanclass.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [master];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [CustomerID] int IDENTITY(1,1) NOT NULL,
    [CustomerName] nvarchar(max)  NOT NULL,
    [CusomerAddress] nvarchar(max)  NOT NULL,
    [CustomerPhone] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Parts1'
CREATE TABLE [dbo].[Parts1] (
    [PartID] int IDENTITY(1,1) NOT NULL,
    [PartName] nvarchar(max)  NOT NULL,
    [PartNumber] nvarchar(max)  NOT NULL,
    [PartDescription] nvarchar(max)  NOT NULL,
    [PartPrice] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [OrderID] int IDENTITY(1,1) NOT NULL,
    [OrderInfo] nvarchar(max)  NOT NULL,
    [OrderNumber] nvarchar(max)  NOT NULL,
    [OrderDate] nvarchar(max)  NOT NULL,
    [OrderPrice] nvarchar(max)  NOT NULL,
    [OrderHistory] nvarchar(max)  NOT NULL,
    [CustomerCustomerID] int  NOT NULL
);
GO

-- Creating table 'PartsOrder'
CREATE TABLE [dbo].[PartsOrder] (
    [Parts_PartID] int  NOT NULL,
    [Orders_OrderID] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CustomerID] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([CustomerID] ASC);
GO

-- Creating primary key on [PartID] in table 'Parts1'
ALTER TABLE [dbo].[Parts1]
ADD CONSTRAINT [PK_Parts1]
    PRIMARY KEY CLUSTERED ([PartID] ASC);
GO

-- Creating primary key on [OrderID] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([OrderID] ASC);
GO

-- Creating primary key on [Parts_PartID], [Orders_OrderID] in table 'PartsOrder'
ALTER TABLE [dbo].[PartsOrder]
ADD CONSTRAINT [PK_PartsOrder]
    PRIMARY KEY CLUSTERED ([Parts_PartID], [Orders_OrderID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Parts_PartID] in table 'PartsOrder'
ALTER TABLE [dbo].[PartsOrder]
ADD CONSTRAINT [FK_PartsOrder_Parts]
    FOREIGN KEY ([Parts_PartID])
    REFERENCES [dbo].[Parts1]
        ([PartID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Orders_OrderID] in table 'PartsOrder'
ALTER TABLE [dbo].[PartsOrder]
ADD CONSTRAINT [FK_PartsOrder_Order]
    FOREIGN KEY ([Orders_OrderID])
    REFERENCES [dbo].[Orders]
        ([OrderID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PartsOrder_Order'
CREATE INDEX [IX_FK_PartsOrder_Order]
ON [dbo].[PartsOrder]
    ([Orders_OrderID]);
GO

-- Creating foreign key on [CustomerCustomerID] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_OrderCustomer]
    FOREIGN KEY ([CustomerCustomerID])
    REFERENCES [dbo].[Customers]
        ([CustomerID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderCustomer'
CREATE INDEX [IX_FK_OrderCustomer]
ON [dbo].[Orders]
    ([CustomerCustomerID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------