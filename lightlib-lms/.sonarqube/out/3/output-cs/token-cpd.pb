Ù3
éC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Web\Controllers\BranchController.cs
	namespace

 	
LightLib


 
.

 
Web

 
.

 
Controllers

 "
{

# $
public 

class 
BranchController !
:" #
LibraryController$ 5
{6 7
private 
readonly !
ILibraryBranchService .
_branchService/ =
;= >
public 
BranchController 
(  !
ILibraryBranchService  5
branchService6 C
)C D
{E F
_branchService 
= 
branchService *
;* +
} 	
public 
async 
Task 
< 
IActionResult '
>' (
Index) .
(. /
[/ 0
	FromQuery0 9
]9 :
int; >
page? C
=D E
$numF G
,G H
[I J
	FromQueryJ S
]S T
intU X
perPageY `
=a b
$numc e
)e f
{g h
var 
paginatedBranches !
=" #
await$ )
_branchService* 8
.8 9
GetPaginated9 E
(E F
pageF J
,J K
perPageL S
)S T
;T U
if 
( 
paginatedBranches !
.! "
Results" )
.) *
Any* -
(- .
). /
)/ 0
{1 2
foreach 
( 
var 
branch #
in$ &
paginatedBranches' 8
.8 9
Results9 @
)@ A
{B C
var 
branchId  
=! "
branch# )
.) *
Id* ,
;, -
branch 
. 
IsOpen !
=" #
await$ )
_branchService* 8
.8 9
IsBranchOpen9 E
(E F
branchIdF N
)N O
;O P
branch 
. 
NumberOfAssets )
=* +
await, 1
_branchService2 @
.@ A
GetAssetCountA N
(N O
branchIdO W
)W X
;X Y
branch 
. 
NumberOfPatrons *
=+ ,
await- 2
_branchService3 A
.A B
GetPatronCountB P
(P Q
branchIdQ Y
)Y Z
;Z [
} 
var 
model 
= 
new 
BranchIndexModel  0
{1 2
PageOfBranches "
=# $
paginatedBranches% 6
} 
; 
return!! 
View!! 
(!! 
model!! !
)!!! "
;!!" #
}"" 
var$$ 

emptyModel$$ 
=$$ 
new$$  
BranchIndexModel$$! 1
{$$2 3
PageOfBranches%% 
=%%  
new%%! $
PaginationResult%%% 5
<%%5 6
LibraryBranchDto%%6 F
>%%F G
{%%H I
Results&& 
=&& 
new&& !
List&&" &
<&&& '
LibraryBranchDto&&' 7
>&&7 8
(&&8 9
)&&9 :
,&&: ;

PageNumber'' 
=''  
page''! %
,''% &
PerPage(( 
=(( 
perPage(( %
})) 
}** 
;** 
return,, 
View,, 
(,, 

emptyModel,, "
),," #
;,,# $
}-- 	
public// 
async// 
Task// 
<// 
IActionResult// '
>//' (
Detail//) /
(/// 0
int//0 3
id//4 6
)//6 7
{//8 9
var11 
serviceResult11 
=11 
await11  %
_branchService11& 4
.114 5
Get115 8
(118 9
id119 ;
)11; <
;11< =
var33 
patronCount33 
=33 
await33 #
_branchService33$ 2
.332 3
GetPatronCount333 A
(33A B
id33B D
)33D E
;33E F
var44 
assetsCount44 
=44 
await44 #
_branchService44$ 2
.442 3
GetAssetCount443 @
(44@ A
id44A C
)44C D
;44D E
var55 
assetsValue55 
=55 
await55 #
_branchService55$ 2
.552 3
GetAssetsValue553 A
(55A B
id55B D
)55D E
;55E F
var66 
branchHoursResult66 !
=66" #
await66$ )
_branchService66* 8
.668 9
GetBranchHours669 G
(66G H
id66H J
)66J K
;66K L
var77 
branchHours77 
=77 
branchHoursResult77 /
??770 2
new773 6
List777 ;
<77; <
string77< B
>77B C
(77C D
)77D E
;77E F
var99 
model99 
=99 
new99 
BranchDetailModel99 -
{99. /

BranchName:: 
=:: 
serviceResult:: *
.::* +
Name::+ /
,::/ 0
Description;; 
=;; 
serviceResult;; +
.;;+ ,
Description;;, 7
,;;7 8
Address<< 
=<< 
serviceResult<< '
.<<' (
Address<<( /
,<</ 0
	Telephone== 
=== 
serviceResult== )
.==) *
	Telephone==* 3
,==3 4
BranchOpenedDate>>  
=>>! "
serviceResult>># 0
.>>0 1
OpenDate>>1 9
.>>9 :
ToString>>: B
(>>B C
$str>>C O
)>>O P
,>>P Q
NumberOfPatrons?? 
=??  !
patronCount??" -
,??- .
NumberOfAssets@@ 
=@@  
assetsCount@@! ,
,@@, -
TotalAssetValueAA 
=AA  !
assetsValueAA" -
,AA- .
ImageUrlBB 
=BB 
serviceResultBB (
.BB( )
ImageUrlBB) 1
,BB1 2
	HoursOpenCC 
=CC 
branchHoursCC '
}DD 
;DD 
returnFF 
ViewFF 
(FF 
modelFF 
)FF 
;FF 
}GG 	
}HH 
}II •@
èC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Web\Controllers\CatalogController.cs
	namespace 	
LightLib
 
. 
Web 
. 
Controllers "
{# $
public 

class 
CatalogController "
:# $
LibraryController% 6
{7 8
private 
readonly  
ILibraryAssetService -
_assetsService. <
;< =
private 
readonly 
ICheckoutService )
_checkoutsService* ;
;; <
private 
readonly 
IHoldService %
_holdService& 2
;2 3
public 
CatalogController  
(  ! 
ILibraryAssetService  
assetsService! .
,. /
IHoldService 
holdService $
,$ %
ICheckoutService 
checkoutsService -
)- .
{/ 0
_assetsService 
= 
assetsService *
;* +
_checkoutsService 
= 
checkoutsService  0
;0 1
_holdService 
= 
holdService &
;& '
} 	
public 
async 
Task 
< 
IActionResult '
>' (
Index) .
(. /
[/ 0
	FromQuery0 9
]9 :
int; >
page? C
,C D
[E F
	FromQueryF O
]O P
intQ T
perPageU \
)\ ]
{^ _
var #
paginationServiceResult '
=( )
await* /
_assetsService0 >
.> ?
GetPaginated? K
(K L
pageL P
,P Q
perPageR Y
)Y Z
;Z [
if   
(   #
paginationServiceResult   '
!=  ( *
null  + /
&&  0 2#
paginationServiceResult  3 J
.  J K
Results  K R
.  R S
Any  S V
(  V W
)  W X
)  X Y
{  Z [
var!! 
	allAssets!! 
=!! #
paginationServiceResult!!  7
.!!7 8
Results!!8 ?
.!!? @
ToList!!@ F
(!!F G
)!!G H
;!!H I
var"" 
	viewModel"" 
="" 
new""  #
AssetIndexModel""$ 3
{""4 5
PageOfAssets##  
=##! "
new### &
PaginationResult##' 7
<##7 8
LibraryAssetDto##8 G
>##G H
{##I J
Results$$ 
=$$  !
	allAssets$$" +
}%% 
}&& 
;&& 
return(( 
View(( 
((( 
	viewModel(( %
)((% &
;((& '
})) 
var++ 

emptyModel++ 
=++ 
new++  
AssetIndexModel++! 0
{++1 2
PageOfAssets,, 
=,, 
new,, "
PaginationResult,,# 3
<,,3 4
LibraryAssetDto,,4 C
>,,C D
(,,D E
),,E F
{,,G H
Results-- 
=-- 
new-- !
List--" &
<--& '
LibraryAssetDto--' 6
>--6 7
(--7 8
)--8 9
,--9 :
PerPage.. 
=.. 
perPage.. %
,..% &

PageNumber// 
=//  
page//! %
}00 
}11 
;11 
return33 
View33 
(33 

emptyModel33 "
)33" #
;33# $
}44 	
public66 
async66 
Task66 
<66 
IActionResult66 '
>66' (
Detail66) /
(66/ 0
int660 3
id664 6
)666 7
{668 9
throw77 
new77 #
NotImplementedException77 -
(77- .
)77. /
;77/ 0
}88 	
public:: 
async:: 
Task:: 
<:: 
IActionResult:: '
>::' (
VisitCheckOutPage::) :
(::: ;
int::; >
id::? A
)::A B
{::C D
throw;; 
new;; #
NotImplementedException;; -
(;;- .
);;. /
;;;/ 0
}<< 	
public>> 
async>> 
Task>> 
<>> 
IActionResult>> '
>>>' (
CheckIn>>) 0
(>>0 1
string>>1 7
assetId>>8 ?
)>>? @
{>>A B
throw?? 
new?? #
NotImplementedException?? -
(??- .
)??. /
;??/ 0
}@@ 	
publicBB 
asyncBB 
TaskBB 
<BB 
IActionResultBB '
>BB' (
MarkLostBB) 1
(BB1 2
stringBB2 8
assetIdBB9 @
)BB@ A
{BBB C
varCC 
	assetGuidCC 
=CC 
GuidCC  
.CC  !
ParseCC! &
(CC& '
assetIdCC' .
)CC. /
;CC/ 0
awaitDD 
_assetsServiceDD  
.DD  !
MarkLostDD! )
(DD) *
	assetGuidDD* 3
)DD3 4
;DD4 5
returnEE 
RedirectToActionEE #
(EE# $
$strEE$ ,
,EE, -
newEE. 1
{EE2 3
	assetGuidEE3 <
}EE< =
)EE= >
;EE> ?
}FF 	
publicHH 
asyncHH 
TaskHH 
<HH 
IActionResultHH '
>HH' (
	MarkFoundHH) 2
(HH2 3
stringHH3 9
assetIdHH: A
)HHA B
{HHC D
varII 
	assetGuidII 
=II 
GuidII  
.II  !
ParseII! &
(II& '
assetIdII' .
)II. /
;II/ 0
awaitJJ 
_assetsServiceJJ  
.JJ  !
	MarkFoundJJ! *
(JJ* +
	assetGuidJJ+ 4
)JJ4 5
;JJ5 6
returnKK 
RedirectToActionKK #
(KK# $
$strKK$ ,
,KK, -
newKK. 1
{KK2 3
	assetGuidKK3 <
}KK< =
)KK= >
;KK> ?
}LL 	
[NN 	
HttpPostNN	 
]NN 
publicOO 
asyncOO 
TaskOO 
<OO 
IActionResultOO '
>OO' (
PlaceCheckoutOO) 6
(OO6 7
stringOO7 =
assetIdOO> E
,OOE F
intOOG J
libraryCardIdOOK X
)OOX Y
{OOZ [
varPP 
	assetGuidPP 
=PP 
GuidPP  
.PP  !
ParsePP! &
(PP& '
assetIdPP' .
)PP. /
;PP/ 0
awaitQQ 
_checkoutsServiceQQ #
.QQ# $
CheckOutItemQQ$ 0
(QQ0 1
	assetGuidQQ1 :
,QQ: ;
libraryCardIdQQ< I
)QQI J
;QQJ K
returnRR 
RedirectToActionRR #
(RR# $
$strRR$ ,
,RR, -
newRR. 1
{RR2 3
idRR3 5
=RR6 7
assetIdRR8 ?
}RR? @
)RR@ A
;RRA B
}SS 	
[UU 	
HttpPostUU	 
]UU 
publicVV 
asyncVV 
TaskVV 
<VV 
IActionResultVV '
>VV' (
	PlaceHoldVV) 2
(VV2 3
stringVV3 9
assetIdVV: A
,VVA B
intVVC F
libraryCardIdVVG T
)VVT U
{VVV W
varWW 
	assetGuidWW 
=WW 
GuidWW  
.WW  !
ParseWW! &
(WW& '
assetIdWW' .
)WW. /
;WW/ 0
awaitXX 
_holdServiceXX 
.XX 
	PlaceHoldXX (
(XX( )
	assetGuidXX) 2
,XX2 3
libraryCardIdXX4 A
)XXA B
;XXB C
returnYY 
RedirectToActionYY #
(YY# $
$strYY$ ,
,YY, -
newYY. 1
{YY2 3
idYY3 5
=YY6 7
assetIdYY8 ?
}YY? @
)YY@ A
;YYA B
}ZZ 	
}[[ 
}\\ À

åC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Web\Controllers\HomeController.cs
	namespace 	
LightLib
 
. 
Web 
. 
Controllers "
{# $
public 

class 
HomeController 
:  !
LibraryController" 3
{4 5
private 
readonly 
ILogger  
<  !
HomeController! /
>/ 0
_logger1 8
;8 9
public 
HomeController 
( 
ILogger %
<% &
HomeController& 4
>4 5
logger6 <
)< =
{> ?
_logger		 
=		 
logger		 
;		 
_logger

 
.

 
LogDebug

 
(

 
$num

 
,

 
$str

  C
)

C D
;

D E
} 	
public 
IActionResult 
Index "
(" #
)# $
{% &
_logger 
. 
LogInformation "
(" #
$str# >
)> ?
;? @
return 
View 
( 
) 
; 
} 	
} 
} ¬
èC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Web\Controllers\LibraryController.cs
	namespace 	
LightLib
 
. 
Web 
. 
Controllers "
{# $
public 

abstract 
class 
LibraryController +
:, -

Controller. 8
{9 :
} 
} π/
éC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Web\Controllers\PatronController.cs
	namespace 	
LightLib
 
. 
Web 
. 
Controllers "
{# $
public 

class 
PatronController !
:" #
LibraryController$ 5
{6 7
private 
readonly 
IPatronService '
_patronService( 6
;6 7
public 
PatronController 
(  
IPatronService  .
patronService/ <
)< =
{> ?
_patronService 
= 
patronService *
;* +
} 	
public 
async 
Task 
< 
IActionResult '
>' (
Index) .
(. /
[/ 0
	FromQuery0 9
]9 :
int; >
page? C
=D E
$numF G
,G H
[I J
	FromQueryJ S
]S T
intU X
perPageY `
=a b
$numc e
)e f
{g h
var 
patrons 
= 
await 
_patronService  .
.. /
GetPaginated/ ;
(; <
page< @
,@ A
perPageB I
)I J
;J K
if 
( 
patrons 
!= 
null 
&&  "
patrons# *
.* +
Results+ 2
.2 3
Any3 6
(6 7
)7 8
)8 9
{: ;
var 
	viewModel 
= 
new  #
PatronIndexModel$ 4
{5 6
PageOfPatrons !
=" #
patrons$ +
} 
; 
return 
View 
( 
	viewModel %
)% &
;& '
} 
var!! 

emptyModel!! 
=!! 
new!!  
PatronIndexModel!!! 1
{!!2 3
PageOfPatrons"" 
="" 
new""  #
PaginationResult""$ 4
<""4 5
	PatronDto""5 >
>""> ?
{""@ A
Results## 
=## 
new## !
List##" &
<##& '
	PatronDto##' 0
>##0 1
(##1 2
)##2 3
,##3 4
PerPage$$ 
=$$ 
perPage$$ %
,$$% &

PageNumber%% 
=%%  
page%%! %
}&& 
}'' 
;'' 
return)) 
View)) 
()) 

