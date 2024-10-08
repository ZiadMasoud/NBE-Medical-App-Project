USE [Bank Medical DB]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 9/10/2024 9:00:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[AppointmentID] [int] IDENTITY(1,1) NOT NULL,
	[SlotID] [int] NULL,
	[EmployeeID] [int] NULL,
	[ApStatus] [int] NOT NULL,
	[Diagnosis] [nvarchar](max) NULL,
	[FinanceID] [int] NULL,
	[SLDStart] [date] NULL,
	[SLDEnd] [date] NULL,
	[AppointmentDate] [date] NULL,
 CONSTRAINT [PK__Appointm__8ECDFCA24EC6F503] PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 9/10/2024 9:00:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__Departme__B2079BCD8C937218] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 9/10/2024 9:00:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[DoctorID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NULL,
	[MFID] [int] NULL,
	[Username] [nvarchar](100) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[DoctorName] [nvarchar](100) NULL,
	[Position] [nvarchar](100) NOT NULL,
	[DoctorPassword] [nvarchar](50) NOT NULL,
	[Mobile] [bigint] NOT NULL,
 CONSTRAINT [PK__Doctor__2DC00EDFB4F3AC09] PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 9/10/2024 9:00:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Photo] [nvarchar](200) NOT NULL,
	[EmployeeName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__Employee__7AD04FF1578CB1DE] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Finance]    Script Date: 9/10/2024 9:00:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Finance](
	[FinanceID] [int] IDENTITY(1,1) NOT NULL,
	[FinancePassword] [nvarchar](100) NOT NULL,
	[FinanceName] [nvarchar](100) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__Finance__7917A8FFEE5F5F16] PRIMARY KEY CLUSTERED 
(
	[FinanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LabReports]    Script Date: 9/10/2024 9:00:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabReports](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentID] [int] NULL,
	[PayStatus] [int] NOT NULL,
	[LabName] [nvarchar](100) NULL,
	[ReportDate] [date] NOT NULL,
 CONSTRAINT [PK__LabRepor__D5BD48E5E892B0BB] PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LabReportsDetails]    Script Date: 9/10/2024 9:00:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabReportsDetails](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[ReportID] [int] NULL,
	[TestID] [int] NULL,
	[FinancialApprovalStatus] [int] NOT NULL,
	[ResultPDF] [nvarchar](300) NULL,
 CONSTRAINT [PK__LabRepor__135C314DF698735D] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalField]    Script Date: 9/10/2024 9:00:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalField](
	[MFID] [int] IDENTITY(1,1) NOT NULL,
	[MMID] [int] NULL,
	[Username] [nvarchar](100) NOT NULL,
	[MFName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[MFPassword] [nvarchar](100) NOT NULL,
	[Hotline] [bigint] NOT NULL,
	[MFAddress] [nvarchar](100) NOT NULL,
	[MFType] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__MedicalF__1B48A421C1EE1CDA] PRIMARY KEY CLUSTERED 
(
	[MFID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicines]    Script Date: 9/10/2024 9:00:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicines](
	[MedicineID] [int] IDENTITY(1,1) NOT NULL,
	[MedicineName] [nvarchar](100) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK__Medicine__4F2128F07CFC9BE8] PRIMARY KEY CLUSTERED 
(
	[MedicineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MiddleMan]    Script Date: 9/10/2024 9:00:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MiddleMan](
	[MMID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[MMName] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[MMPassword] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__MiddleMa__6D0F547208104DAA] PRIMARY KEY CLUSTERED 
(
	[MMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescriptions]    Script Date: 9/10/2024 9:00:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescriptions](
	[PrescriptionID] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentID] [int] NULL,
	[RenewalStatus] [int] NOT NULL,
	[Monthly] [bit] NOT NULL,
	[SupplyDate] [date] NULL,
 CONSTRAINT [PK__Prescrip__40130812CB728D0A] PRIMARY KEY CLUSTERED 
(
	[PrescriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrescriptionsDetails]    Script Date: 9/10/2024 9:00:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrescriptionsDetails](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[PrescriptionID] [int] NULL,
	[FinanceApprovalStatus] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Frequency] [int] NOT NULL,
	[Notes] [nvarchar](300) NULL,
	[MedicineID] [int] NULL,
 CONSTRAINT [PK__Prescrip__135C314D6874AA2C] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tests]    Script Date: 9/10/2024 9:00:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tests](
	[TestID] [int] IDENTITY(1,1) NOT NULL,
	[TestName] [nvarchar](100) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK__Tests__8CC331003C86ACA8] PRIMARY KEY CLUSTERED 
