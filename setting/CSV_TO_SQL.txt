public void Main()
		{
            // TODO: Add your code here

            // User::varFilePathCSV

            string FilePathCSV = Dts.Variables["User::varFilePathCSV"].Value.ToString();
            CSVToSql(FilePathCSV);
            Dts.TaskResult = (int)ScriptResults.Success;
		}

public static void CSVToSql(string path)
        {
            try
            {
                //①、string strConn =”Server=服务器名；Database=数据库名；uid=用户名；pwd=密码；”;

                // ②、string strConn =”Data Source = 服务器名；initial catalog = 数据库名； integrated security = True；Connect Timeout = 30；”;
                // @"server=DOUBLL\MSSQL_ADMIN;Database=Task_03;Integrated Security=SSPI;User Instance=True"
                using (SqlConnection conn = new SqlConnection(@"Data Source = DOUBLL\MSSQL_ADMIN; Initial Catalog = Task_03; Persist Security Info = True; Integrated Security=True;"))
                {
                    conn.Open();
                    using (StreamReader reader = new StreamReader(path))
                    {
                        while (!reader.EndOfStream)
                        {
                            var line = reader.ReadLine();

                            var values = line.Split(',');

                            string sql = "insert into [dbo].[Excel255] values('"+ values[0].ToString()+"','"+values[1].ToString() + "','" + values[2].ToString() + "','" + values[3].ToString() + "','" + values[4].ToString() + "')";

                            MessageBox.Show(sql.ToString());
                            
                            SqlCommand cmd = new SqlCommand(sql, conn);
                            
                            MessageBox.Show(cmd.ToString());

                            // cmd.
                            cmd.ExecuteNonQuery();
                            
                        }
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }