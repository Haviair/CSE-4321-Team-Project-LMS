¸J
êC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Service\Assets\LibraryAssetService.cs
	namespace 	
LightLib
 
. 
Service 
. 
Assets !
{" #
public 

class 
LibraryAssetService $
:% & 
ILibraryAssetService' ;
{< =
private 
readonly 
LibraryDbContext )
_context* 2
;2 3
private 
readonly 
IMapper  
_mapper! (
;( )
public 
LibraryAssetService "
(" #
LibraryDbContext 
context $
,$ %
IMapper 
mapper 
) 
{ 
_context 
= 
context 
; 
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
bool 
> 
Add  #
(# $
LibraryAssetDto$ 3
assetDto4 <
)< =
{> ?
var 
newAsset 
= 
_mapper "
." #
Map# &
<& '
Asset' ,
>, -
(- .
assetDto. 6
)6 7
;7 8
await 
_context 
. 
AddAsync #
(# $
newAsset$ ,
), -
;- .
await 
_context 
. 
SaveChangesAsync +
(+ ,
), -
;- .
return 
true 
; 
}   	
public"" 
async"" 
Task"" 
<"" 
LibraryAssetDto"" )
>"") *
Get""+ .
("". /
Guid""/ 3
assetId""4 ;
)""; <
{""= >
var## 
asset## 
=## 
await## 
_context## &
.##& '
LibraryAssets##' 4
.$$ 
Include$$ 
($$ 
a$$ 
=>$$ 
a$$ 
.$$  
AvailabilityStatus$$  2
)$$2 3
.%% 
Include%% 
(%% 
a%% 
=>%% 
a%% 
.%%  
Location%%  (
)%%( )
.&& 

FirstAsync&& 
(&& 
a&& 
=>&&  
a&&! "
.&&" #
Id&&# %
==&&& (
assetId&&) 0
)&&0 1
;&&1 2
return'' 
_mapper'' 
.'' 
Map'' 
<'' 
LibraryAssetDto'' .
>''. /
(''/ 0
asset''0 5
)''5 6
;''6 7
}(( 	
public** 
async** 
Task** 
<** 
PaginationResult** *
<*** +
LibraryAssetDto**+ :
>**: ;
>**; <
GetPaginated**= I
(**I J
int**J M
page**N R
,**R S
int**T W
perPage**X _
)**_ `
{**a b
var++ 
assets++ 
=++ 
_context++ !
.++! "
LibraryAssets++" /
.,, 
Include,, 
(,, 
a,, 
=>,, 
a,, 
.,,  
AvailabilityStatus,,  2
),,2 3
.-- 
Include-- 
(-- 
a-- 
=>-- 
a-- 
.--  
Location--  (
)--( )
;--) *
var.. 
pageOfAssets.. 
=.. 
await.. $
assets..% +
...+ ,
ToPaginatedResult.., =
(..= >
page..> B
,..B C
perPage..D K
)..K L
;..L M
var// 
pageOfAssetDtos// 
=//  !
_mapper//" )
.//) *
Map//* -
<//- .
List//. 2
<//2 3
LibraryAssetDto//3 B
>//B C
>//C D
(//D E
pageOfAssets//E Q
.//Q R
Results//R Y
)//Y Z
;//Z [
return00 
new00 
PaginationResult00 '
<00' (
LibraryAssetDto00( 7
>007 8
{009 :

PageNumber11 
=11  
pageOfAssets11! -
.11- .

PageNumber11. 8
,118 9
PerPage22 
=22 
pageOfAssets22 *
.22* +
PerPage22+ 2
,222 3
Results33 
=33 
pageOfAssetDtos33 -
}44 
;44 
}55 	
public77 
async77 
Task77 
<77 
LibraryBranchDto77 *
>77* +
GetCurrentLocation77, >
(77> ?
Guid77? C
assetId77D K
)77K L
{77M N
var88 
asset88 
=88 
await88 
_context88 &
.99 
LibraryAssets99 
.:: 

FirstAsync:: 
(:: 
a:: 
=>::  
a::! "
.::" #
Id::# %
==::& (
assetId::) 0
)::0 1
;::1 2
var;; 
location;; 
=;; 
asset;;  
.;;  !
Location;;! )
;;;) *
return<< 
_mapper<< 
.<< 
Map<< 
<<< 
LibraryBranchDto<< /
><</ 0
(<<0 1
location<<1 9
)<<9 :
;<<: ;
}== 	
public?? 
async?? 
Task?? 
<?? 
bool?? 
>?? 
MarkLost??  (
(??( )
Guid??) -
assetId??. 5
)??5 6
{??7 8
var@@ 
item@@ 
=@@ 
await@@ 
_context@@ %
.@@% &
LibraryAssets@@& 3
.AA 

FirstAsyncAA 
(AA 
aAA 
=>AA  
aAA! "
.AA" #
IdAA# %
==AA& (
assetIdAA) 0
)AA0 1
;AA1 2
_contextBB 
.BB 
UpdateBB 
(BB 
itemBB  
)BB  !
;BB! "
itemDD 
.DD 
AvailabilityStatusDD #
=DD$ %
_contextDD& .
.DD. /
StatusesDD/ 7
.EE 
FirstEE 
(EE 
aEE 
=>EE 
aEE 
.EE 
NameEE "
==EE# %
AssetStatusEE& 1
.EE1 2
LostEE2 6
)EE6 7
;EE7 8
awaitFF 
_contextFF 
.FF 
SaveChangesAsyncFF +
(FF+ ,
)FF, -
;FF- .
returnGG 
trueGG 
;GG 
}HH 	
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
boolJJ 
>JJ 
	MarkFoundJJ  )
(JJ) *
GuidJJ* .
assetIdJJ/ 6
)JJ6 7
{JJ8 9
varKK 
libraryAssetKK 
=KK 
awaitKK $
_contextKK% -
.KK- .
LibraryAssetsKK. ;
.LL 

FirstAsyncLL 
(LL 
aLL 
=>LL  
aLL! "
.LL" #
IdLL# %
==LL& (
assetIdLL) 0
)LL0 1
;LL1 2
_contextMM 
.MM 
UpdateMM 
(MM 
libraryAssetMM (
)MM( )
;MM) *
libraryAssetNN 
.NN 
AvailabilityStatusNN +
=NN, -
_contextNN. 6
.NN6 7
StatusesNN7 ?
.OO 
FirstOO 
(OO 
aOO 
=>OO 
aOO 
.OO 
NameOO "
==OO# %
AssetStatusOO& 1
.OO1 2
GoodConditionOO2 ?
)OO? @
;OO@ A
varPP 
nowPP 
=PP 
DateTimePP 
.PP 
UtcNowPP %
;PP% &
varSS 
checkoutSS 
=SS 
_contextSS #
.SS# $
	CheckoutsSS$ -
.TT 
FirstTT 
(TT 
aTT 
=>TT 
aTT 
.TT 
AssetTT #
.TT# $
IdTT$ &
==TT' )
assetIdTT* 1
)TT1 2
;TT2 3
ifUU 
(UU 
checkoutUU 
!=UU 
nullUU  
)UU  !
_contextUU" *
.UU* +
RemoveUU+ 1
(UU1 2
checkoutUU2 :
)UU: ;
;UU; <
varXX 
historyXX 
=XX 
_contextXX "
.XX" #
CheckoutHistoriesXX# 4
.YY 
FirstYY 
(YY 
hYY 
=>YY 
hZZ 
.ZZ 
AssetZZ 
.ZZ 
IdZZ 
==ZZ !
assetIdZZ" )
&&[[ 
h[[ 
.[[ 
	CheckedIn[[ "
==[[# %
null[[& *
)[[* +
;[[+ ,
if]] 
(]] 
history]] 
!=]] 
null]] 
)]]  
{]]! "
_context^^ 
.^^ 
Update^^ 
(^^  
history^^  '
)^^' (
;^^( )
history__ 
.__ 
	CheckedIn__ !
=__" #
now__$ '
;__' (
}`` 
awaitaa 
_contextaa 
.aa 
SaveChangesAsyncaa +
(aa+ ,
)aa, -
;aa- .
returnbb 
truebb 
;bb 
}cc 	
}dd 
}ee ¬
äC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Service\Assets\StatusService.cs
	namespace 	
LightLib
 
. 
Service 
. 
Assets !
{" #
public 

class 
StatusService 
:  
IStatusService! /
{0 1
private 
readonly 
LibraryDbContext )
_context* 2
;2 3
private 
readonly 
IMapper  
_mapper! (
;( )
public 
StatusService 
( 
LibraryDbContext 
context $
,$ %
IMapper 
mapper 
) 
{ 
_context 
= 
context 
; 
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
bool 
> 
Add  #
(# $
	StatusDto$ -
	statusDto. 7
)7 8
{9 :
var 
status 
= 
_mapper  
.  !
Map! $
<$ %
AvailabilityStatus% 7
>7 8
(8 9
	statusDto9 B
)B C
;C D
await 
_context 
. 
AddAsync #
(# $
status$ *
)* +
;+ ,
await 
_context 
. 
SaveChangesAsync +
(+ ,
), -
;- .
return 
true 
; 
} 	
public   
async   
Task   
<   
PaginationResult   *
<  * +
	StatusDto  + 4
>  4 5
>  5 6
GetPaginated  7 C
(  C D
int  D G
page  H L
,  L M
int  N Q
perPage  R Y
)  Y Z
{  [ \
var!! 
statuses!! 
=!! 
_context!! #
.!!# $
Statuses!!$ ,
;!!, -
var"" 
pageOfStatuses"" 
=""  
await""! &
statuses""' /
.""/ 0
ToPaginatedResult""0 A
(""A B
page""B F
,""F G
perPage""H O
)""O P
;""P Q
var## 
pageOfAssetDtos## 
=##  !
_mapper##" )
.##) *
Map##* -
<##- .
List##. 2
<##2 3
	StatusDto##3 <
>##< =
>##= >
(##> ?
pageOfStatuses##? M
.##M N
Results##N U
)##U V
;##V W
return$$ 
new$$ 
PaginationResult$$ '
<$$' (
	StatusDto$$( 1
>$$1 2
{$$3 4

PageNumber%% 
=%%  
pageOfStatuses%%! /
.%%/ 0

PageNumber%%0 :
,%%: ;
PerPage&& 
=&& 
pageOfStatuses&& ,
.&&, -
PerPage&&- 4
,&&4 5
Results'' 
='' 
pageOfAssetDtos'' -
}(( 
;(( 
})) 	
public++ 
async++ 
Task++ 
<++ 
	StatusDto++ #
>++# $
Get++% (
(++( )
int++) ,
statusId++- 5
)++5 6
{++7 8
var,, 
status,, 
=,, 
await,, 
_context,, '
.,,' (
Statuses,,( 0
.,,0 1

FirstAsync,,1 ;
(,,; <
p,,< =
=>,,> @
p,,A B
.,,B C
Id,,C E
==,,F H
statusId,,I Q
),,Q R
;,,R S
return-- 
_mapper-- 
.-- 
Map-- 
<-- 
	StatusDto-- (
>--( )
(--) *
status--* 0
)--0 1
;--1 2
}.. 	
}// 
}00 ≈d
ìC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Service\Branches\LibraryBranchService.cs
	namespace 	
LightLib
 
. 
Service 
. 
Branches #
{$ %
public 

class  
LibraryBranchService %
:& '!
ILibraryBranchService( =
{> ?
private 
readonly 
LibraryDbContext )
_context* 2
;2 3
private 
readonly 
IMapper  
_mapper! (
;( )
public  
LibraryBranchService #
(# $
LibraryDbContext$ 4
context5 <
,< =
IMapper> E
mapperF L
)L M
{N O
_context 
= 
context 
; 
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
bool 
> 
Add  #
(# $
LibraryBranchDto$ 4
newBranchDto5 A
)A B
{C D
var 
	newBranch 
= 
_mapper #
.# $
Map$ '
<' (
LibraryBranch( 5
>5 6
(6 7
newBranchDto7 C
)C D
;D E
await 
_context 
. 
AddAsync #
(# $
	newBranch$ -
)- .
;. /
await 
_context 
. 
SaveChangesAsync +
(+ ,
), -
;- .
return 
true 
; 
} 	
public   
async   
Task   
<   
List   
<   
string   %
>  % &
>  & '
GetBranchHours  ( 6
(  6 7
int  7 :
branchId  ; C
)  C D
{  E F
var!! 
hours!! 
=!! 
await!! 
_context!! &
."" 
BranchHours"" 
.## 
Where## 
(## 
a## 
=>## 
a## 
.## 
Branch## $
.##$ %
Id##% '
==##( *
branchId##+ 3
)##3 4
.$$ 
ToListAsync$$ 
($$ 
)$$ 
;$$ 
return%% !
HumanizeBusinessHours%% (
(%%( )
hours%%) .
)%%. /
.%%/ 0
ToList%%0 6
(%%6 7
)%%7 8
;%%8 9
}&& 	
public(( 
async(( 
Task(( 
<(( 
LibraryBranchDto(( *
>((* +
Get((, /
(((/ 0
int((0 3
branchId((4 <
)((< =
{((> ?
var)) 
branches)) 
=)) 
await))  
_context))! )
.))) *
LibraryBranches))* 9
.** 
Include** 
(** 
b** 
=>** 
b** 
.**  
Patrons**  '
)**' (
.++ 
Include++ 
(++ 
b++ 
=>++ 
b++ 
.++  
LibraryAssets++  -
)++- .
.,, 

FirstAsync,, 
(,, 
p,, 
=>,,  
p,,! "
.,," #
Id,,# %
==,,& (
branchId,,) 1
),,1 2
;,,2 3
return// 
_mapper// 
.// 
Map// 
<// 
LibraryBranchDto// /
>/// 0
(//0 1
branches//1 9
)//9 :
;//: ;
}00 	
private33 
struct33 &
BranchHoursOpenRangeForDay33 1
{332 3
public44 
int44 '
Start_SecondsSinceWeekStart44 2
{443 4
get445 8
;448 9
set44: =
;44= >
}44? @
public55 
int55 %
End_SecondsSinceWeekStart55 0
{551 2
get553 6
;556 7
set558 ;
;55; <
}55= >
}66 	
public88 
async88 
Task88 
<88 
bool88 
>88 
IsBranchOpen88  ,
(88, -
int88- 0
branchId881 9
)889 :
{88; <
var99 
now99 
=99 
DateTime99 
.99 
UtcNow99 %
;99% &
return@@ 
true@@ 
;@@ 
}AA 	
publicCC 
asyncCC 
TaskCC 
<CC 
intCC 
>CC 
GetAssetCountCC ,
(CC, -
intCC- 0
branchIdCC1 9
)CC9 :
{CC; <
varDD 
libraryBranchDD 
=DD 
awaitDD  %
GetDD& )
(DD) *
branchIdDD* 2
)DD2 3
;DD3 4
returnEE 
libraryBranchEE  
.EE  !
LibraryAssetsEE! .
.EE. /
CountEE/ 4
;EE4 5
}FF 	
publicHH 
asyncHH 
TaskHH 
<HH 
intHH 
>HH 
GetPatronCountHH -
(HH- .
intHH. 1
branchIdHH2 :
)HH: ;
{HH< =
varII 
libraryBranchII 
=II 
awaitII  %
GetII& )
(II) *
branchIdII* 2
)II2 3
;II3 4
returnJJ 
libraryBranchJJ  
.JJ  !
PatronsJJ! (
.JJ( )
CountJJ) .
;JJ. /
}KK 	
publicMM 
asyncMM 
TaskMM 
<MM 
decimalMM !
>MM! "
GetAssetsValueMM# 1
(MM1 2
intMM2 5
branchIdMM6 >
)MM> ?
{MM@ A
varNN 
branchNN 
=NN 
awaitNN 
_contextNN '
.NN' (
LibraryBranchesNN( 7
.OO 
IncludeOO 
(OO 
aOO 
=>OO 
aOO 
.OO  
LibraryAssetsOO  -
)OO- .
.PP 

FirstAsyncPP 
(PP 
bPP 
=>PP  
bPP! "
.PP" #
IdPP# %
==PP& (
branchIdPP) 1
)PP1 2
;PP2 3
varQQ 
assetsForBranchQQ 
=QQ  !
branchQQ" (
.QQ( )
LibraryAssetsQQ) 6
;QQ6 7
returnRR 
assetsForBranchRR "
.RR" #
SumRR# &
(RR& '
aRR' (
=>RR) +
aRR, -
.RR- .
CostRR. 2
)RR2 3
;RR3 4
}SS 	
publicUU 
asyncUU 
TaskUU 
<UU 
PaginationResultUU *
<UU* +
LibraryBranchDtoUU+ ;
>UU; <
>UU< =
GetPaginatedUU> J
(UUJ K
intUUK N
pageUUO S
,UUS T
intUUU X
perPageUUY `
)UU` a
{UUb c
varVV 
libraryBranchesVV 
=VV  !
_contextVV" *
.VV* +
LibraryBranchesVV+ :
.WW 
IncludeWW 
(WW 
aWW 
=>WW 
aWW 
.WW  
PatronsWW  '
)WW' (
.XX 
IncludeXX 
(XX 
aXX 
=>XX 
aXX 
.XX  
LibraryAssetsXX  -
)XX- .
;XX. /
varYY 
pageOfBranchesYY 
=YY  
awaitYY! &
libraryBranchesYY' 6
.YY6 7
ToPaginatedResultYY7 H
(YYH I
pageYYI M
,YYM N
perPageYYO V
)YYV W
;YYW X
varZZ 
pageOfAssetDtosZZ 
=ZZ  !
_mapperZZ" )
.ZZ) *
MapZZ* -
<ZZ- .
ListZZ. 2
<ZZ2 3
LibraryBranchDtoZZ3 C
>ZZC D
>ZZD E
(ZZE F
pageOfBranchesZZF T
.ZZT U
ResultsZZU \
)ZZ\ ]
;ZZ] ^
return[[ 
new[[ 
PaginationResult[[ '
<[[' (
LibraryBranchDto[[( 8
>[[8 9
{[[: ;

PageNumber\\ 
=\\  
pageOfBranches\\! /
.\\/ 0

PageNumber\\0 :
,\\: ;
PerPage]] 
=]] 
pageOfBranches]] ,
.]], -
PerPage]]- 4
,]]4 5
Results^^ 
=^^ 
pageOfAssetDtos^^ -
}__ 
;__ 
}`` 	
publicbb 
asyncbb 
Taskbb 
<bb 
PaginationResultbb *
<bb* +
	PatronDtobb+ 4
>bb4 5
>bb5 6

GetPatronsbb7 A
(bbA B
intbbB E
branchIdbbF N
,bbN O
intbbP S
pagebbT X
,bbX Y
intbbZ ]
perPagebb^ e
)bbe f
{bbg h
varcc 
branchcc 
=cc 
awaitcc 
_contextcc '
.cc' (
LibraryBranchescc( 7
.dd 
Includedd 
(dd 
add 
=>dd 
add 
.dd  
Patronsdd  '
)dd' (
.ee 

FirstAsyncee 
(ee 
bee 
=>ee  
bee! "
.ee" #
Idee# %
==ee& (
branchIdee) 1
)ee1 2
;ee2 3
varff 
patronsff 
=ff 
branchff  
.ff  !
Patronsff! (
.ff( )
AsQueryableff) 4
(ff4 5
)ff5 6
;ff6 7
vargg 
pageOfPatronsgg 
=gg 
awaitgg  %
patronsgg& -
.gg- .
ToPaginatedResultgg. ?
(gg? @
pagegg@ D
,ggD E
perPageggF M
)ggM N
;ggN O
varhh 
pageOfAssetDtoshh 
=hh  !
_mapperhh" )
.hh) *
Maphh* -
<hh- .
Listhh. 2
<hh2 3
	PatronDtohh3 <
>hh< =
>hh= >
(hh> ?
pageOfPatronshh? L
.hhL M
ResultshhM T
)hhT U
;hhU V
returnii 
newii 
PaginationResultii '
<ii' (
	PatronDtoii( 1
>ii1 2
{ii3 4

PageNumberjj 
=jj  
pageOfPatronsjj! .
.jj. /

PageNumberjj/ 9
,jj9 :
PerPagekk 
=kk 
pageOfPatronskk +
.kk+ ,
PerPagekk, 3
,kk3 4
Resultsll 
=ll 
pageOfAssetDtosll -
}mm 
;mm 
}nn 	
publicpp 
asyncpp 
Taskpp 
<pp 
PaginationResultpp *
<pp* +
LibraryAssetDtopp+ :
>pp: ;
>pp; <
	GetAssetspp= F
(ppF G
intppG J
branchIdppK S
,ppS T
intppU X
pageppY ]
,pp] ^
intpp_ b
perPageppc j
)ppj k
{ppl m
varqq 
branchqq 
=qq 
awaitqq 
_contextqq '
.qq' (
LibraryBranchesqq( 7
.rr 
Includerr 
(rr 
arr 
=>rr 
arr 
.rr  
Patronsrr  '
)rr' (
.ss 

FirstAsyncss 
(ss 
bss 
=>ss  
bss! "
.ss" #
Idss# %
==ss& (
branchIdss) 1
)ss1 2
;ss2 3
vartt 
libraryAssetstt 
=tt 
branchtt  &
.tt& '
LibraryAssetstt' 4
.tt4 5
AsQueryablett5 @
(tt@ A
)ttA B
;ttB C
varuu 
pageOfAssetsuu 
=uu 
awaituu $
libraryAssetsuu% 2
.uu2 3
ToPaginatedResultuu3 D
(uuD E
pageuuE I
,uuI J
perPageuuK R
)uuR S
;uuS T
varvv 
pageOfAssetDtosvv 
=vv  !
_mappervv" )
.vv) *
Mapvv* -
<vv- .
Listvv. 2
<vv2 3
LibraryAssetDtovv3 B
>vvB C
>vvC D
(vvD E
pageOfAssetsvvE Q
.vvQ R
ResultsvvR Y
)vvY Z
;vvZ [
returnww 
newww 
PaginationResultww '
<ww' (
LibraryAssetDtoww( 7
>ww7 8
{ww9 :

PageNumberxx 
=xx  
pageOfAssetsxx! -
.xx- .

PageNumberxx. 8
,xx8 9
PerPageyy 
=yy 
pageOfAssetsyy *
.yy* +
PerPageyy+ 2
,yy2 3
Resultszz 
=zz 
pageOfAssetDtoszz -
}{{ 
;{{ 
}|| 	
}}} 
}~~ »û
éC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Service\Checkout\CheckoutService.cs
	namespace 	
LightLib
 
. 
Service 
. 
Checkout #
{$ %
public 

class 
CheckoutService  
:! "
ICheckoutService# 3
{4 5
private 
readonly 
LibraryDbContext )
_context* 2
;2 3
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
IHoldService %
_holdService& 2
;2 3
private 
const 
int 
DefaultDateDueDays ,
=- .
$num/ 1
;1 2
public 
CheckoutService 
( 
LibraryDbContext 
context $
,$ %
IHoldService 
holdService $
,$ %
IMapper 
mapper 
) 
{ 
_context 
= 
context 
; 
_holdService 
= 
holdService &
;& '
_mapper 
= 
mapper 
; 
} 	
public   
async   
Task   
<   
PaginationResult   *
<  * +
CheckoutDto  + 6
>  6 7
>  7 8
GetPaginated  9 E
(  E F
int  F I
page  J N
,  N O
int  P S
perPage  T [
)  [ \
{  ] ^
var!! 
	checkouts!! 
=!! 
_context!! $
.!!$ %
	Checkouts!!% .
;!!. /
var"" 
pageOfCheckouts"" 
=""  !
await""" '
	checkouts""( 1
.""1 2
ToPaginatedResult""2 C
(""C D
page""D H
,""H I
perPage""J Q
)""Q R
;""R S
var## 
pageOfAssetDtos## 
=##  !
_mapper##" )
.##) *
Map##* -
<##- .
List##. 2
<##2 3
CheckoutDto##3 >
>##> ?
>##? @
(##@ A
pageOfCheckouts##A P
.##P Q
Results##Q X
)##X Y
;##Y Z
return$$ 
new$$ 
PaginationResult$$ '
<$$' (
CheckoutDto$$( 3
>$$3 4
{$$5 6

PageNumber%% 
=%%  
pageOfCheckouts%%! 0
.%%0 1

PageNumber%%1 ;
,%%; <
PerPage&& 
=&& 
pageOfCheckouts&& -
.&&- .
PerPage&&. 5
,&&5 6
Results'' 
='' 
pageOfAssetDtos'' -
}(( 
;(( 
})) 	
public++ 
async++ 
Task++ 
<++ 
PaginationResult++ *
<++* +
CheckoutHistoryDto+++ =
>++= >
>++> ?
GetCheckoutHistory++@ R
(++R S
Guid,, 
assetId,, 
,,, 
int-- 
page-- 
,-- 
int.. 
perPage.. 
).. 
{.. 
var00 
checkoutHistories00 !
=00" #
_context00$ ,
.00, -
CheckoutHistories00- >
.11 
Include11 
(11 
a11 
=>11 
a11 
.11  
Asset11  %
)11% &
.22 
Include22 
(22 
a22 
=>22 
a22 
.22  
LibraryCard22  +
)22+ ,
.33 
Where33 
(33 
a33 
=>33 
a33 
.33 
Asset33 #
.33# $
Id33$ &
==33' )
assetId33* 1
)331 2
;332 3
var55 
pageOfHistory55 
=55 
await55  %
checkoutHistories55& 7
.557 8
ToPaginatedResult558 I
(55I J
page55J N
,55N O
perPage55P W
)55W X
;55X Y
var66 
pageOfHistoryDto66  
=66! "
_mapper66# *
.66* +
Map66+ .
<66. /
List66/ 3
<663 4
CheckoutHistoryDto664 F
>66F G
>66G H
(66H I
pageOfHistory66I V
.66V W
Results66W ^
)66^ _
;66_ `
return77 
new77 
PaginationResult77 '
<77' (
CheckoutHistoryDto77( :
>77: ;
{77< =

PageNumber88 
=88  
pageOfHistory88! .
.88. /

PageNumber88/ 9
,889 :
PerPage99 
=99 
pageOfHistory99 +
.99+ ,
PerPage99, 3
,993 4
Results:: 
=:: 
pageOfHistoryDto:: .
};; 
;;; 
}<< 	
public>> 
async>> 
Task>> 
<>> 
CheckoutDto>> %
>>>% &
Get>>' *
(>>* +
int>>+ .

checkoutId>>/ 9
)>>9 :
{>>; <
var?? 
checkout?? 
=?? 
await??  
_context??! )
.??) *
	Checkouts??* 3
.??3 4

FirstAsync??4 >
(??> ?
p??? @
=>??A C
p??D E
.??E F
Id??F H
==??I K

checkoutId??L V
)??V W
;??W X
return@@ 
_mapper@@ 
.@@ 
Map@@ 
<@@ 
CheckoutDto@@ *
>@@* +
(@@+ ,
checkout@@, 4
)@@4 5
;@@5 6
}AA 	
publicCC 
asyncCC 
TaskCC 
<CC 
CheckoutDtoCC %
>CC% &
GetLatestCheckoutCC' 8
(CC8 9
GuidCC9 =
assetIdCC> E
)CCE F
{CCG H
varDD 
latestDD 
=DD 
awaitDD 
_contextDD '
.DD' (
	CheckoutsDD( 1
.EE 
WhereEE 
(EE 
cEE 
=>EE 
cEE 
.EE 
AssetEE #
.EE# $
IdEE$ &
==EE' )
assetIdEE* 1
)EE1 2
.FF 
OrderByDescendingFF "
(FF" #
cFF# $
=>FF% '
cFF( )
.FF) *
CheckedOutSinceFF* 9
)FF9 :
.GG 

FirstAsyncGG 
(GG 
)GG 
;GG 
returnHH 
_mapperHH 
.HH 
MapHH 
<HH 
CheckoutDtoHH *
>HH* +
(HH+ ,
latestHH, 2
)HH2 3
;HH3 4
}II 	
publicKK 
asyncKK 
TaskKK 
<KK 
boolKK 
>KK 
IsCheckedOutKK  ,
(KK, -
GuidKK- 1
assetIdKK2 9
)KK9 :
=>LL 
awaitLL 
_contextLL 
.LL 
	CheckoutsLL '
.LL( )
AnyAsyncLL) 1
(LL1 2
aLL2 3
=>LL4 6
aLL7 8
.LL8 9
AssetLL9 >
.LL> ?
IdLL? A
==LLB D
assetIdLLE L
)LLL M
;LLM N
publicNN 
asyncNN 
TaskNN 
<NN 
stringNN  
>NN  !
GetCurrentPatronNN" 2
(NN2 3
GuidNN3 7
assetIdNN8 ?
)NN? @
{NNA B
varOO 
checkoutOO 
=OO 
awaitOO  
_contextOO! )
.OO) *
	CheckoutsOO* 3
