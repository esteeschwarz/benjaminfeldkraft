f<-list.files(".")
m<-grep("(-[1-9]{1}-)([1-9]{1})(.md)",f)
f[m]
f2<-gsub("(.+-[1-9]{1}-)([1-9]{1})(.md)","\\100\\2\\3",f[m])
f2
file.rename(f[m],f2)
m<-grep( "(.+-[1-9]{1}-)([1-9]{1})([0-9]{1})(.md)",f)
f[m]
f3<-gsub("(.+-[1-9]{1}-)([1-9]{1})([0-9]{1})(.md)","\\10\\2\\3\\4",f[m])
f3
file.rename(f[m],f3)
f4<-list.files()
f4
library(rmarkdown)
for (k in f4){
  render(k,latex_document(),output_dir = "../tex")
}
f5<-list.files()
texlist<-paste0("input{",f5,"}")
texlist
texlist<-paste0("\\",texlist)
texlist
example_string <- "This is a backslash: \\"
print(example_string)
cat (texlist)
library(clipr)
write_clip(texlist)
