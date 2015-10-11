    ## We start by storing the data in a data.frame called "doc"
    ## and focusing in those two days of interest (as in "plot1.R")
    doc<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?",quote="")
    doc_focus<-doc[doc[[1]]=="1/2/2007",]
    doc_focus<-rbind(doc_focus,doc[doc[[1]]=="2/2/2007",])
    ## We now have to convert the Date and Time data as we
    ## did in "plot2.R" code.See next 4 commands.
    x<-as.character(doc_focus[[1]])
    y<-as.character(doc_focus[[2]])
    time_var<-paste(x,y)
    time_var<-strptime(time_var,"%d/%m/%Y %H:%M:%S")
    ## As in "plot2.R" code we change the system language to English
    Sys.setlocale("LC_TIME","English")
    ## Finally we create the "plot3.png" file
    png("./Explor_Proj1/plot3.png")
    plot(time_var,doc_focus[[7]],type="n",xlab="",ylab="Energy sub metering")
    points(time_var,doc_focus[[7]],col="black",type="l")
    points(time_var,doc_focus[[8]],col="red",type="l")
    points(time_var,doc_focus[[9]],col="blue",type="l")
    legend("topright",pch=151 ,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    dev.off()