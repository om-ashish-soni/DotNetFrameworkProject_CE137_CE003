CREATE TABLE [dbo].News_Paper_Advertise (
    [Id]   INT      IDENTITY (1, 1) NOT NULL,
	[Name] NVARCHAR(100) NOT NULL,
    [Business_Id] INT NOT NULL,
	[News_Paper_Id] INT NOT NULL,
	[Source] NVARCHAR(1000) NOT NULL,
	[Date] Date NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [Business_Reference_Constraint] FOREIGN KEY ([Business_Id]) REFERENCES [dbo].[Business] ([Id]),
	CONSTRAINT [News_Paper_Reference_Constraint] FOREIGN KEY ([News_Paper_Id]) REFERENCES [dbo].[News_Paper] ([Id])
);