emptyModel)) "
)))" #
;))# $
}** 	
public,, 
async,, 
Task,, 
<,, 
IActionResult,, '
>,,' (
Detail,,) /
(,,/ 0
int,,0 3
id,,4 6
),,6 7
{,,8 9
var-- 
patron-- 
=-- 
await-- 
_patronService-- -
.--- .
Get--. 1
(--1 2
id--2 4
)--4 5
;--5 6
var.. 
assetsCheckedOut..  
=..! "
await..# (
_patronService..) 7
...7 8!
GetPaginatedCheckouts..8 M
(..M N
patron..N T
...T U
Id..U W
,..W X
$num..Y Z
,..Z [
$num..\ ^
)..^ _
;.._ `
var// 
checkoutHistory// 
=//  !
await//" '
_patronService//( 6
.//6 7'
GetPaginatedCheckoutHistory//7 R
(//R S
patron//S Y
.//Y Z
Id//Z \
,//\ ]
$num//^ _
,//_ `
$num//a c
)//c d
;//d e
var00 
holds00 
=00 
await00 
_patronService00 ,
.00, -
GetPaginatedHolds00- >
(00> ?
patron00? E
.00E F
Id00F H
,00H I
$num00J K
,00K L
$num00M O
)00O P
;00P Q
var11 
memberLengthOfTime11 "
=11# $
TimeSpanHumanizer11% 6
.116 7
GetReadableTimespan117 J
(11J K
DateTime11K S
.11S T
UtcNow11T Z
-11[ \
patron11] c
.11c d
	CreatedOn11d m
)11m n
;11n o
var33 
model33 
=33 
new33 
PatronDetailModel33 -
(33- .
)33. /
{330 1
Id44 
=44 
patron44 
.44 
Id44 
,44 
	FirstName55 
=55 
patron55 "
.55" #
	FirstName55# ,
,55, -
LastName66 
=66 
patron66 !
.66! "
LastName66" *
,66* +
Email77 
=77 
patron77 
.77 
Email77 $
,77$ %
LibraryCardId88 
=88 
patron88  &
.88& '
LibraryCardId88' 4
,884 5
Address99 
=99 
patron99  
.99  !
Address99! (
,99( )
	Telephone:: 
=:: 
patron:: "
.::" #
	Telephone::# ,
,::, -
HomeLibrary;; 
=;; 
patron;; $
.;;$ %
HomeLibrary;;% 0
,;;0 1
OverdueFees<< 
=<< 
patron<< $
.<<$ %
OverdueFees<<% 0
,<<0 1
AssetsCheckedOut==  
===! "
assetsCheckedOut==# 3
,==3 4
CheckoutHistory>> 
=>>  !
checkoutHistory>>" 1
,>>1 2
Holds?? 
=?? 
holds?? 
,?? 
HasBeenMemberFor@@  
=@@! "
memberLengthOfTime@@# 5
}AA 
;AA 
returnCC 
ViewCC 
(CC 
modelCC 
)CC 
;CC 
}DD 	
}EE 
}FF º
ëC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Web\Models\Branch\BranchDetailModel.cs
	namespace 	
