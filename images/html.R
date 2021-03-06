library(stringr)

# Oils
if(T){
setwd('C:/Z/sher/sherslifework/images/SherOils')

# Get list of files (Remove R script)
fn <- list.files(); fn
fn <- stringr::str_sort(fn,numeric=T)
fn <- fn[!grepl('.R',fn)]; fn
fn <- fn[!grepl('.html',fn)]; fn
fnO <- fn

# Write out html script with file names
# First Div
htmlStart1 <- "<div id='Oils & Acrlyics' class='tabcontent'>
<div class='masonry'>"; htmlStart1
html1 <- "<div class='item'> 
<img src='/images/SherOils/"; html1
# title here
html2 <- "' style='width:100%' onclick='openModal();currentSlide("; html2
# title num here
html3 <- ")' class='hover-shadow cursor'> </div>"; html3
htmlMidClose <- "</div>\n</div>" # Close Masonary Div

combinedHtml1 <- htmlStart1; combinedHtml1
for(i in 1:length(fn)){
  combinedHtml1 <- paste(combinedHtml1,html1,fn[i],html2,i,html3,sep='')
}; combinedHtml1
combinedHtml1 <- paste(combinedHtml1,htmlMidClose,sep='\n'); combinedHtml1

combinedHtmlO <- combinedHtml1; combinedHtmlO
}

# Watercolors
if(T){
  setwd('C:/Z/sher/sherslifework/images/SherWatercolors')
  
  # Get list of files (Remove R script)
  fn <- list.files(); fn
  fn <- stringr::str_sort(fn,numeric=T)
  fn <- fn[!grepl('.R',fn)]; fn
  fn <- fn[!grepl('.html',fn)]; fn
  fnW <- fn
  
  # Write out html script with file names
  # First Div
  htmlStart1 <- "<div id='Watercolors' class='tabcontent'>
<div class='masonry'>"; htmlStart1
  html1 <- "<div class='item'> 
<img src='/images/SherWatercolors/"; html1
  # title here
  html2 <- "' style='width:100%' onclick='openModal();currentSlide("; html2
  # title num here
  html3 <- ")' class='hover-shadow cursor'> </div>"; html3
  htmlMidClose <- "</div>\n</div>" # Close Masonary Div
  
  combinedHtml1 <- htmlStart1; combinedHtml1
  for(i in 1:length(fn)){
    combinedHtml1 <- paste(combinedHtml1,html1,fn[i],html2,i+length(fnO),html3,sep='')
  }; combinedHtml1
  combinedHtml1 <- paste(combinedHtml1,htmlMidClose,sep='\n'); combinedHtml1
 
  combinedHtmlW <- combinedHtml1; combinedHtmlW
}

# Drawings
if(T){
  setwd('C:/Z/sher/sherslifework/images/SherDrawings')
  
  # Get list of files (Remove R script)
  fn <- list.files(); fn
  fn <- stringr::str_sort(fn,numeric=T)
  fn <- fn[!grepl('.R',fn)]; fn
  fn <- fn[!grepl('.html',fn)]; fn
  fnD <- fn
  
  # Write out html script with file names
  # First Div
  htmlStart1 <- "<div id='Drawings' class='tabcontent'>
<div class='masonry'>"; htmlStart1
  html1 <- "<div class='item'> 
<img src='/images/SherDrawings/"; html1
  # title here
  html2 <- "' style='width:100%' onclick='openModal();currentSlide("; html2
  # title num here
  html3 <- ")' class='hover-shadow cursor'> </div>"; html3
  htmlMidClose <- "</div>\n</div>" # Close Masonary Div

  combinedHtml1 <- htmlStart1; combinedHtml1
  for(i in 1:length(fn)){
    combinedHtml1 <- paste(combinedHtml1,html1,fn[i],html2,i+length(fnO)+length(fnW),html3,sep='')
  }; combinedHtml1
  combinedHtml1 <- paste(combinedHtml1,htmlMidClose,sep='\n'); combinedHtml1
 
  combinedHtmlD <- combinedHtml1; combinedHtmlD
}


# Modal
if(T){
# Second Div Modal
htmlModalStart <- "<div id='myModal' class='modal'> 
<span class='close cursor' onclick='closeModal()'>&times;</span> 
<div class='modal-content'>"
htmlmodal1 <- "<div class='mySlides'>
<figcaption>"
# title here
htmlmodalO <- "</figcaption>
<img src='/images/SherOils/"
htmlmodalW <- "</figcaption>
<img src='/images/SherWatercolors/"
htmlmodalD <- "</figcaption>
<img src='/images/SherDrawings/"
# title here
htmlmodal3 <- "' style='width:100%'>
</div>"
htmlCloseAll <-"<a class='prev' onclick='plusSlides(-1)'>&#10094;</a>
<a class='next' onclick='plusSlides(1)'>&#10095;</a>
<div class='caption-container'>
<p id='caption'>
</p>
</div>
</div>
</div>"

combinedHtml1 <- htmlModalStart; combinedHtml1
for(i in 1:length(fnO)){
  combinedHtml1 <- paste(combinedHtml1,htmlmodal1,gsub(".jpg","",fnO[i]),
                         htmlmodalO,fnO[i],htmlmodal3,sep='')
}; combinedHtml1

for(i in 1:length(fnW)){
  combinedHtml1 <- paste(combinedHtml1,htmlmodal1,gsub(".jpg","",fnW[i]),
                         htmlmodalW,fnW[i],htmlmodal3,sep='')
}; combinedHtml1

for(i in 1:length(fnD)){
  combinedHtml1 <- paste(combinedHtml1,htmlmodal1,gsub(".jpg","",fnD[i]),
                         htmlmodalD,fnD[i],htmlmodal3,sep='')
}; combinedHtml1

combinedHtml1 <- paste(combinedHtml1,htmlCloseAll,sep='\n'); combinedHtml1

combinedHtmlM <- combinedHtml1; combinedHtmlM

}

combinedHtml <- paste(combinedHtmlO,combinedHtmlW,combinedHtmlD,
                      combinedHtmlM,sep='\n'); combinedHtml

write.table(combinedHtml, 
            file='C:/Z/sher/sherslifework/images/art.html', 
            quote = FALSE,
            col.names = FALSE,
            row.names = FALSE)

