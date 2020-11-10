fn <- list.files(paste(getwd(),"/SherDrawings",sep=""));fn
# Rename
for (i in 1:length(fn)){
  file.rename(paste(getwd(),"/SherDrawings/",fn[i],sep=""),
              paste(getwd(),"/SherDrawings/","D",i," - Untitled.jpg",sep=""))
}

fn <- list.files(paste(getwd(),"/SherWatercolors",sep=""));fn
fnIMG <- fn[grepl("IMG",fn)]; fnIMG
fnOther <- fn[!grepl("IMG",fn)]; fnOther
# Rename
for (i in 1:length(fnIMG)){
  file.rename(paste(getwd(),"/SherWatercolors/",fnIMG[i],sep=""),
              paste(getwd(),"/SherWatercolors/W",i," - Untitled.jpg",sep=""))
}
# Rename
for (i in 1:length(fnOther)){
  file.rename(paste(getwd(),"/SherWatercolors/",fnOther[i],sep=""),
              paste(getwd(),"/SherWatercolors/W",length(fnIMG)+i," - ",fnOther[i],sep=""))
}