LightLib
 
. 
Web 
. 
Models 
. 
Branch $
{% &
public 

class 
BranchDetailModel "
{# $
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 

BranchName  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
BranchOpenedDate &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public		 
string		 
	Telephone		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
public

 
bool

 
IsOpen

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
int 
NumberOfPatrons "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
NumberOfAssets !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
decimal 
TotalAssetValue &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
string 
ImageUrl 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
IEnumerable 
< 
string !
>! "
	HoursOpen# ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
} 
} ã
êC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Web\Models\Branch\BranchIndexModel.cs
	namespace 	
LightLib
 
. 
Web 
. 
Models 
. 
Branch $
{% &
public 

class 
BranchIndexModel !
{" #
public 
PaginationResult 
<  
LibraryBranchDto  0
>0 1
PageOfBranches2 @
{A B
getC F
;F G
setH K
;K L
}M N
} 
} û
ëC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Web\Models\Catalog\AssetDetailModel.cs
	namespace 	
LightLib
 
. 
Web 
. 
Models 
. 
Catalog %
{ 
public 

class 
AssetDetailModel !
{ 
public 
int 
AssetId 
{ 
get  
;  !
set" %
;% &
}' (
public		 
string		 
Title		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
public

 
string

 
AuthorOrDirector

 &
{

' (
get

) ,
;

, -
set

. 1
;

1 2
}

3 4
public 
string 
Type 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
Year 
{ 
get 
; 
set "
;" #
}$ %
public 
string 
Isbn 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Dewey 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Status 
{ 
get "
;" #
set$ '
;' (
}) *
public 
decimal 
Cost 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
CurrentLocation %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
ImageUrl 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 

