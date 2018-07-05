### as all seq runs were run in DADA2 separately, they need to be combined into a single table for each level and cohort.
###

folders=list.files()
folders_bsp=folders[grep("^BSP",folders)]
folders_bsp=folders_bsp[grepl("all",folders_bsp)==F]

for(f in folders_bsp){
if(exists("genall")){
gen<-read.table(paste0(f,"/Genus_dada2_Rar.tsv"),head=T)
genall[rownames(gen)[!rownames(gen) %in% rownames(genall)],]<-0
genall[,colnames(gen)]<-0
genall[rownames(gen),colnames(gen)]<-gen

fam<-read.table(paste0(f,"/Family_dada2_Rar.tsv"),head=T,row.names=2)[,-1]
famall[rownames(fam)[!rownames(fam) %in% rownames(famall)],]<-0
famall[,colnames(fam)]<-0
famall[rownames(fam),colnames(fam)]<-fam

cla<-read.table(paste0(f,"/Class_dada2_Rar.tsv"),head=T,row.names=2)[,-1]
claall[rownames(cla)[!rownames(cla) %in% rownames(claall)],]<-0
claall[,colnames(cla)]<-0
claall[rownames(cla),colnames(cla)]<-cla

ord<-read.table(paste0(f,"/Order_dada2_Rar.tsv"),head=T,row.names=2)[,-1]
ordall[rownames(ord)[!rownames(ord) %in% rownames(ordall)],]<-0
ordall[,colnames(ord)]<-0
ordall[rownames(ord),colnames(ord)]<-ord

phy<-read.table(paste0(f,"/Phylum_dada2_Rar.tsv"),head=T,row.names=2)[,-1]
phyall[rownames(phy)[!rownames(phy) %in% rownames(phyall)],]<-0
phyall[,colnames(phy)]<-0
phyall[rownames(phy),colnames(phy)]<-phy

}else{
genall<-read.table(paste0(f,"/Genus_dada2_Rar.tsv"),head=T)
famall<-read.table(paste0(f,"/Family_dada2_Rar.tsv"),head=T,row.names=2)[,-1]
ordall<-read.table(paste0(f,"/Order_dada2_Rar.tsv"),head=T,row.names=2)[,-1]
claall<-read.table(paste0(f,"/Class_dada2_Rar.tsv"),head=T,row.names=2)[,-1]
phyall<-read.table(paste0(f,"/Phylum_dada2_Rar.tsv"),head=T,row.names=2)[,-1]
}

}


folders_foc=folders[grep("^FOC",folders)]
folders_foc=folders_foc[grepl("all",folders_foc)==F]

for(f in folders_foc){
if(exists("genall.foc")){
gen<-read.table(paste0(f,"/Genus_dada2_Rar.tsv"),head=T)
genall.foc[rownames(gen)[!rownames(gen) %in% rownames(genall.foc)],]<-0
genall.foc[,colnames(gen)]<-0
genall.foc[rownames(gen),colnames(gen)]<-gen

fam<-read.table(paste0(f,"/Family_dada2_Rar.tsv"),head=T,row.names=2)[,-1]
famall.foc[rownames(fam)[!rownames(fam) %in% rownames(famall.foc)],]<-0
famall.foc[,colnames(fam)]<-0
famall.foc[rownames(fam),colnames(fam)]<-fam

cla<-read.table(paste0(f,"/Class_dada2_Rar.tsv"),head=T,row.names=2)[,-1]
claall.foc[rownames(cla)[!rownames(cla) %in% rownames(claall.foc)],]<-0
claall.foc[,colnames(cla)]<-0
claall.foc[rownames(cla),colnames(cla)]<-cla

ord<-read.table(paste0(f,"/Order_dada2_Rar.tsv"),head=T,row.names=2)[,-1]
ordall.foc[rownames(ord)[!rownames(ord) %in% rownames(ordall.foc)],]<-0
ordall.foc[,colnames(ord)]<-0
ordall.foc[rownames(ord),colnames(ord)]<-ord

phy<-read.table(paste0(f,"/Phylum_dada2_Rar.tsv"),head=T,row.names=2)[,-1]
phyall.foc[rownames(phy)[!rownames(phy) %in% rownames(phyall.foc)],]<-0
phyall.foc[,colnames(phy)]<-0
phyall.foc[rownames(phy),colnames(phy)]<-phy

}else{
genall.foc<-read.table(paste0(f,"/Genus_dada2_Rar.tsv"),head=T)
famall.foc<-read.table(paste0(f,"/Family_dada2_Rar.tsv"),head=T,row.names=2)[,-1]
ordall.foc<-read.table(paste0(f,"/Order_dada2_Rar.tsv"),head=T,row.names=2)[,-1]
claall.foc<-read.table(paste0(f,"/Class_dada2_Rar.tsv"),head=T,row.names=2)[,-1]
phyall.foc<-read.table(paste0(f,"/Phylum_dada2_Rar.tsv"),head=T,row.names=2)[,-1]
}

}

write.table(genall, "BSPSPC_all/Genus_dada2_Rar.tsv" ,col.names=T,row.names = T,quote=FALSE,sep = "\t") 
write.table(famall, "BSPSPC_all/Family_dada2_Rar.tsv" ,col.names=T,row.names = T,quote=FALSE,sep = "\t")
write.table(ordall, "BSPSPC_all/Order_dada2_Rar.tsv" ,col.names=T,row.names = T,quote=FALSE,sep = "\t")
write.table(claall, "BSPSPC_all/Class_dada2_Rar.tsv" ,col.names=T,row.names = T,quote=FALSE,sep = "\t")
write.table(phyall, "BSPSPC_all/Phylum_dada2_Rar.tsv" ,col.names=T,row.names = T,quote=FALSE,sep = "\t")

write.table(genall.foc, "FOCUS_all/Genus_dada2_Rar.tsv" ,col.names=T,row.names = T,quote=FALSE,sep = "\t") 
write.table(famall.foc, "FOCUS_all/Family_dada2_Rar.tsv" ,col.names=T,row.names = T,quote=FALSE,sep = "\t")
write.table(ordall.foc, "FOCUS_all/Order_dada2_Rar.tsv" ,col.names=T,row.names = T,quote=FALSE,sep = "\t")
write.table(claall.foc, "FOCUS_all/Class_dada2_Rar.tsv" ,col.names=T,row.names = T,quote=FALSE,sep = "\t")
write.table(phyall.foc, "FOCUS_all/Phylum_dada2_Rar.tsv" ,col.names=T,row.names = T,quote=FALSE,sep = "\t")


