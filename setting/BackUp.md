# DATE

```
(DT_STR, 4, 1252) DATEPART("yy" , GETDATE()) + "_"+ RIGHT("0" + (DT_STR, 2, 1252) DATEPART("mm" , GETDATE()), 2)+ "_"+RIGHT("0" + (DT_STR, 2, 1252) DATEPART("dd" , GETDATE()), 2)
```

```
2022_06_17
```

# BackupFilePath

```
@[User::varBackDirPath]  + ( @[User::varIsFail] ==0?"\\succe":"\\fail" )+"\\" +  @[User::Date] + "\\" +  @[User::varFileAndExtension]
```