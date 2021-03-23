## tips
+ `os.Mkdir("/usr/tmp", 0755)`
+ `_, err := os.Stat("/path/to/whatever"); os.IsNotExist(err) `

## issues
+ 写入的中文CSV,excel打开乱码
    + `file.WriteString("\xEF\xBB\xBF")`

## ref
+ [encoding/csv](https://golang.org/pkg/encoding/csv/)
+ [Write data to a CSV file](https://golangcode.com/write-data-to-a-csv-file/)
+ [Create a directory or folder in Go (Golang)](https://golangbyexample.com/create-directory-folder-golang/)
+ [List all files (recursively) in a directory](https://yourbasic.org/golang/list-files-in-directory/)
+ [使用Golang导出CSV数据并解决数据乱码问题](https://blog.wangjunfeng.com/post/golang-csv/)