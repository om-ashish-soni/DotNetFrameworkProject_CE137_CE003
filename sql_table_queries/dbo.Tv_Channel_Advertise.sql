CREATE TABLE [dbo].Tv_Channel_Advertise (
    [Id]   INT      IDENTITY (1, 1) NOT NULL,
	[Name] NVARCHAR(100) NOT NULL,
    [Business_Id] INT NOT NULL,
	[Tv_Channel_Id] INT NOT NULL,
	[Source] NVARCHAR(1000) NOT NULL,
	[Reason] NVARCHAR(1000) NULL,
	[Accepted] NVARCHAR(5) NOT NULL Default 'No',
	[Cost] INT NOT NULL Default 0,
	[Frequency] INT NOT NULL Default 10,
	[Date] Date NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
	CONSTRAINT [Business_Reference_Tv_Channel_Advertise_Constraint] FOREIGN KEY ([Business_Id]) REFERENCES [dbo].[Business] ([Id]),
	CONSTRAINT [Tv_Channel_Reference_Constraint] FOREIGN KEY ([Tv_Channel_Id]) REFERENCES [dbo].[Tv_Channel] ([Id])
);