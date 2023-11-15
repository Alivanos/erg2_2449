program rainfall

implicit none
integer::N,Nmax
integer,allocatable::B(:)
character(13),allocatable::A(:)

print*,"Type Nmax"
read*,Nmax

allocate(A(Nmax),B(Nmax))

call list(Nmax,A,B,N)

contains

subroutine list(M,T,R,k)

integer,intent(in)::M
character(13),intent(out)::T(M)
integer,intent(out)::R(M),k
integer::i,st

k=0
open(10,file='data.txt',iostat=st)
if(st/=0)then
  print*,"file error"
  return
end if

read(10,*)
print*," Town        ","        Rain"

do i=1,M
  read(10,*,iostat=st)T(i),R(i)
  if(st==-1)exit
  k=k+1
  print*,T(i),R(i)
end do

print*
print*,"Number of rows:",k

close(10)

end subroutine

end program