.PP 
IncludePP 
(PP 
aPP 
=>PP 
aPP 
.PP  
AssetPP  %
)PP% &
.QQ 
IncludeQQ 
(QQ 
aQQ 
=>QQ 
aQQ 
.QQ  
LibraryCardQQ  +
)QQ+ ,
.RR 

FirstAsyncRR 
(RR 
aRR 
=>RR  
aRR! "
.RR" #
AssetRR# (
.RR( )
IdRR) +
==RR, .
assetIdRR/ 6
)RR6 7
;RR7 8
ifTT 
(TT 
checkoutTT 
==TT 
nullTT  
)TT  !
{TT" #
}VV 
varXX 
cardIdXX 
=XX 
checkoutXX !
.XX! "
LibraryCardXX" -
.XX- .
IdXX. 0
;XX0 1
varZZ 
patronZZ 
=ZZ 
awaitZZ 
_contextZZ '
.ZZ' (
PatronsZZ( /
.[[ 
Include[[ 
([[ 
p[[ 
=>[[ 
p[[ 
.[[  
LibraryCard[[  +
)[[+ ,
.\\ 

FirstAsync\\ 
(\\ 
c\\ 
=>\\  
c\\! "
.\\" #
LibraryCard\\# .
.\\. /
Id\\/ 1
==\\2 4
cardId\\5 ;
)\\; <
;\\< =
return^^ 
$"^^ 
{^^ 
patron^^ 
.^^ 
	FirstName^^ &
}^^& '
$str^^' (
{^^( )
patron^^) /
.^^/ 0
LastName^^0 8
}^^8 9
"^^9 :
;^^: ;
}__ 	
publicaa 
asyncaa 
Taskaa 
<aa 
boolaa 
>aa 
Addaa  #
(aa# $
CheckoutDtoaa$ /
newCheckoutDtoaa0 >
)aa> ?
{aa@ A
varbb 
checkoutEntitybb 
=bb  
_mapperbb! (
.bb( )
Mapbb) ,
<bb, -
Databb- 1
.bb1 2
Modelsbb2 8
.bb8 9
Checkoutbb9 A
>bbA B
(bbB C
newCheckoutDtobbC Q
)bbQ R
;bbR S
trycc 
{cc 
awaitdd 
_contextdd 
.dd 
AddAsyncdd '
(dd' (
checkoutEntitydd( 6
)dd6 7
;dd7 8
awaitee 
_contextee 
.ee 
SaveChangesAsyncee /
(ee/ 0
)ee0 1
;ee1 2
returnff 
trueff 
;ff 
}gg 
catchgg 
(gg 
	Exceptiongg 
exgg !
)gg! "
{gg# $
throwhh 
newhh #
LibraryServiceExceptionhh 1
(hh1 2
Reasonhh2 8
.hh8 9
UncaughtErrorhh9 F
)hhF G
;hhG H
}ii 
}jj 	
publicll 
asyncll 
Taskll 
<ll 
boolll 
>ll 
CheckOutItemll  ,
(ll, -
Guidll- 1
assetIdll2 9
,ll9 :
intll; >
libraryCardIdll? L
)llL M
{llN O
varnn 
nownn 
=nn 
DateTimenn 
.nn 
UtcNownn %
;nn% &
varpp 
isAlreadyCheckedOutpp #
=pp$ %
awaitpp& +
IsCheckedOutpp, 8
(pp8 9
assetIdpp9 @
)pp@ A
;ppA B
ifrr 
(rr 
isAlreadyCheckedOutrr #
)rr# $
{rr% &
}tt 
varvv 
libraryAssetvv 
=vv 
awaitvv $
_contextvv% -
.vv- .
LibraryAssetsvv. ;
.ww 
Includeww 
(ww 
aww 
=>ww 
aww 
.ww  
AvailabilityStatusww  2
)ww2 3
.xx 

FirstAsyncxx 
(xx 
axx 
=>xx  
axx! "
.xx" #
Idxx# %
==xx& (
assetIdxx) 0
)xx0 1
;xx1 2
_contextzz 
.zz 
Updatezz 
(zz 
libraryAssetzz (
)zz( )
;zz) *
libraryAsset}} 
.}} 
AvailabilityStatus}} +
=}}, -
await}}. 3
_context}}4 <
.}}< =
Statuses}}= E
.~~ 

FirstAsync~~ 
(~~ 
a~~ 
=>~~  
a~~! "
.~~" #
Name~~# '
==~~( *
$str~~+ 8
)~~8 9
;~~9 :
var
ÄÄ 
libraryCard
ÄÄ 
=
ÄÄ 
await
ÄÄ #
_context
ÄÄ$ ,
.
ÄÄ, -
LibraryCards
ÄÄ- 9
.
ÅÅ 
Include
ÅÅ 
(
ÅÅ 
c
ÅÅ 
=>
ÅÅ 
c
ÅÅ 
.
ÅÅ  
	Checkouts
ÅÅ  )
)
ÅÅ) *
.
ÇÇ 

FirstAsync
ÇÇ 
(
ÇÇ 
a
ÇÇ 
=>
ÇÇ  
a
ÇÇ! "
.
ÇÇ" #
Id
ÇÇ# %
==
ÇÇ& (
libraryCardId
ÇÇ) 6
)
ÇÇ6 7
;
ÇÇ7 8
var
ÑÑ 
checkout
ÑÑ 
=
ÑÑ 
new
ÑÑ 
Data
ÑÑ #
.
ÑÑ# $
Models
ÑÑ$ *
.
ÑÑ* +
Checkout
ÑÑ+ 3
{
ÑÑ4 5
Asset
ÖÖ 
=
ÖÖ 
libraryAsset
ÖÖ $
,
ÖÖ$ %
LibraryCard
ÜÜ 
=
ÜÜ 
libraryCard
ÜÜ )
,
ÜÜ) *
CheckedOutSince
áá 
=
áá  !
now
áá" %
,
áá% &
CheckedOutUntil
àà 
=
àà  !
GetDefaultDateDue
àà" 3
(
àà3 4
now
àà4 7
)
àà7 8
}
ââ 
;
ââ 
await
ãã 
_context
ãã 
.
ãã 
AddAsync
ãã #
(
ãã# $
checkout
ãã$ ,
)
ãã, -
;
ãã- .
var
çç 
checkoutHistory
çç 
=
çç  !
new
çç" %
CheckoutHistory
çç& 5
{
çç6 7

CheckedOut
éé 
=
éé 
now
éé  
,
éé  !
Asset
èè 
=
èè 
libraryAsset
èè $
,
èè$ %
LibraryCard
êê 
=
êê 
libraryCard
êê )
}
ëë 
;
ëë 
await
ìì 
_context
ìì 
.
ìì 
AddAsync
ìì #
(
ìì# $
checkoutHistory
ìì$ 3
)
ìì3 4
;
ìì4 5
await
îî 
_context
îî 
.
îî 
SaveChangesAsync
îî +
(
îî+ ,
)
îî, -
;
îî- .
return
ïï 
true
ïï 
;
ïï 
}
ññ 	
public
òò 
async
òò 
Task
òò 
<
òò 
bool
òò 
>
òò 
CheckInItem
òò  +
(
òò+ ,
Guid
òò, 0
assetId
òò1 8
)
òò8 9
{
òò: ;
var
öö 
now
öö 
=
öö 
DateTime
öö 
.
öö 
UtcNow
öö %
;
öö% &
var
úú 
libraryAsset
úú 
=
úú 
await
úú $
_context
úú% -
.
úú- .
LibraryAssets
úú. ;
.
ùù 

FirstAsync
ùù 
(
ùù 
a
ùù 
=>
ùù  
a
ùù! "
.
ùù" #
Id
ùù# %
==
ùù& (
assetId
ùù) 0
)
ùù0 1
;
ùù1 2
_context
üü 
.
üü 
Update
üü 
(
üü 
libraryAsset
üü (
)
üü( )
;
üü) *
var
¢¢ 
checkout
¢¢ 
=
¢¢ 
await
¢¢  
_context
¢¢! )
.
¢¢) *
	Checkouts
