@echo off
rem 计算指定天数之前的日期
set DaysAgo=4
rem 假设系统日期的格式为yyyy-mm-dd
call :DateToDays %date:~0,4% %date:~5,2% %date:~8,2% PassDays
set /a PassDays-=%DaysAgo%
call :DaysToDate %PassDays% DstYear DstMonth DstDay

if %DstMonth%==01 set DstMonth=Jan 
if %DstMonth%==02 set DstMonth=Feb 
if %DstMonth%==03 set DstMonth=Mar 
if %DstMonth%==04 set DstMonth=Apr 
if %DstMonth%==05 set DstMonth=May 
if %DstMonth%==06 set DstMonth=Jun 
if %DstMonth%==07 set DstMonth=July 
if %DstMonth%==08 set DstMonth=Aug 
if %DstMonth%==09 set DstMonth=Sep 
if %DstMonth%==10 set DstMonth=Oct 
if %DstMonth%==11 set DstMonth=Nov 
if %DstMonth%==12 set DstMonth=Dec 

set DstDate=%DstMonth%%DstDay%
echo %DstDate%

set _month=%date:~5,2%

if %_month%==01 set _month=Jan 
if %_month%==02 set _month=Feb 
if %_month%==03 set _month=Mar 
if %_month%==04 set _month=Apr 
if %_month%==05 set _month=May 
if %_month%==06 set _month=Jun 
if %_month%==07 set _month=July 
if %_month%==08 set _month=Aug 
if %_month%==09 set _month=Sep 
if %_month%==10 set _month=Oct 
if %_month%==11 set _month=Nov 
if %_month%==12 set _month=Dec 

set _date=%_month%%date:~8,2%
set day=%date:~8,2%
set OUTPUT=%DstDate% - %_date%
echo %cd%\%OUTPUT%
md "%cd%\%OUTPUT%"

goto :eof

:DateToDays %yy% %mm% %dd% days
setlocal ENABLEEXTENSIONS
set yy=%1&set mm=%2&set dd=%3
if 1%yy% LSS 200 if 1%yy% LSS 170 (set yy=20%yy%) else (set yy=19%yy%)
set /a dd=100%dd%%%100,mm=100%mm%%%100
set /a z=14-mm,z/=12,y=yy+4800-z,m=mm+12*z-3,j=153*m+2
set /a j=j/5+dd+y*365+y/4-y/100+y/400-2472633
endlocal&set %4=%j%&goto :EOF

:DaysToDate %days% yy mm dd
setlocal ENABLEEXTENSIONS
set /a a=%1+2472632,b=4*a+3,b/=146097,c=-b*146097,c/=4,c+=a
set /a d=4*c+3,d/=1461,e=-1461*d,e/=4,e+=c,m=5*e+2,m/=153,dd=153*m+2,dd/=5
set /a dd=-dd+e+1,mm=-m/10,mm*=12,mm+=m+3,yy=b*100+d-4800+m/10
(if %mm% LSS 10 set mm=0%mm%)&(if %dd% LSS 10 set dd=0%dd%)
endlocal&set %2=%yy%&set %3=%mm%&set %4=%dd%&goto :EOF

RunDll32.exe USER32.DLL,UpdatePerUserSystemParameters


exit 

