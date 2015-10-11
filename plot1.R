       
      ## We start by storing the data in a data.frame called "doc"
      doc<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?",quote="") 
      ## We then have to focus on the two days of interest
      ## (that is first two days of Feb 2007). We achieve this
      ## by using the variable "doc_focus" as follows:
      doc_focus<-doc[doc[[1]]=="1/2/2007",]
      doc_focus<-rbind(doc_focus,doc[doc[[1]]=="2/2/2007",])
      ## We create the plot1.png file.To save it, I have created
      ## a directory called "Explor_Proj1", that stands for 
      ## "Exploratory Data Analysis- Project 1".
      png("./Explor_Proj1/plot1.png")
      with(doc_focus,hist(Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)", ylab="Frequency"))
      dev.off()