¢¢* 3
.
££ 
Include
££ 
(
££ 
c
££ 
=>
££ 
c
££ 
.
££  
Asset
££  %
)
££% &
.
§§ 
Include
§§ 
(
§§ 
c
§§ 
=>
§§ 
c
§§ 
.
§§  
LibraryCard
§§  +
)
§§+ ,
.
•• 

FirstAsync
•• 
(
•• 
a
•• 
=>
••  
a
••! "
.
••" #
Asset
••# (
.
••( )
Id
••) +
==
••, .
assetId
••/ 6
)
••6 7
;
••7 8
if
ßß 
(
ßß 
checkout
ßß 
!=
ßß 
null
ßß  
)
ßß  !
{
ßß" #
_context
®® 
.
®® 
Remove
®® 
(
®®  
checkout
®®  (
)
®®( )
;
®®) *
}
©© 
var
¨¨ 
history
¨¨ 
=
¨¨ 
await
¨¨ 
_context
¨¨  (
.
¨¨( )
CheckoutHistories
¨¨) :
.
≠≠ 
Include
≠≠ 
(
≠≠ 
h
≠≠ 
=>
≠≠ 
h
≠≠ 
.
≠≠  
Asset
≠≠  %
)
≠≠% &
.
ÆÆ 
Include
ÆÆ 
(
ÆÆ 
h
ÆÆ 
=>
ÆÆ 
h
ÆÆ 
.
ÆÆ  
LibraryCard
ÆÆ  +
)
ÆÆ+ ,
.
ØØ 