PatronName  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
Checkout 
LatestCheckout &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
LibraryCard (
CurrentAssociatedLibraryCard 7
{8 9
get: =
;= >
set? B
;B C
}D E
public 
IEnumerable 
< 
CheckoutHistory *
>* +
CheckoutHistory, ;
{< =
get> A
;A B
setC F
;F G
}H I
public 
IEnumerable 
< 
AssetHoldModel )
>) *
CurrentHolds+ 7
{8 9
get: =
;= >
set? B
;B C
}D E
} 
public 

class 
AssetHoldModel 
{ 
public 
string 

PatronName  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 

HoldPlaced  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} à
êC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Web\Models\Catalog\AssetIndexModel.cs
	namespace 	
LightLib
 
. 
Web 
. 
Models 
. 
Catalog %
{& '
public 

class 
AssetIndexModel  
{! "
public 
PaginationResult 
<  
LibraryAssetDto  /
>/ 0
PageOfAssets1 =
{> ?
get@ C
;C D
setE H
;H I
}J K
} 
} —

ïC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Web\Models\CheckoutModels\CheckoutModel.cs
	namespace 	
LightLib
 
. 
Web 
. 
Models 
. 
CheckoutModels ,
{ 
public 

class 
CheckoutModel 
{ 
public 
string 
LibraryCardId #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
AssetId 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
ImageUrl 
{  
get! $
;$ %
set& )
;) *
}+ ,
public		 
int		 
	HoldCount		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
