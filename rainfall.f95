program rainfall

implicit none
integer,parameter::N=5
character(13)::A(N)
integer::i,st
integer::B(N)

open(10,file='data.txt',iostat=st)
if(st/=0)then
  print*,"file error"
  stop
end if

read(10,*)
print*," Town        ","        Rain"

do i=1,N
  read(10,*,iostat=st)A(i),B(i)
  if(st==-1)exit
  print*,A(i),B(i)
end do

close(10)

end program