FirstAsync
ØØ 
(
ØØ 
h
ØØ 
=>
ØØ  
h
∞∞ 
.
∞∞ 
Asset
∞∞ 
.
∞∞ 
Id
∞∞ 
==
∞∞ !
assetId
∞∞" )
&&
±± 
h
±± 
.
±± 
	CheckedIn
±± "
==
±±# %
null
±±& *
)
±±* +
;
±±+ ,
if
≥≥ 
(
≥≥ 
history
≥≥ 
!=
≥≥ 
null
≥≥ 
)
≥≥  
{
≥≥! "
_context
¥¥ 
.
¥¥ 
Update
¥¥ 
(
¥¥  
history
¥¥  '
)
¥¥' (
;
¥¥( )
history
µµ 
.
µµ 
	CheckedIn
µµ !
=
µµ" #
now
µµ$ '
;
µµ' (
}
∂∂ 
var
∫∫ $
wasCheckedOutToNewHold
∫∫ &
=
∫∫' (
await
∫∫) .$
CheckoutToEarliestHold
∫∫/ E
(
∫∫E F
assetId
∫∫F M
)
∫∫M N
;
∫∫N O
if
ºº 
(
ºº $
wasCheckedOutToNewHold
ºº &
)
ºº& '
{
ºº( )
}
ææ 
libraryAsset
¬¬ 
.
¬¬  
AvailabilityStatus
¬¬ +
=
¬¬, -
await
¬¬. 3
_context
¬¬4 <
.
¬¬< =
Statuses
¬¬= E
.
√√ 

FirstAsync
√√ 
(
√√ 
a
√√ 
=>
√√  
a
√√! "
.
√√" #
Name
√√# '
==
√√( *
$str
√√+ 6
)
√√6 7
;
√√7 8
await
≈≈ 
_context
≈≈ 
.
≈≈ 
SaveChangesAsync
≈≈ +
(
≈≈+ ,
)
≈≈, -
;
≈≈- .
return
∆∆ 
true
∆∆ 
;
∆∆ 
}
«« 	
private
…… 
async
…… 
Task
…… 
<
…… 
bool
…… 
>
……  $
CheckoutToEarliestHold
……! 7
(
……7 8
Guid
……8 <
assetId
……= D
)
……D E
{
……F G
var
ÀÀ 
earliestHold
ÀÀ 
=
ÀÀ 
await
ÀÀ $
_holdService
ÀÀ% 1
.
ÀÀ1 2
GetEarliestHold
ÀÀ2 A
(
ÀÀA B
assetId
ÀÀB I
)
ÀÀI J
;
ÀÀJ K
if
ÕÕ 
(
ÕÕ 
earliestHold
ÕÕ 
==
ÕÕ 
null
ÕÕ  $
)
ÕÕ$ %
{
ÕÕ& '
return
ŒŒ 
false
ŒŒ 
;
ŒŒ 
}
œœ 
var
—— 
card
—— 
=
—— 
earliestHold
—— #
.
——# $
LibraryCard
——$ /
;
——/ 0
_context
”” 
.
”” 
Remove
”” 
(
”” 
earliestHold
”” (
)
””( )
;
””) *
await
‘‘ 
_context
‘‘ 
.
‘‘ 
SaveChangesAsync
‘‘ +
(
‘‘+ ,
)
‘‘, -
;
‘‘- .
var
◊◊ 
checkOutResult
◊◊ 
=
◊◊  
await
◊◊! &
CheckOutItem
◊◊' 3
(
◊◊3 4
assetId
◊◊4 ;
,
◊◊; <
card
◊◊= A
.
◊◊A B
Id
◊◊B D
)
◊◊D E
;
◊◊E F
return
ŸŸ 
checkOutResult
ŸŸ !
;
ŸŸ! "
}
⁄⁄ 	
private
‹‹ 
static
‹‹ 
DateTime
‹‹ 
GetDefaultDateDue
‹‹  1
(
‹‹1 2
DateTime
‹‹2 :
now
‹‹; >
)
‹‹> ?
=>
‹‹@ B
now
‹‹C F
.
‹‹F G
AddDays
‹‹G N
(
‹‹N O 
DefaultDateDueDays
‹‹O a
)
‹‹a b
;
‹‹b c
}
›› 
}ﬁﬁ ÍN
äC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Service\Checkout\HoldService.cs
	namespace 	