public

 
bool

 
IsCheckedOut

  
{

! "
get

# &
;

& '
set

( +
;

+ ,
}

- .
} 
} á
ëC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Web\Models\Patron\PatronDetailModel.cs
	namespace 	
LightLib
 
. 
Web 
. 
Models 
. 
Patron $
{% &
public 

class 
PatronDetailModel "
{# $
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
	FirstName 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
string		 
LastName		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
int

 
?

 
LibraryCardId

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
	Telephone 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
HomeLibrary !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
decimal 
? 
OverdueFees #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
HasBeenMemberFor &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
PaginationResult 
<  
CheckoutDto  +
>+ ,
AssetsCheckedOut- =
{> ?
get@ C
;C D
setE H
;H I
}J K
public 
PaginationResult 
<  
CheckoutHistoryDto  2
>2 3
CheckoutHistory4 C
{D E
getF I
;I J
setK N
;N O
}P Q
public 
PaginationResult 
<  
HoldDto  '
>' (
Holds) .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
} 
} É
êC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Web\Models\Patron\PatronIndexModel.cs
	namespace 	
LightLib
 
. 
Web 
. 
Models 
. 
Patron $
{% &
public 

class 
PatronIndexModel !
{" #
public 
PaginationResult 
<  
	PatronDto  )
>) *
PageOfPatrons+ 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
} 
} ª
yC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Web\Program.cs
	namespace 	
