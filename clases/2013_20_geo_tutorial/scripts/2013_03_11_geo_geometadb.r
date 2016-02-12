##geo_geometadb.r
##2013-03-03 dmontaner@cipf.es
##GEOmetadb library example

##Tested using GEOmetadb Version: "2.25.0"


###Clear working environment and load library
rm (list = ls ())
library (GEOmetadb); packageDescription ("GEOmetadb", fields = "Version") #"2.25.0"
help (package = GEOmetadb)


###Get the database file: "GEOmetadb.sqlite"
getSQLiteFile()
dir ()


###Connect to the database
con <- dbConnect(SQLite(),'GEOmetadb.sqlite')

###Show tables
dbListTables (con)


###Send SQL query
myquery <- dbGetQuery(con, 'select * from gse limit 5')
myquery


##Read a full table into an R object
tabla <- dbReadTable (con, "gse")
class (tabla)
dim (tabla)
colnames (tabla)
tabla[1:3,]


###Get melanoma in title
touse <- grep (pattern = "melanoma", tabla[,"title"], ignore.case = TRUE)
touse
tabla[touse, "title"]


###EXIT
warnings ()
sessionInfo ()
q ("no")