LightLib
 
. 
Service 
. 
Checkout #
{$ %
public 

class 
HoldService 
: 
IHoldService +
{, -
private 
readonly 
LibraryDbContext )
_context* 2
;2 3
private 
readonly 
IMapper  
_mapper! (
;( )
public 
HoldService 
( 
LibraryDbContext 
context $
,$ %
IMapper 
mapper 
) 
{ 
_context 
= 
context 
; 
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
PaginationResult *
<* +
HoldDto+ 2
>2 3
>3 4$
GetCurrentHoldsPaginated5 M
(M N
GuidN R
assetIdS Z
,Z [
int\ _
page` d
,d e
intf i
perPagej q
)q r
{s t
var 
holds 
= 
_context  
.  !
Holds! &
. 
Include 
( 
h 
=> 
h 
.  
Asset  %
)% &
.   
Where   
(   
a   
=>   
a   
.   
Asset   #
.  # $
Id  $ &
==  ' )
assetId  * 1
)  1 2
;  2 3
var!! 
pageOfHolds!! 
=!! 
await!! #
holds!!$ )
.!!) *
ToPaginatedResult!!* ;
(!!; <
page!!< @
,!!@ A
perPage!!B I
)!!I J
;!!J K
var"" 
pageOfAssetDtos"" 
=""  !
_mapper""" )
."") *
Map""* -
<""- .
List"". 2
<""2 3
HoldDto""3 :
>"": ;
>""; <
(""< =
pageOfHolds""= H
.""H I
Results""I P
)""P Q
;""Q R
return## 
new## 
PaginationResult## '
<##' (
HoldDto##( /
>##/ 0
{##1 2

PageNumber$$ 
=$$  
pageOfHolds$$! ,
.$$, -

PageNumber$$- 7
,$$7 8
PerPage%% 
=%% 
pageOfHolds%% )
.%%) *
PerPage%%* 1
,%%1 2
Results&& 
=&& 
pageOfAssetDtos&& -
}'' 
;'' 
}(( 	
public** 
async** 
Task** 
<** 
string**  
>**  ! 
GetCurrentHoldPatron**" 6
(**6 7
int**7 :
holdId**; A
)**A B
{**C D
var++ 
hold++ 
=++ 
_context++ 
.++  
Holds++  %
.,, 
Include,, 
(,, 
a,, 
=>,, 
a,, 
.,,  
Asset,,  %
),,% &
.-- 
Include-- 
(-- 
a-- 
=>-- 
a-- 
.--  
LibraryCard--  +
)--+ ,
... 
Where.. 
(.. 
v.. 
=>.. 
v.. 
... 
Id..  
==..! #
holdId..$ *
)..* +
;..+ ,
var00 
cardId00 
=00 
await00 
hold00 #
.11 
Include11 
(11 
a11 
=>11 
a11 
.11  
LibraryCard11  +
)11+ ,
.22 
Select22 
(22 
a22 
=>22 
a22 
.22 
LibraryCard22 *
.22* +
Id22+ -
)22- .
.33 

FirstAsync33 
(33 
)33 
;33 
var55 
patron55 
=55 
await55 
_context55 '
.55' (
Patrons55( /
.66 
Include66 
(66 
p66 
=>66 
p66 
.66  
LibraryCard66  +
)66+ ,
.77 

FirstAsync77 
(77 
p77 
=>77  
p77! "
.77" #
LibraryCard77# .
.77. /
Id77/ 1
==772 4
cardId775 ;
)77; <
;77< =
return99 
$"99 
{99 
patron99 
.99 
	FirstName99 &
}99& '
$str99' (
{99( )
patron99) /
.99/ 0
LastName990 8
}998 9
"999 :
;99: ;
}:: 	
public<< 
async<< 
Task<< 
<<< 
string<<  
><<  ! 
GetCurrentHoldPlaced<<" 6
(<<6 7
int<<7 :
holdId<<; A
)<<A B
{<<C D
var== 
hold== 
=== 
await== 
_context== %
.==% &
Holds==& +
.>> 
Include>> 
(>> 
a>> 
=>>> 
a>> 
.>>  
Asset>>  %
)>>% &
.?? 
Include?? 
(?? 
a?? 
=>?? 
a?? 
.??  
LibraryCard??  +
)??+ ,
.@@ 

FirstAsync@@ 
(@@ 
v@@ 
=>@@  
v@@! "
.@@" #
Id@@# %
==@@& (
holdId@@) /
)@@/ 0
;@@0 1
varBB 

holdPlacedBB 
=BB 
holdBB !
.BB! "

HoldPlacedBB" ,
;BB, -
returnDD 

holdPlacedDD 
.DD 
ToStringDD &
(DD& '
CultureInfoDD' 2
.DD2 3
InvariantCultureDD3 C
)DDC D
;DDD E
}EE 	
publicGG 
asyncGG 
TaskGG 
<GG 
boolGG 
>GG 
	PlaceHoldGG  )
(GG) *
GuidGG* .
assetIdGG/ 6
,GG6 7
intGG8 ;
libraryCardIdGG< I
)GGI J
{GGK L
varHH 
nowHH 
=HH 
DateTimeHH 
.HH 
UtcNowHH %
;HH% &
varJJ 
assetJJ 
=JJ 
awaitJJ 
_contextJJ &
.JJ& '
LibraryAssetsJJ' 4
.KK 
IncludeKK 
(KK 
aKK 
=>KK 
aKK 
.KK  
AvailabilityStatusKK  2
)KK2 3
.LL 

FirstAsyncLL 
(LL 
aLL 
=>LL  
aLL! "
.LL" #
IdLL# %
==LL& (
assetIdLL) 0
)LL0 1
;LL1 2
varNN 
cardNN 
=NN 
awaitNN 
_contextNN %
.NN% &
LibraryCardsNN& 2
.OO 

FirstAsyncOO 
(OO 
aOO 
=>OO  
aOO! "
.OO" #
IdOO# %
==OO& (
libraryCardIdOO) 6
)OO6 7
;OO7 8
_contextQQ 
.QQ 
UpdateQQ 
(QQ 
assetQQ !
)QQ! "
;QQ" #
ifSS 
(SS 
assetSS 
.SS 
AvailabilityStatusSS (
.SS( )
NameSS) -
==SS. 0
$strSS1 <
)SS< =
{SS> ?
assetTT 
.TT 
AvailabilityStatusTT (
=TT) *
awaitTT+ 0
_contextTT1 9
.TT9 :
StatusesTT: B
.UU 

FirstAsyncUU 
(UU  
aUU  !
=>UU" $
aUU% &
.UU& '
NameUU' +
==UU, .
$strUU/ 8
)UU8 9
;UU9 :
}VV 
varXX 
holdXX 
=XX 
newXX 
HoldXX 
{XX  !

HoldPlacedYY 
=YY 
nowYY  
,YY  !
AssetZZ 
=ZZ 
assetZZ 
,ZZ 
LibraryCard[[ 
=[[ 
card[[ "
}\\ 
;\\ 
await^^ 
_context^^ 
.^^ 
AddAsync^^ #
(^^# $
hold^^$ (
)^^( )
;^^) *
await__ 
_context__ 
.__ 
SaveChangesAsync__ +
(__+ ,
)__, -
;__- .
returnaa 
trueaa 
;aa 
}bb 	
publicdd 
asyncdd 
Taskdd 
<dd 
HoldDtodd !
>dd! "
GetEarliestHolddd# 2
(dd2 3
Guiddd3 7
assetIddd8 ?
)dd? @
{ddA B
varee 
earliestHoldee 
=ee 
awaitee $
_contextee% -
.ee- .
Holdsee. 3
.ff 
Includeff 
(ff 
holdff 
=>ff  
holdff! %
.ff% &
Assetff& +
)ff+ ,
.gg 
Includegg 
(gg 
holdgg 
=>gg  
holdgg! %
.gg% &
LibraryCardgg& 1
)gg1 2
.hh 
Wherehh 
(hh 
holdhh 
=>hh 
holdhh #
.hh# $
Assethh$ )
.hh) *
Idhh* ,
==hh- /
assetIdhh0 7
)hh7 8
.ii 
OrderByii 
(ii 
aii 
=>ii 
aii 
.ii  

HoldPlacedii  *
)ii* +
.jj 

FirstAsyncjj 
(jj 
)jj 
;jj 
returnll 
_mapperll 
.ll 
Mapll 
<ll 
HoldDtoll &
>ll& '
(ll' (
earliestHoldll( 4
)ll4 5
;ll5 6
}mm 	
}nn 
}oo ˝
âC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Service\Helpers\DataHelpers.cs
	namespace 	
LightLib
 
. 
Service 
. 
Helpers "
{# $
public 

static 
class 
DataHelpers #
{$ %
public 
static 
IEnumerable !
<! "
string" (
>( )!
HumanizeBusinessHours* ?
(? @
IEnumerable@ K
<K L
BranchHoursL W
>W X
branchHoursY d
)d e
{f g
var		 
hours		 
=		 
new		 
List		  
<		  !
string		! '
>		' (
(		( )
)		) *
;		* +
foreach 
( 
var 
time 
in  
branchHours! ,
), -
{. /
var 
day 
= 
HumanizeDayOfWeek +
(+ ,
time, 0
.0 1
	DayOfWeek1 :
): ;
;; <
var 
openTime 
= 
HumanizeTime +
(+ ,
time, 0
.0 1
OpenTime1 9
)9 :
;: ;
var 
	closeTime 
= 
HumanizeTime  ,
(, -
time- 1
.1 2
	CloseTime2 ;
); <
;< =
var 
	timeEntry 
= 
$"  "
{" #
day# &
}& '
$str' (
{( )
openTime) 1
}1 2
$str2 6
{6 7
	closeTime7 @
}@ A
"A B
;B C
hours 
. 
Add 
( 
	timeEntry #
)# $
;$ %
} 
return 
hours 
; 
} 	
private 
static 
string 
HumanizeDayOfWeek /
(/ 0
int0 3
number4 :
): ;
=>< >
Enum? C
.C D
GetNameD K
(K L
typeofL R
(R S
	DayOfWeekS \
)\ ]
,] ^
number_ e
)e f
;f g
private 
static 
string 
HumanizeTime *
(* +
int+ .
time/ 3
)3 4
=>5 7
TimeSpan8 @
.@ A
	FromHoursA J
(J K
timeK O
)O P
.P Q
ToStringQ Y
(Y Z
$strZ c
)c d
;d e
} 
} ”
èC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Service\Helpers\TimeSpanHumanizer.cs
	namespace 	
LightLib
 
. 
Service 
. 
Helpers "
{# $
public 

static 
class 
TimeSpanHumanizer )
{* +
public 
static 
string 
GetReadableTimespan 0
(0 1
TimeSpan1 9
ts: <
)< =
{> ?
string 
readableTimespan #
=$ %
$str& (
;( )
var 
days 
= 
ts 
. 
Days 
; 
var		 
approxMonths		 
=		 
days		 #
/		$ %
$num		& (
;		( )
switch 
( 
days 
) 
{ 
case 
< 
$num 
: 
return 
$str ,
;, -
case 
> 
$num 
when 
approxMonths *
<=+ -
$num. /
:/ 0
return 
$str .
;. /
default 
: 
{ 
switch 
( 
approxMonths (
)( )
{* +
case 
> 
$num  
and! $
<=% '
$num( *
:* +
return "
$str# 5
;5 6
case 
> 
$num !
and" %
<=& (
$num) +
:+ ,
return "
$str# 1
;1 2
case 
> 
$num !
and" %
<=& (
$num) +
:+ ,
return "
$str# 5
;5 6
case 
> 
$num !
:! "
{# $
var 
approxYears  +
=, -
approxMonths. :
/; <
$num= ?
;? @
return "
$"# %
$str% +
{+ ,
approxYears, 7
}7 8
$str8 >
"> ?
;? @
} 
} 
break 
; 
} 
}   
return"" 
readableTimespan"" #
;""# $
}## 	
}$$ 
}%% ı
çC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Service\Interfaces\IBookService.cs
	namespace 	
LightLib
 
. 
Service 
. 

Interfaces %
{& '
public 

	interface 
IBookService !
{" #
Task 
< 
PaginationResult 
< 
BookDto %
>% &
>& '
GetAll( .
(. /
int/ 2
page3 7
,7 8
int9 <

pageNumber= G
)G H
;H I
Task		 
<		 
PaginationResult		 
<		 
BookDto		 %
>		% &
>		& '
GetByAuthor		( 3
(		3 4
string		4 :
author		; A
,		A B
int		C F
page		G K
,		K L
int		M P
perPage		Q X
)		X Y
;		Y Z
Task

 
<

 
BookDto

 
>

 
	GetByIsbn

 
(

  
string

  &
isbn

' +
)

+ ,
;

, -
Task 
< 
BookDto 
> 
Get 
( 
int 
id  
)  !
;! "
Task 
< 
bool 
> 
Add 
( 
BookDto 
newBook &
)& '
;' (
} 
} ∂
ëC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Service\Interfaces\ICheckoutService.cs
	namespace 	
LightLib
 
. 
Service 
. 

Interfaces %
{& '
public 

	interface 
ICheckoutService %
{& '
Task 
< 
bool 
> 
Add 
( 
CheckoutDto "
newCheckout# .
). /
;/ 0
Task		 
<		 
CheckoutDto		 
>		 
Get		 
(		 
int		 !

checkoutId		" ,
)		, -
;		- .
Task

 
<

 
bool

 
>

 
CheckInItem

 
(

 
Guid

 #
assetId

$ +
)

+ ,
;

, -
Task 
< 
bool 
> 
CheckOutItem 
(  
Guid  $
assetId% ,
,, -
int. 1
libraryCardId2 ?
)? @
;@ A
Task 
< 
CheckoutDto 
> 
GetLatestCheckout +
(+ ,
Guid, 0
assetId1 8
)8 9
;9 :
Task 
< 
bool 
> 
IsCheckedOut 
(  
Guid  $
assetId% ,
), -
;- .
Task 
< 
string 
> 
GetCurrentPatron %
(% &
Guid& *
assetId+ 2
)2 3
;3 4
Task 
< 
PaginationResult 
< 
CheckoutDto )
>) *
>* +
GetPaginated, 8
(8 9
int9 <
page= A
,A B
intC F
perPageG N
)N O
;O P
Task 
< 
PaginationResult 
< 
CheckoutHistoryDto 0
>0 1
>1 2
GetCheckoutHistory3 E
(E F
GuidF J
assetIdK R
,R S
intT W
pageX \
,\ ]
int^ a
perPageb i
)i j
;j k
} 
} ı
çC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Service\Interfaces\IHoldService.cs
	namespace 	
LightLib
 
. 
Service 
. 

Interfaces %
{& '
public 

	interface 
IHoldService !
{" #
Task 
< 
PaginationResult 
< 
HoldDto %
>% &
>& '$
GetCurrentHoldsPaginated( @
(@ A
GuidA E
assetIdF M
,M N
intO R
pageS W
,W X
intY \
perPage] d
)d e
;e f
Task		 
<		 
bool		 
>		 
	PlaceHold		 
(		 
Guid		 !
assetId		" )
,		) *
int		+ .
libraryCardId		/ <
)		< =
;		= >
Task

 
<

 
string

 
>

  
GetCurrentHoldPatron

 )
(

) *
int

* -
holdId

. 4
)

4 5
;

5 6
Task 
< 
string 
>  
GetCurrentHoldPlaced )
() *
int* -
holdId. 4
)4 5
;5 6
Task 
< 
HoldDto 
> 
GetEarliestHold %
(% &
Guid& *
assetId+ 2
)2 3
;3 4
} 
} ª
ïC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Service\Interfaces\ILibraryAssetService.cs
	namespace 	
LightLib
 
. 
Service 
. 

Interfaces %
{& '
public 

	interface  
ILibraryAssetService )
{* +
Task		 
<		 
PaginationResult		 
<		 
LibraryAssetDto		 -
>		- .
>		. /
GetPaginated		0 <
(		< =
int		= @
page		A E
,		E F
int		G J
perPage		K R
)		R S
;		S T
Task

 
<

 
LibraryAssetDto

 
>

 
Get

 !
(

! "
Guid

" &
assetId

' .
)

. /
;

/ 0
Task 
< 
bool 
> 
Add 
( 
LibraryAssetDto &
newDto' -
)- .
;. /
Task 
< 
LibraryBranchDto 
> 
GetCurrentLocation 1
(1 2
Guid2 6
assetId7 >
)> ?
;? @
Task 
< 
bool 
> 
MarkLost 
( 
Guid  
assetId! (
)( )
;) *
Task 
< 
bool 
> 
	MarkFound 
( 
Guid !
assetId" )
)) *
;* +
} 
} Ü
ñC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Service\Interfaces\ILibraryBranchService.cs
	namespace 	
LightLib
 
. 
Service 
. 

Interfaces %
{& '
public 

	interface !
ILibraryBranchService *
{+ ,
Task		 
<		 
PaginationResult		 
<		 
LibraryBranchDto		 .
>		. /
>		/ 0
GetPaginated		1 =
(		= >
int		> A
page		B F
,		F G
int		H K
perPage		L S
)		S T
;		T U
Task

 
<

 
PaginationResult

 
<

 
	PatronDto

 '
>

' (
>

( )

GetPatrons

* 4
(

4 5
int

5 8
branchId

9 A
,

A B
int

C F
page

G K
,

K L
int

M P
perPage

Q X
)

X Y
;

Y Z
Task 
< 
PaginationResult 
< 
LibraryAssetDto -
>- .
>. /
	GetAssets0 9
(9 :
int: =
branchId> F
,F G
intH K
pageL P
,P Q
intR U
perPageV ]
)] ^
;^ _
Task 
< 
List 
< 
string 
> 
> 
GetBranchHours )
() *
int* -
branchId. 6
)6 7
;7 8
Task 
< 
LibraryBranchDto 
> 
Get "
(" #
int# &
branchId' /
)/ 0
;0 1
Task 
< 
bool 
> 
Add 
( 
LibraryBranchDto '
newBranchDto( 4
)4 5
;5 6
Task 
< 
bool 
> 
IsBranchOpen 
(  
int  #
branchId$ ,
), -
;- .
Task 
< 
int 
> 
GetAssetCount 
(  
int  #
branchId$ ,
), -
;- .
Task 
< 
int 
> 
GetPatronCount  
(  !
int! $
branchId% -
)- .
;. /
Task 
< 
decimal 
> 
GetAssetsValue $
($ %
int% (
branchId) 1
)1 2
;2 3
} 
} ®
îC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Service\Interfaces\ILibraryCardService.cs
	namespace 	
LightLib
 
. 
Service 
. 

Interfaces %
{& '
public 

	interface 
ILibraryCardService (
{) *
Task 
< 
PaginationResult 
< 
LibraryCardDto ,
>, -
>- .
GetPaginated/ ;
(; <
int< ?
page@ D
,D E
intF I
perPageJ Q
)Q R
;R S
Task 
< 
LibraryCardDto 
> 
Get  
(  !
int! $
libraryCardId% 2
)2 3
;3 4
Task		 
<		 
bool		 
>		 
Add		 
(		 
LibraryCardDto		 %
libraryCardDto		& 4
)		4 5
;		5 6
}

 
} ≠
ãC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Service\Interfaces\IPaginator.cs
	namespace 	
LightLib
 
. 
Service 
. 

Interfaces %
{& '
public

 

	interface

 

IPaginator

 
<

  
T

  !
>

! "
where

# (
T

) *
:

+ ,
class

- 2
{

3 4
public 

IQueryable 
< 
T 
> 
BuildPageResult ,
<, -
TOrder- 3
>3 4
(4 5

IQueryable 
< 
T 
> 
data 
, 
int 
page 
, 
int 
perPage 
, 

Expression 
< 
Func 
< 
T 
, 
TOrder %
>% &
>& '

orderByExp( 2
,2 3
bool 
isDescending 
= 
true  $
) 
; 
public 

IQueryable 
< 
T 
> 
BuildPageResult ,
<, -
TOrder- 3
>3 4
(4 5

IQueryable 
< 
T 
> 
data 
, 
int 
page 
, 
int 
perPage 
, 

Expression 
< 
Func 
< 
T 
, 
bool #
># $
>$ %
whereExp& .
,. /

Expression 
< 
Func 
< 
T 
, 
TOrder %
>% &
>& '

orderByExp( 2
) 
; 
} 
} ≥
èC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Service\Interfaces\IPatronService.cs
	namespace 	
LightLib
 
. 
Service 
. 

Interfaces %
{& '
public 

	interface 
IPatronService #
{$ %
Task 
< 
PaginationResult 
< 
	PatronDto '
>' (
>( )
GetPaginated* 6
(6 7
int7 :
page; ?
,? @
intA D
perPageE L
)L M
;M N
Task 
< 
PaginationResult 
< 
CheckoutHistoryDto 0
>0 1
>1 2'
GetPaginatedCheckoutHistory3 N
(N O
intO R
patronIdS [
,[ \
int] `
pagea e
,e f
intg j
perPagek r
)r s
;s t
Task		 
<		 
PaginationResult		 
<		 
HoldDto		 %
>		% &
>		& '
GetPaginatedHolds		( 9
(		9 :
int		: =
patronId		> F
,		F G
int		H K
page		L P
,		P Q
int		R U
perPage		V ]
)		] ^
;		^ _
Task

 
<

 
PaginationResult

 
<

 
CheckoutDto

 )
>

) *
>

* +!
GetPaginatedCheckouts

, A
(

A B
int

B E
patronId

F N
,

N O
int

P S
page

T X
,

X Y
int

Z ]
perPage

^ e
)