(
	[TestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timetable]    Script Date: 9/10/2024 9:00:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timetable](
	[SlotID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorID] [int] NULL,
	[TTDay] [nvarchar](50) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[MFID] [int] NOT NULL,
 CONSTRAINT [PK__Timetabl__0A124A4F65ADABF0] PRIMARY KEY CLUSTERED 
(
	[SlotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointments]  WITH NOCHECK ADD  CONSTRAINT [FK_Appointment_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointment_Employee]
GO
ALTER TABLE [dbo].[Appointments]  WITH NOCHECK ADD  CONSTRAINT [FK_Appointment_TimeTable] FOREIGN KEY([SlotID])
REFERENCES [dbo].[Timetable] ([SlotID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointment_TimeTable]
GO
ALTER TABLE [dbo].[Appointments]  WITH NOCHECK ADD  CONSTRAINT [FK_Appointments_Finance] FOREIGN KEY([FinanceID])
REFERENCES [dbo].[Finance] ([FinanceID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Finance]
GO
ALTER TABLE [dbo].[Doctor]  WITH NOCHECK ADD  CONSTRAINT [FK_Doctor] FOREIGN KEY([MFID])
REFERENCES [dbo].[MedicalField] ([MFID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor]
GO
ALTER TABLE [dbo].[Doctor]  WITH NOCHECK ADD  CONSTRAINT [FK_Doctor_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Departments]
GO
ALTER TABLE [dbo].[LabReports]  WITH NOCHECK ADD  CONSTRAINT [FK_LabReports] FOREIGN KEY([AppointmentID])
REFERENCES [dbo].[Appointments] ([AppointmentID])
GO
ALTER TABLE [dbo].[LabReports] CHECK CONSTRAINT [FK_LabReports]
GO
ALTER TABLE [dbo].[LabReportsDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_LabReportsDetails_Report] FOREIGN KEY([ReportID])
REFERENCES [dbo].[LabReports] ([ReportID])
GO
ALTER TABLE [dbo].[LabReportsDetails] CHECK CONSTRAINT [FK_LabReportsDetails_Report]
GO
ALTER TABLE [dbo].[LabReportsDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_LabReportsDetails_Test] FOREIGN KEY([TestID])
REFERENCES [dbo].[Tests] ([TestID])
GO
ALTER TABLE [dbo].[LabReportsDetails] CHECK CONSTRAINT [FK_LabReportsDetails_Test]
GO
ALTER TABLE [dbo].[MedicalField]  WITH NOCHECK ADD  CONSTRAINT [FK_MedicalField] FOREIGN KEY([MMID])
REFERENCES [dbo].[MiddleMan] ([MMID])
GO
ALTER TABLE [dbo].[MedicalField] CHECK CONSTRAINT [FK_MedicalField]
GO
ALTER TABLE [dbo].[Prescriptions]  WITH NOCHECK ADD  CONSTRAINT [FK_Prescriptions_Appointments1] FOREIGN KEY([AppointmentID])
REFERENCES [dbo].[Appointments] ([AppointmentID])
GO
ALTER TABLE [dbo].[Prescriptions] CHECK CONSTRAINT [FK_Prescriptions_Appointments1]
GO
ALTER TABLE [dbo].[PrescriptionsDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_PrescriptionDetails] FOREIGN KEY([PrescriptionID])
REFERENCES [dbo].[Prescriptions] ([PrescriptionID])
GO
ALTER TABLE [dbo].[PrescriptionsDetails] CHECK CONSTRAINT [FK_PrescriptionDetails]
GO
ALTER TABLE [dbo].[PrescriptionsDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_PrescriptionDetails_Medicine] FOREIGN KEY([MedicineID])
REFERENCES [dbo].[Medicines] ([MedicineID])
GO
ALTER TABLE [dbo].[PrescriptionsDetails] CHECK CONSTRAINT [FK_PrescriptionDetails_Medicine]
GO
ALTER TABLE [dbo].[Timetable]  WITH NOCHECK ADD  CONSTRAINT [FK_TimeTable] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctor] ([DoctorID])
GO
ALTER TABLE [dbo].[Timetable] CHECK CONSTRAINT [FK_TimeTable]
GO
