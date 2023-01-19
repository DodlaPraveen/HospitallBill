select * from BillCrud123


select * from pranellore

create or alter proc pranellore_sp
@BillNumber int,
@BillDate datetime,
@PatientName nvarchar(50),
@Gender nvarchar(50),
@Address nvarchar(50),
@EmailId nvarchar(50),
@MobileNumber nvarchar(50),
@Investigation nvarchar(50),
@Fee nvarchar(50)
as
begin
insert into pranellore(BillDate,PatientName,Gender,Address,EmailId,MobileNumber,Investigation,Fee)
values (@BillDate,@PatientName,@Gender,@Address,@EmailId,@MobileNumber,@Investigation,@Fee)
end


exec pranellore_sp 1001,'1/1/2021','praveen','Male','hyd','praveen.kce','8883380120','typhoid','5000';

create proc hyper
as
begin 
select * from pranellore
end

exec hyper


create or alter proc praveenupdateSP
@BillNumber int,
@BillDate datetime,
@PatientName nvarchar(50),
@Gender nvarchar(50),
@Address nvarchar(50),
@EmailId nvarchar(50),
@MobileNumber nvarchar(50),
@Investigation nvarchar(50),
@Fee nvarchar(50)
as
begin
update pranellore set PatientName=@PatientName,Gender=@Gender,Address=@Address,EmailId=@EmailId,MobileNumber=@MobileNumber,Investigation=@Investigation,Fee=@Fee where BillNumber=@BillNumber
end


create or alter proc praveendeleteSP
@BillNumber int
as
begin
Delete pranellore where BillNumber=@BillNumber
end
