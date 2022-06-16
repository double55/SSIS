# 文件夹ForEach、Foreach_01

文件夹ForEach是ssis包文件，Foreach_01则为数据文件

处理场景 ：
在ETL中有时候提取的数据文件很多，有的多少上百个甚至上千个，仅仅通过循环读取这些文件进入数据库整个过程会很慢，就需要通过并发的方案来处理这些文件。
例如：有1千个文件，可以采用并发处理，同时并发4个或8个来读取文件（并发个数小于等于CPU核心数），即原来的串行处理文件变成同时并发处理文件，从而提高了文件处理时间。

# 文件夹Load Multiple Sheets with different schema

处理场景：
在ETL中数据源文件是excel文件，有些excel文件中多个sheet页，sheet页名称是固定的，这些sheet页可能全部进入同一个表中；也有可能一部分sheet页进入一个表中，其他的部分sheet页进入另一个表中；
甚至excel中的sheet页名称不固定，sheet会发生变化(减少或增加)的场景，这些sheet页可能全部进入同一个表；也有可能一部分sheet页进入一个表中，其他的部分sheet页进入另一个表中。

# 文件夹Mul_Floor

处理场景 ：
在ETL处理中，如果集成的源数据是文件格式的，那么可能存在要读取多层级文件夹(不包含文件类型的文件夹外，其上面有1-2层父文件夹)中的文件。

# 文件夹Excel255

处理场景：
在ETL中，有时候要集成的源数据是excel文件，可能存在某一列中单元格的内容超过255字符就会报错。因为Excel会根据某一列的前8行作为参考来确定该列的数据类型导致的。

# 文件夹import custom excel file in sql server using C# or SSIS

处理场景：
将Excel File数据导入到sql server数据库中，使用Script Task。

# 文件夹Balanced Data Distributor

处理场景：
在ETL中有时候提取的单个数据文件很大，超过100M，甚至更大，通常使用数据流任务将文件中的数据加载到数据库的表中。