e f
;

f g
Task 
< 
	PatronDto 
> 
Get 
( 
int 
patronId  (
)( )
;) *
Task 
< 
bool 
> 
Add 
( 
	PatronDto  
	newPatron! *
)* +
;+ ,
} 
} Ç
èC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Service\Interfaces\IStatusService.cs
	namespace 	
LightLib
 
. 
Service 
. 

Interfaces %
{& '
public 

	interface 
IStatusService #
{$ %
Task 
< 
PaginationResult 
< 
	StatusDto '
>' (
>( )
GetPaginated* 6
(6 7
int7 :
page; ?
,? @
intA D
perPageE L
)L M
;M N
Task 
< 
	StatusDto 
> 
Get 
( 
int 
statusId  (
)( )
;) *
Task		 
<		 
bool		 
>		 
Add		 
(		 
	StatusDto		  
status		! '
)		' (
;		( )
}

 
} ª 
êC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Service\Patrons\LibraryCardService.cs
	namespace 	
LightLib
 
. 
Service 
. 
Patrons "
{# $
public 

class 
LibraryCardService #
:$ %
ILibraryCardService& 9
{: ;
private 
readonly 
LibraryDbContext )
_context* 2
;2 3
private 
readonly 
IMapper  
_mapper! (
;( )
public 
LibraryCardService !
(! "
LibraryDbContext 
context $
,$ %
IMapper 
mapper 
) 
{ 
_context 
= 
context 
; 
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
PaginationResult *
<* +
LibraryCardDto+ 9
>9 :
>: ;
GetPaginated< H
(H I
intI L
pageM Q
,Q R
intS V
perPageW ^
)^ _
{` a
var 
libraryCards 
= 
_context '
.' (
LibraryCards( 4
;4 5
var 
pageOfLibraryCards "
=# $
await% *
libraryCards+ 7
.7 8
ToPaginatedResult8 I
(I J
pageJ N
,N O
perPageP W
)W X
;X Y
var !
pageOfLibraryCardsDto %
=& '
_mapper( /
./ 0
Map0 3
<3 4
List4 8
<8 9
LibraryCardDto9 G
>G H
>H I
(I J
pageOfLibraryCardsJ \
.\ ]
Results] d
)d e
;e f
return 
new 
PaginationResult '
<' (
LibraryCardDto( 6
>6 7
{8 9

PageNumber 
=  
pageOfLibraryCards! 3
.3 4

PageNumber4 >
,> ?
PerPage 
= 
pageOfLibraryCards 0
.0 1
PerPage1 8
,8 9
Results 
= !
pageOfLibraryCardsDto 3
} 
; 
}   	
public"" 
async"" 
Task"" 
<"" 
LibraryCardDto"" (
>""( )
Get""* -
(""- .
int"". 1
cardId""2 8
)""8 9
{"": ;
var## 
libraryCard## 
=## 
await## #
_context##$ ,
.##, -
LibraryCards##- 9
.##9 :

FirstAsync##: D
(##D E
p##E F
=>##G I
p##J K
.##K L
Id##L N
==##O Q
cardId##R X
)##X Y
;##Y Z
return$$ 
_mapper$$ 
.$$ 
Map$$ 
<$$ 
LibraryCardDto$$ -
>$$- .
($$. /
libraryCard$$/ :
)$$: ;
;$$; <
}%% 	
public'' 
async'' 
Task'' 
<'' 
bool'' 
>'' 
Add''  #
(''# $
LibraryCardDto''$ 2
libraryCardDto''3 A
)''A B
{''C D
var(( 
newLibraryCard(( 
=((  
_mapper((! (
.((( )
Map(() ,
<((, -
LibraryCard((- 8
>((8 9
(((9 :
libraryCardDto((: H
)((H I
;((I J
await)) 
_context)) 
.)) 
AddAsync)) #
())# $
newLibraryCard))$ 2
)))2 3
;))3 4
await** 
_context** 
.** 
SaveChangesAsync** +
(**+ ,
)**, -
;**- .
return++ 
true++ 
;++ 
},, 	
}-- 
}.. Ül
ãC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Service\Patrons\PatronService.cs
	namespace 	
LightLib
 
. 
Service 
. 
Patrons "
{# $
public 

class 
PatronService 
:  
IPatronService! /
{0 1
private 
readonly 
LibraryDbContext )
_context* 2
;2 3
private 
readonly 
IMapper  
_mapper! (
;( )
public 
PatronService 
( 
LibraryDbContext 
context $
,$ %
IMapper 
mapper 
) 
{ 
_context 
= 
context 
; 
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
	PatronDto #
># $
Get% (
(( )
int) ,
patronId- 5
)5 6
{7 8
var 
patron 
= 
await 
_context '
.' (
Patrons( /
. 
Include 
( 
a 
=> 
a 
.  
LibraryCard  +
)+ ,
. 
Include 
( 
a 
=> 
a 
.  
HomeLibraryBranch  1
)1 2
. 

FirstAsync 
( 
p 
=>  
p! "
." #
Id# %
==& (
patronId) 1
)1 2
;2 3
return   
_mapper   
.   
Map   
<   
	PatronDto   (
>  ( )
(  ) *
patron  * 0
)  0 1
;  1 2
}!! 	
public## 
async## 
Task## 
<## 
bool## 
>## 
Add##  #
(### $
	PatronDto##$ -
newPatronDto##. :
)##: ;
{##< =
var$$ 
	newPatron$$ 
=$$ 
_mapper$$ #
.$$# $
Map$$$ '
<$$' (
Patron$$( .
>$$. /
($$/ 0
newPatronDto$$0 <
)$$< =
;$$= >
await%% 
_context%% 
.%% 
AddAsync%% #
(%%# $
	newPatron%%$ -
)%%- .
;%%. /
await&& 
_context&& 
.&& 
SaveChangesAsync&& +
(&&+ ,
)&&, -
;&&- .
return'' 
true'' 
;'' 
}(( 	
public** 
async** 
Task** 
<** 
PaginationResult** *
<*** +
	PatronDto**+ 4
>**4 5
>**5 6
GetPaginated**7 C
(**C D
int**D G
page**H L
,**L M
int**N Q
perPage**R Y
)**Y Z
{**[ \
var++ 
patrons++ 
=++ 
_context++ "
.++" #
Patrons++# *
;++* +
var,, 
pageOfPatrons,, 
=,, 
await,,  %
patrons,,& -
.,,- .
ToPaginatedResult,,. ?
(,,? @
page,,@ D
,,,D E
perPage,,F M
),,M N
;,,N O
var-- 
pageOfPatronDtos--  
=--! "
_mapper--# *
.--* +
Map--+ .
<--. /
List--/ 3
<--3 4
	PatronDto--4 =
>--= >
>--> ?
(--? @
pageOfPatrons--@ M
.--M N
Results--N U
)--U V
;--V W
return.. 
new.. 
PaginationResult.. '
<..' (
	PatronDto..( 1
>..1 2
{..3 4

PageNumber// 
=//  
pageOfPatrons//! .
.//. /

PageNumber/// 9
,//9 :
PerPage00 
=00 
pageOfPatrons00 +
.00+ ,
PerPage00, 3
,003 4
Results11 
=11 
pageOfPatronDtos11 .
}22 
;22 
}33 	
public55 
async55 
Task55 
<55 
PaginationResult55 *
<55* +
CheckoutHistoryDto55+ =
>55= >
>55> ?'
GetPaginatedCheckoutHistory55@ [
(55[ \
int55\ _
patronId55` h
,55h i
int55j m
page55n r
,55r s
int55t w
perPage55x 
)	55 Ä
{
55Å Ç
var66 
patron66 
=66 
await66 
_context66 '
.66' (
Patrons66( /
.77 
Include77 
(77 
a77 
=>77 
a77 
.77  
LibraryCard77  +
)77+ ,
.88 

FirstAsync88 
(88 
a88 
=>88  
a88! "
.88" #
Id88# %
==88& (
patronId88) 1
)881 2
;882 3
if:: 
(:: 
patron:: 
==:: 
null:: 
):: 
{::  !
return<< 
new<< 
PaginationResult<< +
<<<+ ,
CheckoutHistoryDto<<, >
><<> ?
(<<? @
)<<@ A
;<<A B
}== 
var?? 
cardId?? 
=?? 
patron?? 
.??  
LibraryCard??  +
.??+ ,
Id??, .
;??. /
varAA 
	historiesAA 
=AA 
_contextAA $
.AA$ %
CheckoutHistoriesAA% 6
.BB 
IncludeBB 
(BB 
aBB 
=>BB 
aBB 
.BB  
LibraryCardBB  +
)BB+ ,
.CC 
IncludeCC 
(CC 
aCC 
=>CC 
aCC 
.CC  
AssetCC  %
)CC% &
.DD 
WhereDD 
(DD 
aDD 
=>DD 
aDD 
.DD 
LibraryCardDD )
.DD) *
IdDD* ,
==DD- /
cardIdDD0 6
)DD6 7
.EE 
OrderByDescendingEE "
(EE" #
aEE# $
=>EE% '
aEE( )
.EE) *

CheckedOutEE* 4
)EE4 5
;EE5 6
varGG 
pageOfHistoryGG 
=GG 
awaitGG  %
	historiesGG& /
.GG/ 0
ToPaginatedResultGG0 A
(GGA B
pageGGB F
,GGF G
perPageGGH O
)GGO P
;GGP Q
varHH 
pageOfHistoryDtoHH  
=HH! "
_mapperHH# *
.HH* +
MapHH+ .
<HH. /
ListHH/ 3
<HH3 4
CheckoutHistoryDtoHH4 F
>HHF G
>HHG H
(HHH I
pageOfHistoryHHI V
.HHV W
ResultsHHW ^
)HH^ _
;HH_ `
returnII 
newII 
PaginationResultII '
<II' (
CheckoutHistoryDtoII( :
>II: ;
{II< =

PageNumberJJ 
=JJ  
pageOfHistoryJJ! .
.JJ. /

PageNumberJJ/ 9
,JJ9 :
PerPageKK 
=KK 
pageOfHistoryKK +
.KK+ ,
PerPageKK, 3
,KK3 4
ResultsLL 
=LL 
pageOfHistoryDtoLL .
}MM 
;MM 
}NN 	
publicPP 
asyncPP 
TaskPP 
<PP 
PaginationResultPP *
<PP* +
HoldDtoPP+ 2
>PP2 3
>PP3 4
GetPaginatedHoldsPP5 F
(PPF G
intPPG J
patronIdPPK S
,PPS T
intPPU X
pagePPY ]
,PP] ^
intPP_ b
perPagePPc j
)PPj k
{PPl m
varQQ 
patronQQ 
=QQ 
awaitQQ 
_contextQQ '
.QQ' (
PatronsQQ( /
.RR 
IncludeRR 
(RR 
aRR 
=>RR 
aRR 
.RR  
LibraryCardRR  +
)RR+ ,
.SS 

FirstAsyncSS 
(SS 
aSS 
=>SS  
aSS! "
.SS" #
IdSS# %
==SS& (
patronIdSS) 1
)SS1 2
;SS2 3
ifUU 
(UU 
patronUU 
==UU 
nullUU 
)UU 
{UU  !
}WW 
varYY 
libraryCardIdYY 
=YY 
patronYY  &
.YY& '
LibraryCardYY' 2
.YY2 3
IdYY3 5
;YY5 6
var[[ 
holds[[ 
=[[ 
_context[[  
.[[  !
Holds[[! &
.\\ 
Include\\ 
(\\ 
a\\ 
=>\\ 
a\\ 
.\\  
LibraryCard\\  +
)\\+ ,
.]] 
Include]] 
(]] 
a]] 
=>]] 
a]] 
.]]  
Asset]]  %
)]]% &
.^^ 
Where^^ 
(^^ 
a^^ 
=>^^ 
a^^ 
.^^ 
LibraryCard^^ )
.^^) *
Id^^* ,
==^^- /
libraryCardId^^0 =
)^^= >
.__ 
OrderByDescending__ "
(__" #
a__# $
=>__% '
a__( )
.__) *

HoldPlaced__* 4
)__4 5
;__5 6
varaa 
pageOfHoldsaa 
=aa 
awaitaa #
holdsaa$ )
.aa) *
ToPaginatedResultaa* ;
(aa; <
pageaa< @
,aa@ A
perPageaaB I
)aaI J
;aaJ K
varbb 
pageOfHoldsDtobb 
=bb  
_mapperbb! (
.bb( )
Mapbb) ,
<bb, -
Listbb- 1
<bb1 2
HoldDtobb2 9
>bb9 :
>bb: ;
(bb; <
pageOfHoldsbb< G
.bbG H
ResultsbbH O
)bbO P
;bbP Q
returncc 
newcc 
PaginationResultcc '
<cc' (
HoldDtocc( /
>cc/ 0
{cc1 2

PageNumberdd 
=dd  
pageOfHoldsdd! ,
.dd, -

PageNumberdd- 7
,dd7 8
PerPageee 
=ee 
pageOfHoldsee )
.ee) *
PerPageee* 1
,ee1 2
Resultsff 
=ff 
pageOfHoldsDtoff ,
}gg 
;gg 
}hh 	
publicjj 
asyncjj 
Taskjj 
<jj 
PaginationResultjj *
<jj* +
CheckoutDtojj+ 6
>jj6 7
>jj7 8!
GetPaginatedCheckoutsjj9 N
(jjN O
intjjO R
patronIdjjS [
,jj[ \
intjj] `
pagejja e
,jje f
intjjg j
perPagejjk r
)jjr s
{jjt u
varll 
patronll 
=ll 
awaitll 
_contextll '
.ll' (
Patronsll( /
.mm 
Includemm 
(mm 
amm 
=>mm 
amm 
.mm  
LibraryCardmm  +
)mm+ ,
.nn 

FirstAsyncnn 
(nn 
ann 
=>nn  
ann! "
.nn" #
Idnn# %
==nn& (
patronIdnn) 1
)nn1 2
;nn2 3
ifpp 
(pp 
patronpp 
==pp 
nullpp 
)pp 
{pp  !
returnrr 
newrr 
PaginationResultrr +
<rr+ ,
CheckoutDtorr, 7
>rr7 8
(rr8 9
)rr9 :
;rr: ;
}ss 
varuu 
libraryCardIduu 
=uu 
patronuu  &
.uu& '
LibraryCarduu' 2
.uu2 3
Iduu3 5
;uu5 6
varww 
	checkoutsww 
=ww 
_contextww $
.ww$ %
	Checkoutsww% .
.xx 
Includexx 
(xx 
axx 
=>xx 
axx 
.xx  
LibraryCardxx  +
)xx+ ,
.yy 
Includeyy 
(yy 
ayy 
=>yy 
ayy 
.yy  
Assetyy  %
)yy% &
.zz 
Wherezz 
(zz 
azz 
=>zz 
azz 
.zz 
LibraryCardzz )
.zz) *
Idzz* ,
==zz- /
libraryCardIdzz0 =
)zz= >
.{{ 
OrderByDescending{{ "
({{" #
a{{# $
=>{{% '
a{{( )
.{{) *
CheckedOutSince{{* 9
){{9 :
;{{: ;
var}} 
pageOfCheckouts}} 
=}}  !
await}}" '
	checkouts}}( 1
.}}1 2
ToPaginatedResult}}2 C
(}}C D
page}}D H
,}}H I
perPage}}J Q
)}}Q R
;}}R S
var~~ 
pageOfCheckoutsDto~~ "
=~~# $
_mapper~~% ,
.~~, -
Map~~- 0
<~~0 1
List~~1 5
<~~5 6
CheckoutDto~~6 A
>~~A B
>~~B C
(~~C D
pageOfCheckouts~~D S
.~~S T
Results~~T [
)~~[ \
;~~\ ]
return 
new 
PaginationResult '
<' (
CheckoutDto( 3
>3 4
{5 6

PageNumber
ÄÄ 
=
ÄÄ  
pageOfCheckouts
ÄÄ! 0
.
ÄÄ0 1

PageNumber
ÄÄ1 ;
,
ÄÄ; <
PerPage
ÅÅ 
=
ÅÅ 
pageOfCheckouts
ÅÅ -
.
ÅÅ- .
PerPage
ÅÅ. 5
,
ÅÅ5 6
Results
ÇÇ 
=
ÇÇ  
pageOfCheckoutsDto
ÇÇ 0
}
ÉÉ 
;
ÉÉ 
}
ÑÑ 	
}
ÖÖ 
}ÜÜ ü
òC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Service\Serialization\EntityMappingProfile.cs
	namespace 	
