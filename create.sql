/****** Object:  Table [dbo].[Doctor]    Script Date: 4/22/2020 11:09:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Doctor](
    [IdDoctor] [int] IDENTITY(1,1) NOT NULL,
    [FirstName] [nvarchar](100) NOT NULL,
    [LastName] [nvarchar](100) NOT NULL,
    [Email] [nvarchar](100) NOT NULL,
    CONSTRAINT [Doctor_pk] PRIMARY KEY CLUSTERED
(
[IdDoctor] ASC
)
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Medicament]    Script Date: 4/22/2020 11:09:45 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [Medicament](
    [IdMedicament] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](100) NOT NULL,
    [Description] [nvarchar](100) NOT NULL,
    [Type] [nvarchar](100) NOT NULL,
    CONSTRAINT [Medicament_pk] PRIMARY KEY CLUSTERED
(
[IdMedicament] ASC
)
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Patient]    Script Date: 4/22/2020 11:09:45 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [Patient](
    [IdPatient] [int] IDENTITY(1,1) NOT NULL,
    [FirstName] [nvarchar](100) NOT NULL,
    [LastName] [nvarchar](100) NOT NULL,
    [Birthdate] [date] NOT NULL,
    CONSTRAINT [Patient_pk] PRIMARY KEY CLUSTERED
(
[IdPatient] ASC
)
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Prescription]    Script Date: 4/22/2020 11:09:45 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [Prescription](
    [IdPrescription] [int] IDENTITY(1,1) NOT NULL,
    [Date] [date] NOT NULL,
    [DueDate] [date] NOT NULL,
    [IdPatient] [int] NOT NULL,
    [IdDoctor] [int] NOT NULL,
    CONSTRAINT [Prescription_pk] PRIMARY KEY CLUSTERED
(
[IdPrescription] ASC
)
    ) ON [PRIMARY]
    GO
/****** Object:  Table [dbo].[Prescription_Medicament]    Script Date: 4/22/2020 11:09:45 PM ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [Prescription_Medicament](
    [IdMedicament] [int] NOT NULL,
    [IdPrescription] [int] NOT NULL,
    [Dose] [int] NOT NULL,
    [Details] [nvarchar](100) NOT NULL,
    CONSTRAINT [Prescription_Medicament_pk] PRIMARY KEY CLUSTERED
(
    [IdMedicament] ASC,
[IdPrescription] ASC
)
    ) ON [PRIMARY]
    GO
    SET IDENTITY_INSERT [Doctor] ON

    INSERT [Doctor] ([IdDoctor], [FirstName], [LastName], [Email]) VALUES (1, N'Andrzej', N'Malewski', N'malewski@wp.pl')
    INSERT [Doctor] ([IdDoctor], [FirstName], [LastName], [Email]) VALUES (2, N'Marcin', N'Malędowski', N'moleda@wp.pl')
    INSERT [Doctor] ([IdDoctor], [FirstName], [LastName], [Email]) VALUES (3, N'Krzysztof', N'Kowalewicz', N'kowalewicz@wp.pl')
    INSERT [Doctor] ([IdDoctor], [FirstName], [LastName], [Email]) VALUES (4, N'Anna', N'Kostrzewska', N'akostrzew@onet.pl')
    SET IDENTITY_INSERT [Doctor] OFF
    GO
    SET IDENTITY_INSERT [Medicament] ON

    INSERT [Medicament] ([IdMedicament], [Name], [Description], [Type]) VALUES (1, N'Xanax', N'Lorem ipsum...', N'Depression')
    INSERT [Medicament] ([IdMedicament], [Name], [Description], [Type]) VALUES (2, N'Abilify', N'Lorem.', N'Tabletki')
    INSERT [Medicament] ([IdMedicament], [Name], [Description], [Type]) VALUES (3, N'Abra', N'Lorem...', N'Żel')
    INSERT [Medicament] ([IdMedicament], [Name], [Description], [Type]) VALUES (4, N'Acai', N'Test', N'Kapsułki')
    INSERT [Medicament] ([IdMedicament], [Name], [Description], [Type]) VALUES (5, N'ACC', N'Lorem ipsum...', N'Tabletki')
    INSERT [Medicament] ([IdMedicament], [Name], [Description], [Type]) VALUES (6, N'Acerin', N'Lorem...', N'Płyn')
    SET IDENTITY_INSERT [Medicament] OFF
    GO
    SET IDENTITY_INSERT [Patient] ON

    INSERT [Patient] ([IdPatient], [FirstName], [LastName], [Birthdate]) VALUES (1, N'Jan', N'Andrzejewski', CAST(N'1980-02-02' AS Date))
    INSERT [Patient] ([IdPatient], [FirstName], [LastName], [Birthdate]) VALUES (2, N'Krzysztof', N'Kowalewicz', CAST(N'1991-01-10' AS Date))
    INSERT [Patient] ([IdPatient], [FirstName], [LastName], [Birthdate]) VALUES (3, N'Marcin', N'Andrzejewicz', CAST(N'1995-01-02' AS Date))
    SET IDENTITY_INSERT [Patient] OFF
    GO
    SET IDENTITY_INSERT [Prescription] ON

    INSERT [Prescription] ([IdPrescription], [Date], [DueDate], [IdPatient], [IdDoctor]) VALUES (1, CAST(N'2020-05-10' AS Date), CAST(N'2020-10-23' AS Date), 1, 2)
    INSERT [Prescription] ([IdPrescription], [Date], [DueDate], [IdPatient], [IdDoctor]) VALUES (2, CAST(N'2020-05-20' AS Date), CAST(N'2020-06-10' AS Date), 1, 2)
    INSERT [Prescription] ([IdPrescription], [Date], [DueDate], [IdPatient], [IdDoctor]) VALUES (3, CAST(N'2020-06-05' AS Date), CAST(N'2020-06-20' AS Date), 2, 1)
    INSERT [Prescription] ([IdPrescription], [Date], [DueDate], [IdPatient], [IdDoctor]) VALUES (4, CAST(N'2020-03-01' AS Date), CAST(N'2020-04-25' AS Date), 3, 2)
    SET IDENTITY_INSERT [Prescription] OFF
    GO
    INSERT [Prescription_Medicament] ([IdMedicament], [IdPrescription], [Dose], [Details]) VALUES (1, 1, 4, N'Take every morning')
    INSERT [Prescription_Medicament] ([IdMedicament], [IdPrescription], [Dose], [Details]) VALUES (1, 2, 1, N'Once a week')
    INSERT [Prescription_Medicament] ([IdMedicament], [IdPrescription], [Dose], [Details]) VALUES (1, 3, 3, N'once every two weeks')
    INSERT [Prescription_Medicament] ([IdMedicament], [IdPrescription], [Dose], [Details]) VALUES (2, 1, 10, N'Every evening')
    INSERT [Prescription_Medicament] ([IdMedicament], [IdPrescription], [Dose], [Details]) VALUES (3, 2, 7, N'once every day after main meal')
    GO
ALTER TABLE [Prescription]  WITH CHECK ADD  CONSTRAINT [Prescription_Doctor] FOREIGN KEY([IdDoctor])
    REFERENCES [Doctor] ([IdDoctor])
    GO
ALTER TABLE [Prescription] CHECK CONSTRAINT [Prescription_Doctor]
    GO
ALTER TABLE [Prescription]  WITH CHECK ADD  CONSTRAINT [Prescription_Patient] FOREIGN KEY([IdPatient])
    REFERENCES [Patient] ([IdPatient])
    GO
ALTER TABLE [Prescription] CHECK CONSTRAINT [Prescription_Patient]
    GO
ALTER TABLE [Prescription_Medicament]  WITH CHECK ADD  CONSTRAINT [Prescription_Medicament_Medicament] FOREIGN KEY([IdMedicament])
    REFERENCES [Medicament] ([IdMedicament])
    GO
ALTER TABLE [Prescription_Medicament] CHECK CONSTRAINT [Prescription_Medicament_Medicament]
    GO
ALTER TABLE [Prescription_Medicament]  WITH CHECK ADD  CONSTRAINT [Prescription_Medicament_Prescription] FOREIGN KEY([IdPrescription])
    REFERENCES [Prescription] ([IdPrescription])
    GO
ALTER TABLE [Prescription_Medicament] CHECK CONSTRAINT [Prescription_Medicament_Prescription]
    GO
