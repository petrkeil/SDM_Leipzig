files <- paste("../wc2-5/",
               list.files("../wc2-5/", pattern = ".bil"),
               sep = "")
bio2.5 <- stack(files)
bio2.5 <- bio2.5[[c(1, 4, 16, 17, 5,6,7,8)]]


