#module
#deffunc fullmemoryaccessmoduleinit
dupptr fullaccessablemem1,0,0x7FFFFFFF,2
dupptr fullaccessablemem2,0x80000000,0x7FFFFFFF,2
return
#deffunc mempoke int prm_1,int prm_2
if prm_1>=0x80000000{
poke fullaccessablemem2,prm_1-0x80000000,prm_2
}else{
poke fullaccessablemem1,prm_1,prm_2
}
return
#deffunc memwpoke int prm_1,int prm_2
if prm_1>=0x80000000{
wpoke fullaccessablemem2,prm_1-0x80000000,prm_2
}else{
wpoke fullaccessablemem1,prm_1,prm_2
}
return
#deffunc memlpoke int prm_1,int prm_2
if prm_1>=0x80000000{
lpoke fullaccessablemem2,prm_1-0x80000000,prm_2
}else{
lpoke fullaccessablemem1,prm_1,prm_2
}
return

#defcfunc mempeek int prm_1
if prm_1>=0x80000000{
return peek(fullaccessablemem2,prm_1-0x80000000)
}else{
return peek(fullaccessablemem1,prm_1)
}
return
#defcfunc memwpeek int prm_1
if prm_1>=0x80000000{
return wpeek(fullaccessablemem2,prm_1-0x80000000)
}else{
return wpeek(fullaccessablemem1,prm_1)
}
return
#defcfunc memlpeek int prm_1
if prm_1>=0x80000000{
return lpeek(fullaccessablemem2,prm_1-0x80000000)
}else{
return lpeek(fullaccessablemem1,prm_1)
}
return

#deffunc memmemcpy int prm_1,int prm_2,int prm_3
repeat prm_3
mempeek prm_1+cnt,mempoke(prm_2+cnt)
loop
return
#global
fullmemoryaccessmoduleinit
