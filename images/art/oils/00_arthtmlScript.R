setwd('C:\Z\sher\sherslifework\images\art\oils')

# Get list of files (Remove R script)
fn <- list.files(); fn
fn <- fn[!grepl('.R',fn)]; fn
fn <- fn[!grepl('.html',fn)]; fn

# Write out html script with file names
# First Div
htmlStart1 <- "<div id='Oils & Acrlyics' class='tabcontent'>
<div class='masonry'>"; htmlStart1
html1 <- "<div class='item'> 
<img src='/images/art/oils/"; html1
# title here
html2 <- "' style='width:100%' onclick='openModal();currentSlide("; html2
# title num here
html3 <- ")' class='hover-shadow cursor'> </div>"; html3
htmlMidClose <- "</div>" # Close Masonary Div
# Second Div Modal
htmlModalStart <- "<div id='myModal' class='modal'> 
<span class='close cursor' onclick='closeModal()'>&times;</span> 
<div class='modal-content'>"
htmlmodal1 <- "<div class='mySlides'>
<figcaption>"
# title here
htmlmodal2 <- "</figcaption>
<img src='/images/art/oils/"
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
</div>
</div>"

combinedHtml1 <- htmlStart1; combinedHtml1
for(i in 1:2){
  combinedHtml1 <- paste(combinedHtml1,html1,fn[i],html2,i,html3,sep='')
}; combinedHtml1
combinedHtml1 <- paste(combinedHtml1,htmlMidClose,sep='\n'); combinedHtml1


combinedHtml2 <- htmlModalStart; combinedHtml2
for(i in 1:2){
  combinedHtml2 <- paste(combinedHtml2,"\n",htmlmodal1,fn[i],htmlmodal2,fn[i],htmlmodal3,sep='')
}; combinedHtml2

combinedHtml <- paste(combinedHtml1,combinedHtml2,htmlCloseAll,sep='\n'); combinedHtml

write.table(combinedHtml, 
            file='00combinedHtml.html', 
            quote = FALSE,
            col.names = FALSE,
            row.names = FALSE)