LightLib
 
. 
Web 
{ 
public 

static 
class 
Program 
{  !
public		 
static		 
void		 
Main		 
(		  
string		  &
[		& '
]		' (
args		) -
)		- .
{		/ 0
var

 
logger

 
=

 
NLog

 
.

 
Web

 !
.

! "
NLogBuilder

" -
. 
ConfigureNLog 
( 
$str ,
), -
. !
GetCurrentClassLogger &
(& '
)' (
;( )
try 
{ 
CreateHostBuilder !
(! "
args" &
)& '
.' (
Build( -
(- .
). /
./ 0
Run0 3
(3 4
)4 5
;5 6
} 
catch 
( 
	Exception 
e  
)  !
{" #
logger 
. 
Error 
( 
e 
, 
$str  F
)F G
;G H
throw 
; 
} 
finally 
{ 
NLog 
. 

LogManager 
.  
Shutdown  (
(( )
)) *
;* +
} 
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{8 9

webBuilder 
. 

UseStartup %
<% &
Startup& -
>- .
(. /
)/ 0
. 
UseUrls 
( 
$str -
,- .
$str/ >
)> ?
. 
ConfigureLogging %
(% &
logging& -
=>. 0
{1 2
logging   
.    
ClearProviders    .
(  . /
)  / 0
;  0 1
logging!! 
.!!  
SetMinimumLevel!!  /
(!!/ 0
LogLevel!!0 8
.!!8 9
Trace!!9 >
)!!> ?
;!!? @
}"" 
)"" 
.## 
UseNLog## 
(## 
)## 
;## 
}%% 
)%% 
;%% 
}&& 
}'' ∆%
yC:\Users\Havia\OneDrive\Documents\Senior Year 2.0 2nd Semester\CSE 4321\Team Project\lightlib-lms\LightLib.Web\Startup.cs
	namespace 	
