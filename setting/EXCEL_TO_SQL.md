public void Main()
		{
            // TODO: Add your code here
            
            InsertExcelRecord();
            
            Dts.TaskResult = (int)ScriptResults.Success;
		}

        public static void InsertExcelRecord()
        {
            try
            {
                // Provider=Microsoft.ACE.OLEDB.12.0;Data Source=D:\桌面\peixun\import custom excel file in sql server using C# or SSIS\excel.xlsx;Extended Properties="Excel 12.0 XML;HDR=YES";
                string _path = @"D:\My_file\test\excel.xlsx";
                string constr = string.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=""Excel 12.0 XML; HDR = YES"";",_path);
                OleDbConnection Econ = new OleDbConnection(constr);
                string Query = string.Format("SELECT [Name],[DOB],[Age] FROM [{0}]", "Sheet1$");
                OleDbCommand Ecom = new OleDbCommand(Query, Econ);
                Econ.Open();
                
                DataSet ds = new DataSet();
                OleDbDataAdapter oda = new OleDbDataAdapter(Query, Econ);
                Econ.Close();
                oda.Fill(ds);
                DataTable Exceldt = ds.Tables[0];

                

                for (int i= Exceldt.Rows.Count - 1; i >= 0; i--)
                {
                    string sr = "";
                    int ln = Exceldt.Rows[i]["Name"].ToString().Length;
                    string value = Exceldt.Rows[i]["Name"].ToString();
                    if (ln >= 4)
                    {
                        sr = Exceldt.Rows[i]["Name"].ToString().Substring(0, 4);
                    }

                    if (Exceldt.Rows[i]["Name"]==DBNull.Value || Exceldt.Rows[i]["Name"] == "" || sr == "This")
                    {
                        Exceldt.Rows[i].Delete();
                    }
                    MessageBox.Show(Exceldt.ToString());
                }
                Exceldt.AcceptChanges();

                SqlConnection sqlConnec = new SqlConnection
                {
                    ConnectionString = @"server=DOUBLL\MSSQL_ADMIN;Database=Task_03;Integrated Security=SSPI;"
                };
                MessageBox.Show(sqlConnec.ToString());
                SqlBulkCopy objbulk = new SqlBulkCopy(sqlConnec)
                {
                    DestinationTableName = "Student"
                };
                MessageBox.Show(objbulk.ToString());
                // Mapping Table column
                objbulk.ColumnMappings.Add("Name", "Name");
                objbulk.ColumnMappings.Add("DOB", "DOB");
                objbulk.ColumnMappings.Add("Age", "Age");

                // Inserting Datatable Record to DataBase
                sqlConnec.Open();
                objbulk.WriteToServer(Exceldt);
                sqlConnec.Close();
            }catch(Exception ex)
            {

            }
        }