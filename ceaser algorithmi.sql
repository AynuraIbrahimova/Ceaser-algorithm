create or replace type fg as table of varchar2(50);
declare
text varchar2(50):=&text; 
c number;
d varchar2(50);
n number:=4;
r varchar2(50);
x varchar2(50);
fgf fg; 
begin
  fgf:=fg();
  fgf.extend(50);
  for i in 1..length(text) loop
    d:=substr(text,i,1);
    if regexp_like(text,'^[[:upper:]]+$') then
    c:=mod(ascii(d)+n-65,26) + 65;
    else 
      c:=mod(ascii(d)+n-97,26) + 97; 
    end if; 
    fgf(i):=c;
    r:=chr(c);
    dbms_output.put_line(r);
    end loop;
  end;