LightLib
 
. 
Web 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
config& ,
), -
{. /
Configuration 
= 
config "
;" #
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{C D
services 
. 
AddMvc 
( 
) 
; 
services 
. 
AddSingleton !
(! "
Configuration" /
)/ 0
;0 1
services 
. 
AddDbContext !
<! "
LibraryDbContext" 2
>2 3
(3 4
options4 ;
=>< >
options 
. 
	UseNpgsql !
(! "
Configuration" /
./ 0
GetConnectionString0 C
(C D
$strD W
)W X
)X Y
)Y Z
;Z [
services 
. 
AddAutoMapper "
(" #
c# $
=>% '
c( )
.) *

AddProfile* 4
<4 5 
EntityMappingProfile5 I
>I J
(J K
)K L
,L M
typeofN T
(T U
StartupU \
)\ ]
)] ^
;^ _
services!! 
.!! 
	AddScoped!! 
<!! 
ICheckoutService!! /
,!!/ 0
CheckoutService!!1 @
>!!@ A
(!!A B
)!!B C
;!!C D
services"" 
."" 
	AddScoped"" 
<"" 
IHoldService"" +
,""+ ,
HoldService""- 8
>""8 9
(""9 :
)"": ;
;""; <
services## 
.## 
	AddScoped## 
<##  
ILibraryAssetService## 3
,##3 4
LibraryAssetService##5 H
>##H I
(##I J
)##J K
;##K L
services$$ 
.$$ 
	AddScoped$$ 
<$$ !
ILibraryBranchService$$ 4
,$$4 5 
LibraryBranchService$$6 J
>$$J K
($$K L
)$$L M
;$$M N
services%% 
.%% 
	AddScoped%% 
<%% 
ILibraryCardService%% 2
,%%2 3
LibraryCardService%%4 F
>%%F G
(%%G H
)%%H I
;%%I J
services&& 
.&& 
	AddScoped&& 
<&& 
IPatronService&& -
,&&- .
PatronService&&/ <
>&&< =
(&&= >
)&&> ?
;&&? @
services'' 
.'' 
	AddScoped'' 
<'' 
IStatusService'' -
,''- .
StatusService''/ <
>''< =
(''= >
)''> ?
;''? @
}(( 	
public** 
void** 
	Configure** 
(** 
IApplicationBuilder** 1
app**2 5
,**5 6
IWebHostEnvironment**7 J
env**K N
)**N O
{**P Q
if++ 
(++ 
env++ 
.++ 
IsDevelopment++ !
(++! "
)++" #
)++# $
{++% &
app,, 
.,, %
UseDeveloperExceptionPage,, -
(,,- .
),,. /
;,,/ 0
}-- 
else-- 
{-- 
app.. 
... 
UseExceptionHandler.. '
(..' (
$str..( 5
)..5 6
;..6 7
}// 
app11 
.11 
UseStaticFiles11 
(11 
)11  
;11  !
app22 
.22 
UseCookiePolicy22 
(22  
)22  !
;22! "
app33 
.33 

UseRouting33 
(33 
)33 
;33 
app44 
.44 
UseAuthentication44 !
(44! "
)44" #
;44# $
app66 
.66 
UseEndpoints66 
(66 
routes66 #
=>66$ &
{66' (
routes77 
.77 
MapControllerRoute77 )
(77) *
$str77* 3
,773 4
$str775 ]
)77] ^
;77^ _
}88 
)88 
;88 
}99 	
}:: 
};; 