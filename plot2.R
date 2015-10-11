    ## We start by storing the data in a data.frame called "doc"
    ## and focusing in those two days of interest (as in "plot1.R")
    doc<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?",quote="")
    doc_focus<-doc[doc[[1]]=="1/2/2007",]
    doc_focus<-rbind(doc_focus,doc[doc[[1]]=="2/2/2007",])
    ## We now have to convert the Date and Time data (first two
    ## variables in our data.frame called "doc") in the default
    ## format "YYYY-MM-DD HH:MM:SS". The next 4 commands do it.
    x<-as.character(doc_focus[[1]])
    y<-as.character(doc_focus[[2]])
    time_var<-paste(x,y)
    time_var<-strptime(time_var,"%d/%m/%Y %H:%M:%S")
    ## We change the system language to English so that in the
    ## x-axis we have "Thu", "Fri" , "Sat" instead of this in
    ## any other language.
    Sys.setlocale("LC_TIME","English")
    ## We now create the plot2.png file (similar method as in
    ## "plot1.R" code)
    png("./Explor_Proj1/plot2.png")
    with(doc_focus,plot(time_var,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
    dev.off()