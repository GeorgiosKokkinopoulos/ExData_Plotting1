    ## As in previous codes we start by storing the data of interest 
    ## in a data.frame called "doc_focus".
    doc<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?",quote="")
    doc_focus<-doc[doc[[1]]=="1/2/2007",]
    doc_focus<-rbind(doc_focus,doc[doc[[1]]=="2/2/2007",])
    ## Once again we convert Date and Time in the appropriate
    ## format
    x<-as.character(doc_focus[[1]])
    y<-as.character(doc_focus[[2]])
    time_var<-paste(x,y)
    time_var<-strptime(time_var,"%d/%m/%Y %H:%M:%S")
    ## We also change the system language to English
    Sys.setlocale("LC_TIME","English")
    ## We create the "plot4.png" file
    png("./Explor_Proj1/plot4.png")
    par(mar=c(4,4,2,2))
    par(mfcol=c(2,2))
    with(doc_focus,plot(time_var,Global_active_power,type="l",xlab="",ylab="Global Active Power"))
    plot(time_var,doc_focus[[7]],type="n",xlab="",ylab="Energy sub metering")
    points(time_var,doc_focus[[7]],col="black",type="l")
    points(time_var,doc_focus[[8]],col="red",type="l")
    points(time_var,doc_focus[[9]],col="blue",type="l")
    legend("topright",pch=151 ,col=c("black","red","blue"),bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    with(doc_focus,plot(time_var,Voltage,type="l",xlab="Datetime",ylab="Voltage"))
    with(doc_focus,plot(time_var,Global_reactive_power,type="l",xlab="Datetime"))
    dev.off()