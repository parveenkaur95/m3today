use Training;

create table EmployeeManagementTable(
	EmployeeID int primary key identity(100,1),
	EmployeeName varchar(30) not null,
	City varchar(30) not null,
	DepartmentName varchar(20) not null,
	DateOfJoin date not null
);

drop table EmployeeManagementTable;

go
alter PROCEDURE [dbo].[uspAddEmployee] 
	
	(
	@ipv_vcEmployeeName varchar(30),
	@ipv_vcCity varchar(30),
	@ipv_vcDepartmentName varchar(20),
	@ipv_vcDateOfJoin date
	)
	
AS
	insert into EmployeeManagementTable(EmployeeName,City,DepartmentName,DateOfJoin) Values(@ipv_vcEmployeeName,@ipv_vcCity,@ipv_vcDepartmentName,@ipv_vcDateOfJoin)
	RETURN

go
CREATE PROCEDURE [dbo].[uspDeleteEmployee] 
	
	(
	@ipv_iEmployeeID int
	
	)
	
AS
	Delete from EmployeeManagementTable where EmployeeID = @ipv_iEmployeeID;
	RETURN

go
CREATE PROCEDURE [dbo].[uspGetAllEmployee] 

AS
	select EmployeeID,EmployeeName,City,DepartmentName,DateOfJoin from EmployeeManagementTable;
	RETURN

CREATE PROCEDURE [dbo].[uspSearchEmployee] 
	
	(
	@ipv_iEmployeeID int
	
	)
	
AS
		select EmployeeID,EmployeeName,City,DepartmentName,DateOfJoin from EmployeeManagementTable where EmployeeID = @ipv_iEmployeeID;
	RETURN

go
CREATE PROCEDURE [dbo].[uspUpdateEmployee] 
	(
	@ipv_iEmployeeID int,
	@ipv_vcEmployeeName varchar(30),
	@ipv_vcCity varchar(30),
	@ipv_vcDepartmentName varchar(20),
	@ipv_vcDateOfJoin date
	)
AS
	update EmployeeManagementTable set EmployeeName = @ipv_vcEmployeeName,City = @ipv_vcCity,DepartmentName=@ipv_vcDepartmentName,DateOfJoin=@ipv_vcDateOfJoin where EmployeeID = @ipv_iEmployeeID;
	RETURN

	