LightLib
 
. 
Service 
. 
Serialization (
{) *
public 

class  
EntityMappingProfile %
:& '
Profile( /
{0 1
public		  
EntityMappingProfile		 #
(		# $
)		$ %
{		& '
	CreateMap

 
<

 
Asset

 
,

 
LibraryAssetDto

 ,
>

, -
(

- .
)

. /
.

/ 0

ReverseMap

0 :
(

: ;
)

; <
;

< =
	CreateMap 
< 
Book 
, 
BookDto #
># $
($ %
)% &
.& '

ReverseMap' 1
(1 2
)2 3
;3 4
	CreateMap 
< 
DVD 
, 
DvdDto !
>! "
(" #
)# $
.$ %

ReverseMap% /
(/ 0
)0 1
;1 2
	CreateMap 
< 
AudioCd 
, 

AudioCdDto )
>) *
(* +
)+ ,
., -

ReverseMap- 7
(7 8
)8 9
;9 :
	CreateMap 
< 
	AudioBook 
,  
AudioBookDto! -
>- .
(. /
)/ 0
.0 1

ReverseMap1 ;
(; <
)< =
;= >
	CreateMap 
< 

Periodical  
,  !
PeriodicalDto" /
>/ 0
(0 1
)1 2
.2 3

ReverseMap3 =
(= >
)> ?
;? @
	CreateMap 
< 
AvailabilityStatus (
,( )
	StatusDto* 3
>3 4
(4 5
)5 6
.6 7

ReverseMap7 A
(A B
)B C
;C D
	CreateMap 
< 
LibraryBranch #
,# $
LibraryBranchDto% 5
>5 6
(6 7
)7 8
.8 9

ReverseMap9 C
(C D
)D E
;E F
	CreateMap 
< 
Patron 
, 
	PatronDto '
>' (
(( )
)) *
.* +

ReverseMap+ 5
(5 6
)6 7
;7 8
	CreateMap 
< 
Data 
. 
Models !
.! "
Checkout" *
,* +
CheckoutDto, 7
>7 8
(8 9
)9 :
.: ;

ReverseMap; E
(E F
)F G
;G H
	CreateMap 
< 
CheckoutHistory %
,% &
CheckoutHistoryDto' 9
>9 :
(: ;
); <
.< =

ReverseMap= G
(G H
)H I
;I J
	CreateMap 
< 
Hold 
, 
HoldDto #
># $
($ %
)% &
.& '

ReverseMap' 1
(1 2
)2 3
;3 4
	CreateMap 
< 
LibraryCard !
,! "
LibraryCardDto# 1
>1 2
(2 3
)3 4
.4 5

ReverseMap5 ?
(? @
)@ A
;A B
} 	
} 
} 